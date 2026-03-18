<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Announcement.aspx.cs" Inherits="TheSerifsAndScribes_MP.Announcement" %>

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
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
            <asp:LinkButton ID="learnmoreBtn" runat="server" PostBackUrl="About.aspx" Text="Learn More" />
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
                    <asp:LinkButton ID="viewmoreBtn" runat="server" Text="View All" />
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
    <div id ="map">
        <img src="..\Images\staticmap.png" />
    </div>
</asp:Content>
            