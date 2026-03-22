using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TheSerifsAndScribes_MP
{
    /// <summary>
    /// Data access helper for Inquiry entries (contact form submissions).
    /// </summary>
    public static class InquiryRepository
    {
        private static readonly string[] ConnectionStrings = new[]
        {
            ConfigurationManager.ConnectionStrings["DBConnection"]?.ConnectionString,       // Azure
            ConfigurationManager.ConnectionStrings["DBConnectionLocal"]?.ConnectionString, // LocalDB dev
            ConfigurationManager.ConnectionStrings["DBConnectionExpress"]?.ConnectionString // SQLEXPRESS
        };

        /// <summary>
        /// Try each configured connection string until one opens successfully.
        /// This allows local development to keep working if cloud SQL is unreachable.
        /// </summary>
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
                    return conn; // caller owns disposal
                }
                catch (SqlException ex)
                {
                    lastSqlEx = ex;
                    conn.Dispose();
                }
            }

            if (lastSqlEx != null) throw lastSqlEx;
            throw new InvalidOperationException("No valid database connection string found (DBConnection / Local / Express).");
        }

        public static DataTable GetAll()
        {
            const string query = @"
                SELECT messageID, assignedAdminID, fullName, email, phoneNumber, subject, [message], dateSent, [status]
                FROM [dbo].[Inquiry]
                ORDER BY dateSent DESC, messageID DESC;";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(query, conn))
            using (var adapter = new SqlDataAdapter(cmd))
            {
                var table = new DataTable();
                adapter.Fill(table);
                return table;
            }
        }

        public static bool Add(string fullName, string email, string phone, string subject, string message)
        {
            if (string.IsNullOrWhiteSpace(fullName) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(message))
            {
                return false;
            }

            const string insert = @"
                INSERT INTO [dbo].[Inquiry] (fullName, email, phoneNumber, subject, [message], dateSent, [status])
                VALUES (@fullName, @email, @phoneNumber, @subject, @message, @dateSent, @status);";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(insert, conn))
            {
                cmd.Parameters.Add("@fullName", SqlDbType.NVarChar, 50).Value = fullName.Trim();
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = email.Trim();
                // phoneNumber column is NOT NULL, so send an empty string when omitted.
                cmd.Parameters.Add("@phoneNumber", SqlDbType.VarChar, 13).Value =
                    string.IsNullOrWhiteSpace(phone) ? string.Empty : phone.Trim();
                cmd.Parameters.Add("@subject", SqlDbType.NVarChar, 200).Value =
                    string.IsNullOrWhiteSpace(subject) ? (object)DBNull.Value : subject.Trim();
                cmd.Parameters.Add("@message", SqlDbType.NVarChar, -1).Value = message.Trim();
                cmd.Parameters.Add("@dateSent", SqlDbType.Date).Value = DateTime.Today;
                cmd.Parameters.Add("@status", SqlDbType.VarChar, 10).Value = "UNREAD";

                var rows = cmd.ExecuteNonQuery();
                return rows > 0;
            }
        }

        public static void UpdateStatus(int id, string status)
        {
            if (string.IsNullOrWhiteSpace(status))
            {
                return;
            }

            const string sql = @"UPDATE [dbo].[Inquiry] SET [status] = @status WHERE messageID = @id;";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@status", SqlDbType.NVarChar, 20).Value = status.Trim().ToUpperInvariant();
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;

                cmd.ExecuteNonQuery();
            }
        }

        public static void Delete(int id)
        {
            const string sql = @"DELETE FROM [dbo].[Inquiry] WHERE messageID = @id;";

            using (var conn = CreateOpenConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;

                cmd.ExecuteNonQuery();
            }
        }
    }
}
