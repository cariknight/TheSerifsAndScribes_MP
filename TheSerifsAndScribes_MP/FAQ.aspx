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
                <div class="faq-filters">
                    <button type="button" class="faq-filter active" data-filter="all">All</button>
                    <button type="button" class="faq-filter" data-filter="general">General</button>
                </div>

                <div class="faq-list">
                            <div class="faq-item" data-category="general">
                                <button type="button" class="faq-question">
                                    <span class="faq-question-left">
                                        <span class="faq-icon-box">
                                            <img src="../Images/Assets/Icons/doc-green-icon.png" alt="Document Icon"/>
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
                                        Please bring valid identification and the required processing fee. For online requests, you may also utilize the PSA Serbilis portal.
                                    </p>
                                </div>
                            </div>


                          <div class="faq-item" data-category="other">
                              <button type="button" class="faq-question">
                                  <span class="faq-question-left">
                                      <span class="faq-icon-box">
                                          <img src="../Images/Assets/Icons/building-green-icon.png" alt="Business Icon"/>
                                      </span>
                                      <span class="faq-question-text">
                                          Where do I apply for or renew a business permit?
                                      </span>
                                  </span>
                                  <span class="arrow"></span>
                              </button>
                              <div class="faq-answer">
                                  <p>
                                      Applications and renewals are handled by the Business Permit and Licensing Office (BPLO).
                                      Forms are available at City Hall or through the Services section of our website.
                                  </p>
                              </div>
                          </div>

                          <div class="faq-item" data-category="other">
                              <button type="button" class="faq-question">
                                  <span class="faq-question-left">
                                      <span class="faq-icon-box">
                                          <img src="../Images/Assets/Icons/emergency-green-icon.png" alt="Hotline Icon"/>
                                      </span>
                                      <span class="faq-question-text">
                                          What is the official emergency hotline number?
                                      </span>
                                  </span>
                                  <span class="arrow"></span>
                              </button>
                              <div class="faq-answer">
                                  <p>
                                      For urgent concerns, please call our official hotline: (049) 513-9111.
                                  </p>
                              </div>
                          </div>

                          <div class="faq-item"  data-category="general">
                              <button type="button" class="faq-question">
                                  <span class="faq-question-left">
                                      <span class="faq-icon-box">
                                          <img src="../Images/Assets/Icons/doc-green-icon.png" alt="Document Icon"/>
                                      </span>
                                      <span class="faq-question-text">
                                          How do I apply for government jobs in Biñan City?
                                      </span>
                                  </span>
                                  <span class="arrow"></span>
                              </button>
                              <div class="faq-answer">
                                  <p>
                                      Job openings are posted on the Jobs/Careers section of our website and at the City Human Resources Office.
                                      Applicants must submit their resume and required documents.
                                  </p>
                              </div>
                          </div>

                          <div class="faq-item" data-category="other">
                              <button type="button" class="faq-question">
                                  <span class="faq-question-left">
                                      <span class="faq-icon-box">
                                          <img src="../Images/Assets/Icons/stetoscope-green-icon.png" alt="Assistance Icon"/>
                                      </span>
                                      <span class="faq-question-text">
                                          How do I apply for medical, educational, or livelihood assistance?
                                      </span>
                                  </span>
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

                <div class="faq-support-section">
                    <div class="faq-support-card">
                        <h3>Still have questions?</h3>
                        <p>Please chat to our friendly team at the City Hall.</p>

                        <div class="faq-support-options">
                            <a href="tel:+63495135028" class="faq-support-option">
                                <div class="faq-support-icon-box">
                                    <img src="../Images/Assets/Icons/phone-filled-greenicon.png" data-hover="../Images/Assets/Icons/phone white icon.png" alt="Phone Icon" />
                                </div>
                                <h4>Call us</h4>
                                <span>(049) 513-5028</span>
                            </a>

                            <a href="mailto:info@binan.gov.ph" class="faq-support-option">
                                <div class="faq-support-icon-box">
                                    <img src="../Images/Assets/Icons/mail--filled-greenicon2.png"  data-hover="../Images/Assets/Icons/mail-white-icon.png" alt="Email Icon" />
                                </div>
                                <h4>Email Us</h4>
                                <span>info@binan.gov.ph</span>
                            </a>

                            <a href="Contact.aspx" class="faq-support-option">
                                <div class="faq-support-icon-box">
                                    <img src="../Images/Assets/Icons/msg-filled-green-icon.png"  data-hover="../Images/Assets/Icons/msg-white-icon.png" alt="Message Icon" />
                                </div>
                                <h4>Message Us</h4>
                                <span>Via Contact Form</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script src="Scripts/faq.js"></script>
</asp:Content>