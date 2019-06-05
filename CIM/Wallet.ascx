<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Wallet.ascx.cs" Inherits="CIM_Wallet" %>
<%@ Register Src="CreditCardEditor.ascx" TagName="CreditCardEditor" TagPrefix="uc1" %>

<div id="walletHeaderDescription">
    <span id="walletHeaderDescriptionText"></span>
</div>
<asp:UpdatePanel ID="PanelWallet" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Repeater ID="ListViewCreditCards" runat="server" OnItemCommand="ListViewCreditCards_ItemCommand"
            OnItemDataBound="ListViewCreditCards_ItemDataBound">
            <HeaderTemplate>
                <table>
            </HeaderTemplate>
            <FooterTemplate>
                </table></FooterTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Image ID="ImageCard" CssClass="walletCardImage" runat="server" 
                            ImageUrl='<%# GatewayAuthorizeNet.DisplayTools
                                .GetCardImage("~/App_Themes/Skin_1/images/", ((GatewayAuthorizeNet.PaymentProfileWrapper)Container.DataItem).CardType) %>' />
                    </td>
                    <td>
                        <div class="walletCardType">
                            <asp:Label ID="LabelCardType" runat="server" Text='<%#((GatewayAuthorizeNet.PaymentProfileWrapper)Container.DataItem).CardType %>' /></div>
                        <div class="walletCardNumber">
                            <asp:Label ID="LabelCardNumber" runat="server" Text='<%#((GatewayAuthorizeNet.PaymentProfileWrapper)Container.DataItem).CreditCardNumberMasked  %>' /></div>
                        <div class="walletCardExpDate">
                            Exp.
                            <asp:Label ID="LabelCardExpDate" runat="server" Text='<%#((GatewayAuthorizeNet.PaymentProfileWrapper)Container.DataItem).ExpirationMonth  %>' />
                            /
                            <asp:Label ID="Label1" runat="server" Text='<%#((GatewayAuthorizeNet.PaymentProfileWrapper)Container.DataItem).ExpirationYear %>' /></div>
                    </td>
                    <td>
                        <div class="walletRemoveButtonWrap">
                            <asp:Button runat="server" ID="ButtonRemoveCard" Text="<%$ Tokens:StringResource, account.aspx.102%>" CommandName="Delete" CssClass="walletButton"
                                CommandArgument='<%#((GatewayAuthorizeNet.PaymentProfileWrapper)Container.DataItem).ProfileId %>' /></div>
                        <div class="walletEditButtonWrap">
                            <asp:Button runat="server" ID="ButtonEditCard" CssClass="walletButton" Text="<%$ Tokens:StringResource, account.aspx.103%>" CommandName="Edit" CommandArgument='<%#((GatewayAuthorizeNet.PaymentProfileWrapper)Container.DataItem).ProfileId %>' /></div>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <div id="walletAddPaymentWrap">
            <asp:Button runat="server" Text="<%$ Tokens:StringResource, account.aspx.104%>" CssClass="walletButton" ID="ButtonAddPaymentType" OnClick="ButtonAddPaymentType_Click" />
            <asp:Panel runat="server" ID="PanelAddPaymentType">
                <uc1:CreditCardEditor ID="CreditCardEditor1" runat="server" />
            </asp:Panel>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
