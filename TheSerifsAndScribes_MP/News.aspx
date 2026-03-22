<%@ Page Title="News &amp; Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="TheSerifsAndScribes_MP.News" ValidateRequest="false" %>

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .page-shell { max-width: 1100px; margin: 0 auto; padding: 32px 18px 60px; }
        .news-hero { margin-bottom: 24px; }
        .news-hero h1 { margin: 0; font-family: "Akatab Bold", "Roboto", sans-serif; color: #0a7d3b; }
        .news-hero p { color: #5f666f; margin: 8px 0 0; }
        .news-list { display: grid; gap: 18px; }
        .news-card { background: #fff; border: 1px solid #e1e5ea; border-radius: 14px; padding: 18px; box-shadow: 0 8px 16px rgba(0,0,0,0.05); }
        .news-card h3 { margin-top: 0; margin-bottom: 6px; color: #1f2937; }
        .meta-row { display: flex; flex-wrap: wrap; gap: 8px; margin-bottom: 10px; }
        .pill { background: #f4f7fa; border-radius: 999px; padding: 6px 10px; font-weight: 700; color: #374151; }
        .pill.primary { background: #e9f7ef; color: #0a7d3b; }
        .news-body { color: #3b434c; line-height: 1.6; }
        .news-body p { margin-bottom: 12px; }
    </style>
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-shell">
        <section class="news-hero">
            <h1 class="h2-style">News &amp; Events</h1>
            <p>Stories, advisories, and event highlights from the City Government of Bi&amp;ntilde;an.</p>
        </section>

        <asp:Panel ID="EmptyStatePanel" runat="server" CssClass="alert alert-info" Visible="false">
            No news or events have been published yet. Please check back soon.
        </asp:Panel>

        <asp:Repeater ID="NewsRepeater" runat="server">
            <HeaderTemplate>
                <div class="news-list">
            </HeaderTemplate>
            <ItemTemplate>
                <article class="news-card" id='<%# Eval("Id") %>'>
                    <div class="meta-row">
                        <span class="pill primary"><%# Eval("Category") %></span>
                        <span class="pill">By <%# Eval("AuthorName") %></span>
                        <span class="pill"><%# ((DateTime)Eval("CreatedAt")).ToString("MMMM dd, yyyy") %></span>
                    </div>
                    <h3><%# Eval("Title") %></h3>
                    <div class="news-body">
                        <asp:Literal ID="BodyLiteral" runat="server" Mode="PassThrough" Text='<%# Eval("BodyHtml") %>' />
                    </div>
                </article>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
