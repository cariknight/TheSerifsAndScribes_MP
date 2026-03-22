using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSerifsAndScribes_MP
{
    public partial class Organizations : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    BindDepartmentDropdown(OfficerDepartmentDropDown, null);
                    BindGrid();
                    BindOfficersGrid();
                }
                catch (Exception ex)
                {
                    ShowMessage($"Unable to load departments: {ex.Message}", true);
                }
            }
        }

        protected void AddDepartmentButton_Click(object sender, EventArgs e)
        {
            var name = DepartmentNameTextBox.Text.Trim();
            var description = DescriptionTextBox.Text.Trim();
            var pldtHotline = PldtHotlineTextBox.Text.Trim();
            var intelcoHotline = IntelcoHotlineTextBox.Text.Trim();

            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(pldtHotline) || string.IsNullOrWhiteSpace(intelcoHotline))
            {
                ShowMessage("Department name and both hotlines are required.", true);
                return;
            }

            try
            {
                OrganizationRepository.AddDepartment(name, description, pldtHotline, intelcoHotline, null);
                ClearAddForm();
                ShowMessage("Department saved.");
                BindGrid();
            }
            catch (Exception ex)
            {
                ShowMessage($"Could not save department: {ex.Message}", true);
            }
        }

        protected void AddOfficerButton_Click(object sender, EventArgs e)
        {
            var id = OfficerIdTextBox.Text.Trim();
            var first = OfficerFirstNameTextBox.Text.Trim();
            var last = OfficerLastNameTextBox.Text.Trim();
            var position = OfficerPositionTextBox.Text.Trim();
            var startText = OfficerTermStartTextBox.Text.Trim();
            var endText = OfficerTermEndTextBox.Text.Trim();
            var photo = OfficerPhotoUrlTextBox.Text.Trim();
            var deptValue = OfficerDepartmentDropDown.SelectedValue;
            int? deptId = null;
            if (!string.IsNullOrEmpty(deptValue) && int.TryParse(deptValue, out var parsedDept))
            {
                deptId = parsedDept;
            }

            if (string.IsNullOrWhiteSpace(id) || string.IsNullOrWhiteSpace(first) || string.IsNullOrWhiteSpace(last) || string.IsNullOrWhiteSpace(position) || string.IsNullOrWhiteSpace(startText) || string.IsNullOrWhiteSpace(endText))
            {
                ShowMessage("All officer fields are required except photo URL.", true);
                return;
            }

            if (!DateTime.TryParse(startText, out var start) || !DateTime.TryParse(endText, out var end))
            {
                ShowMessage("Invalid term dates. Use YYYY-MM-DD.", true);
                return;
            }

            if (end < start)
            {
                ShowMessage("Term end must be after term start.", true);
                return;
            }

            try
            {
                OrganizationRepository.AddOfficer(id, first, last, position, start, end, photo, deptId);
                ClearOfficerForm();
                ShowMessage("Officer saved.");
                BindDepartmentDropdown(OfficerDepartmentDropDown, null);
                BindGrid();
                BindOfficersGrid();
            }
            catch (Exception ex)
            {
                ShowMessage($"Could not save officer: {ex.Message}", true);
            }
        }

        protected void DepartmentsGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            DepartmentsGrid.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void DepartmentsGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            DepartmentsGrid.EditIndex = -1;
            BindGrid();
        }

        protected void DepartmentsGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var row = DepartmentsGrid.Rows[e.RowIndex];
            var id = Convert.ToInt32(DepartmentsGrid.DataKeys[e.RowIndex].Values["DepartmentId"]);

            var nameBox = (TextBox)row.FindControl("EditDepartmentNameTextBox");
            var descriptionBox = (TextBox)row.FindControl("EditDescriptionTextBox");
            var pldtBox = (TextBox)row.FindControl("EditPldtHotlineTextBox");
            var intelcoBox = (TextBox)row.FindControl("EditIntelcoHotlineTextBox");
            var headDropdown = (DropDownList)row.FindControl("EditHeadOfficerDropDown");

            if (nameBox == null || pldtBox == null || intelcoBox == null)
            {
                ShowMessage("Could not locate edit fields.", true);
                return;
            }

            var name = nameBox.Text.Trim();
            var description = descriptionBox != null ? descriptionBox.Text.Trim() : string.Empty;
            var pldtHotline = pldtBox.Text.Trim();
            var intelcoHotline = intelcoBox.Text.Trim();
            var headOfficerId = OrganizationRepository.SupportsHeadOfficer && headDropdown != null ? headDropdown.SelectedValue : null;

            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(pldtHotline) || string.IsNullOrWhiteSpace(intelcoHotline))
            {
                ShowMessage("Department name and both hotlines are required.", true);
                return;
            }

            try
            {
                OrganizationRepository.UpdateDepartment(id, name, description, pldtHotline, intelcoHotline, headOfficerId);
                DepartmentsGrid.EditIndex = -1;
                ShowMessage("Department updated.");
                BindGrid();
            }
            catch (Exception ex)
            {
                ShowMessage($"Could not update department: {ex.Message}", true);
            }
        }

        protected void DepartmentsGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = Convert.ToInt32(DepartmentsGrid.DataKeys[e.RowIndex].Values["DepartmentId"]);

            try
            {
                OrganizationRepository.DeleteDepartment(id);
                ShowMessage("Department removed.");
                BindGrid();
            }
            catch (Exception ex)
            {
                ShowMessage($"Could not delete department: {ex.Message}", true);
            }
        }

        protected void DepartmentsGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
            {
                return;
            }

            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                var dropdown = (DropDownList)e.Row.FindControl("EditHeadOfficerDropDown");
                if (dropdown != null)
                {
                    var data = e.Row.DataItem as DepartmentRecord;
                    BindHeadDropdown(dropdown, data != null ? data.HeadOfficerId : null);

                    if (!OrganizationRepository.SupportsHeadOfficer)
                    {
                        dropdown.Enabled = false;
                    }
                }
            }
        }

        protected string FormatHead(object nameObj, object positionObj)
        {
            var name = nameObj == null ? string.Empty : nameObj.ToString();
            var position = positionObj == null ? string.Empty : positionObj.ToString();

            if (string.IsNullOrWhiteSpace(name))
            {
                return "Not set";
            }

            return string.IsNullOrWhiteSpace(position) ? name : $"{name} ({position})";
        }

        private void BindGrid()
        {
            DepartmentsGrid.DataSource = OrganizationRepository.GetDepartments();
            DepartmentsGrid.DataBind();
        }

        private void BindOfficersGrid()
        {
            OfficersGrid.DataSource = OrganizationRepository.GetOfficers();
            OfficersGrid.DataBind();
        }

        private void BindDepartmentDropdown(DropDownList dropdown, int? selectedId)
        {
            dropdown.Items.Clear();
            dropdown.Items.Add(new ListItem("-- No department --", string.Empty));

            var departments = OrganizationRepository.GetDepartments();
            dropdown.DataSource = departments;
            dropdown.DataTextField = "DepartmentName";
            dropdown.DataValueField = "DepartmentId";
            dropdown.DataBind();

            if (selectedId.HasValue)
            {
                var item = dropdown.Items.FindByValue(selectedId.Value.ToString());
                if (item != null)
                {
                    dropdown.SelectedValue = selectedId.Value.ToString();
                }
            }
        }

        private void BindHeadDropdown(DropDownList dropdown, string selectedValue)
        {
            dropdown.Items.Clear();
            dropdown.Items.Add(new ListItem("-- Select head (optional) --", string.Empty));

            var officers = OrganizationRepository.GetOfficers();
            dropdown.DataSource = officers;
            dropdown.DataTextField = "DisplayName";
            dropdown.DataValueField = "OfficerId";
            dropdown.DataBind();

            if (!string.IsNullOrEmpty(selectedValue))
            {
                var item = dropdown.Items.FindByValue(selectedValue);
                if (item != null)
                {
                    dropdown.SelectedValue = selectedValue;
                }
            }
        }

        private void ShowMessage(string message, bool isError = false)
        {
            MessagePanel.Visible = true;
            MessagePanel.CssClass = isError ? "alert alert-danger" : "alert alert-success";
            MessagePanel.Controls.Clear();
            MessagePanel.Controls.Add(new Literal { Text = message });
        }

        private void ClearAddForm()
        {
            DepartmentNameTextBox.Text = string.Empty;
            DescriptionTextBox.Text = string.Empty;
            PldtHotlineTextBox.Text = string.Empty;
            IntelcoHotlineTextBox.Text = string.Empty;
        }

        private void ClearOfficerForm()
        {
            OfficerIdTextBox.Text = string.Empty;
            OfficerFirstNameTextBox.Text = string.Empty;
            OfficerLastNameTextBox.Text = string.Empty;
            OfficerPositionTextBox.Text = string.Empty;
            OfficerTermStartTextBox.Text = string.Empty;
            OfficerTermEndTextBox.Text = string.Empty;
            OfficerPhotoUrlTextBox.Text = string.Empty;
            if (OfficerDepartmentDropDown.Items.Count > 0)
            {
                OfficerDepartmentDropDown.SelectedIndex = 0;
            }
        }

        protected void OfficersGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            OfficersGrid.EditIndex = e.NewEditIndex;
            BindOfficersGrid();
        }

        protected void OfficersGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            OfficersGrid.EditIndex = -1;
            BindOfficersGrid();
        }

        protected void OfficersGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var row = OfficersGrid.Rows[e.RowIndex];
            var officerId = OfficersGrid.DataKeys[e.RowIndex].Value.ToString();

            var firstBox = (TextBox)row.FindControl("EditFirstNameTextBox");
            var lastBox = (TextBox)row.FindControl("EditLastNameTextBox");
            var positionBox = (TextBox)row.FindControl("EditPositionTextBox");
            var startBox = (TextBox)row.FindControl("EditTermStartTextBox");
            var endBox = (TextBox)row.FindControl("EditTermEndTextBox");
            var photoBox = (TextBox)row.FindControl("EditPhotoUrlTextBox");
            var deptDropdown = (DropDownList)row.FindControl("EditOfficerDepartmentDropDown");

            if (firstBox == null || lastBox == null || positionBox == null || startBox == null || endBox == null)
            {
                ShowMessage("Could not locate edit fields for officer.", true);
                return;
            }

            if (!DateTime.TryParse(startBox.Text, out var start) || !DateTime.TryParse(endBox.Text, out var end))
            {
                ShowMessage("Invalid term dates. Use YYYY-MM-DD.", true);
                return;
            }

            if (end < start)
            {
                ShowMessage("Term end must be after term start.", true);
                return;
            }

            int? deptId = null;
            if (deptDropdown != null && !string.IsNullOrEmpty(deptDropdown.SelectedValue) && int.TryParse(deptDropdown.SelectedValue, out var parsedDept))
            {
                deptId = parsedDept;
            }

            try
            {
                OrganizationRepository.UpdateOfficer(officerId, firstBox.Text.Trim(), lastBox.Text.Trim(), positionBox.Text.Trim(), start, end, photoBox?.Text.Trim(), deptId);
                OfficersGrid.EditIndex = -1;
                ShowMessage("Officer updated.");
                BindDepartmentDropdown(OfficerDepartmentDropDown, null);
                BindGrid();
                BindOfficersGrid();
            }
            catch (Exception ex)
            {
                ShowMessage($"Could not update officer: {ex.Message}", true);
            }
        }

        protected void OfficersGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var officerId = OfficersGrid.DataKeys[e.RowIndex].Value.ToString();

            try
            {
                OrganizationRepository.DeleteOfficer(officerId);
                ShowMessage("Officer deleted.");
                BindDepartmentDropdown(OfficerDepartmentDropDown, null);
                BindGrid();
                BindOfficersGrid();
            }
            catch (Exception ex)
            {
                ShowMessage($"Could not delete officer: {ex.Message}", true);
            }
        }

        protected void OfficersGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
            {
                return;
            }

            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                var dropdown = (DropDownList)e.Row.FindControl("EditOfficerDepartmentDropDown");
                if (dropdown != null)
                {
                    var data = e.Row.DataItem as OfficerRecord;
                    BindDepartmentDropdown(dropdown, data != null ? data.DepartmentId : null);
                }
            }
        }
    }
}
