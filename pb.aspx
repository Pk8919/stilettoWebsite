<%@ Page language="c#" Inherits="AspDotNetStorefront.pb" CodeFile="pb.aspx.cs" EnableTheming="false" StylesheetTheme="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Product Browser</title>
    <link rel="stylesheet" href="~/App_Themes/Skin_1/style.css" type="text/css">
    <script type="text/javascript" src="jscripts/formValidate.js"></script>
    <script type="text/javascript" src="jscripts/core.js"></script>
</head>
<body class="ProductBrowserBody" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" rightmargin="0" topmargin="0" bgcolor="#FFFFFF">
    <form id="aspnetForm" runat="server" >
        <asp:Literal ID="litOutput" runat="server"></asp:Literal>
        
        <%-- Let's place a dummy button here to generate the required standard asp.net javascripts --%>
        <div style="display:none;">
            <asp:Button ID="Button1" runat="server" Text="Button" UseSubmitBehavior="false" Visible="true" />
        </div>
    </form>
</body>

