<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TheSerifsAndScribes_MP.Contact" %>

<asp:Content ID="ContactHead" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Contact</title>
    <link href="Styles/Contact.css" rel="stylesheet" type="text/css"/>
</asp:Content>

<asp:Content ID="ContactMain" ContentPlaceHolderID="MainContent" runat="server">
         <div id="contact-page">
            <div class="contact-section flex-container">
                <div class="contact-left">
                    <p class="kicker">CONNECT WITH US</p>
                    <h2 class="h2-style">We're here to <span>Serve You</span></h2>
                    <p class="subtitle contact-subtitle">
                        Have a question, concern, or feedback? Reach out to the City Government of Bi&ntilde;an. Our team is dedicated to providing prompt assistance.
                    </p>

                    <div class="contact-info-row">
                        <div class="contact-item">
                            <div class="contact-icon-box">
                                <img src="../Images/Assets/Icons/map-green-icon.png" alt="Location" class="contact-icon-placeholder"/>
                            </div>
                            <div class="contact-text">
                                <h3>Visit Us</h3>
                                <p>City Hall Compound, Zapote, Bi&ntilde;an City</p>
                            </div>
                        </div>

                        <div class="contact-item">
                            <div class="contact-icon-box">
                                <img src="../Images/Assets/Icons/clock-green-icon.png" alt="Clock" class="contact-icon-placeholder"/>
                            </div>
                            <div class="contact-text">
                                <h3>Office Hours</h3>
                                <p>Mon - Fri: 8:00 AM - 5:00 PM</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contact-right">
                    <div class="form-title">Send us a Message</div>

                    <div class="form-row">
                        <div class="form-group">
                            <asp:TextBox ID="fullname" runat="server" CssClass="contact-input" placeholder="Full Name" />
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="email" runat="server" CssClass="contact-input" TextMode="Email" placeholder="Email Address" />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:TextBox ID="subject" runat="server" CssClass="contact-input" placeholder="Subject" />
                    </div>

                    <div class="form-group">
                        <asp:TextBox ID="message" runat="server" CssClass="contact-input contact-textarea" TextMode="MultiLine" Rows="6" placeholder="How can we help you?" />
                    </div>

                    <div class="consent">
                        <asp:CheckBox ID="consent" runat="server" />
                        <label for="consent">I consent to the processing of my personal data (Privacy Policy)</label>
                    </div>

                    <div class="button-wrap">
                        <asp:Button ID="submitBtn" runat="server" CssClass="btn-submit" Text="Send Message" OnClick="submitBtn_Click" />
                    </div>
                </div>
            </div>
        </div>

        <div class="hotlines">
            <h3>Government <span>Hotlines</span></h3>
            <p class="hotlines-subtitle">
                Keep these numbers saved for immediate assistance and government-related inquiries.
            </p>
            <div class="hotline-list">
                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/emergency-green-icon.png" alt="Emergency Icon"/>
                        </div>
                        <span class="hotline-category">Emergency</span>
                    </div>
                    <h4>Disaster Risk Reduction</h4>
                    <p class="hotline-number">513-9111</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/emergency-green-icon.png" alt="Emergency Icon"/>
                        </div>
                        <span class="hotline-category">Emergency</span>
                    </div>
                    <h4>Bureau of Fire Protection</h4>
                    <p class="hotline-number">511-9111</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/emergency-green-icon.png" alt="Emergency Icon"/>
                        </div>
                        <span class="hotline-category">Emergency</span>
                    </div>
                    <h4>Philippine National Police</h4>
                    <p class="hotline-number">513-5111</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/stetoscope-green-icon.png" alt="Medical Icon"/>
                        </div>
                        <span class="hotline-category">Medical</span>
                    </div>
                    <h4>Ospital ng Bi&ntilde;an (ONB)</h4>
                    <p class="hotline-number">511-4119</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/emergency-green-icon.png" alt="Emergency Icon"/>
                        </div>
                        <span class="hotline-category">Security</span>
                    </div>
                    <h4>Public Order &amp; Safety</h4>
                    <p class="hotline-number">513-8888</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/admin-green-icon.png" alt="Admin Icon"/>
                        </div>
                        <span class="hotline-category">Admin</span>
                    </div>
                    <h4>Building Admin</h4>
                    <p class="hotline-number">513-5002</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/info-green-icon.png" alt="Information Icon"/>
                        </div>
                        <span class="hotline-category">General</span>
                    </div>
                    <h4>City Information Office</h4>
                    <p class="hotline-number">513-5028</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/building-green-icon.png" alt="Business Icon"/>
                        </div>
                        <span class="hotline-category">Business</span>
                    </div>
                    <h4>Negosyo Center</h4>
                    <p class="hotline-number">513-5104</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/jail-green-icon.png" alt="Jail Icon"/>
                        </div>
                        <span class="hotline-category">Emergency</span>
                    </div>
                    <h4>Bureau of Jail Management</h4>
                    <p class="hotline-number">511-6324</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/tree-green-icon.png" alt="Environment Icon"/>
                        </div>
                        <span class="hotline-category">Environment</span>
                    </div>
                    <h4>City Environment and Natural Resources Office</h4>
                    <p class="hotline-number">513-5096</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/building-green-icon.png" alt="Business Icon"/>
                        </div>
                        <span class="hotline-category">Business</span>
                    </div>
                    <h4>Business Permit and Licensing Office</h4>
                    <p class="hotline-number">513-5084</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/Election-green-icon.png" alt="Election Icon"/>
                        </div>
                        <span class="hotline-category">General</span>
                    </div>
                    <h4>Commission on Election</h4>
                    <p class="hotline-number">513-5100</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/gradcap-green-icon.png" alt="Education Icon"/>
                        </div>
                        <span class="hotline-category">Education</span>
                    </div>
                    <h4>Department of Education</h4>
                    <p class="hotline-number">511-6446</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/building-green-icon.png" alt="Business Icon"/>
                        </div>
                        <span class="hotline-category">General</span>
                    </div>
                    <h4>Department of the Interior and Local Government</h4>
                    <p class="hotline-number">513-5032</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/building-green-icon.png" alt="Business Icon"/>
                        </div>
                        <span class="hotline-category">General</span>
                    </div>
                    <h4>Department of Social Welfare and Development</h4>
                    <p class="hotline-number">513-5041</p>
                </div>

                <div class="hotline-card">
                    <div class="hotline-top">
                        <div class="hotline-icon-box">
                            <img src="../Images/Assets/Icons/Grave-green-icon.png" alt="Cemetery Icon"/>
                        </div>
                        <span class="hotline-category">General</span>
                    </div>
                    <h4>Public Cemetery</h4>
                    <p class="hotline-number">511-8499</p>
                </div>
            </div>
        </div>

        <div class="social-section">
            <div class="social-content">
                <div class="social-text">
                    <h3>Join the Conversation</h3>
                    <p>Follow our official social media channels for real-time updates.</p>
                </div>

                <div class="social-icons">
                    <a href="https://www.facebook.com/CIOBinan/" target="_blank" class="icon-box">
                        <img src="../Images/Assets/Icons/f-white-icon.png" alt="Facebook"/>
                    </a>

                    <a href="https://www.instagram.com/cityofbinan/" target="_blank" class="icon-box">
                        <img src="../Images/Assets/Icons/insta-white-icon.png" alt="Instagram"/>
                    </a>

                    <a href="https://x.com/CIO_BINAN" target="_blank" class="icon-box">
                        <img src="../Images/Assets/Icons/twt-white-icon.png" alt="Twitter"/>
                    </a>
                </div>
            </div>
        </div>

        <div class="map-section">
            <div class="map-container">
                <iframe 
                    src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1149.3495159631427!2d121.07942613549059!3d14.315176308457174!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397d9d7d402a00b%3A0x98d248e973356fb4!2sBi%C3%B1an%20City%20Hall!5e0!3m2!1sen!2sph!4v1773864686026!5m2!1sen!2sph"
                    allowfullscreen=""
                    loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
        </div>
</asp:Content>