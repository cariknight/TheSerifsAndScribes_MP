<%@ Page Title="Admin Overview" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="TheSerifsAndScribes_MP.AdminDashboard" %>
<%@ Import Namespace="TheSerifsAndScribes_MP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DashboardContent" runat="server">
    <div class="overview">
        <h1 class="overview__title">Overview</h1>

        <div class="stat-grid">
            <div class="stat-card">
                <div class="stat-card__icon bg-soft-green">
                    <i class="fa-solid fa-user-group"></i>
                </div>
                <p class="stat-card__label">Total Visitors</p>
                <asp:Literal ID="TotalVisitorsLiteral" runat="server" />
                <asp:Literal ID="VisitorNoteLiteral" runat="server" />
            </div>

            <div class="stat-card">
                <div class="stat-card__icon bg-soft-green">
                    <i class="fa-regular fa-message"></i>
                </div>
                <p class="stat-card__label">Total Inquiries</p>
                <asp:Literal ID="TotalInquiriesLiteral" runat="server" />
            </div>

            <div class="stat-card">
                <div class="stat-card__icon bg-soft-green">
                    <i class="fa-solid fa-envelope-circle-check"></i>
                </div>
                <p class="stat-card__label">Unread Inquiries</p>
                <asp:Literal ID="UnreadInquiriesLiteral" runat="server" />
            </div>

            <div class="stat-card stat-card--tall">
                <div class="d-flex justify-content-between align-items-start mb-2">
                    <p class="stat-card__label mb-0">Announcements</p>
                    <a href="AnnouncementsDashboard.aspx" class="text-link">Manage</a>
                </div>
                <asp:Repeater ID="AnnouncementsRepeater" runat="server">
                    <ItemTemplate>
                        <div class="announcement-chip">
                            <div>
                                <p class="announcement-chip__title"><%# Eval("Title") %></p>
                                <p class="announcement-chip__meta"><%# String.Format("{0:MMM dd, yyyy}", Eval("CreatedAt")) %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Literal ID="AnnouncementsEmptyState" runat="server" Visible="false" />
            </div>
        </div>

        <div class="split-grid">
            <div class="panel">
                <div class="panel__header">
                    <h3>Recent Inquiries</h3>
                    <a class="btn btn-outline-success btn-sm" href="Inquiries.aspx">See all</a>
                </div>

                <asp:Repeater ID="RecentInquiriesRepeater" runat="server">
                    <ItemTemplate>
                        <div class="list-row">
                            <div>
                                <p class="list-row__title"><%# Eval("fullName") %></p>
                                <p class="list-row__meta">
                                    <%# Eval("subject") %> &middot;
                                    <%# String.Format("{0:MMM dd, yyyy}", Eval("dateSent")) %>
                                </p>
                            </div>
                            <span class='<%# Eval("status").ToString() == "UNREAD" ? "badge bg-warning text-dark" : "badge bg-success" %>'>
                                <%# Eval("status") %>
                            </span>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Literal ID="InquiriesEmptyState" runat="server" Visible="false" />
            </div>
        </div>
    </div>
</asp:Content>
