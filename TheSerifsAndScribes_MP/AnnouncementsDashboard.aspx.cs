using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSerifsAndScribes_MP
{
    public partial class AnnouncementsDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            var title = TitleTextBox.Text.Trim();
            var body = BodyTextBox.Text.Trim();

            if (string.IsNullOrWhiteSpace(title) || string.IsNullOrWhiteSpace(body))
            {
                ShowMessage("Title and details are required.", isError: true);
                return;
            }

            AnnouncementRepository.Add(title, body);
            TitleTextBox.Text = string.Empty;
            BodyTextBox.Text = string.Empty;
            ShowMessage("Announcement saved and needs approval.");
            BindGrid();
        }

        protected void AnnouncementsGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (!Guid.TryParse(e.CommandArgument.ToString(), out var id))
            {
                return;
            }

            switch (e.CommandName)
            {
                case "delete":
                    AnnouncementRepository.Delete(id);
                    ShowMessage("Announcement deleted.");
                    break;
                case "approve":
                    AnnouncementRepository.SetStatus(id, AnnouncementStatus.Active);
                    ShowMessage("Announcement approved and published.");
                    break;
                case "archive":
                    AnnouncementRepository.SetStatus(id, AnnouncementStatus.Archived);
                    ShowMessage("Announcement archived.");
                    break;
                case "activate":
                    AnnouncementRepository.SetStatus(id, AnnouncementStatus.Active);
                    ShowMessage("Announcement re-activated.");
                    break;
                default:
                    return;
            }

            BindGrid();
        }

        private void BindGrid()
        {
            AnnouncementsGrid.DataSource = AnnouncementRepository.GetAll();
            AnnouncementsGrid.DataBind();
        }

        private void ShowMessage(string message, bool isError = false)
        {
            MessagePanel.Visible = true;
            MessagePanel.CssClass = isError ? "alert alert-danger" : "alert alert-success";
            MessagePanel.Controls.Clear();
            MessagePanel.Controls.Add(new Literal { Text = message });
        }

        protected string GetStatusLabel(object statusObj)
        {
            var status = ToStatus(statusObj);
            switch (status)
            {
                case AnnouncementStatus.NeedApproval:
                    return "Needs approval";
                case AnnouncementStatus.Active:
                    return "Active";
                case AnnouncementStatus.Archived:
                    return "Archived";
                default:
                    return "Unknown";
            }
        }

        protected string GetStatusBadgeClass(object statusObj)
        {
            var status = ToStatus(statusObj);
            switch (status)
            {
                case AnnouncementStatus.NeedApproval:
                    return "badge bg-warning text-dark";
                case AnnouncementStatus.Active:
                    return "badge bg-success";
                case AnnouncementStatus.Archived:
                    return "badge bg-secondary";
                default:
                    return "badge bg-light text-dark";
            }
        }

        private AnnouncementStatus ToStatus(object value)
        {
            if (value is AnnouncementStatus typed)
            {
                return typed;
            }

            try
            {
                return (AnnouncementStatus)Enum.Parse(typeof(AnnouncementStatus), value.ToString(), ignoreCase: true);
            }
            catch
            {
                return AnnouncementStatus.NeedApproval;
            }
        }
    }
}
