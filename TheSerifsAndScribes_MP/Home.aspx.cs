using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSerifsAndScribes_MP
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindLatestAnnouncement();
            }
        }

        private void BindLatestAnnouncement()
        {
            EnsureFeaturedControls();

            var announcements = AnnouncementRepository.GetActive()
                .Take(3)
                .ToList();

            if (announcements == null || announcements.Count == 0)
            {
                NoAnnouncementPanel.Visible = true;
                LatestAnnouncementsRepeater.Visible = false;
                if (FeaturedPanel != null) FeaturedPanel.Visible = false;
                return;
            }

            NoAnnouncementPanel.Visible = false;

            // featured = first item
            var featured = announcements.First();
            if (FeaturedPanel != null)
            {
                FeaturedPanel.Visible = true;
            }
            if (FeaturedTitle != null) FeaturedTitle.InnerText = featured.Title;
            if (FeaturedBody != null) FeaturedBody.InnerText = BuildPreview(featured.Body);
            if (FeaturedDate != null) FeaturedDate.InnerText = featured.CreatedAt.ToString("MMMM dd, yyyy");

            LatestAnnouncementsRepeater.Visible = true;
            LatestAnnouncementsRepeater.DataSource = announcements.Select(a => new
            {
                a.Title,
                a.CreatedAt,
                Preview = BuildPreview(a.Body)
            });
            LatestAnnouncementsRepeater.DataBind();
        }

        private string BuildPreview(string body)
        {
            if (string.IsNullOrWhiteSpace(body)) return string.Empty;
            var preview = body.Trim();
            if (preview.Length > 140)
            {
                preview = preview.Substring(0, 137) + "...";
            }
            return preview;
        }

        private void EnsureFeaturedControls()
        {
            if (FeaturedPanel == null)
            {
                FeaturedPanel = FindControl("FeaturedPanel") as Panel;
            }
            if (FeaturedTitle == null)
            {
                FeaturedTitle = FindControl("FeaturedTitle") as System.Web.UI.HtmlControls.HtmlGenericControl;
            }
            if (FeaturedBody == null)
            {
                FeaturedBody = FindControl("FeaturedBody") as System.Web.UI.HtmlControls.HtmlGenericControl;
            }
            if (FeaturedDate == null)
            {
                FeaturedDate = FindControl("FeaturedDate") as System.Web.UI.HtmlControls.HtmlGenericControl;
            }
        }
    }
}
