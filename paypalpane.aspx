<%@ Page Language="C#" AutoEventWireup="true" Inherits="AspDotNetStorefront.paypalpane"  StylesheetTheme="" CodeFile="paypalpane.aspx.cs" %>
<html>
<head>
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style2
        {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
        }
    </style>
</head>
<body>
<span lang="en-us"><br />

<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<asp:Panel ID="Panel1" runat="server">
    <div class="style1">
        <span lang="en-us"><span class="style2">Redirecting to Paypal...<br />
        </span><br />
        </span>
        <img src="App_Themes/skin_1/images/loadingshipping.gif" alt="" />
    </div>
</asp:Panel>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
</span>
<br />
<asp:Literal ID="PayPalForm" runat="server" Mode="passThrough"></asp:Literal>
</body>
</html>



