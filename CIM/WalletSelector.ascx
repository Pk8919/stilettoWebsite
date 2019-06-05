<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WalletSelector.ascx.cs" Inherits="CIM_WalletSelector" %>
<asp:UpdatePanel ID="PanelWallet" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Repeater ID="ListViewCreditCards" runat="server" OnItemDataBound="ListViewCreditCards_ItemDataBound">
            <HeaderTemplate>
                <table>
            </HeaderTemplate>
            <FooterTemplate>
                </table></FooterTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <div id="walletUseCardWrap">
                            <asp:RadioButton runat="server" ID="ButtonBillCard" GroupName="BillCard" Text=""
                                CommandName="BillThisCard" AutoPostBack="true" 
                                OnCheckedChanged="BillThisCard_CheckChanged" /></div>
                    </td>
                    <td>
                        <asp:Image ID="ImageCard" CssClass="walletCardImage" runat="server" 
                            ImageUrl='<%# GatewayAuthorizeNet.DisplayTools.GetCardImage("~/App_Themes/Skin_1/images/", ((GatewayAuthorizeNet.PaymentProfileWrapper)Container.DataItem).CardType) %>' />
                    </td>
                    <td>
                        <div id="walletCardType">
                            <asp:Label ID="LabelCardType" runat="server" Text='<%#((GatewayAuthorizeNet.PaymentProfileWrapper)Container.DataItem).CardType %>' /></div>
                        <div id="walletCardNumber">
                            <asp:Label ID="LabelCardNumber" runat="server" Text='<%#((GatewayAuthorizeNet.PaymentProfileWrapper)Container.DataItem).CreditCardNumberMasked  %>' /></div>
                        <div id="walletCardExpDate">
                            Exp.
                            <asp:Label ID="LabelCardExpDate" runat="server" Text='<%#((GatewayAuthorizeNet.PaymentProfileWrapper)Container.DataItem).ExpirationMonth  %>' />
                            /
                            <asp:Label ID="Label1" runat="server" Text='<%#((GatewayAuthorizeNet.PaymentProfileWrapper)Container.DataItem).ExpirationYear %>' /></div>
                    </td>
                </tr>
            </ItemTemplate>
            <SeparatorTemplate>
                <tr>
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
            </SeparatorTemplate>
        </asp:Repeater>
        <asp:Panel ID="PanelNoSavedCards" runat="server" Visible="false">
            <asp:Literal runat="server" Text="<%$ Tokens:StringResource, account.aspx.105%>" />
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
