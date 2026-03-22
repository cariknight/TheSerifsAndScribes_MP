using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace TheSerifsAndScribes_MP
{
    public enum AnnouncementStatus
    {
        NeedApproval = 0,
        Active = 1,
        Archived = 2
    }

    public class AnnouncementRecord
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public DateTime CreatedAt { get; set; }
        public AnnouncementStatus Status { get; set; }
    }

    /// <summary>
    /// Data access for announcements (shared by dashboard and public list).
    /// </summary>
    public static class AnnouncementRepository
    {
        private static readonly string ConnectionString =
            ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        // Ensure table exists before any CRUD calls.
        static AnnouncementRepository()
        {
            EnsureTableExists();
        }

        public static IEnumerable<AnnouncementRecord> GetAll()
        {
            const string query = @"
                SELECT Id, Title, Body, CreatedAt, Status
                FROM [dbo].[Announcements]
                ORDER BY CreatedAt DESC;";

            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(query, conn))
            {
                conn.Open();
                using (var reader = cmd.ExecuteReader())
                {
                    var results = new List<AnnouncementRecord>();
                    while (reader.Read())
                    {
                        results.Add(Map(reader));
                    }
                    return results;
                }
            }
        }

        public static IEnumerable<AnnouncementRecord> GetActive()
        {
            const string query = @"
                SELECT Id, Title, Body, CreatedAt, Status
                FROM [dbo].[Announcements]
                WHERE Status = @Status
                ORDER BY CreatedAt DESC;";

            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.Add("@Status", SqlDbType.Int).Value = (int)AnnouncementStatus.Active;

                conn.Open();
                using (var reader = cmd.ExecuteReader())
                {
                    var results = new List<AnnouncementRecord>();
                    while (reader.Read())
                    {
                        results.Add(Map(reader));
                    }
                    return results;
                }
            }
        }

        public static void Add(string title, string body)
        {
            if (string.IsNullOrWhiteSpace(title) || string.IsNullOrWhiteSpace(body))
            {
                return;
            }

            const string query = @"
                INSERT INTO [dbo].[Announcements] (Id, Title, Body, CreatedAt, Status)
                VALUES (@Id, @Title, @Body, @CreatedAt, @Status);";

            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.Add("@Id", SqlDbType.UniqueIdentifier).Value = Guid.NewGuid();
                cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 200).Value = title.Trim();
                cmd.Parameters.Add("@Body", SqlDbType.NVarChar, -1).Value = body.Trim();
                cmd.Parameters.Add("@CreatedAt", SqlDbType.DateTime).Value = DateTime.Now;
                cmd.Parameters.Add("@Status", SqlDbType.Int).Value = (int)AnnouncementStatus.NeedApproval;

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public static void Delete(Guid id)
        {
            const string query = @"DELETE FROM [dbo].[Announcements] WHERE Id = @Id;";

            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.Add("@Id", SqlDbType.UniqueIdentifier).Value = id;

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public static void SetStatus(Guid id, AnnouncementStatus status)
        {
            const string query = @"UPDATE [dbo].[Announcements] SET Status = @Status WHERE Id = @Id;";

            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.Add("@Id", SqlDbType.UniqueIdentifier).Value = id;
                cmd.Parameters.Add("@Status", SqlDbType.Int).Value = (int)status;

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private static AnnouncementRecord Map(SqlDataReader reader) =>
            new AnnouncementRecord
            {
                Id = reader.GetGuid(reader.GetOrdinal("Id")),
                Title = reader["Title"] as string,
                Body = reader["Body"] as string,
                CreatedAt = reader.GetDateTime(reader.GetOrdinal("CreatedAt")),
                Status = (AnnouncementStatus)reader.GetInt32(reader.GetOrdinal("Status"))
            };

        /// <summary>
        /// Creates the Announcements table if it is missing. Intended to prevent
        /// “Invalid object name 'dbo.Announcements'” when the DB has not been seeded.
        /// </summary>
        private static void EnsureTableExists()
        {
            const string existsQuery = @"
                IF NOT EXISTS (SELECT 1
                               FROM INFORMATION_SCHEMA.TABLES
                               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Announcements')
                BEGIN
                    CREATE TABLE [dbo].[Announcements](
                        Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
                        Title NVARCHAR(200) NOT NULL,
                        Body NVARCHAR(MAX) NOT NULL,
                        CreatedAt DATETIME NOT NULL CONSTRAINT DF_Announcements_CreatedAt DEFAULT (GETDATE()),
                        Status INT NOT NULL
                    );
                    CREATE INDEX IX_Announcements_CreatedAt ON [dbo].[Announcements](CreatedAt DESC);
                END";

            using (var conn = new SqlConnection(ConnectionString))
            using (var cmd = new SqlCommand(existsQuery, conn))
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
