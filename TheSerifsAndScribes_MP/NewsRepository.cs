using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TheSerifsAndScribes_MP
{
    public enum NewsStatus
    {
        Draft,
        Published,
        Archived
    }

    public class NewsRecord
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string BodyHtml { get; set; }
        public int AuthorId { get; set; }
        public string AuthorName { get; set; }
        public string Category { get; set; }
        public DateTime CreatedAt { get; set; }
        public NewsStatus Status { get; set; }
    }

    /// <summary>
    /// Repository for News &amp; Events articles backed by dbo.NewsEvents.
    /// </summary>
    public static class NewsRepository
    {
        private static readonly string[] ConnectionStrings = new[]
        {
            ConfigurationManager.ConnectionStrings["DBConnection"]?.ConnectionString,
            ConfigurationManager.ConnectionStrings["DBConnectionLocal"]?.ConnectionString,
            ConfigurationManager.ConnectionStrings["DBConnectionExpress"]?.ConnectionString
        };

        static NewsRepository()
        {
            EnsureTableExists();
        }

        public static IEnumerable<NewsRecord> GetAll()
        {
            const string sql = @"
                SELECT n.newsID, n.title, n.contentHTML, n.authorID, n.datePosted, n.STATUS,
                       a.firstName, a.lastName
                FROM [dbo].[NewsEvents] n
                LEFT JOIN [dbo].[Admin] a ON a.adminID = n.authorID
                ORDER BY datePosted DESC, newsID DESC;";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            using (var reader = cmd.ExecuteReader())
            {
                var rows = new List<NewsRecord>();
                while (reader.Read())
                {
                    rows.Add(Map(reader));
                }

                return rows;
            }
        }

        public static IEnumerable<NewsRecord> GetPublished()
        {
            const string sql = @"
                SELECT n.newsID, n.title, n.contentHTML, n.authorID, n.datePosted, n.STATUS,
                       a.firstName, a.lastName
                FROM [dbo].[NewsEvents] n
                LEFT JOIN [dbo].[Admin] a ON a.adminID = n.authorID
                WHERE n.STATUS = @Status
                ORDER BY datePosted DESC, newsID DESC;";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@Status", SqlDbType.NVarChar, 20).Value = StatusToString(NewsStatus.Published);

                using (var reader = cmd.ExecuteReader())
                {
                    var rows = new List<NewsRecord>();
                    while (reader.Read())
                    {
                        rows.Add(Map(reader));
                    }

                    return rows;
                }
            }
        }

        public static void Add(string title, int authorId, string bodyHtml, string category, NewsStatus status)
        {
            if (string.IsNullOrWhiteSpace(title) ||
                string.IsNullOrWhiteSpace(bodyHtml))
            {
                return;
            }

            const string sql = @"
                INSERT INTO [dbo].[NewsEvents] (title, contentHTML, authorID, datePosted, STATUS)
                VALUES (@Title, @Body, @AuthorId, @DatePosted, @Status);";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 100).Value = title.Trim();
                cmd.Parameters.Add("@Body", SqlDbType.NVarChar, -1).Value = bodyHtml.Trim();
                cmd.Parameters.Add("@AuthorId", SqlDbType.Int).Value = authorId;
                cmd.Parameters.Add("@DatePosted", SqlDbType.Date).Value = DateTime.Today;
                cmd.Parameters.Add("@Status", SqlDbType.NVarChar, 20).Value = StatusToString(status);

                cmd.ExecuteNonQuery();
            }
        }

        public static void Delete(int id)
        {
            const string sql = @"DELETE FROM [dbo].[NewsEvents] WHERE newsID = @Id;";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@Id", SqlDbType.Int).Value = id;
                cmd.ExecuteNonQuery();
            }
        }

        public static void SetStatus(int id, NewsStatus status)
        {
            const string sql = @"UPDATE [dbo].[NewsEvents] SET STATUS = @Status WHERE newsID = @Id;";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@Id", SqlDbType.Int).Value = id;
                cmd.Parameters.Add("@Status", SqlDbType.NVarChar, 20).Value = StatusToString(status);
                cmd.ExecuteNonQuery();
            }
        }

        private static NewsRecord Map(SqlDataReader reader) =>
            new NewsRecord
            {
                Id = reader.GetInt32(reader.GetOrdinal("newsID")),
                Title = reader["title"] as string,
                BodyHtml = reader["contentHTML"] as string,
                AuthorId = reader.GetInt32(reader.GetOrdinal("authorID")),
                AuthorName = BuildAuthorName(reader),
                Category = "News", // category not in schema; default label
                CreatedAt = reader.IsDBNull(reader.GetOrdinal("datePosted"))
                    ? DateTime.Today
                    : reader.GetDateTime(reader.GetOrdinal("datePosted")),
                Status = ToStatus(reader["STATUS"] as string)
            };

        private static string BuildAuthorName(SqlDataReader reader)
        {
            var hasFirst = !reader.IsDBNull(reader.GetOrdinal("firstName"));
            var hasLast = !reader.IsDBNull(reader.GetOrdinal("lastName"));
            if (!hasFirst && !hasLast) return $"Admin {reader["authorID"]}";
            var first = hasFirst ? reader["firstName"] as string : string.Empty;
            var last = hasLast ? reader["lastName"] as string : string.Empty;
            var full = $"{first} {last}".Trim();
            return string.IsNullOrWhiteSpace(full) ? $"Admin {reader["authorID"]}" : full;
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
            throw new InvalidOperationException("No valid database connection string for NewsEvents.");
        }

        private static void EnsureTableExists()
        {
            const string sql = @"
                IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'NewsEvents')
                BEGIN
                    CREATE TABLE [dbo].[NewsEvents](
                        newsID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
                        title NVARCHAR(100) NOT NULL,
                        contentHTML NVARCHAR(MAX) NOT NULL,
                        authorID INT NOT NULL,
                        datePosted DATE NULL,
                        STATUS VARCHAR(MAX) NULL
                    );
                    CREATE INDEX IX_NewsEvents_datePosted ON [dbo].[NewsEvents](datePosted DESC, newsID DESC);
                END";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.ExecuteNonQuery();
            }
        }

        private static string StatusToString(NewsStatus status)
        {
            switch (status)
            {
                case NewsStatus.Published:
                    return "PUBLISHED";
                case NewsStatus.Archived:
                    return "ARCHIVED";
                default:
                    return "DRAFT";
            }
        }

        private static NewsStatus ToStatus(string status)
        {
            if (string.IsNullOrWhiteSpace(status))
            {
                return NewsStatus.Draft;
            }

            switch (status.Trim().ToUpperInvariant())
            {
                case "PUBLISHED":
                    return NewsStatus.Published;
                case "ARCHIVED":
                    return NewsStatus.Archived;
                default:
                    return NewsStatus.Draft;
            }
        }
    }
}
