<%@ Control Language="c#" AutoEventWireup="false" Inherits="AspDotNetStorefront.TemplateBase"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Assembly="AspDotNetStorefrontControls" Namespace="AspDotNetStorefrontControls" TagPrefix="aspdnsf" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    
    <%-- Leave the title empty, it will get populated at runtime --%>
    <title></title>    
    
    <asp:Literal ID="ltrCurrencyLocaleRobotsTag" runat="server" Text='<%$ Tokens:Currency_Locale_Robots_Tag %>' />
    
    <%-- Leave the description and keyword content empty, it will get populated at runtime --%>
    <meta name="description" content="">
    <meta name="keywords" content="">
    
    <%-- The skin ref will base on the current theme applied so we don't need to declare here which css file to use --%>
    <%--<link runat="server" rel="stylesheet" href="~/skins/skin_1/style.css" type="text/css">--%>

    <script type="text/javascript" src="jscripts/formvalidate.js"></script>

    <script type="text/javascript" src="jscripts/core.js"></script>

</head>
<body>

    <asp:Literal ID="ltrSkinAdminAlert" runat="server" Text='<%$ Tokens:XmlPackage,skin.adminalert.xml.config %>' />
    <asp:Literal ID="ltrPageInfo" runat="server" Text='<%$ Tokens:PageInfo %>' />
    
    <form id="Form" runat="server">
    <div id="wrapper">       
        <div id="login">
            <span id="userName"><asp:Literal ID="ltrUserName" runat="server" Text='<%$ Tokens:UserName %>' /></span><span id="loginText"><a href='<asp:Literal ID="Literal1" runat="server" Text="<%$ Tokens:SignInOut_Link %>" />'><asp:Literal ID="ltrSignInOutText" runat="server" Text='<%$ Tokens:SignInOut_Text %>' /></a></span>
        </div>
        <div id="header">
            <a id="logo" href="default.aspx" title="YourCompany.com"><b>YourCompany.com</b></a>
            <a class="wishlist" href="wishlist.aspx">Your Wishlist</a> <a class="cart" href="shoppingcart.aspx">
                Shopping Cart (<asp:Literal ID="ltrNumCartItems" runat="server" Text='<%$ Tokens:Num_Cart_Items %>' />)</a> <a class="contact" href="t-contact.aspx">Contact
                    Us</a> <a class="account" href="account.aspx">Your Account</a>
        </div>
        <div id="horizNav">
            <!-- TOP MENU -->
            <asp:Menu ID="aspnetMenu" runat="server" Orientation="Horizontal" StaticTopSeparatorImageUrl="~/images/tab-sep.gif"
                StaticEnableDefaultPopOutImage="False" StaticDisplayLevels="2" MaximumDynamicDisplayLevels="<%$ Tokens:AppConfigUSInt, MaxMenuLevel %>" >
                <StaticSelectedStyle CssClass="aspnetMenu_StaticSelectedStyle" />
                <LevelMenuItemStyles>
                    <asp:MenuItemStyle CssClass="aspnetMenu_Level1" Font-Underline="False" />
                    <asp:MenuItemStyle CssClass="aspnetMenu_Level2" Font-Underline="False" />
                </LevelMenuItemStyles>
                <StaticMenuItemStyle CssClass="aspnetMenu_StaticMenuItemStyle" />
                <DynamicSelectedStyle CssClass="aspnetMenu_DynamicSelectedStyle" />
                <DynamicMenuItemStyle CssClass="aspnetMenu_DynamicMenuItemStyle" />
                <%--
                        These 2 styles below can't be added declaratively, it will be added later on the script
                        But needs to follow the naming convention {MenuId}_WhatEverStyle
                    --%>
                <%--<DynamicHoverStyle CssClass="aspnetMenu_DynamicHoverStyle" />--%>
                <%--<StaticHoverStyle  CssClass="aspnetMenu_StaticHoverStyle" />--%>
            </asp:Menu>
            <!-- END TOP MENU -->
        </div>
        <div id="horizNav2">
            <a href="#">
                <asp:Image ID="imgLiveHelp" runat="server" SkinID="LiveChat" class="liveHelp"  AlternateText="Click Here to Chat With a Representative"/>                                                
            </a>
            <aspdnsf:Search ID="ctrlSearch" runat="server" CssClass="search" 
                SearchButtonCaption="Go" 
                SearchCaption="<%$ Tokens: StringResource, common.cs.82 %>" 
                SearchTextMinLength="<%$ Tokens:AppConfigUSInt, MinSearchStringLength %>" 
                SearchTextMinLengthInvalidErrorMessage="<%$ Tokens: StringResource, search.aspx.2 %>" 
                ValidateInputLength="true" 
                ShowValidationMessageBox="true" 
                ShowValidationSummary="false"  />
            <ul class="tameHoriz">
                <li><a href="account.aspx">Track Your Order</a><span class="pipe">|</span></li>
                <li><a href="t-returns.aspx">Returns</a><span class="pipe">|</span></li>
                <li><a href="t-shipping.aspx">Shipping Policy</a><span class="pipe">|</span></li>
                <li><a href="t-faq.aspx">FAQ</a><span class="pipe">|</span></li>
                <li><span>1-800-555-1234</span></li>
            </ul>
        </div>
        <div id="bodyWrapper">
            <!-- <div id="miniCart">You have (!NUM_CART_ITEMS!) item(s) in your <a class="username" href="shoppingcart.aspx">
                    (!CARTPROMPT!)</a></div> -->
            <div id="ML">
               <aspdnsf:LanguageSelectList ID="ctrlLocaleList"  runat="server" Caption="Language:" CssClass="MLSettings" />                 
                <aspdnsf:CurrencySelectList ID="ctrlCurrencyList"  runat="server" Caption="Currency:" CssClass="MLSettings" />
                <aspdnsf:VATSelectList ID="ctrlVatList"  runat="server" Caption="VAT Mode:" CssClass="MLSettings" />
            </div>
            <div id="breadcrumb">
                <%-- The ID litSectionTitle is required --%>
                Now In: <asp:Literal ID="litSectionTitle" runat="server" Text='' />
            </div>
            <div id="leftWrap">
                <div class="navHeader">
                    Browse
                    <asp:Literal ID="ltrManufacturePrompt" runat="server" Text='<%$ Tokens:StringResource,AppConfig.ManufacturerPromptPlural %>' /></div>
                <div class="leftNav" id="manufacturers">
                    <asp:Literal ID="ltrManufacturers" runat="server" Text='<%$ Tokens:XmlPackage,rev.manufacturers %>' />
                </div>
                <div class="navHeader">
                    Browse
                    <asp:Literal ID="ltrCategoryPromp" runat="server" Text='<%$ Tokens:StringResource,AppConfig.CategoryPromptPlural %>' /></div>
                <div class="leftNav" id="categories">
                    <asp:Literal ID="ltrCategories" runat="server" Text='<%$ Tokens:XmlPackage,rev.categories %>' />
                </div>
                <div class="navHeader">
                    Browse
                    <asp:Literal ID="ltrSectionPrompt" runat="server" Text='<%$ Tokens:StringResource,AppConfig.SectionPromptPlural %>' /></div>
                <div class="leftNav" id="departments">
                    <asp:Literal ID="ltrDepartments" runat="server" Text='<%$ Tokens:XmlPackage,rev.departments %>' />
                </div>
                <div class="navHeader">
                    Help &amp; Info</div>
                <div class="leftNav" id="helpbox">
                    <asp:Literal ID="ltrHelpBox" runat="server" Text='<%$ Tokens:Topic,helpbox %>' /></div>
            </div>
            <div id="content">
                <!-- CONTENTS START -->
                <asp:PlaceHolder ID="PageContent" runat="server"></asp:PlaceHolder>
                <!-- CONTENTS END -->
            </div>
        </div>
        <div id="footer">
            <div id="footerWrap">
                <ul class="tameHoriz">
                    <li><a href="t-about.aspx">About YourCompany.com</a> |</li>
                    <li><a href="t-returns.aspx">Returns</a> |</li>
                    <li><a href="t-faq.aspx">FAQ</a> |</li>
                    <li><a href="t-contact.aspx">Contact Us</a></li>
                </ul>
                <ul class="tameHoriz">                    
                    <li><a href="sitemap2.aspx">Site Map</a> |</li>
                    <li><a href="t-privacy.aspx">Privacy Policy</a> |</li>
                    <li><a href="t-security.aspx">Security</a></li>
                </ul>
                <br />
                <ul class="tame">
                    <li>&copy; YourCompany.com 2009. All Rights Reserved.</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- wrapper -->
    </form>
    <noscript>
        Powered by <a href="http://www.aspdotnetstorefront.com" target="_blank">shopping cart</a></noscript>
</body>
</html>
