using System;
using System.Web.UI;

namespace TheSerifsAndScribes_MP
{
    public partial class Dashboard : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["AdminID"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            
        }

        protected string GetAdminName()
        {
            if (Session["FirstName"] != null)
            {
                return Session["FirstName"].ToString() + " " + Session["LastName"].ToString();
            }
            return "Admin";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}
