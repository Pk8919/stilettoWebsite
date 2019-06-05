<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fedexmeterrequest.aspx.cs" Inherits="AspDotNetStorefrontAdmin.FedExMeterRequest" 
MasterPageFile="~/App_Templates/Admin_Default/AdminMaster.master" %>
<asp:Content runat="server" ContentPlaceHolderID="bodyContentPlaceholder">
		<table class="toppage" width="100%" cellspacing="0" cellpadding="0" border="0">
        <tbody>
        <tr>
<td valign="middle" align="left" style="height: 36px;">
			<h3><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.Form %>" /></H3>
			<TABLE BORDER="0" CELLSPACING="1" ID="table1">
				<TR>
					<TD COLSPAN="2">
						<H4><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.AccountInfo %>" />:</H4>
					</TD>
				</TR>
				<TR>
					<TD><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.AccountInfo %>" />:</TD>
					<TD>
						<ASP:TEXTBOX ID="AccountNumber" RUNAT="server"></ASP:TEXTBOX></TD>
				</TR>
				<TR>
					<TD><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.FedexServer %>" />:</TD>
					<TD>
						<ASP:TEXTBOX ID="FedExServer" RUNAT="server" WIDTH="272px">https://gateway.fedex.com/GatewayDC</ASP:TEXTBOX></TD>
				</TR>
				<TR>
					<TD COLSPAN="2">&nbsp;
						<ASP:LABEL ID="lblMeter" RUNAT="server" FONT-BOLD="True" FORECOLOR="Blue" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.MeterDisplay %>"></ASP:LABEL></TD>
				</TR>
				<TR>
					<TD COLSPAN="2">
						<H4><B><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.ContactInfo %>" /></B>:</H4>
					</TD>
				</TR>
				<TR>
					<TD><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.FullName %>" />:</TD>
					<TD>
						<ASP:TEXTBOX ID="FullName" RUNAT="server"></ASP:TEXTBOX></TD>
				</TR>
				<TR>
					<TD><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.CompanyName %>" />:</TD>
					<TD>
						<ASP:TEXTBOX ID="CompanyName" RUNAT="server"></ASP:TEXTBOX></TD>
				</TR>
				<TR>
					<TD><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.Department %>" />:</TD>
					<TD>
						<ASP:TEXTBOX ID="Department" RUNAT="server"></ASP:TEXTBOX></TD>
				</TR>
				<TR>
					<TD><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.Phone %>" />:
					</TD>
					<TD>
						<ASP:TEXTBOX ID="PhoneNumber" RUNAT="server"></ASP:TEXTBOX></TD>
				</TR>
				<TR>
					<TD><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.Pager %>" />:
					</TD>
					<TD>
						<ASP:TEXTBOX ID="PagerNumber" RUNAT="server"></ASP:TEXTBOX></TD>
				</TR>
				<TR>
					<TD><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.Fax %>" />:
					</TD>
					<TD>
						<ASP:TEXTBOX ID="FaxNumber" RUNAT="server"></ASP:TEXTBOX></TD>
				</TR>
				<TR>
					<TD><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.Email %>" />:
					</TD>
					<TD>
						<ASP:TEXTBOX ID="EMail" RUNAT="server"></ASP:TEXTBOX></TD>
				</TR>
				<TR>
					<TD>
						<asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.Address %>" />:
					</TD>
					<TD>
						<ASP:TEXTBOX ID="Address" RUNAT="server"></ASP:TEXTBOX></TD>
				</TR>
				<TR>
					<TD><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.City %>" />:
					</TD>
					<TD>
						<ASP:TEXTBOX ID="City" RUNAT="server"></ASP:TEXTBOX></TD>
				</TR>
				<TR>
					<TD><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.State %>" />:
					</TD>
					<TD>
						<ASP:TEXTBOX ID="State" RUNAT="server"></ASP:TEXTBOX>&nbsp;<asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.2Chars %>" /></TD>
				</TR>
				<TR>
					<TD><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.Zip %>" />:
					</TD>
					<TD>
						<ASP:TEXTBOX ID="Zip" RUNAT="server"></ASP:TEXTBOX></TD>
				</TR>
				<TR>
					<TD><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.Country %>" />:
					</TD>
					<TD>
						<ASP:TEXTBOX ID="Country" RUNAT="server"></ASP:TEXTBOX>&nbsp;<asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.fedexmeterrequest.2Chars %>" /></TD>
				</TR>
				<TR>
					<TD>&nbsp;</TD>
					<TD>&nbsp;</TD>
				</TR>
				<TR>
					<TD COLSPAN="2">
						<P ALIGN="center">
							<ASP:BUTTON ID="btnSubmitRequest" RUNAT="server" CssClass="normalButtons" TEXT="<%$Tokens:StringResource, admin.fedexmeterrequest.Submit %>" onclick="btnSubmitRequest_Click"></ASP:BUTTON></P>
					</TD>
				</TR>
			</TABLE>
			<P>
				&nbsp;<ASP:LITERAL ID="responseX" RUNAT="server" TEXT="<%$Tokens:StringResource, admin.fedexmeterrequest.ResponseDisplay %>"></ASP:LITERAL></P>
			<P>&nbsp;</P>
</asp:Content>