<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TheSerifsAndScribes_MP.Home" %>

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
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
            <p>Your Gateway to Heritage and Progress.<br />Discover vibrant community where history meets modern innovation.</p>
            <asp:LinkButton ID="learnmoreBtn" CssClass="btn btn-primary btn-lg" ClientIDMode="Static" runat="server" PostBackUrl="About.aspx" Text="Explore City" />
            <asp:LinkButton ID="cityservicesBtn" CssClass="btn btn-primary btn-lg" ClientIDMode="Static" runat="server" PostBackUrl="Services.aspx" Text="City Services" />
        </div>
    </div>

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

    
    <div id="space"></div>
    <div id="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1149.3495159631427!2d121.07942613549059!3d14.315176308457174!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397d9d7d402a00b%3A0x98d248e973356fb4!2sBi%C3%B1an%20City%20Hall!5e0!3m2!1sen!2sph!4v1773864686026!5m2!1sen!2sph" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe
        <p id="map-link">
            <a href="https://www.openstreetmap.org/?mlat=14.3350&amp;mlon=121.0832#map=17/14.3350/121.0832" target="_blank" rel="noopener">Open map in new tab</a>
        </p>
    </div>
</asp:Content>
            
