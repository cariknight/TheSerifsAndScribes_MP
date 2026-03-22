<%@ Page Title="Organizations" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="Organizations.aspx.cs" Inherits="TheSerifsAndScribes_MP.Organizations" %>
<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="DashboardContent" runat="server">
    <h1 class="h2-style mb-3">Departments &amp; Offices</h1>

    <asp:Panel ID="MessagePanel" runat="server" Visible="false" CssClass="alert" />

    <div class="card mb-4">
        <div class="card-body">
            <h5 class="card-title">Add department / office</h5>
            <div class="row g-3">
                <div class="col-md-6">
                    <asp:Label runat="server" AssociatedControlID="DepartmentNameTextBox" CssClass="form-label" Text="Department / office name" />
                    <asp:TextBox runat="server" ID="DepartmentNameTextBox" CssClass="form-control" />
                </div>
                <div class="col-12">
                    <asp:Label runat="server" AssociatedControlID="DescriptionTextBox" CssClass="form-label" Text="Description" />
                    <asp:TextBox runat="server" ID="DescriptionTextBox" CssClass="form-control" TextMode="MultiLine" Rows="2" />
                </div>
                <div class="col-md-6">
                    <asp:Label runat="server" AssociatedControlID="PldtHotlineTextBox" CssClass="form-label" Text="PLDT Hotline" />
                    <asp:TextBox runat="server" ID="PldtHotlineTextBox" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <asp:Label runat="server" AssociatedControlID="IntelcoHotlineTextBox" CssClass="form-label" Text="Intelco Hotline" />
                    <asp:TextBox runat="server" ID="IntelcoHotlineTextBox" CssClass="form-control" />
                </div>
            </div>
            <div class="mt-3 d-flex justify-content-end">
                <asp:Button runat="server" ID="AddDepartmentButton" CssClass="btn btn-primary" Text="Save department" OnClick="AddDepartmentButton_Click" />
            </div>
        </div>
    </div>

    <div class="card mb-4">
        <div class="card-body">
            <h5 class="card-title">Add officer</h5>
            <div class="row g-3">
                <div class="col-md-4">
                    <asp:Label runat="server" AssociatedControlID="OfficerIdTextBox" CssClass="form-label" Text="Officer ID" />
                    <asp:TextBox runat="server" ID="OfficerIdTextBox" CssClass="form-control" MaxLength="15" />
                </div>
                <div class="col-md-4">
                    <asp:Label runat="server" AssociatedControlID="OfficerFirstNameTextBox" CssClass="form-label" Text="First name" />
                    <asp:TextBox runat="server" ID="OfficerFirstNameTextBox" CssClass="form-control" MaxLength="20" />
                </div>
                <div class="col-md-4">
                    <asp:Label runat="server" AssociatedControlID="OfficerLastNameTextBox" CssClass="form-label" Text="Last name" />
                    <asp:TextBox runat="server" ID="OfficerLastNameTextBox" CssClass="form-control" MaxLength="20" />
                </div>
                <div class="col-md-4">
                    <asp:Label runat="server" AssociatedControlID="OfficerPositionTextBox" CssClass="form-label" Text="Position" />
                    <asp:TextBox runat="server" ID="OfficerPositionTextBox" CssClass="form-control" MaxLength="20" />
                </div>
                <div class="col-md-4">
                    <asp:Label runat="server" AssociatedControlID="OfficerTermStartTextBox" CssClass="form-label" Text="Term start (YYYY-MM-DD)" />
                    <asp:TextBox runat="server" ID="OfficerTermStartTextBox" CssClass="form-control" TextMode="Date" />
                </div>
                <div class="col-md-4">
                    <asp:Label runat="server" AssociatedControlID="OfficerTermEndTextBox" CssClass="form-label" Text="Term end (YYYY-MM-DD)" />
                    <asp:TextBox runat="server" ID="OfficerTermEndTextBox" CssClass="form-control" TextMode="Date" />
                </div>
                <div class="col-md-8">
                    <asp:Label runat="server" AssociatedControlID="OfficerPhotoUrlTextBox" CssClass="form-label" Text="Photo URL (optional)" />
                    <asp:TextBox runat="server" ID="OfficerPhotoUrlTextBox" CssClass="form-control" />
                    <asp:Label runat="server" CssClass="form-text text-muted" Text="Leave blank to use default ../Images/user-profile.png" />
                </div>
                <div class="col-md-4">
                    <asp:Label runat="server" AssociatedControlID="OfficerDepartmentDropDown" CssClass="form-label" Text="Department (optional)" />
                    <asp:DropDownList runat="server" ID="OfficerDepartmentDropDown" CssClass="form-select" AppendDataBoundItems="true">
                        <asp:ListItem Text="-- No department --" Value="" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="mt-3 d-flex justify-content-end">
                <asp:Button runat="server" ID="AddOfficerButton" CssClass="btn btn-primary" Text="Save officer" OnClick="AddOfficerButton_Click" />
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h5 class="card-title mb-0">Departments</h5>
                <small class="text-muted">Edit info, hotlines, and heads</small>
            </div>
            <asp:GridView runat="server" ID="DepartmentsGrid" CssClass="table table-striped align-middle" AutoGenerateColumns="False" DataKeyNames="DepartmentId,HeadOfficerId" OnRowEditing="DepartmentsGrid_RowEditing" OnRowCancelingEdit="DepartmentsGrid_RowCancelingEdit" OnRowUpdating="DepartmentsGrid_RowUpdating" OnRowDeleting="DepartmentsGrid_RowDeleting" OnRowDataBound="DepartmentsGrid_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Department / office">
                        <ItemTemplate>
                            <strong><%# Eval("DepartmentName") %></strong><br />
                            <small class="text-muted"><%# Eval("Description") %></small>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditDepartmentNameTextBox" CssClass="form-control mb-2" Text='<%# Bind("DepartmentName") %>' />
                            <asp:TextBox runat="server" ID="EditDescriptionTextBox" CssClass="form-control" TextMode="MultiLine" Rows="2" Text='<%# Bind("Description") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hotlines">
                        <ItemTemplate>
                            <div><span class="badge bg-light text-dark">PLDT</span> <%# Eval("PldtHotline") %></div>
                            <div><span class="badge bg-light text-dark">Intelco</span> <%# Eval("IntelcoHotline") %></div>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label runat="server" AssociatedControlID="EditPldtHotlineTextBox" CssClass="form-label" Text="PLDT" />
                            <asp:TextBox runat="server" ID="EditPldtHotlineTextBox" CssClass="form-control mb-2" Text='<%# Bind("PldtHotline") %>' />
                            <asp:Label runat="server" AssociatedControlID="EditIntelcoHotlineTextBox" CssClass="form-label" Text="Intelco" />
                            <asp:TextBox runat="server" ID="EditIntelcoHotlineTextBox" CssClass="form-control" Text='<%# Bind("IntelcoHotline") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Head of office">
                        <ItemTemplate>
                            <asp:Label runat="server" CssClass='<%# string.IsNullOrEmpty(Eval("HeadOfficerName") as string) ? "text-muted" : "" %>' Text='<%# FormatHead(Eval("HeadOfficerName"), Eval("HeadOfficerPosition")) %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList runat="server" ID="EditHeadOfficerDropDown" CssClass="form-select" AppendDataBoundItems="true" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Edit" CssClass="btn btn-sm btn-outline-primary me-1">Edit</asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-danger" OnClientClick="return confirm('Delete this department?');">Delete</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Update" CssClass="btn btn-sm btn-success me-1">Save</asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="Cancel" CssClass="btn btn-sm btn-secondary">Cancel</asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h5 class="card-title mb-0">Officers</h5>
                <small class="text-muted">Heads and contact persons</small>
            </div>
            <asp:GridView runat="server" ID="OfficersGrid" CssClass="table table-striped align-middle" AutoGenerateColumns="False" DataKeyNames="OfficerId" OnRowEditing="OfficersGrid_RowEditing" OnRowCancelingEdit="OfficersGrid_RowCancelingEdit" OnRowUpdating="OfficersGrid_RowUpdating" OnRowDeleting="OfficersGrid_RowDeleting" OnRowDataBound="OfficersGrid_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Officer">
                        <ItemTemplate>
                            <strong><%# Eval("FirstName") %> <%# Eval("LastName") %></strong><br />
                            <small class="text-muted"><%# Eval("OfficerId") %></small>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditFirstNameTextBox" CssClass="form-control mb-2" Text='<%# Bind("FirstName") %>' />
                            <asp:TextBox runat="server" ID="EditLastNameTextBox" CssClass="form-control" Text='<%# Bind("LastName") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Position">
                        <ItemTemplate>
                            <%# Eval("Position") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditPositionTextBox" CssClass="form-control" Text='<%# Bind("Position") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Department">
                        <ItemTemplate>
                            <asp:Label runat="server" CssClass='<%# string.IsNullOrEmpty(Eval("DepartmentName") as string) ? "text-muted" : "" %>' Text='<%# string.IsNullOrEmpty(Eval("DepartmentName") as string) ? "None" : Eval("DepartmentName") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList runat="server" ID="EditOfficerDepartmentDropDown" CssClass="form-select" AppendDataBoundItems="true" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Term">
                        <ItemTemplate>
                            <%# Eval("TermStart", "{0:yyyy-MM-dd}") %> - <%# Eval("TermEnd", "{0:yyyy-MM-dd}") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditTermStartTextBox" CssClass="form-control mb-2" Text='<%# Bind("TermStart", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                            <asp:TextBox runat="server" ID="EditTermEndTextBox" CssClass="form-control" Text='<%# Bind("TermEnd", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Photo">
                        <ItemTemplate>
                            <a href='<%# Eval("PhotoUrl") %>' target="_blank"><%# Eval("PhotoUrl") %></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditPhotoUrlTextBox" CssClass="form-control" Text='<%# Bind("PhotoUrl") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Edit" CssClass="btn btn-sm btn-outline-primary me-1">Edit</asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-danger" OnClientClick="return confirm('Delete this officer?');">Delete</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Update" CssClass="btn btn-sm btn-success me-1">Save</asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="Cancel" CssClass="btn btn-sm btn-secondary">Cancel</asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
