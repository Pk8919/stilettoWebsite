<%@ Page Language="C#" AutoEventWireup="true" Title="Wizard" CodeFile="wizard.aspx.cs" Inherits="AspDotNetStorefrontAdmin.wizard" MaintainScrollPositionOnPostback="true" MasterPageFile="~/App_Templates/Admin_Default/AdminMaster.master" %>
<%@ Register Assembly="AspDotNetStorefrontControls" Namespace="AspDotNetStorefrontControls" TagPrefix="aspdnsfc" %>
<%@ Register TagPrefix="aspdnsf" TagName="ModalConfigurationAtom" Src="Controls/ModalConfigurationAtom.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register TagPrefix="aspdnsf" TagName="editAppConfigAtom" Src="Controls/editAppConfigAtom.ascx" %>
<%@ Register TagPrefix="aspdnsf" TagName="GeneralInfo" Src="Controls/GeneralInfo.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="scripts/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="scripts/jqueryextensions.js"></script>

    <script type="text/javascript">
        function showGatewayDirections(description) {
            var instructionsHTML = "After successful download, unzip the file and review 'readme.txt' for installation instructions.<br />Your new payment gateway will appear here when you refresh the page.";
            if (description != null && description.length != 0) {
                instructionsHTML = description;
            }
            $("#GatewayInstructionsContent").html(instructionsHTML);

            $find('mpGatewayInsturctions').show();
        }
        $(function () {
            setAlternatingRows();
        });
        function pageLoad(sender, args) {
            if (!args.get_isPartialLoad()) {
                $addHandler(document, "keydown", onKeyDown);
            }
        }
        function onKeyDown(e) {
            if (e && e.keyCode == Sys.UI.Key.esc) {
                $('.atomModalClose').click();
            }
        }
    </script>

    <style type="text/css">
    td.textBox .paddingfix
    {
        padding-top:5px;
    }
    .lineHeightFix
    {
        line-height:normal;
    }
    .trConfigAtomAdvanced
    {
        display:none;
    }
    </style>

</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="bodyContentPlaceholder">

