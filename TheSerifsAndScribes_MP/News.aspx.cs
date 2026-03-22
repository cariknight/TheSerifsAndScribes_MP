using System;
using System.Linq;
using System.Web.UI;

namespace TheSerifsAndScribes_MP
{
    public partial class News : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindNews();
            }
        }

        private void BindNews()
        {
            var items = NewsRepository.GetPublished().ToList();

            if (items.Count == 0)
            {
                EmptyStatePanel.Visible = true;
                NewsRepeater.Visible = false;
                return;
            }

            EmptyStatePanel.Visible = false;
            NewsRepeater.Visible = true;
            NewsRepeater.DataSource = items;
            NewsRepeater.DataBind();
        }
    }
}
