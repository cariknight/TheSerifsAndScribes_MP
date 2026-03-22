using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace TheSerifsAndScribes_MP
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindLatestAnnouncement();
                BindLatestNews();
            }
        }

        private class NewsView
        {
            public int Id { get; set; }
            public string Title { get; set; }
            public DateTime CreatedAt { get; set; }
            public string Preview { get; set; }
            public string Link { get; set; }
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

        private string BuildNewsPreview(string bodyHtml)
        {
            if (string.IsNullOrWhiteSpace(bodyHtml)) return string.Empty;
            var plain = System.Text.RegularExpressions.Regex.Replace(bodyHtml, "<.*?>", string.Empty);
            return BuildPreview(plain);
        }

        private void BindLatestNews()
        {
            var news = NewsRepository.GetPublished()
                .OrderByDescending(n => n.CreatedAt)
                .Select(n => new NewsView
                {
                    Id = n.Id,
                    Title = n.Title,
                    CreatedAt = n.CreatedAt,
                    Preview = BuildNewsPreview(n.BodyHtml),
                    Link = $"News.aspx#{n.Id}"
                })
                .ToList();

            if (news == null || news.Count == 0)
            {
                NoNewsPanel.Visible = true;
                NewsCarouselRepeater.Visible = false;
                return;
            }

            // chunk into slides of 3
            var slides = news
                .Select((item, index) => new { item, index })
                .GroupBy(x => x.index / 3)
                .Select(g => g.Select(x => x.item).ToList())
                .ToList();

            NoNewsPanel.Visible = false;
            NewsCarouselRepeater.Visible = true;
            NewsCarouselRepeater.DataSource = slides;
            NewsCarouselRepeater.DataBind();
        }

        protected void NewsCarouselRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
                return;

            var slideItems = e.Item.DataItem as List<NewsView>;
            var inner = e.Item.FindControl("SlideItemsRepeater") as Repeater;
            if (inner != null && slideItems != null)
            {
                inner.DataSource = slideItems;
                inner.DataBind();
            }

            if (e.Item.ItemIndex == 0)
            {
                var container = e.Item.FindControl("CarouselItem") as HtmlGenericControl;
                if (container != null)
                {
                    container.Attributes["class"] += " active";
                }
            }
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
