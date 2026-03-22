<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TheSerifsAndScribes_MP.Home" %>

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Home</title>
    <link href="Styles/HomeStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- SPLASH SCREEN -->
    <div id="home-bg">
        <div id="home">
            <div id="home-filter">
            </div>
        </div>
        <div id="homecontent">
            <h1>Welcome to <span id="changecolor">Bi&ntilde;an City</span></h1>
            <p>Your Gateway to Heritage and Progress.<br />Discover vibrant community where history meets modern innovation.</p>
            <asp:LinkButton ID="learnmoreBtn" CssClass="btn btn-primary btn-lg" ClientIDMode="Static" runat="server" PostBackUrl="About.aspx" Text="Explore City" />
            <asp:LinkButton ID="cityservicesBtn" CssClass="btn btn-primary btn-lg" ClientIDMode="Static" runat="server" PostBackUrl="#city-service" Text="City Services" />
        </div>
    </div>

    <!-- NAVIGATION ISLAND -->
    <div id="navIsland" class="flex-container">
        <div class="nav-item">
            <a href="Services.aspx">
                <div class="nav-icon-wrap light-green">
                    <img class="nav-icon" src="Images/Assets/Icons/eservices-green-icon.png" alt="E-Services" />
                </div>
                <p>E-Services</p>
            </a>
        </div>
        <div class="nav-item">
            <a href="Invest.aspx">
                <div class="nav-icon-wrap light-yellow">
                    <img class="nav-icon" src="Images/Assets/Icons/business-yellow-icon.png" alt="Business" />
                </div>
                <p>Business</p>
            </a>
        </div>
        <div class="nav-item">
            <a href="About.aspx">
                <div class="nav-icon-wrap light-green">
                    <img class="nav-icon" src="Images/Assets/Icons/tourism-green-icon.png" alt="Tourism" />
                </div>
                <p>Tourism</p>
            </a>
        </div>
        <div class="nav-item">
            <a href="Contact.aspx">
                <div class="nav-icon-wrap light-yellow">
                    <img class="nav-icon" src="Images/Assets/Icons/contactus-yellow-icon.png" alt="Contact Us" />
                </div>
                <p>Contact Us</p>
            </a>
        </div>
    </div>

    <!-- NEWS AND EVENT -->
    
    <div id="news">
        <p class="kicker">STAY UPDATED</p>
        <h2 class="h2-style">News and Events</h2>
        <p class="subtitle">Discover what's happening around the city. From community events to official government </p>
        <div class="flex-container news-cards">
            <div class="news-card card">
                <img class="card-img-top" src="" alt="Card image cap" />
                <div class="card-body">
                    <h3 class="card-title">Lorem Ipsum</h3>
                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
                    <div class="news-link-row">
                        <asp:Button ID="readmoreBtn" CssClass="news-link" runat="server" Text="Read more" />
                        <span class="news-arrow">&#8594;</span>
                    </div>
                </div>
            </div>
            <div class="news-card card">
                <img class="card-img-top" src="" alt="Card image cap" />
                <div class="card-body">
                    <h3 class="card-title">Lorem Ipsum</h3>
                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
                    <div class="news-link-row">
                        <asp:Button ID="Button1" CssClass="news-link" runat="server" Text="Read more" />
                        <span class="news-arrow">&#8594;</span>
                    </div>
                </div>
            </div>
            
            <div class="news-card card">
                <img class="card-img-top" src="" alt="Card image cap" />
                <div class="card-body">
                    <h3 class="card-title">Lorem Ipsum</h3>
                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
                    <div class="news-link-row">
                        <asp:Button ID="Button2" CssClass="news-link" runat="server" Text="Read more" />
                        <span class="news-arrow">&#8594;</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="space"></div>
    <!-- ANNOUNCEMENT SECTION -->
    <div id="announcement">
        <div class="flex-container announcement-shell">
            <div id="announcement-left">
                <div class="hero-rect hero-rect--large hero-img-1"></div>
                <div class="hero-rect hero-rect--small hero-img-2"></div>
                <asp:Panel ID="FeaturedPanel" runat="server" CssClass="featured-card" Visible="false">
                    <div class="featured-pill">Latest News</div>
                    <h5 id="FeaturedTitle" runat="server"></h5>
                    <p id="FeaturedBody" runat="server"></p>
                    <small id="FeaturedDate" runat="server" class="text-muted"></small>
                </asp:Panel>
            </div>

            <div id="announcement-right">
                <p class="kicker">IMPORTANT NOTICES</p>
                <h2 class="h2-style">Announcements</h2>
                <p class="subtitle subtitle-left">Stay informed with the latest official announcements advisories and public notices from the City Government of Bi&ntilde;an</p>

                <asp:Repeater ID="LatestAnnouncementsRepeater" runat="server">
                    <HeaderTemplate><div class="announcement-list"></HeaderTemplate>
                    <ItemTemplate>
                        <div class="announcement-row">
                            <div class="icon-badge"></div>
                            <div class="announcement-copy">
                                <h4><%# Eval("Title") %></h4>
                                <p><%# Eval("Preview") %></p>
                                <small class="text-muted"><%# ((DateTime)Eval("CreatedAt")).ToString("MMMM dd, yyyy") %></small>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate></div></FooterTemplate>
                </asp:Repeater>
                <asp:Panel ID="NoAnnouncementPanel" runat="server" Visible="false" CssClass="alert alert-info mt-2">No announcements yet. Please check back soon.</asp:Panel>

                <asp:LinkButton ID="viewmoreBtn" ClientIDMode="Static" CssClass="btn btn-primary btn-lg view-all-btn" runat="server" Text="View All Announcement" PostBackUrl="~/Announcements.aspx" />
            </div>
        </div>

    </div>

    <!-- CITY SERVICE SECTION -->
    <div id="city-service">
        <div class="flex-container">
            <div>
                <p class="kicker">OUR SERVICES</p>
                <h2 class="h2-style">City Services Available</h2>
                <p class="subtitle">Access essential government services conveniently. We are continuously improving our digital infrastructure to serve you better.</p>
            </div>
            <div>
                <asp:LinkButton ID="allservicesBtn" CssClass="btn btn-outline-success" runat="server" Text="All Services" />
            </div>
        </div>

        <!-- ALL SERVICES -->
        <div id="service-cards" class="flex-container">
            <div class="card">
                <div class="service-icon-wrap service-light-green">
                    <img class="service-icon" src="Images/Assets/Icons/building-green-icon.png" alt="Business Permit" />
                </div>
                
                <h3>Business Permit</h3>
                <p>Apply for or renew your business permit online.</p>

                <a class="serviceBtn" href="https://www.binancitybusinesspermit.online/" target="_blank" rel="noopener">Access Portal</a>
            </div>
            <div class="card">
                <div class="service-icon-wrap service-light-yellow">
                    <img class="service-icon" src="Images/Assets/Icons/house-yellow-icon.png" alt="Real Property Tax" />
                </div>
                <h3>Real Property Tax</h3>
                <p>Check balances and pay your real property tax dues.</p>

                <a class="serviceBtn" href="https://binancityrealproperty.online/" target="_blank" rel="noopener">Access Portal</a>
            </div>
            <div class="card">
                <div class="service-icon-wrap service-light-green">
                    <img class="service-icon" src="Images/Assets/Icons/doc-green-icon.png" alt="Civil Registry" />
                </div>
                <h3>Civil Registry</h3>
                <p>Request certificates for birth, marriage, and other records.</p>

                <a class="serviceBtn" href="https://www.facebook.com/binancivilregistrar/" target="_blank" rel="noopener">Access Facebook</a>
            </div>
            <div class="card">
                <div class="service-icon-wrap service-light-green">
                    <img class="service-icon" src="Images/Assets/Icons/stetoscope-green-icon.png" alt="Health Services" />
                </div>
                <h3>Health Services</h3>
                <p>View advisories and programs from the City Health Office.</p>

                <a class="serviceBtn" href="https://www.facebook.com/CHOBinanLaguna/" target="_blank" rel="noopener">Access Facebook</a>
            </div>
            <div class="card">
                <div class="service-icon-wrap service-light-green">
                    <img class="service-icon" src="Images/Assets/Icons/gradcap-green-icon.png" alt="Education" />
                </div>
                <h3>Education</h3>
                <p>Explore updates and resources from DepEd Bi&ntilde;an City.</p>

                <a class="serviceBtn" href="https://www.depedbinancity.ph/" target="_blank" rel="noopener">Access Website</a>
            </div>
            <div class="card">
                <div class="service-icon-wrap service-light-green">
                    <img class="service-icon" src="Images/Assets/Icons/tree-green-icon.png" alt="Environment" />
                </div>
                <h3>Environment</h3>
                <p>Learn about environmental projects and how to participate.</p>

                <a class="serviceBtn" href="https://www.facebook.com/pgenrolaguna" target="_blank" rel="noopener">Access Website</a>
            </div>
        </div>
    </div>
    
    <!-- MAP -->
    <div id="space"></div>
    <div id="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1149.3495159631427!2d121.07942613549059!3d14.315176308457174!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397d9d7d402a00b%3A0x98d248e973356fb4!2sBi%C3%B1an%20City%20Hall!5e0!3m2!1sen!2sph!4v1773864686026!5m2!1sen!2sph" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
        </iframe>
    </div>
</asp:Content>
            
