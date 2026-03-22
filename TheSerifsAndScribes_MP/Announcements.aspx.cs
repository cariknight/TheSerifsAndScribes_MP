using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSerifsAndScribes_MP
{
    public partial class Announcements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAnnouncements();
            }
        }

        private void BindAnnouncements()
        {
            var announcements = AnnouncementRepository.GetActive().ToList();
            var hasItems = announcements.Any();

            EmptyStatePanel.Visible = !hasItems;
            AnnouncementsRepeater.Visible = hasItems;

            AnnouncementsRepeater.DataSource = announcements;
            AnnouncementsRepeater.DataBind();
        }
    }
}
