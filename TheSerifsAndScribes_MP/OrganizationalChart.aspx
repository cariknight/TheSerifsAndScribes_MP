<%@ Page Title="Organizational Chart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrganizationalChart.aspx.cs" Inherits="TheSerifsAndScribes_MP.OrganizationalChart" %>

<asp:Content ID="OrgChartHead" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Organizational Chart</title>
    <link href="Styles/HomeStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
    <link href="Styles/TransparencyStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
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

        <section class="resource-section">
            <div class="resource-grid">
                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/building-green-icon.png" alt="Executive offices icon" />
                        </div>
                        <div>
                            <p class="resource-label">Document</p>
                            <h3>Executive Structure (PDF)</h3>
                        </div>
                    </div>
                    <p>Mayor's office, vice mayor, and key executive departments with reporting lines.</p>
                    <a class="card-button" href="#" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/admin-green-icon.png" alt="Administrative icon" />
                        </div>
                        <div>
                            <p class="resource-label">Document</p>
                            <h3>Administrative Divisions</h3>
                        </div>
                    </div>
                    <p>Department heads, bureau chiefs, and unit supervisors for core city operations.</p>
                    <a class="card-button" href="#" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/info-green-icon.png" alt="Community services icon" />
                        </div>
                        <div>
                            <p class="resource-label">Document</p>
                            <h3>Community Services Map</h3>
                        </div>
                    </div>
                    <p>Points of contact for education, health, environment, and public safety offices.</p>
                    <a class="card-button" href="#" role="button">Download ></a>
                </article>
            </div>
        </section>
    </div>
</asp:Content>
