<%@ Control Language="C#" AutoEventWireup="true" %>
<link href="Styles/NavigationBar.css" rel="stylesheet" />
<div class="menu-drawer">
  <button class="hamburger" type="button" aria-label="Toggle menu" onclick="toggleMenu()">
    <span></span>
    <span></span>
  </button>

  <div id="menuPanel" class="menu-panel is-hidden">
    <div class="menu-header">
      <span></span>
      <img class="menu-logo" src="/assets/img-menu/icon-binan.png" alt="Logo" />
    </div>

    <nav class="menu-links"><br /><br />
      <nav class="menu-links">
  <a class="menu-item" runat="server" href="~/About.aspx">
    <img src="/assets/img-menu/icon-about.png" class="menu-icon" alt="" />
    <span>ABOUT</span>
  </a>

  <a class="menu-item" runat="server" href="~/Transparency.aspx">
    <img src="/assets/img-menu/icon-transparency.png" class="menu-icon" alt="" />
    <span>TRANSPARENCY</span>
  </a>

  <a class="menu-item" runat="server" href="~/Services.aspx">
    <img src="/assets/img-menu/icon-services.png" class="menu-icon" alt="" />
    <span>SERVICES</span>
  </a>

  <a class="menu-item" runat="server" href="~/Invest.aspx">
    <img src="/assets/img-menu/icon-invest.png" class="menu-icon" alt="" />
    <span>INVEST</span>
  </a>

  <a class="menu-item" runat="server" href="~/Jobs.aspx">
    <img src="/assets/img-menu/icon-jobs.png" class="menu-icon" alt="" />
    <span>JOBS/CAREERS</span>
  </a>

  <a class="menu-item" runat="server" href="~/Contact.aspx">
    <img src="/assets/img-menu/icon-contact.png" class="menu-icon" alt="" />
    <span>CONTACT US</span>
  </a>

  <a class="menu-item" runat="server" href="~/FAQ.aspx">
    <img src="/assets/img-menu/icon-faq.png" class="menu-icon" alt="" />
    <span>FAQS</span>
  </a>
</nav>
    </nav>
  </div>
</div>


