using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSerifsAndScribes_MP
{
    public partial class OrganizationalChart : Page
    {
        protected IList<DepartmentRecord> Departments { get; private set; }
        protected IList<OfficerRecord> Officers { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            EnsureData();

            if (!IsPostBack)
            {
                BindDepartments();
                PopulateDepartmentFilter();
                BindOfficers(Officers);
            }
        }

        private Repeater GetRepeater(string id)
        {
            // Prefer the generated field; fall back to locating within the master/content placeholders
            var field = FindControl(id) as Repeater;
            if (field != null) return field;

            var mainContent = Master?.FindControl("MainContent");
            return mainContent?.FindControl(id) as Repeater;
        }

        private void EnsureData()
        {
            if (Departments == null)
            {
                Departments = OrganizationRepository.GetDepartments().ToList();
            }

            if (Officers == null)
            {
                Officers = OrganizationRepository.GetOfficers().ToList();
            }
        }

        private void BindDepartments()
        {
            var deptRepeater = GetRepeater(nameof(DepartmentsRepeater));
            if (deptRepeater == null) return;
            deptRepeater.DataSource = Departments;
            deptRepeater.DataBind();
        }

        private void BindOfficers(IEnumerable<OfficerRecord> list)
        {
            var officersRepeater = GetRepeater(nameof(OfficersRepeater));
            if (officersRepeater == null) return;
            officersRepeater.DataSource = list;
            officersRepeater.DataBind();
        }

        private void PopulateDepartmentFilter()
        {
            var ddl = FindControlRecursive<DropDownList>("OfficerDepartmentFilter");
            if (ddl == null) return;

            ddl.Items.Clear();
            ddl.Items.Add(new ListItem("All departments", string.Empty));
            ddl.Items.Add(new ListItem("No department", "__none"));
            foreach (var d in Departments)
            {
                ddl.Items.Add(new ListItem(d.DepartmentName, d.DepartmentId.ToString()));
            }
        }

        protected void FilterButton_Click(object sender, EventArgs e)
        {
            EnsureData();

            var searchBox = FindControlRecursive<TextBox>("OfficerSearchBox");
            var ddl = FindControlRecursive<DropDownList>("OfficerDepartmentFilter");

            var search = searchBox?.Text ?? string.Empty;
            var deptValue = ddl?.SelectedValue ?? string.Empty;

            var query = Officers.AsEnumerable();
            if (!string.IsNullOrWhiteSpace(search))
            {
                var s = search.Trim();
                query = query.Where(o =>
                    Contains(o.FirstName, s) ||
                    Contains(o.LastName, s) ||
                    Contains($"{o.FirstName} {o.LastName}".Trim(), s) ||
                    Contains(o.OfficerId, s) ||
                    Contains(o.Position, s) ||
                    Contains(o.DepartmentName, s));
            }

            if (!string.IsNullOrEmpty(deptValue))
            {
                if (deptValue == "__none")
                {
                    query = query.Where(o => !o.DepartmentId.HasValue);
                }
                else if (int.TryParse(deptValue, out var deptId))
                {
                    query = query.Where(o => o.DepartmentId == deptId);
                }
            }

            BindOfficers(query.ToList());
        }

        private T FindControlRecursive<T>(string id) where T : Control
        {
            var direct = FindControl(id) as T;
            if (direct != null) return direct;

            var mainContent = Master?.FindControl("MainContent");
            return mainContent?.FindControl(id) as T;
        }

        private static bool Contains(string source, string term)
        {
            return !string.IsNullOrEmpty(source) &&
                   !string.IsNullOrEmpty(term) &&
                   source.IndexOf(term, StringComparison.OrdinalIgnoreCase) >= 0;
        }
    }
}
