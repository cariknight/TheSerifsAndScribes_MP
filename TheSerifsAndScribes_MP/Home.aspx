<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TheSerifsAndScribes_MP.Home" %>

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Home</title>
    <link href="Styles/HomeStyle.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="home-bg">
        <div id="home">
            <div id="home-filter">
            </div>
        </div>
        <div id="homecontent">
            <h1>Welcome to <span id="changecolor">Bi&ntilde;an City</span></h1>
            <p>Your Gateway to Heritage and Progress</p>
            <asp:LinkButton ID="learnmoreBtn" CssClass="cta-btn" ClientIDMode="Static" runat="server" PostBackUrl="About.aspx" Text="Learn More" />
        </div>
    </div>


    <div id="announcement">
        <div class="flex-container">
            <div id="announcement-left">
                <h2>Announcements</h2>
            </div>
            <div id="announcement-right">
                <div id="announcement-right-content">
                    <div id="announcement-card">
                        <div id="img-container"></div>
                        <div id="announcement-content">
                            <h3>Lorem Ipsum</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
                        </div>
                    </div>
                    <asp:LinkButton ID="viewmoreBtn" CssClass="cta-btn" runat="server" Text="View All" />
                </div>
            </div>
        </div>

    </div>

    <div id="news-bg">
        <div id="news">
            <h2>News and Events</h2>
            <div class="flex-container">
                <div id="newscard">
        
                    <h3>Lorem Ipsum</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
                    <asp:Button ID="readmoreBtn" CssClass="css-button-rounded--yellow" runat="server" Text="Read more" />
                </div>
                <div id="newscard">
                    <h3>Lorem Ipsum</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
                    <asp:Button ID="readmoreBtn1" CssClass="css-button-rounded--yellow" runat="server" Text="Read more" />
                </div>
                <div id="newscard">
                    <h3>Lorem Ipsum</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
                    <asp:Button ID="readmoreBtn2" CssClass="css-button-rounded--yellow" runat="server" Text="Read more" />
                </div>
            </div>
        </div>  
    </div>
    <div id="space"></div>
    <div id="map">
        <iframe
            title="Biñan City Hall Map"
            src="https://www.openstreetmap.org/export/embed.html?bbox=121.0760%2C14.3295%2C121.0904%2C14.3405&amp;layer=mapnik&amp;marker=14.3350%2C121.0832"
            allowfullscreen
            loading="lazy">
        </iframe>
        <p id="map-link">
            <a href="https://www.openstreetmap.org/?mlat=14.3350&amp;mlon=121.0832#map=17/14.3350/121.0832" target="_blank" rel="noopener">Open map in new tab</a>
        </p>
    </div>
</asp:Content>
            
