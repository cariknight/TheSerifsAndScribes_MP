using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TheSerifsAndScribes_MP
{
    public class DepartmentRecord
    {
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        public string Description { get; set; }
        public string PldtHotline { get; set; }
        public string IntelcoHotline { get; set; }
        public string HeadOfficerId { get; set; }
        public string HeadOfficerName { get; set; }
        public string HeadOfficerPosition { get; set; }
        public string HeadOfficerPhotoUrl { get; set; }
    }

    public class OfficerRecord
    {
        public string OfficerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Position { get; set; }
        public DateTime TermStart { get; set; }
        public DateTime TermEnd { get; set; }
        public string PhotoUrl { get; set; }
        public int? DepartmentId { get; set; }
        public string DepartmentName { get; set; }

        public string DisplayName => string.IsNullOrWhiteSpace(FirstName) && string.IsNullOrWhiteSpace(LastName)
            ? OfficerId
            : $"{FirstName} {LastName} ({Position})";
    }

    public static class OrganizationRepository
    {
        private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        private static string _headColumnName;
        private static bool? _supportsHeadOfficer;

        private static string HeadColumnName => ResolveHeadColumnName();

        public static bool SupportsHeadOfficer
        {
            get
            {
                if (_supportsHeadOfficer.HasValue)
                {
                    return _supportsHeadOfficer.Value;
                }

                _supportsHeadOfficer = !string.IsNullOrEmpty(HeadColumnName);
                return _supportsHeadOfficer.Value;
            }
        }

        public static IEnumerable<DepartmentRecord> GetDepartments()
        {
            var list = new List<DepartmentRecord>();
            var headColumn = SupportsHeadOfficer;

            var headColumnName = HeadColumnName;

            var query = headColumn
                ? $@"SELECT d.departmentID, d.departmentName, d.description, d.pldtHotline, d.intelcoHotline, d.{headColumnName},
                          o.firstName, o.lastName, o.position, o.photoURL
                   FROM Department d
                   LEFT JOIN Officer o ON d.{headColumnName} = o.officerID
                   ORDER BY d.departmentName"
                : @"SELECT d.departmentID, d.departmentName, d.description, d.pldtHotline, d.intelcoHotline,
                           ho.officerID   AS headOfficerID,
                           ho.firstName   AS headFirstName,
                           ho.lastName    AS headLastName,
                           ho.position    AS headPosition,
                           ho.photoURL    AS headPhoto
                   FROM Department d
                   OUTER APPLY (
                       SELECT TOP 1 o.officerID, o.firstName, o.lastName, o.position, o.photoURL
                       FROM Officer o
                       WHERE o.departmentID = d.departmentID
                         AND o.position LIKE '%head%'
                       ORDER BY o.termEnd DESC, o.termStart DESC, o.lastName, o.firstName
                   ) ho
                   ORDER BY d.departmentName";

            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(query, conn))
            {
                conn.Open();
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var record = new DepartmentRecord
                        {
                            DepartmentId = reader.GetInt32(reader.GetOrdinal("departmentID")),
                            DepartmentName = reader["departmentName"] as string,
                            Description = reader["description"] as string,
                            PldtHotline = reader["pldtHotline"] as string,
                        IntelcoHotline = reader["intelcoHotline"] as string
                    };

                        if (headColumn)
                        {
                            record.HeadOfficerId = reader[headColumnName] as string;
                            var first = reader["firstName"] as string;
                            var last = reader["lastName"] as string;
                            record.HeadOfficerName = string.IsNullOrWhiteSpace(first) && string.IsNullOrWhiteSpace(last)
                                ? null
                                : $"{first} {last}".Trim();
                            record.HeadOfficerPosition = reader["position"] as string;
                            record.HeadOfficerPhotoUrl = reader["photoURL"] as string;
                        }
                        else
                        {
                            record.HeadOfficerId = reader["headOfficerID"] as string;
                            var first = reader["headFirstName"] as string;
                            var last = reader["headLastName"] as string;
                            record.HeadOfficerName = string.IsNullOrWhiteSpace(first) && string.IsNullOrWhiteSpace(last)
                                ? null
                                : $"{first} {last}".Trim();
                            record.HeadOfficerPosition = reader["headPosition"] as string;
                            record.HeadOfficerPhotoUrl = reader["headPhoto"] as string;
                        }

                    list.Add(record);
                }
            }
            }

            return list;
        }

        public static void AddDepartment(string name, string description, string pldtHotline, string intelcoHotline, string headOfficerId)
        {
            if (SupportsHeadOfficer)
            {
                var headColumnName = HeadColumnName;
                var insertWithHead = $@"INSERT INTO Department (departmentName, description, pldtHotline, intelcoHotline, {headColumnName})
                                        VALUES (@name, @description, @pldt, @intelco, @head)";
                ExecuteNonQuery(insertWithHead, name, description, pldtHotline, intelcoHotline, headOfficerId);
            }
            else
            {
                const string insertNoHead = @"INSERT INTO Department (departmentName, description, pldtHotline, intelcoHotline)
                                              VALUES (@name, @description, @pldt, @intelco)";
                ExecuteNonQuery(insertNoHead, name, description, pldtHotline, intelcoHotline, null);
            }
        }

        public static void UpdateDepartment(int departmentId, string name, string description, string pldtHotline, string intelcoHotline, string headOfficerId)
        {
            if (SupportsHeadOfficer)
            {
                var headColumnName = HeadColumnName;
                var updateWithHead = $@"UPDATE Department
                                              SET departmentName = @name,
                                                  description = @description,
                                                  pldtHotline = @pldt,
                                                  intelcoHotline = @intelco,
                                                  {headColumnName} = @head
                                              WHERE departmentID = @id";
                ExecuteNonQuery(updateWithHead, name, description, pldtHotline, intelcoHotline, headOfficerId, departmentId);
            }
            else
            {
                const string updateNoHead = @"UPDATE Department
                                              SET departmentName = @name,
                                                  description = @description,
                                                  pldtHotline = @pldt,
                                                  intelcoHotline = @intelco
                                              WHERE departmentID = @id";
                ExecuteNonQuery(updateNoHead, name, description, pldtHotline, intelcoHotline, null, departmentId);
            }
        }

        public static void DeleteDepartment(int departmentId)
        {
            const string delete = "DELETE FROM Department WHERE departmentID = @id";
            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(delete, conn))
            {
                cmd.Parameters.AddWithValue("@id", departmentId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public static IEnumerable<OfficerRecord> GetOfficers()
        {
            var list = new List<OfficerRecord>();
            const string query = @"SELECT o.officerID, o.firstName, o.lastName, o.position, o.termStart, o.termEnd, o.photoURL,
                                          o.departmentID, d.departmentName
                                   FROM Officer o
                                   LEFT JOIN Department d ON o.departmentID = d.departmentID
                                   ORDER BY o.lastName, o.firstName";

            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(query, conn))
            {
                conn.Open();
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        list.Add(new OfficerRecord
                        {
                            OfficerId = reader["officerID"] as string,
                            FirstName = reader["firstName"] as string,
                            LastName = reader["lastName"] as string,
                            Position = reader["position"] as string,
                            TermStart = reader.GetDateTime(reader.GetOrdinal("termStart")),
                            TermEnd = reader.GetDateTime(reader.GetOrdinal("termEnd")),
                            PhotoUrl = reader["photoURL"] as string,
                            DepartmentId = reader.IsDBNull(reader.GetOrdinal("departmentID"))
                                ? (int?)null
                                : reader.GetInt32(reader.GetOrdinal("departmentID")),
                            DepartmentName = reader["departmentName"] as string
                        });
                    }
                }
            }

            return list;
        }

        public static void AddOfficer(string officerId, string firstName, string lastName, string position, DateTime termStart, DateTime termEnd, string photoUrl, int? departmentId)
        {
            const string sql = @"INSERT INTO Officer (officerID, firstName, lastName, position, termStart, termEnd, photoURL, departmentID)
                                 VALUES (@id, @first, @last, @pos, @start, @end, @photo, @dept)";
            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@id", officerId);
                cmd.Parameters.AddWithValue("@first", firstName);
                cmd.Parameters.AddWithValue("@last", lastName);
                cmd.Parameters.AddWithValue("@pos", position);
                cmd.Parameters.AddWithValue("@start", termStart);
                cmd.Parameters.AddWithValue("@end", termEnd);
                cmd.Parameters.AddWithValue("@photo", string.IsNullOrWhiteSpace(photoUrl) ? (object)"../Images/user-profile.png" : photoUrl);
                cmd.Parameters.AddWithValue("@dept", (object)departmentId ?? DBNull.Value);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            UpdateDepartmentHeadIfNeeded(officerId, position, departmentId);
        }

        public static void UpdateOfficer(string officerId, string firstName, string lastName, string position, DateTime termStart, DateTime termEnd, string photoUrl, int? departmentId)
        {
            const string sql = @"UPDATE Officer
                                 SET firstName = @first,
                                     lastName = @last,
                                     position = @pos,
                                     termStart = @start,
                                     termEnd = @end,
                                     photoURL = @photo,
                                     departmentID = @dept
                                 WHERE officerID = @id";
            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@id", officerId);
                cmd.Parameters.AddWithValue("@first", firstName);
                cmd.Parameters.AddWithValue("@last", lastName);
                cmd.Parameters.AddWithValue("@pos", position);
                cmd.Parameters.AddWithValue("@start", termStart);
                cmd.Parameters.AddWithValue("@end", termEnd);
                cmd.Parameters.AddWithValue("@photo", string.IsNullOrWhiteSpace(photoUrl) ? (object)"../Images/user-profile.png" : photoUrl);
                cmd.Parameters.AddWithValue("@dept", (object)departmentId ?? DBNull.Value);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            UpdateDepartmentHeadIfNeeded(officerId, position, departmentId);
        }

        public static void DeleteOfficer(string officerId)
        {
            const string sql = "DELETE FROM Officer WHERE officerID = @id";
            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@id", officerId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private static void ExecuteNonQuery(string sql, string name, string description, string pldtHotline, string intelcoHotline, string headOfficerId, int? departmentId = null)
        {
            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@description", (object)description ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@pldt", pldtHotline);
                cmd.Parameters.AddWithValue("@intelco", intelcoHotline);

                if (sql.Contains("@head"))
                {
                    cmd.Parameters.AddWithValue("@head", (object)headOfficerId ?? DBNull.Value);
                }

                if (departmentId.HasValue)
                {
                    cmd.Parameters.AddWithValue("@id", departmentId.Value);
                }

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private static bool ColumnExists(string table, string column)
        {
            const string sql = @"SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @table AND COLUMN_NAME = @column";
            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@table", table);
                cmd.Parameters.AddWithValue("@column", column);
                conn.Open();
                var count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        private static string ResolveHeadColumnName()
        {
            if (_headColumnName != null)
            {
                return _headColumnName;
            }

            // Try explicit, common column names first.
            var candidates = new[]
            {
                "headOfficerId", "headOfficerID", "headOfficer",
                "head", "headID", "departmentHeadID", "departmentHeadId",
                "officerId", "officerID"
            };
            foreach (var column in candidates)
            {
                if (ColumnExists("Department", column))
                {
                    _headColumnName = column;
                    return _headColumnName;
                }
            }

            // Fallback: find any column that contains "head" in its name.
            const string sql = @"SELECT TOP 1 COLUMN_NAME
                                 FROM INFORMATION_SCHEMA.COLUMNS
                                 WHERE TABLE_NAME = 'Department' AND COLUMN_NAME LIKE '%head%'";
            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(sql, conn))
            {
                conn.Open();
                var result = cmd.ExecuteScalar() as string;
                _headColumnName = result ?? string.Empty;
            }

            return _headColumnName;
        }

        private static void UpdateDepartmentHeadIfNeeded(string officerId, string position, int? departmentId)
        {
            if (!SupportsHeadOfficer || !departmentId.HasValue || string.IsNullOrWhiteSpace(officerId))
            {
                return;
            }

            var headColumn = HeadColumnName;
            if (string.IsNullOrWhiteSpace(headColumn))
            {
                return;
            }

            var isHead = IsHeadPosition(position);
            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand())
            {
                cmd.Connection = conn;
                if (isHead)
                {
                    cmd.CommandText = $"UPDATE Department SET {headColumn} = @officer WHERE departmentID = @dept";
                }
                else
                {
                    cmd.CommandText = $"UPDATE Department SET {headColumn} = NULL WHERE departmentID = @dept AND {headColumn} = @officer";
                }

                cmd.Parameters.AddWithValue("@officer", officerId);
                cmd.Parameters.AddWithValue("@dept", departmentId.Value);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private static bool IsHeadPosition(string position)
        {
            return !string.IsNullOrWhiteSpace(position) &&
                   position.IndexOf("head", StringComparison.OrdinalIgnoreCase) >= 0;
        }
    }
}
