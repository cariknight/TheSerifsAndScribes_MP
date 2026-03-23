<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Invest.aspx.cs" Inherits="TheSerifsAndScribes_MP.Invest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Invest</title>
    <link href="Styles/InvestStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="invest-page">

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
                Bi&ntilde;an is a premier industrial and commercial destination in the Philippines.
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
                    of <span>Business in Bi&ntilde;an</span>
                </h2>
                <p class="section-text">
                    Our legislative codes are designed to provide transparency, stability, and incentives for long-term business partnerships.
                </p>

                <div class="code-boxes">
                    <div class="code-box green">
                        <div class="code-text">
                            <div class="code-title">Local Revenue Code</div>
                            <div class="code-desc">Guidelines on local taxation, fees, and charges.</div>
                        </div>
                        <a runat="server" href="~/Files/Invest/2016_1-Local-Revenue-Code.pdf" target="_blank" class="code-icon-btn" rel="noopener">
                            <img src="../Images/Assets/Icons/download-lightgray-icon.png" alt="Open PDF" />
                        </a>



                    </div>

                    <div class="code-box yellow">
                        <div class="code-text">
                            <div class="code-title">Local Investment & Incentive Code</div>
                            <div class="code-desc">Tax holidays and fiscal incentives for new enterprises.</div>
                        </div>
                        <a runat="server" href="~/Files/Invest/Local-Investment-and-Incentive-Code" target="_blank" class="code-icon-btn" rel="noopener">
                            <img src="../Images/Assets/Icons/download-lightgray-icon.png" alt="Download" />
                        </a>

                    </div>
                </div>

            </div>

            <!-- img  -->
            <div class="legal-image-wrapper">
                <img src="../Images/justice-img.png" alt="Lady Justice" class="legal-img" />
            </div>
        </div>
    </section>

    <!-- econ  -->
    <section class="economic-fundamentals container">
        <div class="econ-header">
            <div class="econ-title-text">
                <h2>Economic <span>Fundamentals</span></h2>
                <p>Detailed data on market values and the operational environment in Bi&ntilde;an.</p>
            </div>
        </div>

        <div class="econ-cards">
            <div class="econ-card">
                <div class="econ-icon market-icon">
                    <!-- rep img rememver  -->
                    <img src="../Images/Assets/Icons/market-green-icon.png" alt="Market Icon" />
                </div>
                <h3>Market Value</h3>
                <br />
                <p>Access updated Real Property Market Values. Bi&ntilde;an offers highly competitive property valuations, making it an ideal location for industrial plants and large-scale commercial developments.</p>
                <a runat="server" href="~/Files/Invest/Market-Value.pdf" target="_blank" rel="noopener">View Schedule of Values &gt;
                </a>
            </div>

            <div class="econ-card">
                <div class="econ-icon cost-icon">
                    <img src="../Images/Assets/Icons/money-yellow-icon.png" alt="Cost Icon" />
                </div>
                <h3>Cost of Doing Business</h3>
                <br />
                <p>Compare labor costs, utility rates, and regulatory fees. We maintain a lean fee structure to ensure Bi&ntilde;an remains the most cost-effective hub in the CALABARZON region.</p>
                <a runat="server" href="~/Files/Invest/Cost-of-Doing-Business.pdf" target="_blank" rel="noopener">Operational Cost Guide &gt;
                </a>
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
            <img src="../Images/tradingcenter-img.jpeg" alt="Trading Center" class="opportunities-feature-img" />
            <div class="opportunities-feature-overlay">
                <div class="opportunities-feature-icon">
                    <img src="../Images/Assets/Icons/market-white-icon.png" alt="Trading Center Icon" />
                </div>
                <h3 class="opportunities-feature-title">Trading Center</h3>
                <p class="opportunities-feature-desc">
                    Bi&ntilde;an City is the premier trading hub south of Metro Manila, housing the largest public market in Laguna and the CALABARZON Region. It is a center of commerce with numerous banking institutions and emerging shopping centers serving retailers from nearby towns.
                </p>
            </div>
        </div>

        <div class="opportunities-cards-grid">
            <div class="opportunity-card">
                <img src="../Images/cottage-img.jpg" alt="Cottage Thumbnail" class="opportunity-thumb-img" />
                <div class="opportunity-card-body">
                    <div class="opportunity-head">
                        <span class="opportunity-icon yellow">
                            <img src="../Images/Assets/Icons/house-yellow-icon.png" alt="Cottage Industry Icon" />
                        </span>
                        <h4>Cottage Industry</h4>
                    </div>
                    <p>
                        Support our thriving home-based production sector. We provide unique and distinctive products and services that represent our local craftsmanship, focusing on scaling these unique producers to compete in larger markets.
                    </p>
                </div>
            </div>


            <div class="opportunity-card">
                <img src="../Images/tourism-img.jpg" alt="Tourism Thumbnail" class="opportunity-thumb-img" />
                <div class="opportunity-card-body">
                    <div class="opportunity-head">
                        <span class="opportunity-icon green">
                            <img src="../Images/Assets/Icons/palmtree-lightgreen-icon.png" alt="Tourism Development Icon" />
                        </span>
                        <h4>Tourism Development</h4>
                    </div>
                    <p>
                        Broadening wealth through resorts, hotels, convention centers, and eco-tourism. We focus on preserving our rich cultural and historical heritage while developing modern leisure attractions that create jobs and benefit the entire city.
                    </p>
                </div>
            </div>

            <div class="opportunity-card">
                <img src="../Images/agricultural-img.jpg" alt="Agricultural Thumbnail" class="opportunity-thumb-img" />
                <div class="opportunity-card-body">
                    <div class="opportunity-head">
                        <span class="opportunity-icon green">
                            <img src="../Images/Assets/Icons/seedling-green-icon.png" alt="Agricultural Icon" />
                        </span>
                        <h4>Agricultural</h4>
                    </div>
                    <p>
                        Support our thriving home-based production sector. We provide unique and distinctive products and services that represent our local craftsmanship, focusing on scaling these unique producers to compete in larger markets.
                    </p>
                </div>
            </div>

            <div class="opportunity-card">
                <img src="../Images/commerceleisure-img.jpg" alt="Commercial Thumbnail" class="opportunity-thumb-img" />
                <div class="opportunity-card-body">
                    <div class="opportunity-head">
                        <span class="opportunity-icon yellow">
                            <img src="../Images/Assets/Icons/bag-yellow-icon.png" alt="Commercial &amp; Leisure Icon" />
                        </span>
                        <h4>Commercial &amp; Leisure</h4>
                    </div>
                    <p>
                        Prime opportunities for developers in shopping malls, supermarkets, department stores, and supermarts. Bi&ntilde;an&#39;s growing population and strategic location make it the ideal site for large-scale activity areas and retail centers.
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
                    <img src="../Images/Assets/Icons/market-green-icon.png" alt="Business Directory" />
                </div>
                <h3>Business Directory</h3>
                <p>
                    Search through our database of registered businesses and partners in the city.
                </p>
                <a runat="server" href="~/Files/Invest/Active-Businesses-2017.pdf" target="_blank" class="biz-link" rel="noopener">Search Directory <span>&gt;</span>
                </a>
            </div>

            <div class="biz-card">
                <div class="biz-icon">
                    <img src="../Images/Assets/Icons/award-green-icon.png" alt="Safety Seal Certification" />
                </div>
                <h3>Safety Seal Certification</h3>
                <p>
                    Ensure your business meets the required safety standards and health protocols for public safety.
                </p>
                <a href="https://docs.google.com/forms/d/19rWKK0aY7mDrq6kXhJhabZZuq9AAG1Su_smWxBltptk/viewform?edit_requested=true"
                    target="_blank"
                    class="biz-link"
                    rel="noopener">Apply for Certification <span>&gt;</span>
                </a>
            </div>
        </div>
    </section>

</div>
</asp:Content>


