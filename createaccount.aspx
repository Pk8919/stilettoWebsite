<%@ Page ClientTarget="UpLevel" Language="c#" Inherits="AspDotNetStorefront.createaccount"
    CodeFile="createaccount.aspx.cs" MaintainScrollPositionOnPostback="true" MasterPageFile="~/App_Templates/Skin_1/template.master" %>

<%@ Register TagPrefix="aspdnsf" TagName="Topic" Src="~/Controls/TopicControl.ascx" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PageContent">
    <asp:Panel ID="pnlContent" runat="server">
        <aspdnsf:Topic runat="server" ID="CreateAccountPageHeader" TopicName="CreateAccountPageHeader" />
        <asp:Panel ID="pnlCheckoutImage" runat="server" HorizontalAlign="Center" Visible="false">
            <asp:ImageMap ID="CheckoutImage" HotSpotMode="Navigate" runat="server">
                <asp:RectangleHotSpot Top="0" Left="0" Right="87" Bottom="54" HotSpotMode="Navigate"
                    NavigateUrl="~/shoppingcart.aspx?resetlinkback=1" />
            </asp:ImageMap>
            <br />
        </asp:Panel>
        <asp:Panel ID="pnlErrorMsg" runat="Server" HorizontalAlign="Left" Style="margin-left: 20px;">
            <asp:Label ID="ErrorMsgLabel" runat="server" Font-Bold="true" ForeColor="red"></asp:Label>
        </asp:Panel>
        
        <asp:ValidationSummary ID="valSummary" DisplayMode="List" runat="server" ShowMessageBox="true"
            ShowSummary="false" ValidationGroup="registration" ForeColor="red" Font-Bold="true" />
        <asp:Literal ID="Signin" runat="server" Mode="PassThrough"></asp:Literal>
        
		<asp:Panel ID="pnlCBAAddressWidget" runat="server" Visible="false">
			<div style="float: left;">
				<asp:Literal ID="litCBAAddressWidget" runat="server" />
			</div>
			<div id="CBAAddressWidgetInstruction" style="float: left; padding: 10px; font-weight: bolder; width: 300px;">
				<asp:Literal ID="litCBAAddressWidgetInstruction" runat="server" />
			</div>
			<br style="clear: both;" />
		</asp:Panel>

		<asp:Panel ID="pnlAccountInfo" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" border="0" style="border-style: solid;
                border-width: 0px; border-color: #444444">
                <tr>
                    <td align="left" valign="top">
                        <asp:Image runat="server" ID="accountinfo_gif" /><br />
                        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-style: solid;
                            border-width: 1px; border-color: #444444;">
                            <tr>
                                <td align="left" valign="top">
                                    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="100%" colspan="2">
                                                <b>
                                                    <asp:Label ID="accountaspx12" runat="server" Text="<%$ Tokens:StringResource,account.aspx.12 %>"></asp:Label></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100%" colspan="2">
                                                <hr />
                                            </td>
                                        </tr>
                                        <aspdnsf:Account ID="ctrlAccount" runat="server" 
                                            EmailCaption="<%$ Tokens:StringResource, createaccount.aspx.15 %>"
                                            FirstNameCaption="<%$ Tokens:StringResource, createaccount.aspx.13 %>" 
                                            LastNameCaption="<%$ Tokens:StringResource, createaccount.aspx.14 %>"
                                            PasswordCaption="<%$ Tokens:StringResource, createaccount.aspx.18 %>" 
                                            PasswordConfirmCaption="<%$ Tokens:StringResource, createaccount.aspx.21 %>"
                                            PhoneCaption="<%$ Tokens:StringResource, createaccount.aspx.23 %>" 
                                            SaveCCCaption="<%$ Tokens:StringResource, account.aspx.65 %>"
                                            OKToEmailCaption="<%$ Tokens:StringResource, createaccount.aspx.26 %>" 
                                            OKToEmailNoCaption="<%$ Tokens:StringResource, createaccount.aspx.28 %>"
                                            OKToEmailYesCaption="<%$ Tokens:StringResource, createaccount.aspx.27 %>" 
                                            Over13Caption="<%$ Tokens:StringResource, createaccount.aspx.78 %>"
                                            VATRegistrationIDCaption="<%$ Tokens:StringResource, account.aspx.71 %>" 
                                            PasswordNote="<%$ Tokens:StringResource, account.aspx.19 %>"
                                            OKToEmailNote="<%$ Tokens:StringResource, createaccount.aspx.29 %>" 
                                            SaveCCNote="<%$ Tokens:StringResource, account.aspx.70 %>"
                                            SecurityCodeCaption="<%$ Tokens:StringResource, signin.aspx.21 %>" 
                                            FirstNameReqFieldErrorMessage="<%$ Tokens:StringResource, createaccount.aspx.82 %>"
                                            LastNameReqFieldErrorMessage="<%$ Tokens:StringResource, createaccount.aspx.83 %>"
                                            EmailReqFieldErrorMessage="<%$ Tokens:StringResource, createaccount.aspx.16 %>"
                                            PhoneReqFieldErrorMessage="<%$ Tokens:StringResource, createaccount.aspx.24 %>"
                                            SecurityCodeReqFieldErrorMessage="<%$ Tokens:StringResource, signin.aspx.20 %>"
                                            EmailRegExErrorMessage="<%$ Tokens:StringResource, createaccount.aspx.17 %>"
                                            PasswordReqFieldErrorMessage="<%$ Tokens:StringResource, createaccount.aspx.20 %>"
                                            RequireOver13ErrorMessage="<%$ Tokens:StringResource, Over13OnCreateAccount %>"
                                            EmailRegEx="^[a-zA-Z0-9][-\w\.\+]*@([a-zA-Z0-9][\w\-]*\.)+[a-zA-Z]{2,4}$" 
                                            EmailRegExValGrp="registration"
                                            EmailReqFieldValGrp="registration" 
                                            FirstNameReqFieldValGrp="registration" 
                                            LastNameReqFieldValGrp="registration"
                                            Over13ValGrp="registration" 
                                            PasswordValidateValGrp="registration" 
                                            PhoneReqFieldValGrp="registration"
                                            ShowSecurityCode="true" 
                                            ShowPasswordReqVal="true" 
                                            ShowSaveCC="false"  
                                            ShowValidatorsInline="false" 
                                            ShowVATRegistrationID="<%$ Tokens:AppConfigBool, Vat.Enabled %>"
                                            ShowOver13="<%$ Tokens:AppConfigBool, RequireOver13Checked %>"
                                            DisablePasswordAutocomplete="<%$ Tokens:AppConfigBool, DisablePasswordAutocomplete %>"
                                             />
                                    </table>
                                </td> 
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <asp:Panel ID="pnlSkipReg" runat="server" Visible="false" HorizontalAlign="Left">
            <asp:Literal ID="createaccount_aspx_15_2" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.15 %>"></asp:Literal><asp:TextBox
                ID="txtSkipRegEmail" runat="server" Columns="30" MaxLength="100" ValidationGroup="registration"></asp:TextBox><small><asp:Literal
                    ID="Literal4" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.81 %>"></asp:Literal></small><asp:RequiredFieldValidator
                        ID="valReqSkipRegEmail" runat="server" ControlToValidate="txtSkipRegEmail" Enabled="false"
                        Display="none" ValidationGroup="registration" EnableClientScript="true" ErrorMessage="<%$ Tokens:StringResource,createaccount.aspx.81 %>"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                            ID="valRegExSkipRegEmail" ControlToValidate="txtSkipRegEmail" Display="None"
                            runat="SERVER" ValidationGroup="registration" EnableClientScript="true" ValidationExpression="^[a-zA-Z0-9][-\w\.\+]*@([a-zA-Z0-9][\w\-]*\.)+[a-zA-Z]{2,4}$"></asp:RegularExpressionValidator><br />
            <asp:Literal ID="Literal2" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.78 %>"></asp:Literal><asp:CheckBox
                ID="SkipRegOver13" Visible="true" runat="server" CausesValidation="True" ValidationGroup="registration" />
        </asp:Panel>

        <asp:Panel ID="pnlBillingInfo" runat="server">
            <asp:Table ID="tblBillingInfo" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                        <asp:Image runat="server" ID="billinginfo_gif" /><br />
                        <asp:Table ID="tblBillingInfoBox" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                    <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                        <tr>
                                            <td width="100%" colspan="2">
                                                <b>
                                                    <asp:Literal ID="createaccountaspx30" Mode="PassThrough" runat="Server"></asp:Literal>
                                                    <asp:CheckBox ID="BillingEqualsAccount" runat="server" />
                                                    <asp:Literal ID="createaccountaspx31" Mode="PassThrough" runat="server"></asp:Literal></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100%" colspan="2">
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <aspdnsf:AddressControl ID="ctrlBillingAddress" runat="server" 
                                                    OnSelectedCountryChanged="ctrlAddress_SelectedCountryChanged"
                                                    NickNameCaption='<%$ Tokens:StringResource, address.cs.49 %>' 
                                                    FirstNameCaption='<%$ Tokens:StringResource, address.cs.2 %>'
                                                    LastNameCaption='<%$ Tokens:StringResource, address.cs.3 %>' 
                                                    PhoneNumberCaption='<%$ Tokens:StringResource, address.cs.4 %>'
                                                    CompanyCaption='<%$ Tokens:StringResource, address.cs.5 %>' 
                                                    ResidenceTypeCaption='<%$ Tokens:StringResource, address.cs.58 %>'
                                                    Address1Caption='<%$ Tokens:StringResource, address.cs.6 %>' 
                                                    Address2Caption='<%$ Tokens:StringResource, address.cs.7 %>'
                                                    SuiteCaption='<%$ Tokens:StringResource, address.cs.8 %>' 
                                                    CityCaption='<%$ Tokens:StringResource, address.cs.9 %>'
                                                    StateCaption='<%$ Tokens:StringResource, address.cs.10 %>' 
                                                    CountryCaption='<%$ Tokens:StringResource, address.cs.53 %>'
                                                    ZipCaption='<%$ Tokens:StringResource, address.cs.12 %>'                                                   
                                                    Width="100%" 
                                                    Visible="true"
                                                    AddressType="Billing"
                                                    FirstNameRequiredErrorMessage="FirstName Required!" 
                                                    LastNameRequiredErrorMessage="LastName Required!"
                                                    CityRequiredErrorMessage="City Required!" 
                                                    PhoneRequiredErrorMessage="Phone Number Required!"
                                                    Address1RequiredErrorMessage="Address1 Required!"       
                                                    Address1ValidationErrorMessage="<%$ Tokens:StringResource, createaccount_process.aspx.3 %>"                                                                                                 
                                                    FirstNameReqFieldValGrp="registration" 
                                                    LastNameReqFieldValGrp="registration"
                                                    PhoneNumberReqFieldValGrp="registration" 
                                                    CityReqFieldValGrp="registration" 
                                                    Address1ReqFieldValGrp="registration"
                                                    ZipCodeCustomValGrp="registration"
                                                    Address1CustomValGrp="registration"                                                    
                                                    ShowValidatorsInline="true" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:Panel>
        <br />
        <asp:Panel ID="pnlShippingInfo" runat="server" Visible="false">
            <asp:Table ID="tblShippingInfo" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                        <asp:Image runat="server" ID="shippinginfo_gif" /><br />
                        <asp:Table ID="tblShippingInfoBox" CellSpacing="2" CellPadding="2" Width="100%" runat="server">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="100%" colspan="2">
                                                <asp:Button ID="btnShppingEqBilling" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.53 %>"
                                                    OnClick="btnShppingEqBilling_Click" ValidationGroup="none" />
                                            </td>
                                        </tr>
                                    </table>
                                    <hr />
                                    <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="center">
                                                <aspdnsf:AddressControl ID="ctrlShippingAddress" runat="server" 
                                                    OnSelectedCountryChanged="ctrlAddress_SelectedCountryChanged"
                                                    NickNameCaption='<%$ Tokens:StringResource, address.cs.49 %>' 
                                                    FirstNameCaption='<%$ Tokens:StringResource, address.cs.2 %>'
                                                    LastNameCaption='<%$ Tokens:StringResource, address.cs.3 %>' 
                                                    PhoneNumberCaption='<%$ Tokens:StringResource, address.cs.4 %>'
                                                    CompanyCaption='<%$ Tokens:StringResource, address.cs.5 %>' 
                                                    ResidenceTypeCaption='<%$ Tokens:StringResource, address.cs.58 %>'
                                                    Address1Caption='<%$ Tokens:StringResource, address.cs.6 %>' 
                                                    Address2Caption='<%$ Tokens:StringResource, address.cs.7 %>'
                                                    SuiteCaption='<%$ Tokens:StringResource, address.cs.8 %>' 
                                                    CityCaption='<%$ Tokens:StringResource, address.cs.9 %>'
                                                    StateCaption='<%$ Tokens:StringResource, address.cs.10 %>' 
                                                    CountryCaption='<%$ Tokens:StringResource, address.cs.53 %>'
                                                    ZipCaption='<%$ Tokens:StringResource, address.cs.12 %>'
                                                    Width="100%" Visible="true"
                                                    AddressType="Shipping"
                                                    FirstNameRequiredErrorMessage="FirstName Required!" 
                                                    LastNameRequiredErrorMessage="LastName Required!"
                                                    CityRequiredErrorMessage="City Required!" 
                                                    PhoneRequiredErrorMessage="Phone Number Required!"
                                                    Address1RequiredErrorMessage="Address1 Required!"
                                                    Address1ValidationErrorMessage="<%$ Tokens:StringResource, createaccount_process.aspx.3 %>"                                                     
                                                    FirstNameReqFieldValGrp="registration" 
                                                    LastNameReqFieldValGrp="registration"
                                                    PhoneNumberReqFieldValGrp="registration" 
                                                    CityReqFieldValGrp="registration" 
                                                    Address1ReqFieldValGrp="registration"
                                                    ZipCodeCustomValGrp="registration"
                                                    Address1CustomValGrp="registration"                                                    
                                                    ShowValidatorsInline="true" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:Panel>
        <br />
        <div><table width="100%" ><tr><td align="center">
            <asp:Button runat="server" ID="btnContinueCheckout" 
			CssClass="ContinueCheckoutButton" Text="<%$ Tokens:StringResource,createaccount.aspx.76 %>" 
			ValidationGroup="registration" OnClick="btnContinueCheckout_Click" />
        </td></tr></table></div>
    </asp:Panel>
</asp:Content>
