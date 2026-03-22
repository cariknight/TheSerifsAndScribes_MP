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
            ShowMessage("Announcement posted.");
            BindGrid();
        }

        protected void AnnouncementsGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (!Guid.TryParse(e.CommandArgument.ToString(), out var id))
            {
                return;
            }

            if (e.CommandName == "delete")
            {
                AnnouncementRepository.Delete(id);
                ShowMessage("Announcement deleted.");
            }
            else if (e.CommandName == "toggle")
            {
                AnnouncementRepository.ToggleArchive(id);
                var updated = AnnouncementRepository.Get(id);
                var status = updated != null && updated.IsArchived ? "archived" : "re-activated";
                ShowMessage($"Announcement {status}.");
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
    }
}