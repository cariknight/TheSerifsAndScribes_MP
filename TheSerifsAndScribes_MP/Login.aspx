<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TheSerifsAndScribes_MP.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Styles/LoginStyle.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server">

        <div id="login-page">
            <div class="login-card">
                <div class="login-left">
                    <div class="login-overlay"></div>

                    <div class="login-left-content">
                        <img src="Images/Binan_City_Seal.png" class="login-seal" alt="Biñan City Seal"/>

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

                        <div class="show-password-wrap">
                            <input type="checkbox" id="showPasswordToggle" onclick="togglePassword()" />
                            <label for="showPasswordToggle" class="show-password-label">Show Password</label>
                        </div>

                        <asp:Label ID="lblMessage" runat="server" CssClass="login-error" Visible="false"></asp:Label>
                    </div>

                    <div class="button-wrap">
                        <asp:Button ID="loginBtn" runat="server" CssClass="btn-signin" Text="Sign In" OnClick="loginBtn_Click" />
                    </div>
                </div>

            </div>
        </div>
    </form>
    <script src="Scripts/Password.js"></script>
</body>
</html>