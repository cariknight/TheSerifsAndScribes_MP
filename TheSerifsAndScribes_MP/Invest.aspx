<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TheSerifsAndScribes_MP.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/InvestStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- himmel the HERO SECTION -->
    <section class="invest-hero">
        <div class="hero-overlay"></div>

        <div class="hero-content container">
            <div class="hero-badge">
                BUSINESS &amp; INVESTMENT HUB
            </div>

            <h1 class="hero-title">Invest in
                <br />
                <span>Sustainable Growth</span>
            </h1>

            <p class="hero-text">
                Biñan is a premier industrial and commercial destination in the Philippines.
                Join our thriving economy supported by pro-business policies and world-class infrastructure.
            </p>
        </div>
    </section>

    <!-- legal seCtion -->
    <section class="legal-foundation container">
        <div class="legal-content-wrapper">
            <!-- text Column -->
            <div class="legal-text">
                <p class="section-subtitle">Governance Framework</p>
                <h2 class="section-title">The Legal Foundation
                    <br />
                    of <span>Business in Biñan</span>
                </h2>
                <p class="section-text">
                    Our legislative codes are designed to provide transparency, stability, and incentives for long-term business partnerships.
                </p>

                <div class="code-boxes">
                    <div class="code-box green">
                        <div class="code-title">Local Revenue Code</div>
                        <div class="code-desc">Guidelines on local taxation, fees, and charges.</div>
                        <div class="code-icon">&#8681;</div>
                    </div>

                    <div class="code-box yellow">
                        <div class="code-title">Local Investment & Incentive Code</div>
                        <div class="code-desc">Tax holidays and fiscal incentives for new enterprises.</div>
                        <div class="code-icon">&#8681;</div>
                    </div>
                </div>
            </div>

            <!-- img  -->
            <div class="legal-image-wrapper">
                <img src="../Images/Assets/justice-img.png" alt="Lady Justice" class="legal-img" />
            </div>
        </div>
    </section>

    <!-- econ  -->
    <section class="economic-fundamentals container">
        <div class="econ-header">
            <div class="econ-title-text">
                <h2>Economic <span>Fundamentals</span></h2>
                <p>Detailed data on market values and the operational environment in Biñan.</p>
            </div>
            <div class="econ-btn">
                <asp:Button runat="server" Text="Download Economic Profile" CssClass="btn-download" />
            </div>
        </div>

        <div class="econ-cards">
            <div class="econ-card">
                <div class="econ-icon market-icon">
                    <!-- rep img rememver  -->
                    <img src="../Images/Assets/market-icon.png" alt="Market Icon" />
                </div>
                <h3>Market Value</h3>
                <p>Access updated Real Property Market Values. Biñan offers highly competitive property valuations, making it an ideal location for industrial plants and large-scale commercial developments.</p>
                <a href="#">View Schedule of Values &gt;</a>
            </div>

            <div class="econ-card">
                <div class="econ-icon cost-icon">
                    <img src="../Images/Assets/cost-icon.png" alt="Cost Icon" />
                </div>
                <h3>Cost of Doing Business</h3>
                <p>Compare labor costs, utility rates, and regulatory fees. We maintain a lean fee structure to ensure Biñan remains the most cost-effective hub in the CALABARZON region.</p>
                <a href="#" class="yellow-link">Operational Cost Guide &gt;</a>
            </div>
        </div>
    </section>

    <!-- inve oppo -->
    <section class="investment-opportunities">
        <div class="opportunities-header">
            <p class="opportunities-subtitle">Growth Sectors</p>
            <h2 class="opportunities-title">Investment <span class="highlight-green">Opportunities</span> &amp; Priorities
            </h2>
            <div class="opportunities-underline"></div>
        </div>

        <div class="opportunities-feature-card">
            <img src="../Images/Assets/trading-center.jpg" alt="Trading Center" class="opportunities-feature-img" />
            <div class="opportunities-feature-overlay">
                <div class="opportunities-feature-icon">
                    <img src="../Images/Assets/trading-center-icon.png" alt="Trading Center Icon" />
                </div>
                <h3 class="opportunities-feature-title">Trading Center</h3>
                <p class="opportunities-feature-desc">
                    Biñan City is the premier trading hub south of Metro Manila, housing the largest public market in Laguna and the CALABARZON Region. It is a center of commerce with numerous banking institutions and emerging shopping centers serving retailers from nearby towns.
                </p>
            </div>
        </div>

        <div class="opportunities-cards-grid">
            <div class="opportunity-card">
                <div class="opportunity-card-body">
                    <div class="opportunity-head">
                        <span class="opportunity-icon yellow">
                            <img src="../Images/Assets/cottage-industry-icon.png" alt="Cottage Industry Icon" />
                        </span>
                        <h4>Cottage Industry</h4>
                    </div>
                    <p>
                        Support our thriving home-based production sector. We provide unique and distinctive products and services that represent our local craftsmanship, focusing on scaling these unique producers to compete in larger markets.
                    </p>
                </div>
            </div>

            <div class="opportunity-card">
                <div class="opportunity-card-body">
                    <div class="opportunity-head">
                        <span class="opportunity-icon green">
                            <img src="../Images/Assets/tourism-icon.png" alt="Tourism Development Icon" />
                        </span>
                        <h4>Tourism Development</h4>
                    </div>
                    <p>
                        Broadening wealth through resorts, hotels, convention centers, and eco-tourism. We focus on preserving our rich cultural and historical heritage while developing modern leisure attractions that create jobs and benefit the entire city.
                    </p>
                </div>
            </div>

            <div class="opportunity-card">
                <div class="opportunity-card-body">
                    <div class="opportunity-head">
                        <span class="opportunity-icon green">
                            <img src="../Images/Assets/agricultural-icon.png" alt="Agricultural Icon" />
                        </span>
                        <h4>Agricultural</h4>
                    </div>
                    <p>
                        Support our thriving home-based production sector. We provide unique and distinctive products and services that represent our local craftsmanship, focusing on scaling these unique producers to compete in larger markets.
                    </p>
                </div>
            </div>

            <div class="opportunity-card">
                <div class="opportunity-card-body">
                    <div class="opportunity-head">
                        <span class="opportunity-icon yellow">
                            <img src="../Images/Assets/commercial-leisure-icon.png" alt="Commercial &amp; Leisure Icon" />
                        </span>
                        <h4>Commercial &amp; Leisure</h4>
                    </div>
                    <p>
                        Prime opportunities for developers in shopping malls, supermarkets, department stores, and supermarts. Biñan’s growing population and strategic location make it the ideal site for large-scale activity areas and retail centers.
                    </p>
                </div>
            </div>
        </div>
    </section>
    <!-- buzi   -->
    <section class="biz-services">
        <div class="biz-services-grid">
            <div class="biz-card">
                <div class="biz-icon">
                    <img src="../Images/Assets/business-directory-icon.png" alt="Business Directory" />
                </div>
                <h3>Business Directory</h3>
                <p>
                    Search through our database of registered businesses and partners in the city.
                </p>
                <a href="#" class="biz-link">Search Directory <span>&gt;</span></a>
            </div>

            <div class="biz-card">
                <div class="biz-icon">
                    <img src="../Images/Assets/safety-seal-icon.png" alt="Safety Seal Certification" />
                </div>
                <h3>Safety Seal Certification</h3>
                <p>
                    Ensure your business meets the required safety standards and health protocols for public safety.
                </p>
                <a href="#" class="biz-link">Apply for Certification <span>&gt;</span></a>
            </div>
        </div>
    </section>

</asp:Content>
