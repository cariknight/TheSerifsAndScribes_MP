<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Careers.aspx.cs" Inherits="TheSerifsAndScribes_MP.Careers" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/CareerStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- HERO -->
    <section class="career-hero-bleed">
        <header class="career-hero">
            <div class="career-hero-media" aria-hidden="true"></div>

            <div class="career-hero-content">
                <div class="career-pill">Join Our Mission</div>
                <h1>Build Your Future <span>With Binan City</span></h1>
                <p>
                    Be part of a dynamic team dedicated to public service, heritage preservation, and
                    sustainable urban progress.
                </p>
                <div class="career-hero-note">
                    "The City Government of Binan is an equal opportunity employer. All applications are decided
                    on the applicants' qualifications, merit, fitness to the position applied for. CGO Binan does not
                    tolerate discrimination based on race, religion, color, sex, gender identity, sexual orientation,
                    age, non-disqualifying physical or mental disability, national origin, or any other basis covered
                    by applicable laws."
                </div>
            </div>
        </header>
    </section>

    <!-- list  -->
    <div class="career-page">
        <section class="career-listing">
            <div class="career-toolbar">
                <div class="career-search">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="career-search-input" placeholder="Search by Name"></asp:TextBox>
                </div>
                <div class="career-filters">
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="career-filter-select">
                        <asp:ListItem Text="All statuses" Value="All" />
                        <asp:ListItem Text="New" Value="New" />
                        <asp:ListItem Text="Active" Value="Active" />
                        <asp:ListItem Text="Archived" Value="Archived" />
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlSort" runat="server" CssClass="career-filter-select">
                        <asp:ListItem Text="Newest first" Value="DESC" />
                        <asp:ListItem Text="Oldest first" Value="ASC" />
                    </asp:DropDownList>
                    <asp:Button ID="btnFilter" runat="server" Text="Apply" CssClass="career-btn" OnClick="btnFilter_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="career-btn career-btn-ghost" OnClick="btnReset_Click" CausesValidation="false" />
                </div>
                <div class="career-entries">Showing
                    <asp:Label ID="lblCount" runat="server" Text="0"></asp:Label>
                    entries</div>
            </div>

            <div class="career-card career-table-card">
                <div class="career-table-head">
                    <div>Vacancy Details</div>
                    <div>Status</div>
                    <div>Actions</div>
                </div>

                <asp:Repeater ID="rptVacancies" runat="server">
                    <ItemTemplate>
                        <div class="career-table-row">
                            <div class="career-cell career-details">
                                <asp:Image ID="imgDoc" runat="server" CssClass="career-doc-icon" ImageUrl="~/Images/Assets/Icons/doc-green-icon.png" AlternateText="Document" />
                                <div>
                                    <div class="career-title"><%# Eval("Title") %></div>
                                    <div class="career-meta">ID: <%# Eval("Id") %> · <%# Eval("PostedDate", "{0:MMMM dd, yyyy}") %></div>
                                </div>
                            </div>
                            <div class="career-cell">
                                <span class='career-status <%# GetStatusClass(Eval("Status")) %>'><%# Eval("Status") %></span>
                            </div>
                            <div class="career-cell career-actions">
                                <a class='career-icon-btn <%# GetDisabledClass(Eval("FileUrl")) %>' href='<%# GetSafeUrl(Eval("FileUrl")) %>' target="_blank" rel="noopener">
                                    <img class="action-icon" src="<%# ResolveUrl("~/Images/Assets/Icons/eye-lightgray-icon.png") %>" alt="View" />
                                </a>
                                <a class='career-icon-btn <%# GetDisabledClass(Eval("FileUrl")) %>' href='<%# GetSafeUrl(Eval("FileUrl")) %>' download>
                                    <img class="action-icon" src="<%# ResolveUrl("~/Images/Assets/Icons/download-lightgray-icon.png") %>" alt="Download" />
                                </a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:Panel ID="pnlEmpty" runat="server" CssClass="career-empty" Visible="false">
                    No vacancies found. Try adjusting your filters.
                </asp:Panel>
            </div>
        </section>

        <section class="career-apply">
            <div class="career-apply-text">
                <div class="career-eyebrow">Next Steps</div>
                <h2>How to <span>Apply</span></h2>
                <div class="career-steps">
                    <div class="career-step">
                        <div class="career-step-no">01</div>
                        <div>
                            <div class="career-step-title">Review Vacancies</div>
                            <div class="career-step-desc">Download the vacancy list PDF to see detailed qualifications and job descriptions.</div>
                        </div>
                    </div>
                    <div class="career-step">
                        <div class="career-step-no">02</div>
                        <div>
                            <div class="career-step-title">Prepare Documents</div>
                            <div class="career-step-desc">Ready your PDS, Transcript of Records, and relevant eligibility certificates.</div>
                        </div>
                    </div>
                    <div class="career-step">
                        <div class="career-step-no">03</div>
                        <div>
                            <div class="career-step-title">Submit Online or In-Person</div>
                            <div class="career-step-desc">Send your application via the career portal or visit the HR office at City Hall.</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="career-apply-card">
                <img class="career-apply-icon-img" src="<%= ResolveUrl("~/Images/Assets/Icons/admin-green-icon.png") %>" alt="HR Icon" />

                <h3>Have Questions?</h3>
                <p>Our HR team is here to assist with any inquiries regarding open positions or the application process.</p>
                <div class="career-hours">Mon - Fri: 8:00 AM - 5:00 PM</div>
                <a href="Contact.aspx" class="career-btn career-btn-primary">Contact HR Office</a>

            </div>
        </section>
    </div>
</asp:Content>
