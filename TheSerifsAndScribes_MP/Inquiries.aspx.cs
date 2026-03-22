using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSerifsAndScribes_MP
{
    public partial class Inquiries : System.Web.UI.Page
    {
        private readonly string _connString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            using (var conn = new SqlConnection(_connString))
            using (var cmd = new SqlCommand(@"SELECT messageID, fullName, email, phoneNumber, [message], dateSent, [status] 
                                              FROM Inquiry ORDER BY dateSent DESC, messageID DESC", conn))
            using (var adapter = new SqlDataAdapter(cmd))
            {
                var table = new DataTable();
                adapter.Fill(table);
                GridInquiries.DataSource = table;
                GridInquiries.DataBind();
            }
        }

        protected void GridInquiries_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandArgument == null) return;
            if (!int.TryParse(e.CommandArgument.ToString(), out var id)) return;

            string newStatus = null;
            bool delete = false;

            switch (e.CommandName)
            {
                case "MarkRead":
                    newStatus = "READ";
                    break;
                case "MarkUnread":
                    newStatus = "UNREAD";
                    break;
                case "MarkReplied":
                    newStatus = "REPLIED";
                    break;
                case "MarkArchived":
                    newStatus = "ARCHIVED";
                    break;
                case "DeleteRow":
                    delete = true;
                    break;
                default:
                    return;
            }

            using (var conn = new SqlConnection(_connString))
            using (var cmd = new SqlCommand())
            {
                cmd.Connection = conn;
                if (delete)
                {
                    cmd.CommandText = "DELETE FROM Inquiry WHERE messageID = @id";
                }
                else
                {
                    cmd.CommandText = "UPDATE Inquiry SET [status] = @status WHERE messageID = @id";
                    cmd.Parameters.AddWithValue("@status", newStatus);
                }
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            BindGrid();
        }

        protected void GridInquiries_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            var status = DataBinder.Eval(e.Row.DataItem, "status") as string;
            var badge = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Row.FindControl("StatusBadge");
            if (badge == null || string.IsNullOrEmpty(status)) return;

            string cls;
            switch (status.ToUpper())
            {
                case "UNREAD":
                    cls = "badge-unread";
                    break;
                case "READ":
                    cls = "badge-read";
                    break;
                case "REPLIED":
                    cls = "badge-replied";
                    break;
                case "ARCHIVED":
                    cls = "badge-archived";
                    break;
                default:
                    cls = "badge-read";
                    break;
            }

            badge.Attributes["class"] = $"badge {cls}";
            badge.InnerText = status.ToUpper();
        }
    }
}
