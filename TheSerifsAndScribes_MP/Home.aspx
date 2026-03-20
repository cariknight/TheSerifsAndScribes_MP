<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TheSerifsAndScribes_MP.Home" %>

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Home</title>
    <link href="Styles/HomeStyle.css" rel="stylesheet" />
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
        <div>
            <a href="">
                image
                <p>E-Services</p>
            </a>
        </div>
        <div>
            <a href="">
                image
                <p>Business</p>
            </a>
        </div>
        <div>
            <a href="">
                image
                <p>Tourism</p>
            </a>
        </div>
        <div>
            <a href="">
                image
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
        <div class="flex-container">
            
            <div id="announcement-left">
                <div id="announcement-right-content" class="flex-container">
                    <div>
                        image
                    </div>
                    <div>
                        image
                    </div>
                    <div>
                        image
                    </div>
                    
                </div>
            </div>
            <div id="announcement-right">
                <p class="kicker">IMPORTANT NOTICES</p>
                <h2 class="h2-style">Announcements</h2>
                <p class="subtitle">Stay informed with the latest official announcements advisories and public notices from the City Government of Bi&ntilde;an</p>

                <div class="flex-container">
                    <div>image</div>
                    <div>
                        <h4>Title</h4>
                        <p>text description here</p>
                    </div>
                </div>
                <div class="flex-container">
                    <div>image</div>
                    <div>
                        <h4>Title</h4>
                        <p>text description here</p>
                    </div>
                </div>
                <div class="flex-container">
                    <div>image</div>
                    <div>
                        <h4>Title</h4>
                        <p>text description here</p>
                    </div>
                </div>

                <asp:LinkButton ID="viewmoreBtn" CssClass="btn btn-primary btn-lg" runat="server" Text="View All Announcement" />
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
                logo
                <h3>Business Permit</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipiscing elit.</p>

                <asp:LinkButton CssClass="serviceBtn" ID="businessPermitBtn" runat="server" Text="Access Portal" />
            </div>
            <div class="card">
                logo
                <h3>Real Property Tax</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipiscing elit.</p>

                <asp:LinkButton CssClass="serviceBtn" ID="realPropertyTaxBtn" runat="server" Text="Access Portal" />
            </div>
            <div class="card">
                logo
                <h3>Civil Registry</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipiscing elit.</p>

                <asp:LinkButton CssClass="serviceBtn" ID="civilRegistryBtn" runat="server" Text="Access Facebook" />
            </div>
            <div class="card">
                logo
                <h3>Health Services</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipiscing elit.</p>

                <asp:LinkButton CssClass="serviceBtn" ID="healthServicesBtn" runat="server" Text="Access Facebook" />
            </div>
            <div class="card">
                logo
                <h3>Education</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipiscing elit.</p>

                <asp:LinkButton CssClass="serviceBtn" ID="educationBtn" runat="server" Text="Access Website" />
            </div>
            <div class="card">
                logo
                <h3>Environment</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipiscing elit.</p>

                <asp:LinkButton CssClass="serviceBtn" ID="environmentBtn" runat="server" Text="Access Website" />
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
            
