<%@ Control Language="c#" AutoEventWireup="false" Inherits="AspDotNetStorefront.TemplateBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
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
(!XmlPackage Name="skin.adminalert.xml.config"!)
(!PAGEINFO!)
<div style="font-size: 11px;">
<asp:placeholder id="PageContent" runat="server"></asp:placeholder>
</div>
</body>
</html>
