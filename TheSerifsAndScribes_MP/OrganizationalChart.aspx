<%@ Page Title="Organizational Chart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrganizationalChart.aspx.cs" Inherits="TheSerifsAndScribes_MP.OrganizationalChart" %>

<asp:Content ID="OrgChartHead" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Organizational Chart</title>
    <link href="Styles/HomeStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
    <link href="Styles/TransparencyStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
    <style>
        .org-wrap { padding: 2rem 0 3rem; }
        .org-container { max-width: 1200px; margin: 0 auto; padding: 0 1.25rem; }
        .org-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.25rem; }
        .org-card { border: 1px solid #e5e7eb; border-radius: 12px; padding: 1.25rem; background: #fff; box-shadow: 0 12px 40px rgba(0,0,0,0.04); }
        .org-card__title { display: flex; justify-content: space-between; align-items: baseline; margin-bottom: 0.45rem; }
        .org-chip { background: #f1f5f9; color: #0f172a; border-radius: 999px; padding: 0.25rem 0.75rem; font-size: 0.8rem; font-weight: 600; }
        .org-head { display: flex; gap: 0.9rem; align-items: center; margin-top: 0.65rem; }
        .org-head img { width: 64px; height: 64px; object-fit: cover; border-radius: 14px; border: 1px solid #e5e7eb; background: #f8fafc; }
        .org-head__name { font-weight: 700; margin: 0; }
        .org-head__pos { color: #6b7280; margin: 0; font-size: 0.92rem; }
        .org-list { list-style: none; padding: 0; margin: 0.85rem 0 0; display: flex; flex-wrap: wrap; gap: 0.6rem; }
        .org-badge { border: 1px solid #e5e7eb; border-radius: 10px; padding: 0.6rem 0.75rem; background: #f9fafb; min-width: 190px; }
        .org-badge .label { display: block; font-size: 0.78rem; color: #6b7280; }
        .org-badge .value { font-weight: 700; }
        .officer-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 1rem; margin-top: 1rem; }
        .officer-card { border: 1px solid #e5e7eb; border-radius: 12px; padding: 0.95rem; background: #fff; display: flex; gap: 0.8rem; align-items: center; box-shadow: 0 8px 28px rgba(0,0,0,0.03); }
        .officer-card img { width: 62px; height: 62px; object-fit: cover; border-radius: 50%; border: 1px solid #e5e7eb; background: #f8fafc; }
        .officer-name { font-weight: 700; margin: 0; }
        .officer-meta { margin: 0; color: #6b7280; font-size: 0.9rem; }
        .org-section h2 { margin-bottom: 0.6rem; }
        .org-section p { margin-top: 0; color: #4b5563; }
        .filter-row { align-items: center; }
        .filter-row .btn-filter { width: 100%; height: 100%; padding: 0.55rem 0.9rem; }
        @media (max-width: 600px) {
            .org-grid { grid-template-columns: 1fr; }
            .officer-grid { grid-template-columns: 1fr; }
        }
    </style>
</asp:Content>

<asp:Content ID="OrgChartMain" ContentPlaceHolderID="MainContent" runat="server">
    <div class="transparency-subpage">
        <section class="trans-sub-hero hero-chart">
            <div class="trans-sub-hero__content">
                <span class="portal-badge">Transparency</span>
                <h1>Organizational Chart</h1>
                <p>Explore the leadership structure of Bi&ntilde;an City. See how departments connect and who leads every office so you can engage with the right teams.</p>
                <div class="breadcrumb-inline" aria-label="Breadcrumb">
                    <a href="Home.aspx">Home</a>
                    <span>/</span>
                    <a href="Transparency.aspx">Transparency</a>
                    <span>/</span>
                    <span>Organizational Chart</span>
                </div>
            </div>
        </section>

        <section class="org-wrap">
            <div class="org-container">
            <div class="org-section">
                <h2>Department Heads</h2>
                <p>Each office with its current head and quick contact details.</p>
                <asp:Repeater runat="server" ID="DepartmentsRepeater">
                    <HeaderTemplate><div class="org-grid"></HeaderTemplate>
                    <ItemTemplate>
                        <article class="org-card">
                            <div class="org-card__title">
                                <h3><%# Eval("DepartmentName") %></h3>
                                <span class="org-chip">Office</span>
                            </div>
                            <p class="text-muted"><%# Eval("Description") %></p>
                            <div class="org-head">
                                <img src='<%# string.IsNullOrWhiteSpace(Eval("HeadOfficerPhotoUrl") as string) ? "../Images/user-profile.png" : Eval("HeadOfficerPhotoUrl") %>' alt="Head of office photo" onerror="this.src='../Images/user-profile.png';" />
                                <div>
                                    <p class="org-head__name"><%# string.IsNullOrWhiteSpace(Eval("HeadOfficerName") as string) ? "Not set" : Eval("HeadOfficerName") %></p>
                                    <p class="org-head__pos"><%# string.IsNullOrWhiteSpace(Eval("HeadOfficerPosition") as string) ? "Pending assignment" : Eval("HeadOfficerPosition") %></p>
                                </div>
                            </div>
                            <ul class="org-list">
                                <li class="org-badge"><span class="label">PLDT</span><span class="value"><%# Eval("PldtHotline") %></span></li>
                                <li class="org-badge"><span class="label">Intelco</span><span class="value"><%# Eval("IntelcoHotline") %></span></li>
                            </ul>
                        </article>
                    </ItemTemplate>
                    <FooterTemplate></div></FooterTemplate>
                </asp:Repeater>
            </div>

            <div class="org-section" style="margin-top:2rem;">
                <h2>All Officers</h2>
                <p>Browse every officer, their position, and assigned department.</p>
                <div class="row g-2 g-md-3 mb-3 filter-row">
                    <div class="col-md-6 col-lg-6 d-flex">
                        <asp:TextBox runat="server" ID="OfficerSearchBox" CssClass="form-control" placeholder="Search name, position, or department" />
                    </div>
                    <div class="col-md-4 col-lg-4 d-flex">
                        <asp:DropDownList runat="server" ID="OfficerDepartmentFilter" CssClass="form-select"></asp:DropDownList>
                    </div>
                    <div class="col-md-2 col-lg-2 d-grid d-md-block">
                        <asp:Button runat="server" ID="FilterButton" CssClass="btn btn-success btn-filter" Text="Filter" OnClick="FilterButton_Click" />
                    </div>
                </div>
                <asp:Repeater runat="server" ID="OfficersRepeater">
                    <HeaderTemplate><div class="officer-grid"></HeaderTemplate>
                    <ItemTemplate>
                        <div class="officer-card">
                            <img src='<%# string.IsNullOrWhiteSpace(Eval("PhotoUrl") as string) ? "../Images/user-profile.png" : Eval("PhotoUrl") %>' alt="Officer photo" onerror="this.src='../Images/user-profile.png';" />
                            <div>
                                <p class="officer-name"><%# Eval("FirstName") %> <%# Eval("LastName") %></p>
                                <p class="officer-meta"><%# Eval("Position") %></p>
                                <p class="officer-meta"><%# string.IsNullOrWhiteSpace(Eval("DepartmentName") as string) ? "No department" : Eval("DepartmentName") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate></div></FooterTemplate>
                </asp:Repeater>
            </div>
            </div>
        </section>
    </div>
</asp:Content>
