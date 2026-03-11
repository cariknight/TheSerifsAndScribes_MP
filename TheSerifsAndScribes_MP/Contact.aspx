<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TheSerifsAndScribes_MP.Contact" %>
<%@ Register Src="NavBar.ascx" TagPrefix="uc" TagName="NavBar" %>
<%@ Register Src="Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact</title>
    <link href="~/Styles/contact.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <uc:NavBar runat="server" ID="Navbar1" />
    <form id="form2" runat="server">
        <div class="contact-wrapper">
            <div class="contact-left">
                <h2>Contact Us</h2>
                <p>Have a question or concern? Fill out the form and our team will assist you promptly.</p>
            </div>

            <div class="contact-right">
                <div class="form-group">
                    <label for="txtName">Full Name</label>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtPhone">Phone Number</label>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtMessage">Message</label>
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>

                <div class="consent">
                    <asp:CheckBox ID="chkConsent" runat="server" Text="I consent to the processing of my personal data (Privacy Policy)" />
                </div>

                <asp:Button ID="btnSubmit" runat="server" Text="SEND" CssClass="btn-submit" OnClick="btnSubmit_Click" />
            </div>
        </div>


        <div class="contact-info">
          <div class="contact-item">
            <img src="images/address.png" alt="Address Icon" class="icon"/>
            <span class="title">Address:</span>
            <div class="details">
              City Hall, San Pablo St. Brgy. Zapote, Biñan, Laguna
            </div>
          </div>

          <div class="contact-item">
            <img src="images/phone.png" alt="Phone Icon" class="icon"/>
            <span class="title">Phone:</span>
            <span class="details">(049) 513-5028</span>
          </div>

          <div class="contact-item">
            <img src="images/email.png" alt="Email Icon" class="icon"/>
            <span class="title">Email:</span>
            <span class="details">serbisyongarman@binan.gov.ph</span>
          </div>
        </div>


        <div class="hotlines">
          <h3>Hotlines:</h3>
          <div class="hotline-list">
            <ul>
              <li class="hotline-item">
                <span class="office">City Disaster Risk Reduction Management Office</span>
                <span class="hotline-number">513-9111</span>
              </li>
              <li class="hotline-item">
                <span class="office">Bureau of Fire and Protection Department (BFP)</span>
                <span class="hotline-number">511-9111</span>
              </li>
              <li class="hotline-item">
                <span class="office">Philippine National Police (PNP)</span>
                <span class="hotline-number">513-5111</span>
              </li>
              <li class="hotline-item">
                <span class="office">Bureau of Jail Management and Penology (BJMP)</span>
                <span class="hotline-number">511-6324</span>
              </li>
              <li class="hotline-item">
                <span class="office">Public Order and Safety Office (POSO)</span>
                <span class="hotline-number">513-8888</span>
              </li>
              <li class="hotline-item">
                <span class="office">City Environment and Natural Resources Office (CENRO)</span>
                <span class="hotline-number">513-5096</span>
              </li>
              <li class="hotline-item">
                <span class="office">Ospital ng Biñan (ONB)</span>
                <span class="hotline-number">511-4119</span>
              </li>
              <li class="hotline-item">
                <span class="office">Building Admin</span>
                <span class="hotline-number">513-5002</span>
              </li>
              <li class="hotline-item">
                <span class="office">City Information Office</span>
                <span class="hotline-number">513-5028</span>
              </li>
            </ul>
            <ul>
              <li class="hotline-item">
                <span class="office">Business Permit and Licensing Office (BPLO)</span>
                <span class="hotline-number">513-5084</span>
              </li>
              <li class="hotline-item">
                <span class="office">Commission on Election (COMELEC)</span>
                <span class="hotline-number">513-5100</span>
              </li>
              <li class="hotline-item">
                <span class="office">Department of Education (DepEd)</span>
                <span class="hotline-number">511-6446</span>
              </li>
              <li class="hotline-item">
                <span class="office">Department of the Interior and Local Government (DILG)</span>
                <span class="hotline-number">513-5032</span>
              </li>
              <li class="hotline-item">
                <span class="office">Department of Social Welfare and Development (DSWD)</span>
                <span class="hotline-number">513-5041</span>
              </li>
              <li class="hotline-item">
                <span class="office">Public Cemetery</span>
                <span class="hotline-number">511-8499</span>
              </li>
              <li class="hotline-item">
                <span class="office">Serbisyong Arman Hall</span>
                <span class="hotline-number">513-5033</span>
              </li>
              <li class="hotline-item">
                <span class="office">Negosyo Center</span>
                <span class="hotline-number">513-5104</span>
              </li>
            </ul>
          </div>
        </div>
    </form>
    <uc:Footer runat="server" ID="Footer1" />
</body>
</html>