<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server" />
    <asp:Literal ID="ltScript" runat="server"></asp:Literal> 
    <asp:Literal ID="ltValid" runat="server"></asp:Literal>
    
    <div id="help">
        <div style="margin-bottom: 5px; margin-top: 5px;">
            <asp:Literal ID="ltError" runat="server"></asp:Literal>
        </div>
    </div>

    <div id="container">
        <aspdnsf:ModalConfigurationAtom runat="server" ShowConfigureLink="false"  ID="FileConfigurationAtom" />
        <table border="0" cellpadding="1" cellspacing="0" class="outerTable" width="100%">
            <tr>
                <td>
                    <div class="wrapper">                       
                        <table border="0" cellpadding="0" cellspacing="0" class="innerTable" width="100%">
                            <tr>
                                <td class="titleTable">
                                    <font class="subTitle">Wizard:</font>
                                </td>
                            </tr>
                            <tr>
                                <td class="contentTable" valign="top" width="100%">
                                    <div class="wrapper">
                                        This wizard can help you configure your store's primary configuration variables after first installation. 
                                        <br />
                                        <div id="divMain" runat="server">
                                            <p>Fields marked with an asterisk (*) are required. All other fields are optional.</p>
                                            <table cellpadding="1" cellspacing="0" border="0" width="950px">
                                                <tr id="trSaveTop">
                                                    <td colspan="2">
                                                        <div style="text-align:center;">
                                                        <asp:Button ID="btnSubmitTop" runat="Server" CssClass="normalButtons" Text="Submit" OnClick="btnSubmit_Click" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                
                                                <aspdnsf:editAppConfigAtom runat="server" id="AtomStoreName" HideTableNode="true" ShowSaveButton="false" AppConfig="StoreName" FriendlyName="Store Name" />
                                                <aspdnsf:editAppConfigAtom runat="server" id="AtomLiveServer" HideTableNode="true" ShowSaveButton="false" AppConfig="LiveServer" FriendlyName="Live Server Domain" />
                                                <aspdnsf:editAppConfigAtom runat="server" id="AtomStoreZip" HideTableNode="true" ShowSaveButton="false" AppConfig="RTShipping.OriginZip" FriendlyName="Shipping Origin Zip Code" />
                                                <aspdnsf:editAppConfigAtom runat="server" id="AtomStoreCurrency" HideTableNode="true" ShowSaveButton="false" AppConfig="Localization.StoreCurrency" FriendlyName="Store Currency" />
                                                <aspdnsf:editAppConfigAtom runat="server" id="AtomStoreCurrencyNumeric" HideTableNode="true" ShowSaveButton="false" AppConfig="Localization.StoreCurrencyNumericCode" FriendlyName="Store Currency Numeric Code" />
                                                <aspdnsf:editAppConfigAtom runat="server" id="AtomStoreLiveTransactions" HideTableNode="true" ShowSaveButton="false" AppConfig="UseLiveTransactions" FriendlyName="Use Live Transactions" />
                                                <aspdnsf:editAppConfigAtom runat="server" id="AtomStoreUseSSL" HideTableNode="true" ShowSaveButton="false" AppConfig="UseSSL" FriendlyName="Use SSL" />

                                                <tr id="MachineKeyRow" runat="server">
                                                    <td class="expandingLabel">
                                                        <div class="configTitle">
                                                            <aspdnsf:GeneralInfo runat="server" StringResource="admin.wizard.tooltip.imgStaticMachineKey" />
                                                            <b><asp:Literal ID="ltStaticMachineKey" runat="server" />&nbsp;</b>
                                                        </div>
                                                    </td>
                                                    <td class="textBox">
                                                        <div class="paddingfix">
                                                            <asp:RadioButtonList ID="rblStaticMachineKey" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" CellPadding="5" CellSpacing="0">
                                                                <asp:ListItem Value="false" Selected="true" Text="No" /> 
                                                                <asp:ListItem Value="true" Text="Yes" />                                                                                                                                                                                            
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </td>
                                                </tr>
                                                
                                                <tr id="EncryptWebConfigRow" runat="server">
                                                    <td class="expandingLabel">
                                                        <div class="configTitle">
                                                            <aspdnsf:GeneralInfo runat="server" StringResource="admin.wizard.tooltip.imgEncryptKey" />
                                                            <b>Encrypt the Web.Config:&nbsp;</b>
                                                        </div>
                                                    </td>
                                                    <td class="textBox">
                                                        <div class="paddingfix">
                                                        <asp:RadioButtonList ID="rblEncrypt" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" CellPadding="5" CellSpacing="0">
                                                            <asp:ListItem Value="false" Selected="true" Text="No" /> 
                                                            <asp:ListItem Value="true" Text="Yes" />                                                                                                                                                                                            
                                                        </asp:RadioButtonList>
                                                        </div>
                                                    </td>
                                                </tr>
                                                
                                                <tr id="trEmail">
                                                    <td align="right" class="textBoxLabel">
                                                        <b>Email:&nbsp;</b>
                                                    </td>      
                                                    <td align="left" class="textBox">
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigureEmail" EventName="Click" />
                                                            </Triggers>
                                                            <ContentTemplate>
                                                                <asp:LinkButton ID="btnConfigureEmail" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="General.Email.xml" Text="Configure Email" runat="server" />
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>                                                                                                  
                                                </tr>
                                                
                                                <tr id="trSEO">
                                                    <td align="right" class="textBoxLabel">
                                                        <b>SEO:&nbsp;</b>
                                                    </td>      
                                                    <td align="left" class="textBox">
                                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigureSEO" EventName="Click" />
                                                            </Triggers>
                                                            <ContentTemplate>
                                                                <asp:LinkButton ID="btnConfigureSEO" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="General.SEO.xml" Text="Configure SEO" runat="server" />
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>                                                                                                  
                                                </tr>
                                                
                                                <tr id="trBuySafe">
                                                    <td width="250" align="right" class="textBoxLabel">
                                                        <b>Increase sales with buySAFE:&nbsp;</b>
                                                    </td>
                                                    <td align="left" class="textBox">
                                                        <asp:Panel ID="pnlBuySafeInactive" runat="server">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="rblBuySafeEnabled" RepeatDirection="Horizontal" runat="server">
                                                                            <asp:ListItem Selected="True" Text="No" />
                                                                            <asp:ListItem Text="Yes" />
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                    <td>
                                                                        <a href="buysafeSetup.aspx" style="display:block;margin-left:5px;" target="_blank">buySAFE increases your site conversions by improving shopper confidence. Click here to learn more...</a>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                        <asp:Panel ID="pnlBuySafeActive" Visible="false" runat="server">
                                                            <asp:Literal ID="litBuySafeActiveMsg" runat="server" />
                                                        </asp:Panel>
                                                    </td>
                                                </tr>

                                                <tr style="background-color:#19437D;">
                                                    <td></td>
                                                    <td style="font-weight:bold;color:#fff;">Configure Fraud Solutions</td>
                                                </tr>
                                                
                                                <tr id="trMaxMind">
                                                    <td align="right" class="textBoxLabel">
                                                        <b>MaxMind:&nbsp;</b>
                                                    </td>      
                                                    <td align="left" class="textBox">
                                                        <asp:UpdatePanel runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigureMaxMind" EventName="Click" />
                                                            </Triggers>
                                                            <ContentTemplate>
                                                                <asp:LinkButton ID="btnConfigureMaxMind" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="General.MaxMind.xml" Text="Configure MaxMind" runat="server" />
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>                                                                                                  
                                                </tr>
                                                
                                                <tr><td colspan="2" height="15">&nbsp;</td></tr>
                                                <tr>
                                                    <td align="right" style="padding:2px 5px;"><b>Choose your company's country:</b></td>
                                                    <td class="textBox" style="padding:2px 5px;">                                                        
                                                        <asp:DropDownList ID="ddlCountries" runat="server" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged" AutoPostBack="true" />
                                                    </td>
                                                </tr>
                                                                                                
                                                <tr style="background-color:#19437D;">
                                                    <td></td>
                                                    <td style="font-weight:bold;color:#fff;">Configure Alternative Payment Methods</td>
                                                </tr>

                                               <tr id="trCheckoutMethods">
                                                    <td align="right" class="textBoxLabel">
                                                        <asp:UpdatePanel runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigureCheckoutMethodsPerStore" EventName="Click" />
                                                            </Triggers>
                                                            <ContentTemplate>
                                                                <span class="lineHeightFix">
                                                                    <asp:LinkButton ID="btnConfigureCheckoutMethodsPerStore" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="General.PaymentMethods.xml" Text="Configure Per Store" runat="server" />&nbsp;&nbsp;
                                                                </span>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td align="left" class="textBox">
                                                        <asp:UpdatePanel ID="UpdatePanel8" UpdateMode="Conditional" ChildrenAsTriggers="false" runat="server">
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigureCheckoutByAmazon" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigurePayPalExpress" EventName="Click" />
                                                            </Triggers>
                                                            <ContentTemplate>
                                                                <table class="alternaterows paymentOptionsTable" cellspacing="0" width="100%">
                                                                   <tr id="trPayPalExpress" runat="server">
                                                                        <td>                                                                            
                                                                            <asp:CheckBox CssClass="paymentCheckBox" ID="cbxPayPalExpress" runat="server"  Text="PayPal Express Checkout" />
                                                                        </td>
                                                                        <td>
                                                                            <img id="Img3" runat="server" src="Images/PayPal_OnBoarding_ECPaymentIcon.gif" class="paymentIcon paypalCheckoutBtn"/>
                                                                        </td>
                                                                        <td>
                                                                            See <a href="http://www.aspdotnetstorefront.com/linkmanager.aspx?topic=paypalexpress&type=manual" target="_blank">Manual</a> and <a href="http://www.aspdotnetstorefront.com/linkmanager.aspx?topic=paypalexpress&type=demo" target="_blank">Demo</a>
                                                                        </td>
                                                                        <td class="paymentRightCell">
                                                                            <asp:LinkButton ID="btnConfigurePayPalExpress" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="PaymentMethod.PayPalExpress.xml" Text="configure" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
															                <asp:CheckBox CssClass="paymentCheckBox" ID="cbxCheckoutByAmazon" runat="server"  Text="Checkout By Amazon" />
                                                                        </td>
                                                                        <td>
                                                                            <asp:Literal ID="litAmazonPrompt" runat="server" />
                                                                        </td>
                                                                        <td class="paymentRightCell">
                                                                            <asp:LinkButton ID="btnConfigureCheckoutByAmazon" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="PaymentMethod.CheckoutByAmazon.xml" Text="configure" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-indent:20px;">Google Checkout</td>
                                                                        <td colspan="3" class="paymentRightCell">
                                                                            <asp:UpdatePanel runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                                                                <Triggers>
                                                                                    <asp:AsyncPostBackTrigger ControlID="btnConfigureGoogleCheckout" EventName="Click" />
                                                                                    <asp:AsyncPostBackTrigger ControlID="btnConfigureGoogleCheckoutAdvanced" EventName="Click" />
                                                                                    <asp:AsyncPostBackTrigger ControlID="btnConfigureGoogleCheckoutShipping" EventName="Click" />
                                                                                    <asp:AsyncPostBackTrigger ControlID="btnConfigureGoogleCheckoutCarrierCalculatedShipping" EventName="Click" />
                                                                                </Triggers>
                                                                                <ContentTemplate>
                                                                                    <asp:LinkButton ID="btnConfigureGoogleCheckout" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="General.GoogleCheckoutBasic.xml" Text="Basic Settings" runat="server" /> | 
                                                                                    <asp:LinkButton ID="btnConfigureGoogleCheckoutAdvanced" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="General.GoogleCheckoutAdvanced.xml" Text="Advanced Settings" runat="server" /> | 
                                                                                    <asp:LinkButton ID="btnConfigureGoogleCheckoutShipping" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="General.GoogleCheckoutShipping.xml" Text="Shipping Settings" runat="server" /> | 
                                                                                    <asp:LinkButton ID="btnConfigureGoogleCheckoutCarrierCalculatedShipping" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="General.GoogleCheckoutCarrierCalculatedShipping.xml" Text="Carrier Calculated Shipping" runat="server" />
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                         </td>
                                                                    </tr>
                                                                </table>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>


                                                <tr style="background-color:#19437D;">
                                                    <td></td>
                                                    <td style="font-weight:bold;color:#fff;">Credit Cards & Other Payment Methods</td>
                                                </tr>
                                                
                                                <tr id="trPaymentMethods">
                                                    <td align="right" class="textBoxLabel">
                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigurePaymentMethodsPerStore" EventName="Click" />
                                                            </Triggers>
                                                            <ContentTemplate>
                                                                <span class="lineHeightFix">
                                                                    <asp:LinkButton ID="btnConfigurePaymentMethodsPerStore" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="General.PaymentMethods.xml" Text="Configure Per Store" runat="server" />&nbsp;&nbsp;
                                                                </span>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td align="left" class="textBox">
                                                        <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" ChildrenAsTriggers="false" runat="server">
                                                            <Triggers>                                                                
                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigureCreditCard" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigurePayPalExpress" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigurePayPal" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigureCardinalEChecks" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigureMicroPay" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigureMoneyBookersQuickCheckout" EventName="Click" />
                                                            </Triggers>
                                                            
                                                            <ContentTemplate>
                                                                <table class="alternaterows paymentOptionsTable" cellspacing="0" width="100%">
                                                                    <tr id="trPayPalWebsitePaymentsStandard" runat="server">
                                                                        <td>                                                                            
                                                                            <asp:CheckBox CssClass="paymentCheckBox" ID="cbxPayPal" runat="server"  Text="PayPal Payments Standard" />
                                                                        </td>
                                                                        <td>
                                                                            <img id="Img1" runat="server" src="Images/PayPal_OnBoarding_GenericOptions.png" class="paymentIcon paypalGenericOptions"/>
                                                                        </td>
                                                                        <td>
                                                                            See <a href="http://www.aspdotnetstorefront.com/linkmanager.aspx?topic=paypalstandard&type=manual" target="_blank">Manual</a> and <a href="http://www.aspdotnetstorefront.com/linkmanager.aspx?topic=paypalstandard&type=demo" target="_blank">Demo</a>
                                                                        </td>
                                                                        <td class="paymentRightCell">
                                                                            <asp:LinkButton ID="btnConfigurePayPal" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="PaymentMethod.PayPal.xml" Text="configure" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                     <tr>
                                                                        <td colspan="2">
                                                                            <asp:CheckBox CssClass="paymentCheckBox" ID="cbxCreditCard" runat="server" Text="Credit Card" />
                                                                        </td>
                                                                        <td>Required for recurring billing</td>
                                                                        <td class="paymentRightCell">
                                                                            <asp:LinkButton ID="btnConfigureCreditCard" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="PaymentMethod.CreditCard.xml" Text="configure" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:CheckBox CssClass="paymentCheckBox" ID="cbxRequestQuote" runat="server"  Text="Request For Quote" />
                                                                        </td>
                                                                        <td>&nbsp;</td>
                                                                        <td class="paymentRightCell">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:CheckBox CssClass="paymentCheckBox" ID="cbxPurchaseOrder" runat="server"  Text="Purchase Orders" />
                                                                        </td>
                                                                        <td>&nbsp;</td>
                                                                        <td class="paymentRightCell">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:CheckBox CssClass="paymentCheckBox" ID="cbxCheckByMail" runat="server"  Text="Checks" />
                                                                        </td>
                                                                        <td>&nbsp;</td>
                                                                        <td class="paymentRightCell">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:CheckBox CssClass="paymentCheckBox" ID="cbxCOD" runat="server"  Text="C.O.D." />
                                                                        </td>
                                                                        <td>&nbsp;</td>
                                                                        <td class="paymentRightCell">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:CheckBox CssClass="paymentCheckBox" ID="cbxECheck" runat="server"  Text="E-Checks through supported gateway" />
                                                                        </td>
                                                                        <td>
                                                                            See <a href="http://www.aspdotnetstorefront.com/linkmanager.aspx?topic=echecks&type=manual" target="_blank">Manual</a> for supported gateways
                                                                        </td>
                                                                        <td class="paymentRightCell">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:CheckBox CssClass="paymentCheckBox" ID="cbxCardinalMyCheck" runat="server"  Text="-or- Cardinal Centinel MyECheck" />
                                                                        </td>
                                                                        <td>&nbsp;</td>
                                                                        <td class="paymentRightCell">
                                                                            <asp:LinkButton ID="btnConfigureCardinalEChecks" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="PaymentMethod.CardinalMyECheck.xml" Text="configure" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:CheckBox CssClass="paymentCheckBox" ID="cbxMicroPay" runat="server"  Text="MICROPAY" />
                                                                        </td>
                                                                        <td>
                                                                            See <a href="http://www.aspdotnetstorefront.com/linkmanager.aspx?topic=micropay&type=manual" target="_blank">Manual</a>
                                                                        </td>
                                                                        <td class="paymentRightCell">
                                                                            <asp:LinkButton ID="btnConfigureMicroPay" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="PaymentMethod.Micropay.xml" Text="configure" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
															                <asp:CheckBox CssClass="paymentCheckBox" ID="cbxMoneyBookers" runat="server" Value="Moneybookers Quick Checkout" Text="Skrill (Moneybookers) Quick Checkout" />
                                                                        </td>
                                                                        <td>
                                                                            Learn <a href="http://www.aspdotnetstorefront.com/linkmanager.aspx?topic=skrill&type=learnmore" target="_blank">more...</a>
                                                                        </td>

                                                                        <td class="paymentRightCell">
                                                                            <asp:LinkButton ID="btnConfigureMoneyBookersQuickCheckout" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="PaymentMethod.MoneyBookersQuickCheckout.xml" Text="configure" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                                
                                                <tr style="background-color:#19437D;">
                                                    <td></td>
                                                    <td style="font-weight:bold;color:#fff;">Payment Processing Solutions</td>
                                                </tr>

                                                <tr id="trGateways">
                                                    <td align="right" class="textBoxLabel">
                                                        <b>Payment Gateway:&nbsp;</b><br />
                                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnGatewayPerStoreAndBackup" EventName="Click" />
                                                            </Triggers>
                                                            <ContentTemplate>
                                                                <span class="lineHeightFix">
                                                                    <asp:LinkButton style="margin-right:5px;display:block;" ID="btnGatewayPerStoreAndBackup" OnClick="ShowModalAtomByXMLFile_Click" CommandArgument="General.Gateway.xml" runat="server" >Configure Per Store and<br />Backup Gateways</asp:LinkButton><br />
                                                                </span>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td align="left" class="textBox">
                                                        <asp:Repeater ID="repGateways" runat="server" OnItemDataBound="repGateways_DataBinding" OnItemCommand="repGateways_ItemCommand">
                                                            <HeaderTemplate>
                                                                <table width="100%" cellspacing="0" class="alternaterows paymentOptionsTable">
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr id="trGateway" runat="server">
                                                                    <td>
                                                                        <asp:UpdatePanel ID="upGatewaySelect" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                                                            <Triggers>
                                                                                <asp:AsyncPostBackTrigger ControlID="repGateways" EventName="ItemCommand" />
                                                                                <asp:AsyncPostBackTrigger ControlID="btnConfigureGateway" EventName="Click" />
                                                                            </Triggers>
                                                                            <ContentTemplate>
                                                                                <aspdnsfc:GroupRadioButton CssClass="rbGateway" ID="rbGateway" GroupName="SelectedGateway" Enabled="false" runat="server" value='<%# Eval("GatewayIdentifier") %>' />
                                                                            </ContentTemplate>
                                                                        </asp:UpdatePanel>
                                                                    </td>
                                                                    <td>
                                                                        <b><%# Eval("DisplayName") %></b>
                                                                    </td>
                                                                    <td>       
                                                                        <asp:Image ID="imgPayPal" CssClass="paymentIcon paypalGenericOptions" runat="server" ImageUrl="Images/PayPal_OnBoarding_GenericOptions.png" Visible="false" />                                                          
                                                                    </td>
                                                                    <td>
                                                                        <div class="lineHeightFix">
                                                                            <%# Eval("AdministratorSetupPrompt")%>
                                                                        </div>
                                                                        <asp:HiddenField ID="hfGatewayIdentifier" Value='<%# Eval("GatewayIdentifier") %>' runat="server" />
                                                                        <asp:HiddenField ID="hfGatewayProductIdentifier" Value='<%# Eval("DisplayName") %>' runat="server" />
                                                                    </td>
                                                                    <td class="paymentRightCell">
                                                                        <asp:LinkButton runat="server" ID="btnConfigureGateway" Text="configure" CommandName="ShowConfiguration" CommandArgument='<%# Eval("GatewayIdentifier") %>' />
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                </table>
                                                            </FooterTemplate>
                                                        </asp:Repeater>
                                                        <aspdnsf:ModalConfigurationAtom runat="server" OnAtomSaved="GatewayConfigurationAtom_Saved" ShowConfigureLink="false"  ID="GatewayConfigurationAtom" ConfigureButtonCssClass="ConfigureGatewayButton" />
                                                    </td>
                                                </tr>

                                                <tr id="trSaveBottom">
                                                    <td colspan="2">
                                                        <div style="text-align:center;">
                                                        <br />
                                                        <asp:Button ID="btnSubmitBottom" runat="Server" CssClass="normalButtons" Text="Submit" OnClick="btnSubmit_Click" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:ValidationSummary ID="validationSummary" runat="server" EnableClientScript="true" ShowMessageBox="true" ShowSummary="false" Enabled="true" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
        
    <ajax:ModalPopupExtender 
        ID="mpGatewayInsturctions" runat="server" 
        PopupControlID="pnlGatewayInstructions"
        TargetControlID="btnShowGatewayInstructions" 
        BackgroundCssClass="modal_popup_background" 
        CancelControlID="btnCancelConfiguration"
        BehaviorID="mpGatewayInsturctions"
        >
    </ajax:ModalPopupExtender>
    
    <div style="display: none;">
        <asp:LinkButton ID="btnShowGatewayInstructions" runat="server" Text="configure" OnClientClick="showGatewayDirections();return false;" />
        <asp:Panel ID="pnlGatewayInstructions" runat="server" CssClass="modal_popup atom_modal_popup" Width="725px" ScrollBars="None">
            <div class="modal_popup_Header" id="modaldiv" runat="server">
                <asp:Literal ID="Literal1" runat="server" Text="Gateway Installation" />
                <div style="float:right;">
                    <asp:ImageButton ID="btnCancelConfiguration" runat="server" src="../App_Themes/Admin_Default/images/delete.png" />
                </div>
            </div>
            <asp:Panel ID="pnlConfigAtomContainer" runat="server" ScrollBars="None">
                <div style="padding:10px;">
                    <strong>Your download has started.</strong><br /><br />
                    <span id="GatewayInstructionsContent"></span>
                </div>
            </asp:Panel>
        </asp:Panel>
    </div>

</asp:Content>