using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

namespace TheSerifsAndScribes_MP
{
    public partial class Careers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

            // Use mock data for now
            var items = GetMockVacancies();

            // Filter
            if (!string.IsNullOrWhiteSpace(q))
            {
                items = items.Where(v =>
                    v.Title.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    v.Department.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0 ||
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


        //testing
        private List<VacancyItem> GetMockVacancies()
        {
            return new List<VacancyItem>
            {
                new VacancyItem { Id = 12, Title = "Vacancy List: March 13, 2026", Department = "City Admin", Status = "New", PostedDate = new DateTime(2026, 3, 13), FileUrl = "files/vacancies-march-13-2026.pdf" },
                new VacancyItem { Id = 11, Title = "Vacancy List: March 07, 2026", Department = "HR Office", Status = "New", PostedDate = new DateTime(2026, 3, 7), FileUrl = "files/vacancies-march-07-2026.pdf" },
                new VacancyItem { Id = 10, Title = "Vacancy List: February 28, 2026", Department = "Public Safety", Status = "Active", PostedDate = new DateTime(2026, 2, 28), FileUrl = "files/vacancies-feb-28-2026.pdf" },
                new VacancyItem { Id = 9, Title = "Vacancy List: February 21, 2026", Department = "Public Safety", Status = "Active", PostedDate = new DateTime(2026, 2, 21), FileUrl = "files/vacancies-feb-21-2026.pdf" },
                new VacancyItem { Id = 8, Title = "Vacancy List: February 14, 2026", Department = "Public Safety", Status = "Active", PostedDate = new DateTime(2026, 2, 14), FileUrl = "files/vacancies-feb-14-2026.pdf" },
                new VacancyItem { Id = 7, Title = "Vacancy List: February 07, 2026", Department = "Public Safety", Status = "Archived", PostedDate = new DateTime(2026, 2, 7), FileUrl = "files/vacancies-feb-07-2026.pdf" },
                new VacancyItem { Id = 6, Title = "Vacancy List: January 31, 2026", Department = "Public Safety", Status = "Archived", PostedDate = new DateTime(2026, 1, 31), FileUrl = "files/vacancies-jan-31-2026.pdf" }
            };
        }
        //edit this when sql is done

        private class VacancyItem
        {
            public int Id { get; set; }
            public string Title { get; set; }
            public string Department { get; set; }
            public string Status { get; set; }
            public DateTime PostedDate { get; set; }
            public string FileUrl { get; set; }
        }
    }
}
