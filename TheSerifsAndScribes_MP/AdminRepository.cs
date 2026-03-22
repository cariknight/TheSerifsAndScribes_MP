using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TheSerifsAndScribes_MP
{
    public class AdminRecord
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName => $"{FirstName} {LastName}".Trim();
    }

    /// <summary>
    /// Minimal admin lookup for author selection.
    /// </summary>
    public static class AdminRepository
    {
        private static readonly string[] ConnectionStrings = new[]
        {
            ConfigurationManager.ConnectionStrings["DBConnection"]?.ConnectionString,
            ConfigurationManager.ConnectionStrings["DBConnectionLocal"]?.ConnectionString,
            ConfigurationManager.ConnectionStrings["DBConnectionExpress"]?.ConnectionString
        };

        public static IEnumerable<AdminRecord> GetAll()
        {
            const string sql = @"
                SELECT adminID, firstName, lastName
                FROM [dbo].[Admin]
                ORDER BY firstName, lastName;";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            using (var reader = cmd.ExecuteReader())
            {
                var list = new List<AdminRecord>();
                while (reader.Read())
                {
                    list.Add(new AdminRecord
                    {
                        Id = reader.GetInt32(reader.GetOrdinal("adminID")),
                        FirstName = reader["firstName"] as string,
                        LastName = reader["lastName"] as string
                    });
                }
                return list;
            }
        }

        private static SqlConnection CreateOpenConnection()
        {
            SqlException lastSqlEx = null;

            foreach (var cs in ConnectionStrings)
            {
                if (string.IsNullOrWhiteSpace(cs)) continue;
                var conn = new SqlConnection(cs);
                try
                {
                    conn.Open();
                    return conn;
                }
                catch (SqlException ex)
                {
                    lastSqlEx = ex;
                    conn.Dispose();
                }
            }

            if (lastSqlEx != null) throw lastSqlEx;
            throw new InvalidOperationException("No valid database connection string for Admin lookup.");
        }
    }
}
