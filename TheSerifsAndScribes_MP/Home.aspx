<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TheSerifsAndScribes_MP.Home" %>
<%@ Register Src="Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Welcome to Biñan City</h1>
            <p>Your Gateway to Heritage and Progress</p>
            <asp:Button ID="learnmoreBtn" runat="server" PostBackUrl="About.aspx" Text="Learn More" />
        </div>

        <div>
            <h2>Announcements</h2>
            <div>
                <h3>Lorem Ipsum</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
            </div>
            <asp:Button ID="viewmoreBtn" runat="server" Text="View All" />

        </div>
        <div>
            <h2>News and Events</h2>
            
            <div>
                <h3>Lorem Ipsum</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
                <asp:Button ID="readmoreBtn" runat="server" Text="Read more" />
            </div>
            <div>
                <h3>Lorem Ipsum</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
                <asp:Button ID="readmoreBtn1" runat="server" Text="Read more" />
            </div>
            <div>
                <h3>Lorem Ipsum</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....</p>
                <asp:Button ID="readmoreBtn2" runat="server" Text="Read more" />
            </div>
        </div>
        
        <uc:Footer runat="server" ID="Footer1" />
    </form>
</body>
</html>
