using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web.UI;

namespace TheSerifsAndScribes_MP
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboard();
            }
        }

        private void LoadDashboard()
        {
            BindInquiryCards();
            BindAnnouncements();
            BindVisitorCount();
        }

        private void BindVisitorCount()
        {
            // Placeholder for Google Analytics: read a configured value so the UI is populated even before wiring GA.
            var visitorsSetting = ConfigurationManager.AppSettings["AnalyticsTotalVisitors"];
            int visitors = 0;
            if (!string.IsNullOrWhiteSpace(visitorsSetting))
            {
                int.TryParse(visitorsSetting, out visitors);
            }

            TotalVisitorsLiteral.Text = $"<p class='stat-card__value'>{visitors}</p>";

            if (string.IsNullOrWhiteSpace(visitorsSetting))
            {
                VisitorNoteLiteral.Visible = true;
                VisitorNoteLiteral.Text = "<p class='stat-card__note'>Connect Google Analytics to show live visitors.</p>";
            }
            else
            {
                VisitorNoteLiteral.Visible = false;
            }
        }

        private void BindInquiryCards()
        {
            var inquiries = InquiryRepository.GetAll();
            var unread = inquiries.AsEnumerable()
                                  .Count(r => string.Equals(r.Field<string>("status"), "UNREAD", StringComparison.OrdinalIgnoreCase));

            TotalInquiriesLiteral.Text = $"<p class='stat-card__value'>{inquiries.Rows.Count}</p>";
            UnreadInquiriesLiteral.Text = $"<p class='stat-card__value'>{unread}</p>";

            var recentRows = inquiries.AsEnumerable()
                                      .OrderByDescending(r => r.Field<DateTime>("dateSent"))
                                      .Take(5)
                                      .ToList();

            DataView view;
            if (recentRows.Any())
            {
                var table = recentRows.CopyToDataTable();
                view = table.DefaultView;
            }
            else
            {
                view = inquiries.Clone().DefaultView; // empty with columns
            }

            RecentInquiriesRepeater.DataSource = view;
            RecentInquiriesRepeater.DataBind();

            InquiriesEmptyState.Visible = !recentRows.Any();
            if (InquiriesEmptyState.Visible)
            {
                InquiriesEmptyState.Text = "<p class='empty-state'>No inquiries yet.</p>";
            }
        }

        private void BindAnnouncements()
        {
            var active = AnnouncementRepository.GetActive()
                                               .OrderByDescending(a => a.CreatedAt)
                                               .Take(5)
                                               .ToList();

            AnnouncementsRepeater.DataSource = active;
            AnnouncementsRepeater.DataBind();

            AnnouncementsEmptyState.Visible = !active.Any();
            if (AnnouncementsEmptyState.Visible)
            {
                AnnouncementsEmptyState.Text = "<p class='empty-state'>No active announcements.</p>";
            }
        }
    }
}
