<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TheSerifsAndScribes_MP.Home" %>
<%@ Register Src="Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/HomeStyle.css" rel="stylesheet" />
    <title>Home</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="home-bg">
            <div id="home">
                <div id="home-filter">
                </div>
            </div>
            <div id="homecontent">
                <h1>Welcome to <span id="changecolor">Biñan City</span></h1>
                <p>Your Gateway to Heritage and Progress</p>
                <asp:LinkButton ID="learnmoreBtn" runat="server" PostBackUrl="About.aspx" Text="Learn More" />
            </div>
        </div>
        

        <div id="announcement">
            <div id="flexcontainer">
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
                <div id="flexcontainer">
                    <div id="newscard">
                
                        <h3>Lorem Ipsum</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
                        <asp:Button ID="readmoreBtn" runat="server" Text="Read more" />
                    </div>
                    <div id="newscard">
                        <h3>Lorem Ipsum</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
                        <asp:Button ID="readmoreBtn1" runat="server" Text="Read more" />
                    </div>
                    <div id="newscard">
                        <h3>Lorem Ipsum</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
                        <asp:Button ID="readmoreBtn2" runat="server" Text="Read more" />
                    </div>
                </div>
            </div>  
        </div>
        <div id="space"></div>
        <div id ="map">
            <img src="..\Images\staticmap.png" />
        </div>
    </form>
    <uc:Footer runat="server" ID="Footer1" />
</body>
</html>
