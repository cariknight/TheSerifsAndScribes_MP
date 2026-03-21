<%@ Page Title="Citizen's Charter" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CitizensCharter.aspx.cs" Inherits="TheSerifsAndScribes_MP.CitizensCharter" %>

<asp:Content ID="CitizensCharterHead" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Citizen's Charter</title>
    <link href="Styles/HomeStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
    <link href="Styles/TransparencyStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="CitizensCharterMain" ContentPlaceHolderID="MainContent" runat="server">
    <div class="transparency-subpage">
        <section class="trans-sub-hero hero-charter">
            <div class="trans-sub-hero__content">
                <span class="portal-badge">Transparency</span>
                <h1>Citizen's Charter</h1>
                <p>Service standards, step-by-step processes, and turnaround times for frontline services&#8209;built to keep residents informed and empowered.</p>
                <div class="breadcrumb-inline" aria-label="Breadcrumb">
                    <a href="Home.aspx">Home</a>
                    <span>/</span>
                    <a href="Transparency.aspx">Transparency</a>
                    <span>/</span>
                    <span>Citizen's Charter</span>
                </div>
            </div>
        </section>

        <section class="resource-section">
            <div class="resource-grid">
                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-amber">
                            <img src="../Images/Assets/Icons/business-yellow-icon.png" alt="Frontline services icon" />
                        </div>
                        <div>
                            <p class="resource-label">Guide</p>
                            <h3>City Government of Bi&ntilde;an</h3>
                        </div>
                    </div>
                    <p>Full Citizen's Charter for all city frontline services.</p>
                    <a class="card-button" href="https://www.binan.gov.ph/wp-content/uploads/2022/04/LGU-Binan-Citizens-Charter-2021.pdf" target="_blank" rel="noopener" role="button">Read ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-amber">
                            <img src="../Images/Assets/Icons/contactus-yellow-icon.png" alt="Feedback icon" />
                        </div>
                        <div>
                            <p class="resource-label">Office</p>
                            <h3>City Assessor Office</h3>
                        </div>
                    </div>
                    <p>Assessment services, requirements, and processing times.</p>
                    <a class="card-button" href="https://www.binan.gov.ph/wp-content/uploads/2017/12/Office-of-the-City-Assessor-Citizens-Charter.pdf" target="_blank" rel="noopener" role="button">Read ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-amber">
                            <img src="../Images/Assets/Icons/clock-green-icon.png" alt="Processing time icon" />
                        </div>
                        <div>
                            <p class="resource-label">Office</p>
                            <h3>City Business Permit and Licensing Office</h3>
                        </div>
                    </div>
                    <p>Procedures for business permits and licenses.</p>
                    <a class="card-button" href="https://www.binan.gov.ph/wp-content/uploads/2022/04/BPLO-Citizens-Chater-2022.pdf" target="_blank" rel="noopener" role="button">Read ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-amber">
                            <img src="../Images/Assets/Icons/doc-green-icon.png" alt="Treasurer icon" />
                        </div>
                        <div>
                            <p class="resource-label">Office</p>
                            <h3>City Treasurer Office</h3>
                        </div>
                    </div>
                    <p>Collections, disbursements, and related treasury services.</p>
                    <a class="card-button" href="https://www.binan.gov.ph/wp-content/uploads/2017/12/Office-of-the-City-Treasurer-Citizens-Charter.pdf" target="_blank" rel="noopener" role="button">Read ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-amber">
                            <img src="../Images/Assets/Icons/info-green-icon.png" alt="Civil registrar icon" />
                        </div>
                        <div>
                            <p class="resource-label">Office</p>
                            <h3>City Civil Registrar Office</h3>
                        </div>
                    </div>
                    <p>Birth, marriage, death registration and civil registry services.</p>
                    <a class="card-button" href="https://www.binan.gov.ph/wp-content/uploads/2017/12/Office-of-the-Civil-Registry-Citizens-Charter.pdf" target="_blank" rel="noopener" role="button">Read ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-amber">
                            <img src="../Images/Assets/Icons/contactus-yellow-icon.png" alt="Feedback icon" />
                        </div>
                        <div>
                            <p class="resource-label">Form</p>
                            <h3>Feedbacks and Complaints</h3>
                        </div>
                    </div>
                    <p>Submit compliments, complaints, or suggestions to improve services.</p>
                    <a class="card-button" href="https://www.binan.gov.ph/wp-content/uploads/2017/12/Feedback-Complaint-Citizens-Charter.pdf" target="_blank" rel="noopener" role="button">Read ></a>
                </article>
            </div>
        </section>
    </div>
</asp:Content>
