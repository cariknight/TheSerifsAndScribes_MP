using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;

namespace TheSerifsAndScribes_MP
{
    public partial class Careers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TheSerifsAndScribes_MP.CareerRepository.SeedDefaultsIfEmpty();

                ddlStatus.SelectedValue = "All";
                ddlSort.SelectedValue = "DESC";
                LoadVacancies();
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            LoadVacancies();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = string.Empty;
            ddlStatus.SelectedValue = "All";
            ddlSort.SelectedValue = "DESC";
            LoadVacancies();
        }

        protected string GetStatusClass(object statusObj)
        {
            var status = (statusObj ?? string.Empty).ToString().Trim().ToLowerInvariant();
            if (status == "new") return "new";
            if (status == "active") return "active";
            return "archived";
        }

        protected string GetSafeUrl(object urlObj)
        {
            var url = (urlObj ?? string.Empty).ToString().Trim();
            return string.IsNullOrWhiteSpace(url) ? "#" : url;
        }

        protected string GetDisabledClass(object urlObj)
        {
            var url = (urlObj ?? string.Empty).ToString().Trim();
            return string.IsNullOrWhiteSpace(url) ? "is-disabled" : string.Empty;
        }

        private void LoadVacancies()
        {
            string q = txtSearch.Text.Trim();
            string status = ddlStatus.SelectedValue ?? "All";
            string sortDir = (ddlSort.SelectedValue ?? "DESC").ToUpperInvariant() == "ASC" ? "ASC" : "DESC";

            var items = TheSerifsAndScribes_MP.CareerRepository.GetAll()
                .Select(c => new VacancyItem
                {
                    Id = c.Id,
                    Title = $"Vacancy List: {c.VacancyDate:MMMM dd, yyyy}",
                    Status = c.Status,
                    PostedDate = c.VacancyDate == DateTime.MinValue ? DateTime.Today : c.VacancyDate,
                    FileUrl = !string.IsNullOrWhiteSpace(c.PreviewUrl) ? c.PreviewUrl : c.DownloadUrl
                })
                .ToList();

            // Filter
            if (!string.IsNullOrWhiteSpace(q))
            {
                items = items.Where(v =>
                    v.Title.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    v.PostedDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture).Contains(q)).ToList();
            }

            if (!string.Equals(status, "All", StringComparison.OrdinalIgnoreCase))
            {
                items = items.Where(v => string.Equals(v.Status, status, StringComparison.OrdinalIgnoreCase)).ToList();
            }

            // Sort
            items = sortDir == "ASC"
                ? items.OrderBy(v => v.PostedDate).ToList()
                : items.OrderByDescending(v => v.PostedDate).ToList();

            rptVacancies.DataSource = items;
            rptVacancies.DataBind();
            lblCount.Text = items.Count.ToString(CultureInfo.InvariantCulture);
            pnlEmpty.Visible = items.Count == 0;
        }

        private class VacancyItem
        {
            public int Id { get; set; }
            public string Title { get; set; }
            public string Status { get; set; }
            public DateTime PostedDate { get; set; }
            public string FileUrl { get; set; }
        }
    }
}
