<%@ Page Title="Announcements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Announcements.aspx.cs" Inherits="TheSerifsAndScribes_MP.Announcements" %>

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/AnnouncementStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-shell">
        <section class="announcement-hero">
            <h1 class="h2-style">City Announcements</h1>
            <p class="subtitle">All active public advisories from the City Government of Bi&ntilde;an.</p>
        </section>

        <asp:Panel ID="EmptyStatePanel" runat="server" CssClass="alert alert-info" Visible="false">
            No announcements are posted right now. Please check back later.
        </asp:Panel>

        <asp:Repeater ID="AnnouncementsRepeater" runat="server">
            <HeaderTemplate>
                <div class="announcement-list">
            </HeaderTemplate>
            <ItemTemplate>
                <article class="announcement-card">
                    <div class="announcement-card__header">
                        <h3><%# Eval("Title") %></h3>
                        <span class="announcement-date"><%# ((DateTime)Eval("CreatedAt")).ToString("MMMM dd, yyyy") %></span>
                    </div>
                    <p><%# Eval("Body") %></p>
                </article>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>