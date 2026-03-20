<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TheSerifsAndScribes_MP.About" %>

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
    <title>About</title>
    
    <link href="Styles/HomeStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
    <link href="Styles/AboutStyle.css?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
    
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="bg-color">
        <div id="bg">
            <div id="bg-filter"></div>
        </div>
        <div id="about-content">
            <p class="kicker">GET TO KNOW OUR STORY</p>
            <h1>About <span id="changecolor">Biñan City</span></h1>

            <!-- BREADCRUMB -->
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">About Us</li>
                </ol>
            </nav>

        </div>
    </div>
        
    <!-- HISTORY -->
    <div id="historydiv" class="flex-container">
        <div id="history-img">
            <div class="img-large"></div>
            <div class="img-small"></div>
            <div class="card">
                <p>Founded</p>
                <h2>1571</h2>
            </div>
        </div>
        <div>
            <div class="flex-container">
                <img src="../Images/Assets/Icons/history-icon.png" />
                <p class="kicker">OUR HISTORY</p>
            </div>
            <h2 class="h2-style">From Agricultural Roots to <span id="changecolor">Industrial Excellence</span></h2>
            <p>Bi&ntilde;an City began as a small agricultural settlement along Laguna de Bay before Spanish colonization. It became a town in 1571 under Spanish rule, growing into an important farming and trading center during the colonial period. </p>
            <p>It is historically significant as the place associated with national hero Jose Rizal, who studied there in his youth. Over time, Biñan transformed from a rural pocket into a modern industrial and commercial hub, eventually achieving cityhood in 2010.</p>
        </div>
    </div>
        
    <!-- HERITAGE & CULTURE -->
    <div id="heritagediv" class="flex-container">
        <div>
            <div class="flex-container">
                image
                <p class="kicker">HERITAGE & CULTURE</p>
            </div>

                <h2 class="h2-style">A Legacy Preserved for Future Generations</h2>
                <p>Biñan City is rich in cultural and historical heritage shaped by its deep links to Philippine nationalism. As the ancestral home of Jose Rizal's family, the city preserves Spanish-era influences through old churches and traditional houses.
                </p>
                <p>Beyond historical sites, Biñan's heritage lives on in its traditions, like the famous Puto Latik Festival. These customs highlight the city's identity as a place of hard work, resilience, and pride in local culture.
                </p> 
        </div>
        <div id="heritage-img">
            <div class="img-large"></div>
            <div class="img-small"></div>
            <div class="img-small1"></div>
        </div>
    </div>
        
    <!-- FACTS -->
    <div id="factsdiv">
        <h2>Bi&ntilde;an City <span id="changecolor">Fast Facts</span></h2>
        <div id="line"></div>

        <div id="cards" class="flex-container">
            <div class="card">
                <div>
                    <img src="../Images/Assets/Icons/doc-green-icon.png" alt="logo" />
                </div>
                
                <h3>Rizal's First School</h3>
                <p class="">Jose Rizal studied under Maestro Justiniano Aquino Cruz in Biñan</p>
            </div>

            <div class="card">
                <div>
                    <img src="../Images/Assets/Icons/award-green-icon.png" alt="logo" />
                </div>
                <h3>Wealthy Roots</h3>
                <p class="">One of the wealthiest towns in Laguna during the Spanish era due to rice fields.</p>
            </div>

            <div class="card">
                <div>
                    <img src="../Images/Assets/Icons/cake-green-icon.png" alt="logo" />
                </div>
                <h3>Puto Bi&ntilde;an</h3>
                <p class="">Home to the world-famous Puto Biñan (steamed rice cakes).</p>
            </div>

            <div class="card">
                <div>
                    <img src="../Images/Assets/Icons/building-green-icon.png" alt="logo" />
                </div>
                <h3>Gateway Hub</h3>
                <p class="">A strategic industrial corridor between Metro Manila and the CALABARZON region.</p>
            </div>
        </div>
    </div>

    <!-- HOW TO GET TO BINAN CITY -->
    <div id="howtogettodiv">
        <h2>How to Get To Bi&ntilde;an City</h2>
        <div id="cards" class="flex-container">
            <div class="flex-container">
                <div>
                    logo
                    <h3>By Road</h3>
                    <p>Connected via major road networks like SLEX and the National Highway. Public buses and jeepneys are readily available.</p>
                </div>
            </div>
            <div class="flex-container">
                <div>
                    logo
                    <h3>By Train</h3>
                    <p>The PNR South Commuter line passes through the city, offering a scenic and efficient route from Manila.</p>
                </div>
            </div>
            <div class="flex-container">
                <div>
                    logo
                    <h3>By Air</h3>
                    <p>Conveniently located near NAIA, making it accessible for international and domestic travelers.</p>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
