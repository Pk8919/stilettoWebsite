<%@ Page Language="c#" Inherits="AspDotNetStorefront.checkout1" CodeFile="checkout1.aspx.cs" MasterPageFile="~/App_Templates/Skin_1/template.master" %>

<%@ Register TagPrefix="aspdnsf" TagName="Topic" Src="~/controls/TopicControl.ascx" %>
<%@ Register TagPrefix="aspdnsf" TagName="BuySafeKicker" Src="~/controls/BuySafeKicker.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PageContent">
    <asp:Literal ID="litStyle" runat="server" />
    <asp:Panel ID="pnlContent" runat="server">
        <asp:Literal ID="CheckoutValidationScript" runat="server" Mode="PassThrough"></asp:Literal>
        <asp:Panel ID="pnlMain" runat="server" HorizontalAlign="left" Visible="true">
            <aspdnsf:Topic runat="server" ID="Checkout1PageHeader" TopicName="Checkout1PageHeader" />
            <asp:Panel ID="pnlErrorMsg" runat="Server" HorizontalAlign="Left" Style="margin-left: 20px;">
                <asp:Label ID="ErrorMsgLabel" runat="server" Font-Bold="true" ForeColor="red"></asp:Label>
            </asp:Panel>
            <asp:ValidationSummary ID="valSummary" DisplayMode="BulletList" runat="server" ShowMessageBox="False"
                ShowSummary="false" ValidationGroup="Checkout1" ForeColor="red" Font-Bold="true" />
            <asp:Panel ID="Panel1" runat="server" Visible="false">
                <asp:Label ID="Label1" Style="font-weight: bold; color: Red;" runat="server"></asp:Label>
                <br />
            </asp:Panel>
            <asp:ValidationSummary DisplayMode="List" ID="valsumCreditCard" ShowMessageBox="false"
                runat="server" ShowSummary="true" ValidationGroup="creditcard" ForeColor="red"
                Font-Bold="true" />
            <asp:ValidationSummary DisplayMode="List" ID="valsumEcheck" ShowMessageBox="false"
                runat="server" ShowSummary="true" ValidationGroup="echeck" ForeColor="red" Font-Bold="true" />
            <asp:Panel ID="pnlCCTypeErrorMsg" runat="server" Visible="false">
                <asp:Label ID="CCTypeErrorMsgLabel" Style="font-weight: bold; color: Red;" runat="server"
                    Text="<%$ Tokens:StringResource, address.cs.19 %>">
            <br />
                </asp:Label>
            </asp:Panel>
            <asp:Panel ID="pnlCCExpDtErrorMsg" runat="server" Visible="false">
                <asp:Label ID="CCExpDtErrorMsg" Style="font-weight: bold; color: Red;" runat="server"
                    Text="<%$ Tokens:StringResource, checkoutcard_process.aspx.2 %>">
            <br />
                </asp:Label>
            </asp:Panel>
            <asp:Panel ID="pnlAccountInfo" runat="server" Visible="false">
                <asp:Table ID="tblAccount" CellSpacing="0" CellPadding="0" Width="100%" runat="server">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                            <asp:Image runat="server" ID="accountinfo_gif" />&nbsp;&nbsp;&nbsp;<asp:Label ID="Signin"
                                runat="server" ForeColor="red"></asp:Label><br />
                            <asp:Table ID="tblAccountBox" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td width="100%" colspan="2">
                                                    <asp:Label ID="Checkout1aspx12" Text="<%$ Tokens:StringResource,createaccount.aspx.12 %>"
                                                        runat="server" Font-Bold="true"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100%" colspan="2">
                                                    <hr />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Checkout1aspx13" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.13 %>"></asp:Literal>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="FirstName" Columns="20" MaxLength="50" CausesValidation="true" ValidationGroup="registration"
                                                        runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="valReqFirstName" ControlToValidate="FirstName" runat="server"
                                                        Display="None" EnableClientScript="false" ValidationGroup="registration"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Checkout1aspx14" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.14 %>"></asp:Literal>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="LastName" Columns="20" MaxLength="50" CausesValidation="true" ValidationGroup="registration"
                                                        runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="valReqLastName" ControlToValidate="LastName" runat="server"
                                                        Display="None" EnableClientScript="false" ValidationGroup="registration"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Checkout1aspx15" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.15 %>"></asp:Literal>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="EMail" runat="server" Columns="30" MaxLength="100" ValidationGroup="registration"></asp:TextBox>
                                                    <asp:CustomValidator ID="valAcctEmail" Display="None" runat="server" EnableClientScript="false"
                                                        ValidationGroup="registration" OnServerValidate="ValidateAccountEmail" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Checkout1aspx18" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.18 %>"></asp:Literal>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="password" runat="server" Columns="20" MaxLength="30" TextMode="SingleLine"
                                                        ValidationGroup="registration" CausesValidation="true"></asp:TextBox>
                                                    <asp:Literal ID="Checkout1aspx19" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.19 %>"></asp:Literal>
                                                    <asp:CustomValidator ID="valPassword" Display="None" EnableClientScript="false" runat="server"
                                                        ValidationGroup="registration" OnServerValidate="ValidatePassword"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Checkout1aspx21" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.21 %>"></asp:Literal>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="password2" TextMode="SingleLine" Columns="20" MaxLength="30" runat="server"
                                                        ValidationGroup="registration" CausesValidation="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Checkout1aspx23" runat="server"></asp:Literal>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Phone" runat="server" CausesValidation="true" Columns="14" MaxLength="20"
                                                        ValidationGroup="registration"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="valReqPhone" ControlToValidate="Phone" EnableClientScript="false"
                                                        runat="server" ValidationGroup="registration" Display="None"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Literal ID="Checkout1aspx26" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.26 %>"></asp:Literal>
                                                </td>
                                                <td valign="top">
                                                    <asp:Literal ID="Checkout1aspx27" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.27 %>"></asp:Literal>&nbsp;
                                                    <asp:RadioButton ID="OKToEMailYes" GroupName="OKToEMail" runat="server" />
                                                    <asp:Literal ID="Checkout1aspx28" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.28 %>"></asp:Literal>&nbsp;
                                                    <asp:RadioButton ID="OKToEMailNo" GroupName="OKToEMail" runat="server" />
                                                    <asp:Label ID="Checkout1aspx29" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.29 %>"></asp:Label>
                                                </td>
                                            </tr>
                                            <asp:Panel ID="pnlOver13" runat="server">
                                                <tr>
                                                    <td>
                                                        <asp:Literal ID="ltOver13" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.78 %>"></asp:Literal>
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="Over13" Visible="true" runat="server" />
                                                    </td>
                                                </tr>
                                            </asp:Panel>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="signinaspx21" CssClass="LightCellText" Text="<%$ Tokens:StringResource,signin.aspx.21 %>"
                                                        runat="server" Visible="false"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="SecurityCode" Columns="15" runat="server" CausesValidation="true"
                                                        ValidationGroup="registration" Visible="false"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="valReqSecurityCode" ControlToValidate="SecurityCode"
                                                        Display="None" EnableClientScript="false" Enabled="false" runat="server" ValidationGroup="registration"></asp:RequiredFieldValidator>
                                                    <asp:CustomValidator ID="valCustSecurityCode" ControlToValidate="SecurityCode" Display="None"
                                                        EnableClientScript="false" Enabled="false" runat="server" ValidationGroup="registration"
                                                        OnServerValidate="valCustSecurityCode_ServerValidate"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:Image ID="SecurityImage" runat="server" Visible="false" />
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
            <asp:Panel ID="pnlSkipReg" runat="server" Visible="false" HorizontalAlign="Left">
                <asp:Table ID="tblSkipReg" CellSpacing="0" CellPadding="0" Width="100%" runat="server">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                            <asp:Image runat="server" ID="skipreg_gif" />&nbsp;&nbsp;&nbsp;<asp:Label ID="skipRegSignin"
                                runat="server" ForeColor="red"></asp:Label><br />
                            <asp:Table ID="tblSkipRegBox" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                        <asp:Literal ID="Checkout1_aspx_15_2" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.15 %>"></asp:Literal>&nbsp;
                                        <asp:TextBox ID="txtSkipRegEmail" runat="server" Columns="30" MaxLength="100" ValidationGroup="skipreg"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="valRegExSkipRegEmail" ControlToValidate="txtSkipRegEmail"
                                            Display="None" runat="SERVER" ValidationGroup="skipreg" ValidationExpression="^[a-zA-Z0-9][-\w\.]*@([a-zA-Z0-9][\w\-]*\.)+[a-zA-Z]{2,3}$"></asp:RegularExpressionValidator>
                                        <asp:CustomValidator ID="valReqSkipRegEmail" Display="None" runat="server" EnableClientScript="false"
                                            ValidationGroup="skipreg" OnServerValidate="ValidateAccountEmail" />
                                        <br />
                                        <br />
                                        <asp:Literal ID="Literal2" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.78 %>"></asp:Literal>
                                        <asp:CheckBox ID="SkipRegOver13" Visible="true" runat="server" />
                                        <br />
                                        <br />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <br />
            </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="pnlAshland" runat="server">
            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                <tr style="padding-top: 10px; padding-bottom: 10px;">
                    <td runat="server" id="tdBillingInfo" style="width: 50%;">
                        <div style="text-align: left">
                            <asp:Image runat="server" ID="billinginfo_gif" />
                            &#0160;
							<a runat="server" id="lnkEditBillingInfo" href="address.aspx?add=true&addressType=Billing&Checkout=True&returnURL=checkout1.aspx%3fcheckout%3dTrue">
								<asp:Literal ID="checkout1aspx10" runat="server" Text="<%$ Tokens:StringResource,checkout1.aspx.10 %>" />
							</a>
							<asp:LinkButton runat="server" ID="lnkEditAnonymousBillingInfo" Visible="false" OnClick="EditAnonymousBillingInfo_Click">
								<asp:Literal ID="checkout1aspx10Anonymous" runat="server" Text="<%$ Tokens:StringResource,checkout1.aspx.10 %>" />
							</asp:LinkButton>
                        </div>
                        <div style="border: solid 1px #000000; padding: 10px 10px 10px 10px">
                            <div id="divBillingHeader" runat="server" style="width: 100%; font-weight: bold;
                                padding-bottom: 10px;">
                                <asp:Literal ID="createaccountaspx30" Mode="PassThrough" runat="Server" Text='<%$ Tokens:StringResource, createaccount.aspx.30 %>'></asp:Literal>
                            </div>
                            <div style="width: 100%">
                                <aspdnsf:AddressControl ID="ctrlBillingAddress" runat="server" OnSelectedCountryChanged="ctrlBillingAddress_SelectedCountryChanged"
                                    NickNameCaption='<%$ Tokens:StringResource, address.cs.49 %>'
                                    FirstNameCaption='<%$ Tokens:StringResource, address.cs.2 %>' LastNameCaption='<%$ Tokens:StringResource, address.cs.3 %>'
                                    PhoneNumberCaption='<%$ Tokens:StringResource, address.cs.4 %>' CompanyCaption='<%$ Tokens:StringResource, address.cs.5 %>'
                                    ResidenceTypeCaption='<%$ Tokens:StringResource, address.cs.58 %>' Address1Caption='<%$ Tokens:StringResource, address.cs.6 %>'
                                    Address2Caption='<%$ Tokens:StringResource, address.cs.7 %>' SuiteCaption='<%$ Tokens:StringResource, address.cs.8 %>'
                                    CityCaption='<%$ Tokens:StringResource, address.cs.9 %>' StateCaption='<%$ Tokens:StringResource, address.cs.10 %>'
                                    CountryCaption='<%$ Tokens:StringResource, address.cs.53 %>' ZipCaption='<%$ Tokens:StringResource, address.cs.12 %>'
                                    FirstNameRequiredErrorMessage='<%$ Tokens:StringResource, createaccount.aspx.34 %>' LastNameRequiredErrorMessage='<%$ Tokens:StringResource, createaccount.aspx.36 %>'
                                    CityRequiredErrorMessage='<%$ Tokens:StringResource, createaccount.aspx.46 %>' PhoneRequiredErrorMessage='<%$ Tokens:StringResource, createaccount.aspx.38 %>'
                                    Address1RequiredErrorMessage='<%$ Tokens:StringResource, createaccount.aspx.42 %>' 
                                    FirstNameReqFieldValGrp="BillingCheckout1" LastNameReqFieldValGrp="BillingCheckout1"
                                    PhoneNumberReqFieldValGrp="BillingCheckout1" CityReqFieldValGrp="BillingCheckout1"
                                    Address1ReqFieldValGrp="BillingCheckout1" ShowValidatorsInline="false" Address1CustomValGrp="BillingCheckout1" Address1ValidationErrorMessage="<%$ Tokens:StringResource, createaccount_process.aspx.3 %>" />
                            </div>
                        </div>
                    </td>
                    <td runat="server" id="tdShipingInfo" style="padding-left: 5px">
                        <div style="text-align: left; vertical-align: text-bottom">
                            <asp:Image runat="server" ID="shippinginfo_gif" />
                            &#0160;
							<a runat="server" id="lnkEditShippingInfo" href="address.aspx?add=true&addressType=Shipping&Checkout=True&returnURL=checkout1.aspx%3fcheckout%3dTrue">
								<asp:Literal ID="Literal7" runat="server" Text="<%$ Tokens:StringResource,checkout1.aspx.11 %>"></asp:Literal>
							</a>
							<asp:LinkButton runat="server" ID="lnkEditAnonymousShippingInfo" Visible="false" OnClick="EditAnonymousShippingInfo_Click">
								<asp:Literal runat="server" Text="<%$ Tokens:StringResource,checkout1.aspx.11 %>"></asp:Literal>
							</asp:LinkButton>
                        </div>
                        <div style="border: solid 1px #000000; padding: 10px 10px 10px 10px">
                            <div id="divBillingCopy" runat="server" style="width: 100%; font-weight: bold; padding-bottom: 10px;">
                                <asp:Literal ID="createaccountaspx31" Mode="PassThrough" runat="server" Text='<%$ Tokens:StringResource, createaccount.aspx.53 %>'></asp:Literal>
                                <asp:CheckBox ID="ShippingEqualsBilling" runat="server" />
                            </div>
                            <div style="width: 100%">
                                <aspdnsf:AddressControl ID="ctrlShippingAddress" runat="server"  OnSelectedCountryChanged="ctrlShippingAddress_SelectedCountryChanged"
                                    NickNameCaption='<%$ Tokens:StringResource, address.cs.49 %>'
                                    FirstNameCaption='<%$ Tokens:StringResource, address.cs.2 %>' LastNameCaption='<%$ Tokens:StringResource, address.cs.3 %>'
                                    PhoneNumberCaption='<%$ Tokens:StringResource, address.cs.4 %>' CompanyCaption='<%$ Tokens:StringResource, address.cs.5 %>'
                                    ResidenceTypeCaption='<%$ Tokens:StringResource, address.cs.58 %>' Address1Caption='<%$ Tokens:StringResource, address.cs.6 %>'
                                    Address2Caption='<%$ Tokens:StringResource, address.cs.7 %>' SuiteCaption='<%$ Tokens:StringResource, address.cs.8 %>'
                                    CityCaption='<%$ Tokens:StringResource, address.cs.9 %>' StateCaption='<%$ Tokens:StringResource, address.cs.10 %>'
                                    CountryCaption='<%$ Tokens:StringResource, address.cs.53 %>' ZipCaption='<%$ Tokens:StringResource, address.cs.12 %>'
                                    FirstNameRequiredErrorMessage='<%$ Tokens:StringResource, createaccount.aspx.56 %>' LastNameRequiredErrorMessage='<%$ Tokens:StringResource, createaccount.aspx.58 %>'
                                    CityRequiredErrorMessage='<%$ Tokens:StringResource, createaccount.aspx.68 %>' PhoneRequiredErrorMessage='<%$ Tokens:StringResource, createaccount.aspx.60 %>'
                                    Address1RequiredErrorMessage='<%$ Tokens:StringResource, createaccount.aspx.64 %>' 
                                    FirstNameReqFieldValGrp="ShippingCheckout1" LastNameReqFieldValGrp="ShippingCheckout1"
                                    PhoneNumberReqFieldValGrp="ShippingCheckout1" CityReqFieldValGrp="ShippingCheckout1"
                                    Address1ReqFieldValGrp="ShippingCheckout1" ShowValidatorsInline="false" Address1CustomValGrp="ShippingCheckout1" />
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Literal ID="XmlPackage_CheckoutPaymentPageHeader" runat="server" Mode="PassThrough"></asp:Literal>
            <%--Shipping options--%>
            <table id="trShippingOptions" runat="server" style="width: 100%;" cellpadding="0"
                cellspacing="0">
                <tr>
                    <td align="left">
                        <asp:Image ID="shippingselect_gif" runat="server" />
                    </td>
                </tr>
                <tr runat="server">
                    <td style="width: 100%; border: solid 1px #000000; padding-top: 10px; padding-left: 10px;
                        padding-bottom: 10px;">
                        <div id="divShippingOptions" runat="server">
                            <asp:UpdatePanel runat="server" ID="udpOne" >
                                <ContentTemplate>
                                    <aspdnsf:ShippingMethodControl ID="ctrlShippingMethods" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div id="divRecalcShipping" runat="server" style="padding-top: 10px; text-align: center">
                            <div>
                                <asp:Label ID="lblRecalcShippingMsg" runat="server" Font-Bold="true" ForeColor="red"
                                    Text="<%$ Tokens:StringResource, checkout1.aspx.6 %>"></asp:Label>
                            </div>
                            <div style="padding-top: 10px;">
                                <asp:Button ID="btnRecalcShipping" runat="server" Text="<%$ Tokens:StringResource,checkout1.aspx.5 %>"
                                    OnClick="btnRecalcShipping_OnClick" />
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            <br />
            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left">
                        <asp:Image ID="paymentselect_gif" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%; border: solid 1px #000000; padding: 20px 10px 20px 10px">
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <div>
                                        <asp:Panel ID="pnlPaymentOptions" runat="server" HorizontalAlign="left" Visible="true">
                                            <aspdnsf:PaymentMethod ID="ctrlPaymentMethod" runat="server" OnPaymentMethodChanged="ctrlPaymentMethod_OnPaymentMethodChanged"
                                                CARDINALMYECHECKCaption="<%$ Tokens:StringResource, checkoutpayment.aspx.13 %>"
                                                CHECKBYMAILCaption="<%$ Tokens:StringResource, checkoutpayment.aspx.11 %>" CODCaption="<%$ Tokens:StringResource, checkoutpayment.aspx.12 %>"
                                                CODCOMPANYCHECKCaption="<%$ Tokens:StringResource, checkoutpayment.aspx.22 %>"
                                                CODMONEYORDERCaption="<%$ Tokens:StringResource, checkoutpayment.aspx.24 %>"
                                                CODNET30Caption="<%$ Tokens:StringResource, checkoutpayment.aspx.23 %>" CREDITCARDCaption="<%$ Tokens:StringResource, checkoutpayment.aspx.7 %>"
                                                ECHECKCaption="<%$ Tokens:StringResource, checkoutpayment.aspx.13 %>" MICROPAYCaption="<%$ Tokens:StringResource, checkoutpayment.aspx.14 %>"
                                                MICROPAYLabel="<%$ Tokens:StringResource, checkoutpayment.aspx.26 %>" PAYPALCaption="<%$ Tokens:StringResource, checkoutpayment.aspx.9 %>"
                                                PAYPALEXPRESSCaption="<%$ Tokens:StringResource, checkoutpayment.aspx.25 %>"
                                                PAYPALEXPRESSLabel="<%$ Tokens:StringResource, checkoutpaypal.aspx.2 %>" PAYPALLabel="<%$ Tokens:StringResource, checkoutpaypal.aspx.2 %>"
                                                PURCHASEORDERCaption="<%$ Tokens:StringResource, checkoutpayment.aspx.8 %>" REQUESTQUOTECaption="<%$ Tokens:StringResource, checkoutpayment.aspx.10 %>"
                                                CREDITCARDImage_AmericanExpress="~/App_Themes/Skin_1/images/cc_americanexpress.jpg"
                                                CREDITCARDImage_Discover="~/App_Themes/Skin_1/images/cc_discover.jpg"
                                                CREDITCARDImage_MasterCard="~/App_Themes/Skin_1/images/cc_mastercard.jpg"
                                                CREDITCARDImage_Visa="~/App_Themes/Skin_1/images/cc_visa.jpg"
                                                PAYPALEXPRESSImage="~/App_Themes/Skin_1/images/paypal2.gif"
                                                PAYPALImage="~/App_Themes/Skin_1/images/paypal2.gif" />
                                        </asp:Panel>
                                    </div>
                                    <div style="text-align: center">
                                        <asp:Panel ID="pnlNoPaymentRequired" runat="server" HorizontalAlign="Center" Visible="false">
                                            <asp:Label ID="NoPaymentRequired" runat="server" Font-Bold="true" ForeColor="blue"></asp:Label><br />
                                            <br />
                                            <asp:Literal ID="Finalization" runat="server" Mode="PassThrough"></asp:Literal>
                                        </asp:Panel>
                                        <hr style="width: 98%" />
                                    </div>
                                    <div style="width: 100%; padding: 10px 10px 10px 10px">
                                        <asp:Panel ID="pnlFinalization" runat="server" Visible="false" Style="width: 96%;">
                                            <asp:Literal ID="PMFinalization" Mode="PassThrough" runat="server"></asp:Literal>
                                        </asp:Panel>
                                        <div id="paymentPanes" runat="server">
                                            <asp:Panel ID="pnlCCPane" runat="server" Visible="false" Style="width: 96%;">
                                                <aspdnsf:CreditCardPanel ID="ctrlCreditCardPanel" runat="server" CreditCardExpDtCaption="<%$ Tokens:StringResource, address.cs.33 %>"
                                                    CreditCardNameCaption="<%$ Tokens:StringResource, address.cs.23 %>" CreditCardNoSpacesCaption="<%$ Tokens:StringResource, shoppingcart.cs.106 %>"
                                                    CreditCardNumberCaption="<%$ Tokens:StringResource, address.cs.25 %>" CreditCardTypeCaption="<%$ Tokens:StringResource, address.cs.31 %>"
                                                    CreditCardVerCdCaption="<%$ Tokens:StringResource, address.cs.28 %>" HeaderCaption="<%$ Tokens:StringResource, checkoutcard.aspx.6 %>"
                                                    WhatIsThis="<%$ Tokens:StringResource, address.cs.50 %>" CCNameReqFieldErrorMessage="<%$ Tokens:StringResource, address.cs.24 %>"
                                                    CreditCardStartDtCaption="<%$ Tokens:StringResource, address.cs.59 %>" CreditCardIssueNumCaption="<%$ Tokens:StringResource, address.cs.61 %>"
                                                    CreditCardIssueNumNote="<%$ Tokens:StringResource, address.cs.63 %>" CCNameValGrp="creditcard"
                                                    CCNumberReqFieldErrorMessage="<%$ Tokens:StringResource, address.cs.26 %>" CCNumberValGrp="creditcard"
                                                    CCVerCdReqFieldErrorMessage="<%$ Tokens:StringResource, address.cs.29 %>" CCVerCdValGrp="creditcard"
                                                    ShowCCVerCd="True" ShowCCStartDtFields="<%$ Tokens:AppConfigBool, ShowCardStartDateFields %>"
                                                    ShowCCVerCdReqVal="<%$ Tokens:AppConfigBool, CardExtraCodeIsOptional %>" ShowCimSaveCard="false" />
                                            </asp:Panel>
                                            <asp:Panel ID="pnlCCPaneInfo" Visible="false" runat="server" CssClass ="InfoMessageBox InfoMessage">
                                                <asp:Literal ID="CCPaneInfo" Mode="PassThrough" runat="server"></asp:Literal>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlEcheckPane" runat="server" Visible="false" Style="width: 96%;">
                                                <aspdnsf:Echeck ID="ctrlEcheck" runat="server" ECheckBankABACodeLabel1="<%$ Tokens:StringResource, address.cs.41 %>"
                                                    ECheckBankABACodeLabel2="<%$ Tokens:StringResource, address.cs.42 %>" ECheckBankAccountNameLabel="<%$ Tokens:StringResource, address.cs.36 %>"
                                                    ECheckBankAccountNumberLabel1="<%$ Tokens:StringResource, address.cs.44 %>" ECheckBankAccountNumberLabel2="<%$ Tokens:StringResource, address.cs.45 %>"
                                                    ECheckBankAccountTypeLabel="<%$ Tokens:StringResource, address.cs.47 %>" ECheckBankNameLabel1="<%$ Tokens:StringResource, address.cs.38 %>"
                                                    ECheckBankNameLabel2="<%$ Tokens:StringResource, address.cs.40 %>" ECheckNoteLabel="<%$ Tokens:StringResource, address.cs.48 %>"
                                                    BankAccountNameReqFieldErrorMessage="<%$ Tokens:StringResource,address.cs.37 %>"
                                                    BankNameReqFieldErrorMessage="<%$ Tokens:StringResource, address.cs.39 %>" BankABACodeReqFieldErrorMessage="<%$ Tokens:StringResource, address.cs.43 %>"
                                                    BankAccountNumberReqFieldErrorMessage="<%$ Tokens:StringResource, address.cs.46 %>"
                                                    BankAccountNameReqFieldValGrp="echeck" BankNameReqFieldValGrp="echeck" BankABACodeReqFieldValGrp="echeck"
                                                    BankAccountNumberReqFieldValGrp="echeck" />
                                            </asp:Panel>
                                            <asp:Panel ID="pnlPOPane" runat="server" Visible="false" Style="width: 96%;">
                                                <div>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <b>
                                                                    <asp:Label ID="lblPOHeader" runat="server" Text="<%$ Tokens:StringResource, checkoutpo.aspx.3 %>"></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                </b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblPO" runat="server" Text="<%$ Tokens:StringResource, checkoutpo.aspx.4 %>"></asp:Label>
                                                                <asp:TextBox ID="txtPO" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                        <asp:Panel ID="pnlRequireTerms" runat="server" Visible="<%$ Tokens:AppConfigBool, RequireTermsAndConditionsAtCheckout %>"
                                            Style="width: 99%;">
                                            <br />
                                            <table align="center" width="100%" cellpadding="2" cellspacing="0" class="CheckOutTermsBorder">
                                                <tr>
                                                    <td class="\"LightCell\">
                                                        <asp:CheckBox ID="chkTermsAccepted" runat="server" Text="<%$Tokens:StringResource, checkoutcard.aspx.14 %>"
                                                            Checked="false" /><br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top">
                                                        <asp:Literal ID="Literal1" runat="server" Text="<%$ Tokens:Topic, checkouttermsandconditions %>" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </div>
                                </td>
                                <td style="width:200px;">
                                    <aspdnsf:BuySafeKicker ID="buySAFEKicker" WrapperClass="OPCKicker" runat="server" />
                                </td>
                            </tr>
                        </table>
                        
                    </td>
                </tr>
            </table>
            <div style="width: 100%; padding-top: 20px; padding-bottom: 20px; text-align: center">
                <%--<asp:Button ID="btnContinueCheckout" CssClass="ContinueCheckoutButton" runat="server" Text="<%$ Tokens:StringResource,checkout1.aspx.1 %>"
                    OnClick="btnContinueCheckout_Click" />--%>
                <asp:Button ID="btnCheckOut" runat="server" Text="<%$ Tokens:StringResource,checkout1.aspx.1 %>"
                    OnClick="btnCheckOut_Click" />
            </div>
            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:Panel ID="pnlOrderSummary" runat="server">
                            <%--Shopping cart control--%>
                            <aspdnsf:ShoppingCartControl ID="ctrlShoppingCart"
                             ProductHeaderText='<%$ Tokens:StringResource, shoppingcart.product %>'
                             QuantityHeaderText='<%$ Tokens:StringResource, shoppingcart.quantity %>'
                             SubTotalHeaderText='<%$ Tokens:StringResource, shoppingcart.subtotal %>' 
                             runat="server" AllowEdit="false">
                                <LineItemSettings LinkToProductPageInCart='<%$ Tokens:AppConfigBool, LinkToProductPageInCart %>'
                                    SKUCaption='<%$ Tokens:StringResource, showproduct.aspx.21 %>' GiftRegistryCaption='<%$ Tokens:StringResource, shoppingcart.cs.92 %>'
                                    ItemNotesCaption='<%$ Tokens:StringResource, shoppingcart.cs.86 %>' ItemNotesColumns='<%$ Tokens:AppConfigUSInt, ShoppingCartItemNotesTextareaCols %>'
                                    ItemNotesRows='<%$ Tokens:AppConfigUSInt, ShoppingCartItemNotesTextareaRows %>'
                                    AllowShoppingCartItemNotes="false" />
                            </aspdnsf:ShoppingCartControl>
                            <asp:Literal ID="OrderSummary" Mode="PassThrough" runat="server"></asp:Literal>
                            <%--Total Summary--%>
                            <aspdnsf:CartSummary ID="ctrlCartSummary" runat="server" SubTotalCaption='<%$Tokens:StringResource, shoppingcart.cs.96 %>'
                                SubTotalWithDiscountCaption='<%$Tokens:StringResource, shoppingcart.cs.97 %>'
                                ShippingCaption='<%$Tokens:StringResource, shoppingcart.aspx.12 %>' ShippingVatExCaption='<%$Tokens:StringResource, setvatsetting.aspx.7 %>'
                                ShippingVatInCaption='<%$Tokens:StringResource, setvatsetting.aspx.6 %>' TaxCaption='<%$Tokens:StringResource, shoppingcart.aspx.14 %>'
                                LineItemDiscountCaption ="<%$Tokens:StringResource, shoppingcart.cs.200 %>" OrderDiscountCaption="<%$Tokens:StringResource, shoppingcart.cs.201 %>"
                                TotalCaption='<%$Tokens:StringResource, shoppingcart.cs.61 %>'
                                IncludeTaxInSubtotal="false" ShowShipping="false" ShowTotal="false"
                                 />
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="RTSdebug" runat="server">
            <asp:Literal ID="DebugInfo" runat="server" Mode="PassThrough" />
        </asp:Panel>
        <asp:Literal ID="JSPopupRoutines" runat="server"></asp:Literal>
    </asp:Panel>
</asp:Content>
