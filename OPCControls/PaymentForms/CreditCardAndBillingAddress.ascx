<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreditCardAndBillingAddress.ascx.cs" Inherits="OPCControls_CreditCardAndBillingAddress" %>
<%@ Register Src="../Addresses/AddressBook.ascx" TagName="AddressBook" TagPrefix="uc1" %>
<%@ Register Src="../Addresses/BillingAddressNoZipEdit.ascx" TagName="BillingAddressEdit" TagPrefix="uc1" %>
<%@ Register Src="../Addresses/BillingAddressUKEdit.ascx" TagName="BillingAddressUKEdit" TagPrefix="uc1" %>
<%@ Register Src="../Addresses/BillingAddressStatic.ascx" TagName="BillingAddressStatic" TagPrefix="uc1" %>
<%@ Register Src="CreditCardPaymentForm.ascx" TagName="CreditCardPaymentForm" TagPrefix="uc1" %>
<%@ Register Src="FirstPayEmbeddedCheckoutPaymentForm.ascx" TagName="FirstPayForm" TagPrefix="uc1" %>
<%@ Register Src="../../CIM/WalletSelector.ascx" TagName="WalletSelector" TagPrefix="uc1" %>
<asp:UpdatePanel UpdateMode="Conditional" ChildrenAsTriggers="false" ID="UpdatePanelCreditCardAndBillingAddress"
    runat="server">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="BillSameYes" />
        <asp:AsyncPostBackTrigger ControlID="BillSameNo" />
    </Triggers>
    <ContentTemplate>
        <div class="paymentMethodContents subSection">
			<asp:Panel runat="server" ID="PanelChooseWalletOrNewCard">
				<asp:Panel ID="PanelSelectHeader" runat="server">
					<%# StringResourceProvider.GetString("smartcheckout.aspx.148") %>
				</asp:Panel>
				<asp:Panel ID="PanelSelectWallet" runat="server" CssClass="OPInset">
					<asp:RadioButton GroupName="BillWallet" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.149") %>' ID="RadioButtonWallet" runat="server" OnCheckedChanged="RadioButtonWallet_CheckedChanged" AutoPostBack="true" />
				</asp:Panel>
				<asp:Panel runat="server" ID="PanelWallet" CssClass="walletWrap">                
					<uc1:WalletSelector ID="WalletSelector1" runat="server" />
				</asp:Panel>
				<asp:Panel ID="PanelSelectAddNew" runat="server" CssClass="OPInset">
					<asp:RadioButton GroupName="BillWallet" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.150") %>' ID="RadioButtonNewCard" runat="server" OnCheckedChanged="RadioButtonNewCard_CheckedChanged" AutoPostBack="true" />
				</asp:Panel>
			</asp:Panel>
            <asp:Panel runat="server" ID="PanelAddACard" CssClass="addACardWrap">
                <asp:Panel runat="server" ID="PanelBillSame" Visible="true">
                    <div>
                        <asp:Label runat="server" ID="LabelBillSamePrompt" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.43") %>' CssClass="OPEmphasize" />
                    </div>
                    <div>
                        <asp:RadioButton GroupName="BillSame" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.136") %>' ID="BillSameYes" runat="server" OnCheckedChanged="BillSameYes_CheckedChanged" AutoPostBack="true" />
                    </div>
                    <div>
                        <asp:RadioButton GroupName="BillSame" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.137") %>' ID="BillSameNo" runat="server" OnCheckedChanged="BillSameNo_CheckedChanged" AutoPostBack="true" />
                    </div>
                </asp:Panel>
                <div class="subSection">
                    <asp:Panel runat="server" ID="PanelAddressBook" CssClass="modalAddressBookWindow">
                        <div id="BillingAddressBookBox">
                            <uc1:AddressBook ID="AddressBook1" runat="server" />
                            <br />
                            <asp:Button Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.134") %>' ID="ButtonAddressBookClose" runat="server" OnClientClick="return hideForm('BillingAddressBookBox');" />
                        </div>
                    </asp:Panel>
                    <asp:Label runat="server" ID="BillAddressHeader" CssClass="OPEmphasize" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.116") %>' />
                    <asp:LinkButton ID="HyperLinkBillingAddressBook" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.102") %>'
                        Visible="true" OnClientClick="return showForm('BillingAddressBookBox','modalAddressBookBackground');" />
                    <div class="billAddressWrap">
                        <uc1:BillingAddressEdit ID="BillingAddressEdit1" runat="server" Visible="false" />
                        <uc1:BillingAddressUKEdit ID="BillingAddressUKEdit1" runat="server" Visible="false" />
                        <uc1:BillingAddressStatic ID="BillingAddressStatic1" runat="server" Visible="false" />
                    </div>
                    <uc1:CreditCardPaymentForm ID="CreditCardPaymentForm1" runat="server" Visible="false" />
                    <uc1:FirstPayForm ID="FirstPayPaymentForm" runat="server" Visible="false" />
                </div>
            </asp:Panel>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
