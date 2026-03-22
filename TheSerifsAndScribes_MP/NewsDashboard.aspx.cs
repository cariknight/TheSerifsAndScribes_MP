using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSerifsAndScribes_MP
{
    public partial class NewsDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAuthors();
                BindGrid();
            }
        }

        protected void SaveDraftButton_Click(object sender, EventArgs e)
        {
            SaveArticle(NewsStatus.Draft);
        }

        protected void PublishButton_Click(object sender, EventArgs e)
        {
            SaveArticle(NewsStatus.Published);
        }

        private void SaveArticle(NewsStatus status)
        {
            var title = TitleTextBox.Text.Trim();
            var category = CategoryDropDown.SelectedValue;
            var bodyHtml = ContentHtml.Value;

            var authorId = GetSelectedAuthorId();
            if (authorId <= 0)
            {
                ShowMessage("Select a valid author.", isError: true);
                ContentHtml.Value = bodyHtml;
                return;
            }

            if (string.IsNullOrWhiteSpace(title) ||
                string.IsNullOrWhiteSpace(bodyHtml))
            {
                ShowMessage("Headline and content are required.", isError: true);
                // keep content in hidden field so the editor repopulates
                ContentHtml.Value = bodyHtml;
                return;
            }

            NewsRepository.Add(title, authorId, bodyHtml, category, status);

            TitleTextBox.Text = string.Empty;
            AuthorDropDown.ClearSelection();
            CategoryDropDown.SelectedIndex = 0;
            ContentHtml.Value = string.Empty;

            ShowMessage(status == NewsStatus.Published
                ? "Article published."
                : "Draft saved.");

            BindGrid();
        }

        private int GetSelectedAuthorId()
        {
            return int.TryParse(AuthorDropDown.SelectedValue, out var id) ? id : -1;
        }

        private void BindAuthors()
        {
            var authors = AdminRepository.GetAll();
            AuthorDropDown.DataSource = authors;
            AuthorDropDown.DataTextField = "FullName";
            AuthorDropDown.DataValueField = "Id";
            AuthorDropDown.DataBind();
            AuthorDropDown.Items.Insert(0, new ListItem("-- Select author --", ""));
        }

        protected void NewsGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (!int.TryParse(e.CommandArgument.ToString(), out var id))
            {
                return;
            }

            switch (e.CommandName)
            {
                case "publish":
                    NewsRepository.SetStatus(id, NewsStatus.Published);
                    ShowMessage("Article published.");
                    break;
                case "unpublish":
                    NewsRepository.SetStatus(id, NewsStatus.Draft);
                    ShowMessage("Moved back to draft.");
                    break;
                case "archive":
                    NewsRepository.SetStatus(id, NewsStatus.Archived);
                    ShowMessage("Article archived.");
                    break;
                case "delete":
                    NewsRepository.Delete(id);
                    ShowMessage("Article deleted.");
                    break;
                default:
                    return;
            }

            BindGrid();
        }

        protected string GetStatusLabel(object statusObj)
        {
            var status = ToStatus(statusObj);
            switch (status)
            {
                case NewsStatus.Published:
                    return "Published";
                case NewsStatus.Archived:
                    return "Archived";
                default:
                    return "Draft";
            }
        }

        protected string GetStatusBadgeClass(object statusObj)
        {
            var status = ToStatus(statusObj);
            switch (status)
            {
                case NewsStatus.Published:
                    return "badge-status badge-published";
                case NewsStatus.Archived:
                    return "badge-status badge-archived";
                default:
                    return "badge-status badge-draft";
            }
        }

        protected NewsStatus AsStatus(object statusObj)
        {
            return ToStatus(statusObj);
        }

        private NewsStatus ToStatus(object value)
        {
            if (value is NewsStatus typed)
            {
                return typed;
            }

            try
            {
                return (NewsStatus)Enum.Parse(typeof(NewsStatus), value.ToString(), ignoreCase: true);
            }
            catch
            {
                return NewsStatus.Draft;
            }
        }

        private void BindGrid()
        {
            NewsGrid.DataSource = NewsRepository.GetAll();
            NewsGrid.DataBind();
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
