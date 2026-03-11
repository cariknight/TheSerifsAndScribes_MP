<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TheSerifsAndScribes_MP.Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact</title>
    <link href="~/Styles/contact.css" rel="stylesheet" type="text/css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Akatab:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>

<body>
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

        <div class="contact-details">
            <div class="detail">
                <div class="detail-title address">
                    <span class="label">Address</span>
                </div>
                <p>City Hall Compound, San Pablo St., Barangay Zapote, City of Biñan, Laguna</p>
            </div>

            <div class="detail">
                <div class="detail-title phone">
                    <span class="label">Phone</span>
                </div>
                <p>(049) 513-5028</p>
            </div>

            <div class="detail">
                <div class="detail-title email">
                    <span class="label">Email</span>
                </div>
                <p>serbisyongarman@binan.gov.ph</p>
            </div>
        </div>



        <div class="hotlines">
            <h3>Hotlines</h3>
            <ul>
                <li><strong>City Disaster Risk Reduction Management Office:</strong> 513-9111</li>
                <li><strong>Bureau of Fire and Protection Department (BFP):</strong> 511-9111</li>
                <li><strong>Philippine National Police (PNP):</strong> 513-5111</li>
                <li><strong>Bureau of Jail Management and Penology (BJMP):</strong> 511-6234</li>
                <li><strong>Public Order and Safety Office (POSO):</strong> 513-8888</li>
                <li><strong>City Environment and Natural Resources Office (CENRO):</strong> 513-5096</li>
                <li><strong>Ospital ng Biñan (ONB):</strong> 511-4119</li>
                <li><strong>Building Admin:</strong> 513-5002</li>
                <li><strong>City Information Office:</strong> 513-5028</li>
                <li><strong>Business Permit and Licensing Office (BPLO):</strong> 513-5084</li>
                <li><strong>Commission on Election (COMELEC):</strong> 513-5100</li>
                <li><strong>Department of Education (DepEd):</strong> 511-6446</li>
                <li><strong>Department of the Interior and Local Government (DILG):</strong> 513-5032</li>
                <li><strong>Department of Social Welfare and Development (DSWD):</strong> 513-5041</li>
                <li><strong>Public Cemetery:</strong> 511-8499</li>
                <li><strong>Serbisyong Arman Hall:</strong> 513-5033</li>
                <li><strong>Negosyo Center:</strong> 513-5104</li>
            </ul>
        </div>
    </form>
</body>
</html>
