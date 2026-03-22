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
            var items = AnnouncementRepository.GetActive().ToList();
            EmptyStatePanel.Visible = !items.Any();
            AnnouncementsRepeater.DataSource = items;
            AnnouncementsRepeater.DataBind();
        }
    }
}
