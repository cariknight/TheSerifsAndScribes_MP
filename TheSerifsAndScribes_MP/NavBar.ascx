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
      <a class="menu-item" href="#"><img src="/assets/img-menu/icon-about.png" class="menu-icon" alt="" /><span>ABOUT</span></a><br />
      <a class="menu-item" href="#"><img src="/assets/img-menu/icon-transparency.png" class="menu-icon" alt="" /><span>TRANSPARENCY</span></a><br />
      <a class="menu-item" href="#"><img src="/assets/img-menu/icon-services.png" class="menu-icon" alt="" /><span>SERVICES</span></a><br />
      <a class="menu-item" href="#"><img src="/assets/img-menu/icon-invest.png" class="menu-icon" alt="" /><span>INVEST</span></a><br />
      <a class="menu-item" href="#"><img src="/assets/img-menu/icon-jobs.png" class="menu-icon" alt="" /><span>JOBS/CAREERS</span></a><br />
      <a class="menu-item" href="#"><img src="/assets/img-menu/icon-contact.png" class="menu-icon" alt="" /><span>CONTACT US</span></a><br />
      <a class="menu-item" href="#"><img src="/assets/img-menu/icon-faq.png" class="menu-icon" alt="" /><span>FAQS</span></a><br />
    </nav>
  </div>
</div>


