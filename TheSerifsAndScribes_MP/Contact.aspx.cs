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
        protected void submitBtn_Click(object sender, EventArgs e)
        {
            if (!consent.Checked)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "consentAlert",
                    "alert('You must check the consent box before submitting.');", true);
                return;
            }

            fullname.Text = "";
            email.Text = "";
            subject.Text = "";
            message.Text = "";
            consent.Checked = false;

            ClientScript.RegisterStartupScript(this.GetType(), "successAlert",
                "alert('Form submitted successfully!');", true);
        }
    }
}