using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSerifsAndScribes_MP
{
    public partial class Inquiries : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindList();
            }
        }

        private void BindList()
        {
            var table = InquiryRepository.GetAll();
            PanelEmpty.Visible = table.Rows.Count == 0;
            RepeaterInquiries.DataSource = table;
            RepeaterInquiries.DataBind();
        }

        protected void RepeaterInquiries_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandArgument == null) return;
            if (!int.TryParse(e.CommandArgument.ToString(), out var id)) return;

            string newStatus = null;
            bool delete = false;

            switch (e.CommandName)
            {
                case "Reply":
                    newStatus = "REPLIED";
                    break;
                case "MarkRead":
                    newStatus = "READ";
                    break;
                case "MarkUnread":
                    newStatus = "UNREAD";
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

            if (delete)
            {
                InquiryRepository.Delete(id);
            }
            else
            {
                InquiryRepository.UpdateStatus(id, newStatus);
            }

            BindList();
        }

        protected void RepeaterInquiries_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem) return;

            var status = DataBinder.Eval(e.Item.DataItem, "status") as string;
            var badge = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("StatusBadge");
            var bodyLiteral = (Literal)e.Item.FindControl("LiteralMessage");

            if (bodyLiteral != null)
            {
                var body = DataBinder.Eval(e.Item.DataItem, "message") as string ?? string.Empty;
                var encoded = HttpUtility.HtmlEncode(body).Replace("\r\n", "<br />").Replace("\n", "<br />");
                bodyLiteral.Text = encoded;
            }

            if (badge == null || string.IsNullOrEmpty(status)) return;

            string cls;
            switch (status.ToUpperInvariant())
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
            badge.InnerText = status.ToUpperInvariant();
        }

        /// <summary>
        /// Builds the client-side mailto link and keeps postback enabled.
        /// </summary>
        protected string BuildMailtoOnClick(object emailObj, object subjectObj, object fullNameObj)
        {
            var email = emailObj as string;
            if (string.IsNullOrWhiteSpace(email)) return "return true;";

            var subject = "Re: " + (subjectObj as string ?? "Your inquiry");
            var name = fullNameObj as string ?? "there";
            var body = $"Hi {name},%0D%0A%0D%0A";

            var encodedSubject = HttpUtility.UrlEncode(subject);
            var encodedBody = HttpUtility.UrlEncode(body);

            return $"window.location.href='mailto:{email}?subject={encodedSubject}&body={encodedBody}';return true;";
        }
    }
}
