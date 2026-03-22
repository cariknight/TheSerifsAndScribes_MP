<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CareersDashboard.aspx.cs" Inherits="TheSerifsAndScribes_MP.CareersDashboard" MasterPageFile="~/Dashboard.master" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .admin-section { padding: 24px; background: #f8fafc; border-radius: 14px; margin-bottom: 24px; }
        .admin-actions { display: flex; flex-wrap: wrap; gap: 12px; align-items: center; margin-bottom: 14px; }
        .admin-actions .form-control { min-width: 180px; }
        .status-pill { display: inline-block; padding: 4px 10px; border-radius: 999px; font-weight: 700; font-size: 12px; }
        .status-new { background: #fff7d6; color: #9c6b00; }
        .status-active { background: #e9f7ef; color: #0a7d3b; }
        .status-archived { background: #f1f5f9; color: #334155; }
        .text-danger { color: #dc2626; }
        .grid-wrap { overflow-x: auto; }
        .grid-wrap table { min-width: 760px; }
    </style>
</asp:Content>

<asp:Content ID="DashboardContent" ContentPlaceHolderID="DashboardContent" runat="server">
    <div class="admin-section">
        <h2>Careers Dashboard</h2>
        <p>Manage vacancy lists shown on the public Careers page.</p>

        <div class="admin-actions">
            <asp:TextBox ID="txtVacancyDate" runat="server" CssClass="form-control" TextMode="Date" />
            <asp:TextBox ID="txtPreviewUrl" runat="server" CssClass="form-control" placeholder="Preview URL" />
            <asp:TextBox ID="txtDownloadUrl" runat="server" CssClass="form-control" placeholder="Download URL" />
            <asp:DropDownList ID="ddlStatusAdd" runat="server" CssClass="form-control">
                <asp:ListItem Text="New" Value="New" />
                <asp:ListItem Text="Active" Value="Active" />
                <asp:ListItem Text="Archived" Value="Archived" />
            </asp:DropDownList>
            <asp:Button ID="btnAddCareer" runat="server" CssClass="btn btn-primary" Text="Add Vacancy" OnClick="btnAddCareer_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
        </div>

        <div class="grid-wrap">
            <asp:GridView ID="gvCareers" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                CssClass="table table-striped"
                OnRowEditing="gvCareers_RowEditing"
                OnRowCancelingEdit="gvCareers_RowCancelingEdit"
                OnRowUpdating="gvCareers_RowUpdating"
                OnRowDeleting="gvCareers_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                    <asp:TemplateField HeaderText="Vacancy Date">
                        <ItemTemplate><%# Eval("VacancyDate", "{0:yyyy-MM-dd}") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditDate" runat="server" Text='<%# Bind("VacancyDate", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Preview URL">
                        <ItemTemplate><a href='<%# Eval("PreviewUrl") %>' target="_blank" rel="noopener"><%# Eval("PreviewUrl") %></a></ItemTemplate>
                        <EditItemTemplate><asp:TextBox ID="txtEditPreview" runat="server" Text='<%# Bind("PreviewUrl") %>' Width="220px" /></EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Download URL">
                        <ItemTemplate><a href='<%# Eval("DownloadUrl") %>' target="_blank" rel="noopener"><%# Eval("DownloadUrl") %></a></ItemTemplate>
                        <EditItemTemplate><asp:TextBox ID="txtEditDownload" runat="server" Text='<%# Bind("DownloadUrl") %>' Width="220px" /></EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='status-pill <%# GetStatusCss(Eval("Status")) %>'><%# Eval("Status") %></span>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditStatus" runat="server" SelectedValue='<%# Bind("Status") %>'>
                                <asp:ListItem Text="New" Value="New" />
                                <asp:ListItem Text="Active" Value="Active" />
                                <asp:ListItem Text="Archived" Value="Archived" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
