<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderShipment1.aspx.cs" Inherits="AspDotNetStorefrontAdmin.OrderShipment1" MaintainScrollPositionOnPostback="true" MasterPageFile="~/App_Templates/Admin_Default/AdminMaster.master" %>
<asp:Content runat="server" ContentPlaceHolderID="bodyContentPlaceholder">
<script type="text/javascript">
    function setFormPostDataForImport() {
        var form = document.getElementById("aspnetForm");
        form.action = "ordershipment2.aspx";
        var input = form.elements["pricingimport"];
        form.enctype = "multipart/form-data";
        form.encoding = "multipart/form-data";
        form.submit();
    }
</script>
<asp:Literal ID="ltContent" runat="server"/>
</asp:Content>
