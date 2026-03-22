<%@ Page Title="Announcements Dashboard" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="AnnouncementsDashboard.aspx.cs" Inherits="TheSerifsAndScribes_MP.AnnouncementsDashboard" %>
<%@ Import Namespace="TheSerifsAndScribes_MP" %>
<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="DashboardContent" runat="server">
    <h1 class="page-title">Announcements</h1>

    <asp:Panel ID="MessagePanel" runat="server" Visible="false" CssClass="alert" />

    <div class="card mb-4">
        <div class="card-body">
            <h5 class="card-title">Add announcement</h5>
            <div class="mb-3">
                <asp:Label runat="server" AssociatedControlID="TitleTextBox" CssClass="form-label" Text="Title" />
                <asp:TextBox runat="server" ID="TitleTextBox" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Label runat="server" AssociatedControlID="BodyTextBox" CssClass="form-label" Text="Details" />
                <asp:TextBox runat="server" ID="BodyTextBox" TextMode="MultiLine" Rows="4" CssClass="form-control" />
            </div>
            <asp:Button runat="server" ID="AddButton" CssClass="btn btn-primary" Text="Post announcement" OnClick="AddButton_Click" />
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h5 class="card-title mb-0">All announcements</h5>
                <small class="text-muted">Need approval, active, and archived</small>
            </div>
            <asp:GridView runat="server" ID="AnnouncementsGrid" AutoGenerateColumns="False" CssClass="table table-striped" DataKeyNames="Id" OnRowCommand="AnnouncementsGrid_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="CreatedAt" HeaderText="Posted" DataFormatString="{0:MMM dd, yyyy}" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='<%# (AnnouncementStatus)Eval("Status") == AnnouncementStatus.NeedApproval ? "badge bg-warning text-dark" : (AnnouncementStatus)Eval("Status") == AnnouncementStatus.Active ? "badge bg-success" : "badge bg-secondary" %>'>
                                <%# (AnnouncementStatus)Eval("Status") == AnnouncementStatus.NeedApproval ? "Needs approval" : (AnnouncementStatus)Eval("Status") == AnnouncementStatus.Active ? "Active" : "Archived" %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="approve" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-success me-1" Visible='<%# (AnnouncementStatus)Eval("Status") == AnnouncementStatus.NeedApproval %>'>
                                Approve
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="archive" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-outline-secondary me-1" Visible='<%# (AnnouncementStatus)Eval("Status") == AnnouncementStatus.Active %>'>
                                Archive
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="activate" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-outline-secondary me-1" Visible='<%# (AnnouncementStatus)Eval("Status") == AnnouncementStatus.Archived %>'>
                                Activate
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="delete" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-outline-danger" OnClientClick="return confirm('Delete this announcement?');">
                                Delete
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
