<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TheSerifsAndScribes_MP.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Portal</title>
    <link href="Styles/Fonts.css" rel="stylesheet" />
    <link href="Styles/LoginStyle.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server">

        <div id="login-page">
            <div class="login-card">
                <div class="login-left">
                    <div class="login-overlay"></div>

                    <div class="login-left-content">
                        <img src="Images/Binan_City_Seal.png" class="login-seal" />

                        <h1 class="login-welcome">
                            Welcome to <span>Admin Portal</span>
                        </h1>

                        <p class="login-description">
                            Access the internal management system for announcements,
                            inquiries, organization details, and administrator accounts.
                        </p>
                    </div>
                </div>
                <div class="login-right">
                    <div class="login-form-title">Log In</div>

                    <div class="form-group">
                        <label class="login-label">Username</label>
                        <asp:TextBox ID="username" runat="server" CssClass="login-input" placeholder="Enter your Username" />
                    </div>

                    <div class="form-group">
                        <label class="login-label">Password</label>
                        <asp:TextBox ID="password" runat="server" CssClass="login-input" TextMode="Password" placeholder="Enter your Password" />
                    </div>

                    <div class="forgot-wrap">
                        <a href="#" class="forgot-link">Forgot Password?</a>
                    </div>

                    <div class="button-wrap">
                        <asp:Button ID="loginBtn" runat="server" CssClass="btn-signin" Text="Sign In" OnClick="loginBtn_Click" />
                    </div>
                </div>

            </div>
        </div>

    </form>
</body>
</html>