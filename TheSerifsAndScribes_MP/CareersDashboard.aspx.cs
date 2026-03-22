using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace TheSerifsAndScribes_MP
{
    public partial class CareersDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCareers();
            }
        }

        private void BindCareers()
        {
            var data = CareerRepository.GetAll()
                .OrderByDescending(c => c.VacancyDate)
                .ThenByDescending(c => c.Id)
                .ToList();

            gvCareers.DataSource = data;
            gvCareers.DataBind();
            lblMessage.Text = string.Empty;
        }

        protected void btnAddCareer_Click(object sender, EventArgs e)
        {
            try
            {
                if (!DateTime.TryParse(txtVacancyDate.Text, out var date))
                {
                    lblMessage.Text = "Please provide a valid vacancy date.";
                    return;
                }

                var preview = txtPreviewUrl.Text.Trim();
                var download = txtDownloadUrl.Text.Trim();
                var status = ddlStatusAdd.SelectedValue;

                CareerRepository.Add(date, preview, download, status);
                txtPreviewUrl.Text = string.Empty;
                txtDownloadUrl.Text = string.Empty;
                txtVacancyDate.Text = string.Empty;
                ddlStatusAdd.SelectedValue = "New";

                BindCareers();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error adding record: " + ex.Message;
            }
        }

        protected void gvCareers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCareers.EditIndex = e.NewEditIndex;
            BindCareers();
        }

        protected void gvCareers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCareers.EditIndex = -1;
            BindCareers();
        }

        protected void gvCareers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int id = (int)gvCareers.DataKeys[e.RowIndex].Value;
                var row = gvCareers.Rows[e.RowIndex];

                var txtDate = row.FindControl("txtEditDate") as TextBox;
                var txtPreview = row.FindControl("txtEditPreview") as TextBox;
                var txtDownload = row.FindControl("txtEditDownload") as TextBox;
                var ddlStatus = row.FindControl("ddlEditStatus") as DropDownList;

                if (txtDate == null || !DateTime.TryParse(txtDate.Text, out var date))
                {
                    lblMessage.Text = "Please provide a valid vacancy date.";
                    return;
                }

                var preview = txtPreview?.Text.Trim() ?? string.Empty;
                var download = txtDownload?.Text.Trim() ?? string.Empty;
                var status = ddlStatus?.SelectedValue ?? "New";

                CareerRepository.Update(id, date, preview, download, status);

                gvCareers.EditIndex = -1;
                BindCareers();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error updating record: " + ex.Message;
            }
        }

        protected void gvCareers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id = (int)gvCareers.DataKeys[e.RowIndex].Value;
                CareerRepository.Delete(id);
                BindCareers();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error deleting record: " + ex.Message;
            }
        }

        protected string GetStatusCss(object statusObj)
        {
            var status = (statusObj ?? string.Empty).ToString().Trim().ToLowerInvariant();
            if (status == "new") return "status-new";
            if (status == "active") return "status-active";
            return "status-archived";
        }
    }
}
