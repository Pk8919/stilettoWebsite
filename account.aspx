<%@ Page ClientTarget="UpLevel" language="c#" Inherits="AspDotNetStorefront.account" CodeFile="account.aspx.cs" MasterPageFile="~/App_Templates/Skin_1/template.master"   %>
<%@ Register TagPrefix="aspdnsf" TagName="Topic" Src="~/Controls/TopicControl.ascx" %>
<%@ Register TagPrefix="aspdnsf" TagName="SecureNetVault" Src="~/Controls/SecureNetVaultPanel.ascx" %>
<%@ Import namespace="AspDotNetStorefrontCore" %>
<%@ Register Src="CIM/Wallet.ascx" TagName="Wallet" TagPrefix="uc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PageContent">
    <asp:Panel ID="pnlContent" runat="server" >            
     
    <asp:Panel ID="pnlCheckoutImage" runat="server" HorizontalAlign="Center" Visible="false">
        <asp:ImageMap ID="CheckoutImage" HotSpotMode="Navigate" runat="server">
            <asp:RectangleHotSpot Top="0" Left="0" Right="87" Bottom="54" HotSpotMode="Navigate" NavigateUrl="~/shoppingcart.aspx?resetlinkback=1" />
        </asp:ImageMap>
    </asp:Panel>
    
    <asp:Label ID="ErrorMsgLabel" runat="server" ForeColor="Red" Font-Bold="true" ></asp:Label>
    
	<asp:Panel ID="pnlCBAAddressWidget" runat="server" Visible="false">
			<div style="float: left;">
				<asp:Literal ID="litCBAAddressWidget" runat="server" />
			</div>
			<div id="CBAAddressWidgetInstruction" style="float: left; padding: 10px; font-weight: bolder; width: 300px;">
				<asp:Literal ID="litCBAAddressWidgetInstruction" runat="server" />
			</div>
			<br style="clear: both;" />
		</asp:Panel>

    <asp:Panel ID="pnlAccountUpdated" runat="server" HorizontalAlign="center">
        <asp:Label ID="lblAcctUpdateMsg" runat="server" style="font-weight:bold;color:#FF0000;"></asp:Label><br/><br/>
    </asp:Panel>

    <asp:Panel ID="pnlNotCheckOutButtons" runat="server" HorizontalAlign="left">
        <asp:Image ID="redarrow1" AlternateText="" runat="server" />&#0160;<b><asp:HyperLink runat="server" ID="accountaspx4" NavigateUrl="#OrderHistory" Text="<%$ Tokens:StringResource,account.aspx.4 %>"></asp:HyperLink></b>
        <asp:Panel ID="pnlShowWishButton" runat="server"><asp:Image ID="redarrow2" AlternateText="" runat="server" />&#0160;<b><asp:HyperLink runat="server" ID="ShowWishButtons" NavigateUrl="~/wishlist.aspx" Text="<%$ Tokens:StringResource,account.aspx.58 %>"></asp:HyperLink></b></asp:Panel>
        <asp:Panel ID="pnlShowGiftRegistryButtons" runat="server" ><asp:Image ID="redarrow3" AlternateText="" runat="server" />&#0160;<b><asp:HyperLink runat="server" ID="HyperLink1" NavigateUrl="~/giftregistry.aspx" Text="<%$ Tokens:StringResource,account.aspx.59 %>"></asp:HyperLink></b></asp:Panel>
        <asp:Panel ID="pnlSubscriptionExpiresOn" runat="server"><br/><asp:Label runat="server" ID="lblSubscriptionExpiresOn"></asp:Label></asp:Panel>
    </asp:Panel>

    <aspdnsf:Topic runat="server" ID="HeaderMsg" TopicName="AccountPageHeader" />

        <asp:Textbox ID="OriginalEMail" runat="server" Visible="false" />

        <p><asp:Label ID="note1" runat="server"></asp:Label></p>
        <p><asp:Label ID="MicroPayEnabled" runat="server"></asp:Label></p>
        
        <asp:ValidationSummary DisplayMode="List" ID="ValSummary" ShowMessageBox="false" runat="server" ShowSummary="true" ValidationGroup="account" ForeColor="red" Font-Bold="true"/>
        <table width="100%" cellpadding="2" cellspacing="0" border="0" style="border-style: solid; border-width: 0px; border-color: #444444">
            <tr>
              <td align="left" valign="top">
                <asp:Image AlternateText="" ID="imgAccountinfo" runat="server"/><br/>

                <table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-style: solid; border-width: 1px; border-color: #444444;">
                  <tr>
                    <td align="left" valign="top">
                      <table border="0" cellpadding="4" cellspacing="0" width="100%">
                        <tr>
                          <td width="100%" colspan="2"><b><asp:Label ID="accountaspx12" runat="server" Text="<%$ Tokens:StringResource,account.aspx.12 %>"></asp:Label></b></td>
                        </tr>

                        <tr>
                          <td width="100%" colspan="2">
                            <hr />
                          </td>
                        </tr> 
                        <aspdnsf:Account ID="ctrlAccount" runat="server"
                              EmailCaption="<%$ Tokens:StringResource, account.aspx.15 %>" 
                              FirstNameCaption="<%$ Tokens:StringResource, account.aspx.13 %>" 
                              LastNameCaption="<%$ Tokens:StringResource, account.aspx.14 %>" 
                              PasswordCaption="<%$ Tokens:StringResource, account.aspx.66 %>" 
                              PasswordConfirmCaption="<%$ Tokens:StringResource, account.aspx.67 %>" 
                              PhoneCaption="<%$ Tokens:StringResource, account.aspx.23 %>"
                              SaveCCCaption="<%$ Tokens:StringResource, account.aspx.65 %>" 
                              OKToEmailCaption="<%$ Tokens:StringResource, account.aspx.24 %>" 
                              OKToEmailNoCaption="<%$ Tokens:StringResource, account.aspx.26 %>" 
                              OKToEmailYesCaption="<%$ Tokens:StringResource, account.aspx.25 %>"             
                              Over13Caption="<%$ Tokens:StringResource, createaccount.aspx.78 %>"             
                              VATRegistrationIDCaption="<%$ Tokens:StringResource, account.aspx.71 %>" 
                              PasswordNote="<%$ Tokens:StringResource, account.aspx.19 %>" 
                              OKToEmailNote="<%$ Tokens:StringResource, account.aspx.27 %>"
                              SaveCCNote="<%$ Tokens:StringResource, account.aspx.70 %>"
                              VATRegistrationIDInvalidCaption="<%$ Tokens:StringResource, account.aspx.72 %>"
                              SecurityCodeCaption="<%$ Tokens:StringResource, signin.aspx.21 %>" 
                              EmailRegExErrorMessage="<%$ Tokens:StringResource, account.aspx.78 %>"
                              EmailReqFieldErrorMessage="<%$ Tokens:StringResource, account.aspx.77 %>"
                              FirstNameReqFieldErrorMessage="<%$ Tokens:StringResource, account.aspx.75 %>"
                              LastNameReqFieldErrorMessage="<%$ Tokens:StringResource, account.aspx.76 %>"
                              PhoneReqFieldErrorMessage="<%$ Tokens:StringResource, account.aspx.79 %>"
                              EmailRegExValGrp="account" EmailReqFieldValGrp="account"
                              FirstNameReqFieldValGrp="account" LastNameReqFieldValGrp="account"
                              PhoneReqFieldValGrp="account"
                              PasswordValidateValGrp="account" Over13ValGrp="account"
                              EmailRegEx="^[a-zA-Z0-9][-\w\.\+]*@([a-zA-Z0-9][\w\-]*\.)+[a-zA-Z]{2,4}$"
                              ShowVATRegistrationID="<%$ Tokens:AppConfigBool, VAT.Enabled %>"
                              ShowOver13="<%$ Tokens:AppConfigBool, RequireOver13Checked %>"
                              ShowSaveCC="false"   
                              DisablePasswordAutocomplete="<%$ Tokens:AppConfigBool, DisablePasswordAutocomplete %>"                            
                              />
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
        </table>

        <center>
            <p>
                <asp:Button ID="btnUpdateAccount" CssClass="UpdateAccountButton" Text="<%$ Tokens:StringResource,account.aspx.28 %>" runat="server" CausesValidation="true" ValidationGroup="account" OnClick="btnUpdateAccount_Click"  />
                <asp:Button ID="btnContinueToCheckOut" CssClass="AccountPageContinueCheckoutButton" Text="<%$ Tokens:StringResource,account.aspx.60 %>" runat="server" CausesValidation="false" OnClick="btnContinueToCheckOut_Click" />
            </p>
        </center>    

    <br/>
	
    <table id="tblAccount" runat="server" width="100%" cellpadding="2" cellspacing="0" border="0" style="border-style: solid; border-width: 0px; border-color: #444444">
      <tr>
        <td align="left" valign="top">
          <asp:Image AlternateText="" ID="imgAddressbook"  runat="server" /><br/>

          <table width="100%" cellpadding="4" cellspacing="0" border="0" style="border-style: solid; border-width: 1px; border-color: #444444;">
            <tr>
              <td align="left" valign="top">
                <table width="100%" border="0">
                  <tr>
                    <td colspan="2">
                      <b><asp:Label ID="accountaspx29" runat="server" Text="<%$ Tokens:StringResource,account.aspx.29 %>" ></asp:Label></b><br />
                    </td>
                  </tr>

                  <tr>
                    <td valign="top" width="50%">
                     <asp:Panel ID="pnlBilling" runat="server">
                       <hr />
                        <b><asp:Label ID="accountaspx30" runat="server" Text="<%$ Tokens:StringResource,account.aspx.30 %>"></asp:Label>
                         &nbsp;&nbsp;&nbsp;&nbsp;</b>
                        <asp:HyperLink ID="lnkChangeBilling" runat="server" ></asp:HyperLink><br/>
                        <asp:Literal ID="litBillingAddress" runat="server"></asp:Literal>
                    </asp:Panel>
                    </td>

                    <td valign="top">
                    <asp:Panel ID="pnlShipping" runat="server">
                        <hr />
                        <b><asp:Label ID="accountaspx32" runat="server" Text="<%$ Tokens:StringResource,account.aspx.32 %>"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;</b>
                        <asp:HyperLink ID="lnkChangeShipping" runat="Server"></asp:HyperLink><br/>
                        <asp:Literal ID="litShippingAddress" runat="server"></asp:Literal>
                       </asp:Panel>
                    </td>
                  </tr>

                  <tr>
                    <td valign="top" width="50%"><br /><b><asp:HyperLink ID="lnkAddBillingAddress" runat="server"></asp:HyperLink></b></td>
                    <td valign="top">
                       <asp:Panel ID="pnlShipping2" runat="server">
                        <br /><b><asp:HyperLink ID="lnkAddShippingAddress" runat="server"></asp:HyperLink></b>
                        </asp:Panel>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
            
        </td>
      </tr>
    </table>



    
        <br/>
        <br/>
        <asp:Table ID="tblPaymentMethods" CellSpacing="0" CellPadding="2" Width="100%" runat="server" Visible="false">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                    <asp:Image ID="PaymentMethods_gif" runat="server" AlternateText="" />
                    <br />
					
					<asp:Table ID="tblPaymentMethodsBox" CellSpacing="0" CellPadding="4" Width="100%" runat="server">
						<asp:TableRow>
							<asp:TableCell HorizontalAlign="left" VerticalAlign="top">

								<asp:Panel ID="pnlSecureNetPaymentMethods" runat="server" Visible="false">
									<aspdnsf:SecureNetVault runat="server" />
								</asp:Panel>

								<asp:Label runat="server" ID="LabelPanelMessage" Visible="false" />

								<asp:Panel ID="PanelWallet" runat="server" Visible="false">
									<div id="pnlCimWallet">
										<asp:ScriptManagerProxy ID="SMProxy" runat="server">
											<Scripts>
												<asp:ScriptReference Path="~/CIM/scripts/ajaxHelpers.js" />
												<asp:ScriptReference Path="~/jscripts/tooltip.js" />
											</Scripts>
										</asp:ScriptManagerProxy>
										<uc1:Wallet ID="Wallet" runat="server" />
										<script type="text/javascript" language="Javascript">
											Sys.Application.add_load(function () { var toolTip = new ToolTip('aCardCodeToolTip', 'CardCodeTooltip', '<iframe width="400" height="370" frameborder="0" marginheight="2" marginwidth="2" left="-50" top="-50" scrolling="no" src="App_Themes/skin_1/images/verificationnumber.gif"></iframe>'); });
										</script>
									</div>
								</asp:Panel>

							</asp:TableCell>
						</asp:TableRow>
					</asp:Table>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    


    <asp:Panel ID="pnlGiftCards" runat="server" Visible="false">
        <br/>
        <br/>
        <asp:Table ID="tblGiftCards" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                    <asp:Image ID="giftcards_gif" runat="server" AlternateText="" /><br />

                    <asp:Table ID="tblGiftCardsBox" CellSpacing="0" CellPadding="4" Width="100%" runat="server">
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                <table width="100%">
                                    <tr><td width="60%"><b>Gift Card Serial #</b></td><td><b>Balance</b></td></tr>
                                    <tr><td colspan="2"><hr/></td></tr>
                                    <asp:Repeater ID="rptrGiftCards" runat="server" >
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# ((AspDotNetStorefrontCore.GiftCard)Container.DataItem).SerialNumber %></td>
                                                <td><%# ThisCustomer.CurrencyString(((AspDotNetStorefrontCore.GiftCard)Container.DataItem).Balance) %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>
    
    <br />
    <br />
    <asp:Panel ID="pnlOrderHistory" runat="server">
       
        <asp:Literal ID="RecurringOrders" runat="Server"></asp:Literal>
        <a name="OrderHistory"></a>
        <table width="100%" cellpadding="2" cellspacing="0" border="0" style="border-style: solid; border-width: 0px; border-color: #444444">
          <tr>
            <td width="100%" align="left" valign="top">
              <asp:Image AlternateText="" runat="server" ImageUrl="" ID="imgOrderhistory" /><br />
              <table width="100%" cellpadding="4" cellspacing="0" border="0" style="border-style: solid; border-width: 1px; border-color: #444444;">
                <tr>
                  <td width="100%" align="left" valign="top">
                    <table width="100%" cellpadding="2" cellspacing="0" border="1">
                      <tr>
                        <td align="center" valign="top"><b><asp:Label ID="accountaspx36" runat="server" Text="<%$ Tokens:StringResource,account.aspx.36 %>" ></asp:Label></b><br />
                        <small><asp:Label ID="accountaspx37" runat="server" Text="<%$ Tokens:StringResource,account.aspx.37 %>" ></asp:Label></small></td>

                        <td align="center" valign="top"><b><asp:Label ID="accountaspx38" runat="server" Text="<%$ Tokens:StringResource,account.aspx.38%>"></asp:Label></b></td>

                        <td align="center" valign="top"><b><asp:Label ID="accountaspx39" runat="server" Text="<%$ Tokens:StringResource,account.aspx.39%>"></asp:Label></b></td>

                        <td align="center" valign="top"><b><asp:Label ID="accountaspx40" runat="server" Text="<%$ Tokens:StringResource,account.aspx.40 %>"></asp:Label></b></td>

                        <td align="center" valign="top"><b><asp:Label ID="accountaspx41" runat="server" Text="<%$ Tokens:StringResource,account.aspx.41 %>"></asp:Label></b></td>

                        <td align="center" valign="top"><b><asp:Label ID="accountaspx42" runat="server" Text="<%$ Tokens:StringResource,account.aspx.42 %>"></asp:Label></b></td>
                      </tr>
                        <asp:Repeater ID="orderhistorylist" runat="server">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td align="center" valign="top">
                                        <a target="_blank" href='<%#m_StoreLoc + "receipt.aspx?ordernumber=" + DataBinder.Eval(Container.DataItem, "OrderNumber") %>'><%# DataBinder.Eval(Container.DataItem, "OrderNumber").ToString() %></a>
                                        <%#GetReorder(DataBinder.Eval(Container.DataItem, "OrderNumber").ToString(), DataBinder.Eval(Container.DataItem, "RecurringSubscriptionID").ToString())%>
                                    </td>
                                    <td align="center" valign="top" width="150px"><%#AspDotNetStorefrontCore.Localization.ConvertLocaleDateTime(DataBinder.Eval(Container.DataItem, "OrderDate").ToString(), Localization.GetDefaultLocale(), ThisCustomer.LocaleSetting)%></td>
                                    <td align="center" valign="top"><%#GetPaymentStatus(DataBinder.Eval(Container.DataItem, "PaymentMethod").ToString(), DataBinder.Eval(Container.DataItem, "CardNumber").ToString(), DataBinder.Eval(Container.DataItem, "TransactionState").ToString(), DataBinder.Eval(Container.DataItem, "OrderTotal").ToString())%></td>
                                    <td align="center" valign="top"><%#"&nbsp;" + GetShippingStatus(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "OrderNumber").ToString()), DataBinder.Eval(Container.DataItem, "ShippedOn").ToString(), DataBinder.Eval(Container.DataItem, "ShippedVIA").ToString(), DataBinder.Eval(Container.DataItem, "ShippingTrackingNumber").ToString(), DataBinder.Eval(Container.DataItem, "TransactionState").ToString(), DataBinder.Eval(Container.DataItem, "DownloadEMailSentOn").ToString()) + "&nbsp;"%></td>
                                    <td align="center" valign="top"><%#GetOrderTotal(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "QuoteCheckout").ToString()), DataBinder.Eval(Container.DataItem, "PaymentMethod").ToString(), DataBinder.Eval(Container.DataItem, "OrderTotal").ToString(), Convert.ToInt32(DataBinder.Eval(Container.DataItem, "CouponType").ToString()), DataBinder.Eval(Container.DataItem, "CouponDiscountAmount"))%></td>
                                    <td align="center" valign="top"><%#"&nbsp;" + GetCustSvcNotes(DataBinder.Eval(Container.DataItem, "CustomerServiceNotes").ToString()) + "&nbsp;"%></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate></FooterTemplate>
                        </asp:Repeater>
                    </table>

                    <br/>
                    <asp:Label ID="accountaspx55" runat="server" Text="<%$ Tokens:StringResource,account.aspx.55 %>"></asp:Label>
                    <br/>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
    </asp:Panel>
    
    </asp:Panel>
</asp:Content>

