<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="TheSerifsAndScribes_MP.Services" %>

<asp:Content ID="ServicesHead" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="ServicesStyle.css" rel="stylesheet" />
    <title>Services</title>
</asp:Content>

<asp:Content ID="ServicesMain" ContentPlaceHolderID="MainContent" runat="server">
    <div id="bg-color">
            <div id="bg">
                <div id="bg-filter"></div>
            </div>
            <div id="content">
                <h1>"Empowering <span id="changecolor">businesses</span> through fast, transparent, and accessible permit services." </h1>
            </div>
        </div>
        <div id="rptadiv">
            <div class="flex-container">
                <div id="rptaimage">
                    <img src="..\Images\rptaphoto.png" />
                    <a id="rptabtn" href="https://binancityrealproperty.online/index.php/login?redirect=home" target="_blank">
                        Go to Page
                    </a>
                </div>
                <p1>
                    The Bi&ntilde;an City Business Permit is a mandatory document issued by the City Government of Bi&ntilde;an, Laguna, that grants legal authority for a business to operate within its jurisdiction. 
                    It confirms that the establishment has met all necessary requirements, including zoning clearance, fire safety inspection, sanitary permits, and payment of applicable local taxes and fees.
                </p1>
            </div>

        </div>

        <div id="bplsdiv">
            <div class="flex-container">
                <p2>The Bi&ntilde;an City Business Permit Online Portal is a digital platform provided by the City Government of Bi&ntilde;an, Laguna, that allows business owners to conveniently apply for, renew, and manage their business permits online. 
                    Through the system, users can submit application forms, upload required documents, pay applicable fees, and download their permits electronically, making the process faster, more efficient, and accessible without the need for in-person transactions.</p2>
                <div id="bplsimage">
                    <img src="..\Images\bploimage.png" />
                    <a id="bplsbtn" href="https://www.binancitybusinesspermit.online/" target="_blank">
                        Go to Page
                   </a>
                </div>
            </div>


        </div>
</asp:Content>
