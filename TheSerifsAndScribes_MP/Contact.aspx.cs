using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSerifsAndScribes_MP
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Check if consent is ticked
            if (!chkConsent.Checked)
            {
                Response.Write("<script>alert('You must check the consent box before submitting.');</script>");
                return;
            }

            // If consent is checked, proceed
            Response.Write("<script>alert('Form submitted successfully!');</script>");
        }
    }
}