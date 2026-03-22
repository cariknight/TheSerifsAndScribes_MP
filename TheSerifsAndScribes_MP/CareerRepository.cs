using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace TheSerifsAndScribes_MP
{
    public class CareerRecord
    {
        public int Id { get; set; }
        public DateTime VacancyDate { get; set; }
        public string PreviewUrl { get; set; }
        public string DownloadUrl { get; set; }
        public string Status { get; set; }
    }

    /// <summary>
    /// Repository for Career vacancies.
    /// </summary>
    public static class CareerRepository
    {
        // Try multiple connection strings (same pattern as NewsRepository).
        private static readonly string[] ConnectionStrings = new[]
        {
            ConfigurationManager.ConnectionStrings["DBConnection"]?.ConnectionString,
            ConfigurationManager.ConnectionStrings["DBConnectionLocal"]?.ConnectionString,
            ConfigurationManager.ConnectionStrings["DBConnectionExpress"]?.ConnectionString
        };

        private static string ConnectionString => ConnectionStrings.FirstOrDefault(s => !string.IsNullOrWhiteSpace(s));
        private static readonly Lazy<bool> CareerIdIsIdentity = new Lazy<bool>(DetectIdentityColumn);

        static CareerRepository()
        {
            EnsureTableExists();
            EnsureSeedData();
        }

        /// <summary>
        /// Ensures default seed data is present (no-op if records already exist).
        /// </summary>
        public static void SeedDefaultsIfEmpty()
        {
            EnsureSeedData();
        }

        public static IEnumerable<CareerRecord> GetAll()
        {
            const string sql = @"
                SELECT careerID, vacancyDate, previewURL, downloadURL, status
                FROM [dbo].[Career]
                ORDER BY vacancyDate DESC, careerID DESC;";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            using (var reader = cmd.ExecuteReader())
            {
                var rows = new List<CareerRecord>();
                while (reader.Read())
                {
                    rows.Add(Map(reader));
                }
                return rows;
            }
        }

        public static void Add(DateTime vacancyDate, string previewUrl, string downloadUrl, string status, int? id = null)
        {
            bool useIdentity = CareerIdIsIdentity.Value;

            string sql;
            if (useIdentity)
            {
                sql = @"
                    INSERT INTO [dbo].[Career] (vacancyDate, previewURL, downloadURL, status)
                    VALUES (@vacancyDate, @previewURL, @downloadURL, @status);";
            }
            else
            {
                if (!id.HasValue) throw new InvalidOperationException("careerID is required when the column is not identity.");
                sql = @"
                    INSERT INTO [dbo].[Career] (careerID, vacancyDate, previewURL, downloadURL, status)
                    VALUES (@careerID, @vacancyDate, @previewURL, @downloadURL, @status);";
            }

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                if (!useIdentity)
                    cmd.Parameters.Add("@careerID", SqlDbType.Int).Value = id.Value;

                cmd.Parameters.Add("@vacancyDate", SqlDbType.Date).Value = vacancyDate.Date;
                cmd.Parameters.Add("@previewURL", SqlDbType.NVarChar, -1).Value = (object)previewUrl ?? DBNull.Value;
                cmd.Parameters.Add("@downloadURL", SqlDbType.NVarChar, -1).Value = (object)downloadUrl ?? DBNull.Value;
                cmd.Parameters.Add("@status", SqlDbType.NVarChar, 10).Value = status ?? string.Empty;

                cmd.ExecuteNonQuery();
            }
        }

        public static void Update(int id, DateTime vacancyDate, string previewUrl, string downloadUrl, string status)
        {
            const string sql = @"
                UPDATE [dbo].[Career]
                SET vacancyDate = @vacancyDate,
                    previewURL = @previewURL,
                    downloadURL = @downloadURL,
                    status = @status
                WHERE careerID = @careerID;";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@careerID", SqlDbType.Int).Value = id;
                cmd.Parameters.Add("@vacancyDate", SqlDbType.Date).Value = vacancyDate.Date;
                cmd.Parameters.Add("@previewURL", SqlDbType.NVarChar, -1).Value = (object)previewUrl ?? DBNull.Value;
                cmd.Parameters.Add("@downloadURL", SqlDbType.NVarChar, -1).Value = (object)downloadUrl ?? DBNull.Value;
                cmd.Parameters.Add("@status", SqlDbType.NVarChar, 10).Value = status ?? string.Empty;

                cmd.ExecuteNonQuery();
            }
        }

        public static void Delete(int id)
        {
            const string sql = @"DELETE FROM [dbo].[Career] WHERE careerID = @careerID;";
            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@careerID", SqlDbType.Int).Value = id;
                cmd.ExecuteNonQuery();
            }
        }

        private static void EnsureTableExists()
        {
            const string sql = @"
                IF OBJECT_ID(N'[dbo].[Career]', N'U') IS NULL
                BEGIN
                    CREATE TABLE [dbo].[Career](
                        [careerID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
                        [vacancyDate] DATE NULL,
                        [previewURL] NVARCHAR(MAX) NULL,
                        [downloadURL] NVARCHAR(MAX) NULL,
                        [status] VARCHAR(10) NOT NULL
                    );
                END;";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.ExecuteNonQuery();
            }
        }

        private static void EnsureSeedData()
        {
            const string countSql = "SELECT COUNT(1) FROM [dbo].[Career];";
            int count;

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(countSql, conn))
            {
                count = (int)cmd.ExecuteScalar();
            }

            if (count > 0) return;

            var seed = GetSeedData();
            foreach (var item in seed)
            {
                Add(item.VacancyDate, item.PreviewUrl, item.DownloadUrl, item.Status, item.Id);
            }
        }

        private static IEnumerable<CareerRecord> GetSeedData()
        {
            // Derived from the existing mock data in Careers.aspx.cs
            return new List<CareerRecord>
            {
                new CareerRecord { Id = 1, VacancyDate = new DateTime(2026, 3, 13), PreviewUrl = "files/vacancies-march-13-2026.pdf", DownloadUrl = "files/vacancies-march-13-2026.pdf", Status = "New" },
                new CareerRecord { Id = 2, VacancyDate = new DateTime(2026, 3, 7),  PreviewUrl = "files/vacancies-march-07-2026.pdf", DownloadUrl = "files/vacancies-march-07-2026.pdf", Status = "New" },
                new CareerRecord { Id = 3, VacancyDate = new DateTime(2026, 2, 28), PreviewUrl = "files/vacancies-feb-28-2026.pdf",  DownloadUrl = "files/vacancies-feb-28-2026.pdf",  Status = "Active" },
                new CareerRecord { Id = 4, VacancyDate = new DateTime(2026, 2, 21), PreviewUrl = "files/vacancies-feb-21-2026.pdf",  DownloadUrl = "files/vacancies-feb-21-2026.pdf",  Status = "Active" },
                new CareerRecord { Id = 5, VacancyDate = new DateTime(2026, 2, 14), PreviewUrl = "files/vacancies-feb-14-2026.pdf",  DownloadUrl = "files/vacancies-feb-14-2026.pdf",  Status = "Active" },
                new CareerRecord { Id = 6, VacancyDate = new DateTime(2026, 2, 7),  PreviewUrl = "files/vacancies-feb-07-2026.pdf",  DownloadUrl = "files/vacancies-feb-07-2026.pdf",  Status = "Archived" },
                new CareerRecord { Id = 7, VacancyDate = new DateTime(2026, 1, 31), PreviewUrl = "files/vacancies-jan-31-2026.pdf",  DownloadUrl = "files/vacancies-jan-31-2026.pdf",  Status = "Archived" }
            };
        }

        private static CareerRecord Map(SqlDataReader reader)
        {
            return new CareerRecord
            {
                Id = reader.GetInt32(reader.GetOrdinal("careerID")),
                VacancyDate = reader.IsDBNull(reader.GetOrdinal("vacancyDate"))
                    ? DateTime.MinValue
                    : reader.GetDateTime(reader.GetOrdinal("vacancyDate")),
                PreviewUrl = reader.IsDBNull(reader.GetOrdinal("previewURL")) ? null : reader.GetString(reader.GetOrdinal("previewURL")),
                DownloadUrl = reader.IsDBNull(reader.GetOrdinal("downloadURL")) ? null : reader.GetString(reader.GetOrdinal("downloadURL")),
                Status = reader.IsDBNull(reader.GetOrdinal("status")) ? string.Empty : reader.GetString(reader.GetOrdinal("status"))
            };
        }

        private static SqlConnection CreateOpenConnection()
        {
            var conn = new SqlConnection(ConnectionString);
            conn.Open();
            return conn;
        }

        private static bool DetectIdentityColumn()
        {
            const string sql = "SELECT COLUMNPROPERTY(OBJECT_ID('[dbo].[Career]'), 'careerID', 'IsIdentity')";
            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                var result = cmd.ExecuteScalar();
                if (result == null || result == DBNull.Value) return false;
                return Convert.ToInt32(result) == 1;
            }
        }
    }
}
