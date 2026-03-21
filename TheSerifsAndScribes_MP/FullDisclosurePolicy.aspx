<%@ Page Title="Full Disclosure Policy" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FullDisclosurePolicy.aspx.cs" Inherits="TheSerifsAndScribes_MP.FullDisclosurePolicy" %>

<asp:Content ID="FullDisclosureHead" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Full Disclosure Policy</title>
    <link href="Styles/HomeStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
    <link href="Styles/TransparencyStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="FullDisclosureMain" ContentPlaceHolderID="MainContent" runat="server">
    <div class="transparency-subpage">
        <section class="trans-sub-hero hero-disclosure">
            <div class="trans-sub-hero__content">
                <span class="portal-badge">Transparency</span>
                <h1>Full Disclosure Policy</h1>
                <p>Access budgets, procurement documents, and financial reports released under the DILG Full Disclosure Policy.</p>
                <div class="breadcrumb-inline" aria-label="Breadcrumb">
                    <a href="Home.aspx">Home</a>
                    <span>/</span>
                    <a href="Transparency.aspx">Transparency</a>
                    <span>/</span>
                    <span>Full Disclosure Policy</span>
                </div>
            </div>
        </section>

        <section class="resource-section">
            <div class="resource-grid">
                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/doc-green-icon.png" alt="Budget document icon" />
                        </div>
                        <div>
                            <p class="resource-label">IRA</p>
                            <h3>20% Component of the Internal Revenue Allotment Utilization</h3>
                        </div>
                    </div>
                    <p>Utilization reports for the 20% development fund from IRA.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/AM2gfgfa7OeJedupA6RU6ag/20%25%20Component%20of%20the%20Internal%20Revenue%20Allotment%20Utilization?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/doc-green-icon.png" alt="Annual budget icon" />
                        </div>
                        <div>
                            <p class="resource-label">Budget</p>
                            <h3>Annual Budget Report</h3>
                        </div>
                    </div>
                    <p>Approved annual budget with allocations and funding sources.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/AK7jFTIFdQgoeRlthawT-XA/Annual%20Budget%20Report?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/doc-green-icon.png" alt="Financial statements icon" />
                        </div>
                        <div>
                            <p class="resource-label">GAD</p>
                            <h3>Annual Gender and Development Accomplishment Report</h3>
                        </div>
                    </div>
                    <p>Outcomes and budget utilization for gender and development programs.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/ANKAFCU4pJ7SGMUwnR99DEk/Annual%20Gender%20and%20Development%20Accomplishment%20Report?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/clock-green-icon.png" alt="Procurement icon" />
                        </div>
                        <div>
                            <p class="resource-label">Procurement</p>
                            <h3>Annual Procurement Plan / Procurement List</h3>
                        </div>
                    </div>
                    <p>Planned procurement projects and schedules for the fiscal year.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/AFuZV1SXK2dV5jdqribabDc/Annual%20Procurement%20Plan%20or%20Procurement%20List?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/doc-green-icon.png" alt="Indebtedness icon" />
                        </div>
                        <div>
                            <p class="resource-label">Finance</p>
                            <h3>Annual Statement of Indebtedness, Payments and Balances</h3>
                        </div>
                    </div>
                    <p>Outstanding obligations, payments made, and remaining balances.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/AMrG4K_PQi5wtoeER0u1Pyg/Annual%20Statement%20of%20Indebtedness%2C%20Payments%20and%20Balances?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/doc-green-icon.png" alt="Bid results icon" />
                        </div>
                        <div>
                            <p class="resource-label">Procurement</p>
                            <h3>Bid Results on Civil Works and Goods and Services</h3>
                        </div>
                    </div>
                    <p>Awarded bids and outcomes for civil works and goods/services.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/AE5Ak8IqSnnaZUMM8oK9DUA/Bid%20Results%20on%20Civil%20Works%20and%20Goods%20and%20Services?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/doc-green-icon.png" alt="LDRRMF icon" />
                        </div>
                        <div>
                            <p class="resource-label">DRRM</p>
                            <h3>Local Disaster Risk Reduction and Management Fund Utilization</h3>
                        </div>
                    </div>
                    <p>Utilization of LDRRMF for preparedness, response, and recovery.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/APCv2pLmGn-9oh644dDCkmk/Local%20Disaster%20Risk%20Reduction%20and%20Management%20Fund%20Utilization?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/admin-green-icon.png" alt="Manpower icon" />
                        </div>
                        <div>
                            <p class="resource-label">HR</p>
                            <h3>Manpower Complement</h3>
                        </div>
                    </div>
                    <p>Roster and staffing complement of the LGU.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/ABN38Dlr_qJOeBd9Q0fANl4/Manpower%20Complement?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/clock-green-icon.png" alt="Cash flow icon" />
                        </div>
                        <div>
                            <p class="resource-label">Finance</p>
                            <h3>Quarterly Statement of Cash Flow</h3>
                        </div>
                    </div>
                    <p>Quarterly inflows and outflows of cash for city operations.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/ABSPmitEKo9LpIHm2_bmgOo/Quarterly%20Statement%20of%20Cash%20Flow?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/doc-green-icon.png" alt="SEF icon" />
                        </div>
                        <div>
                            <p class="resource-label">Education</p>
                            <h3>Report of Special Education Fund Utilization</h3>
                        </div>
                    </div>
                    <p>Utilization of SEF for education-related programs and projects.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/AIVwqjXTiauXpUsjWf5Qj4g/Report%20of%20Special%20Education%20Fund%20Utilization?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/doc-green-icon.png" alt="Receipts and expenditures icon" />
                        </div>
                        <div>
                            <p class="resource-label">Finance</p>
                            <h3>Statement of Receipts and Expenditures</h3>
                        </div>
                    </div>
                    <p>Summary of revenues collected and expenditures incurred.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/AF9RjWLDtHpS-TUXecyM8tQ/Statement%20of%20Receipts%20and%20Expenditures?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/clock-green-icon.png" alt="Supplemental procurement icon" />
                        </div>
                        <div>
                            <p class="resource-label">Procurement</p>
                            <h3>Supplemental Procurement Plan</h3>
                        </div>
                    </div>
                    <p>Additional procurement requirements beyond the annual plan.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/AJKHnjMWDKcK65R6AEgvQek/Supplemental%20Procurement%20Plan?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/doc-green-icon.png" alt="Trust fund icon" />
                        </div>
                        <div>
                            <p class="resource-label">Trust Fund</p>
                            <h3>Trust Fund (PDAF) Utilization</h3>
                        </div>
                    </div>
                    <p>Utilization of PDAF-related trust funds.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/ACvCK6_lCjDNWclSFlA8H0o/Trus%20Fund%20%28PDAF%29%20Utilization?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>

                <article class="resource-card">
                    <div class="resource-card__top">
                        <div class="card-icon icon-mint">
                            <img src="../Images/Assets/Icons/doc-green-icon.png" alt="Cash advances icon" />
                        </div>
                        <div>
                            <p class="resource-label">Finance</p>
                            <h3>Unliquidated Cash Advances</h3>
                        </div>
                    </div>
                    <p>Outstanding cash advances awaiting liquidation.</p>
                    <a class="card-button" href="https://www.dropbox.com/scl/fo/x0ij78xkm459pou35cobe/AK16Z_ND-WiHndXtR__1l_Y/Unliquidated%20Cash%20Advances?rlkey=5xeydnyed2c2qi2vctbhpu2c9&dl=0" target="_blank" rel="noopener" role="button">Download ></a>
                </article>
            </div>
        </section>
    </div>
</asp:Content>
