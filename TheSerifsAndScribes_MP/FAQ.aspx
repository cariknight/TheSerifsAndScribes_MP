<%@ Page Title="FAQs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="TheSerifsAndScribes_MP.FAQ" %>

<asp:Content ID="FaqHead" ContentPlaceHolderID="HeadContent" runat="server">
    <title>FAQs</title>
    <link href="Styles/faq.css" rel="stylesheet" type="text/css"/>
</asp:Content>

<asp:Content ID="FaqMain" ContentPlaceHolderID="MainContent" runat="server">
    <div id="faq-page">
        <div class="faq-hero">
            <div class="faq-hero-content">
                <p class="kicker">SUPPORT CENTER</p>
                <h2 class="faq-title">Frequently Asked <span>Questions</span></h2>
            </div>
        </div>

        <div class="faq-content">
                <div class="faq-list">
                        <div class="faq-item">
                            <button type="button" class="faq-question">
                                <span class="faq-question-left">
                                    <span class="faq-icon-box">
                                        <img src="../Images/Assets/Icons/building-green-icon.png" alt="Business Icon"/>
                                    </span>
                                    <span class="faq-question-text">
                                        How can I request a copy of my birth, marriage, or death certificate?
                                    </span>
                                </span>
                                <span class="arrow"></span>
                            </button>

                            <div class="faq-answer">
                                <p>
                                    You may request civil registry documents at the City Civil Registrar's Office in Bi&ntilde;an City Hall.
                                    Please bring valid identification and the required processing fee.
                                </p>
                            </div>
                        </div>

                    <div class="faq-item">
                        <button type="button" class="faq-question">
                            <span>Where do I apply for or renew a business permit?</span>
                            <span class="arrow"></span>
                        </button>
                        <div class="faq-answer">
                            <p>
                                Applications and renewals are handled by the Business Permit and Licensing Office (BPLO).
                                Forms are available at City Hall or through the Services section of our website.
                            </p>
                        </div>
                    </div>

                    <div class="faq-item">
                        <button type="button" class="faq-question">
                            <span>What is the official emergency hotline number?</span>
                            <span class="arrow"></span>
                        </button>
                        <div class="faq-answer">
                            <p>
                                For urgent concerns, please call our official hotline: (049) 513-9111.
                            </p>
                        </div>
                    </div>

                    <div class="faq-item">
                        <button type="button" class="faq-question">
                            <span>How do I apply for government jobs in Bi&ntilde;an City?</span>
                            <span class="arrow"></span>
                        </button>
                        <div class="faq-answer">
                            <p>
                                Job openings are posted on the Jobs/Careers section of our website and at the City Human Resources Office.
                                Applicants must submit their resume and required documents.
                            </p>
                        </div>
                    </div>

                    <div class="faq-item">
                        <button type="button" class="faq-question">
                            <span>How do I apply for medical, educational, or livelihood assistance?</span>
                            <span class="arrow"></span>
                        </button>
                        <div class="faq-answer">
                            <p>
                                Assistance programs are managed by the City Social Welfare and Development Office (CSWDO).
                                Please visit their office or contact them through the hotline for requirements and application procedures.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="faq-container">
                    <div class="faq-intro-card">
                        <h3>Still have questions?</h3>
                        <p>
                            Please chat to our friendly team at the City Hall.
                        </p>
                        <a href="Contact.aspx" class="faq-contact-link">Go to Contact Page</a>
                    </div>
                </div>
            </div>
        </div>
    <script src="Scripts/faq.js"></script>
</asp:Content>