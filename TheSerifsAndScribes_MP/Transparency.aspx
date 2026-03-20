<%@ Page Title="Transparency" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transparency.aspx.cs" Inherits="TheSerifsAndScribes_MP.Transparency" %>

<asp:Content ID="TransparencyHead" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Transparency</title>
    <link href="Styles/HomeStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
    <link href="Styles/TransparencyStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="TransparencyMain" ContentPlaceHolderID="MainContent" runat="server">
    <div class="transparency-page">
        <section class="transparency-hero">
            <div class="transparency-hero__content">
                <span class="portal-badge">Good Governance Portal</span>
                <h1>Transparency<br /><span class="highlight">Public Service</span></h1>
                <p>We adhere to the highest standards of accountability. Access official city structures, service standards, and financial reports to stay informed on how your government works for you.</p>
            </div>
        </section>

        <section class="transparency-cards">
            <div class="cards-grid">
                <article class="trans-card">
                    <div class="card-icon icon-mint">
                        <img src="../Images/Assets/Icons/building-green-icon.png" alt="Organizational chart icon" />
                    </div>
                    <h3>Organizational Chart</h3>
                    <p>Understand the hierarchy and leadership structure of the City Government of Bi&ntilde;an. View departments, executive offices, and the flow of administrative responsibility.</p>
                    <a class="card-button" href="#" role="button">View Structure <span aria-hidden="true">></span></a>
                </article>

                <article class="trans-card">
                    <div class="card-icon icon-amber">
                        <img src="../Images/Assets/Icons/business-yellow-icon.png" alt="Citizen charter icon" />
                    </div>
                    <h3>Citizen's Charter</h3>
                    <p>Our commitment to efficient service. This document outlines the step-by-step procedures, requirements, and turnaround times for all frontline government services.</p>
                    <a class="card-button" href="#" role="button">Access Charter <span aria-hidden="true">></span></a>
                </article>

                <article class="trans-card">
                    <div class="card-icon icon-mint">
                        <img src="../Images/Assets/Icons/doc-green-icon.png" alt="Full disclosure policy icon" />
                    </div>
                    <h3>Full Disclosure Policy</h3>
                    <p>In compliance with DILG standards, we provide public access to financial documents, budget allocations, and procurement reports to ensure absolute integrity.</p>
                    <a class="card-button" href="#" role="button">View Disclosures <span aria-hidden="true">></span></a>
                </article>
            </div>
        </section>
    </div>
</asp:Content>
