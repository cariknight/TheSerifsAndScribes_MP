using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

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

            var fullName = fullname.Text?.Trim();
            var emailAddress = email.Text?.Trim();
            var subjectText = subject.Text?.Trim();
            var phoneText = phone.Text?.Trim();
            var messageBody = message.Text?.Trim();

            if (string.IsNullOrWhiteSpace(fullName) ||
                string.IsNullOrWhiteSpace(emailAddress) ||
                string.IsNullOrWhiteSpace(messageBody))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "requiredAlert",
                    "alert('Full Name, Email, and Message are required.');", true);
                return;
            }

            try
            {
                var saved = InquiryRepository.Add(fullName, emailAddress, phoneText, subjectText, messageBody);
                if (!saved)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "errorAlert",
                        "alert('Unable to send your message right now. Please try again later.');", true);
                    return;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.TraceError("Contact submit failed: {0}", ex);
#if DEBUG
                var safeMessage = (ex.Message ?? "Unknown error").Replace("'", "\\'");
                ClientScript.RegisterStartupScript(this.GetType(), "errorAlert",
                    $"alert('Unable to send your message right now. Details: {safeMessage}');", true);
#else
                ClientScript.RegisterStartupScript(this.GetType(), "errorAlert",
                    "alert('Unable to send your message right now. Please try again later.');", true);
#endif
                return;
            }

            fullname.Text = "";
            email.Text = "";
            subject.Text = "";
            message.Text = "";
            phone.Text = "";
            consent.Checked = false;

            ClientScript.RegisterStartupScript(this.GetType(), "successAlert",
                "alert('Form submitted successfully!');", true);
        }
    }
}
