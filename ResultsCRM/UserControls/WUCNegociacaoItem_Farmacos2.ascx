﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="WUCNegociacaoItem_Farmacos2.ascx.vb" Inherits="ResultsCRM.WUCNegociacaoItem_Farmacos2" %>
<%@ Register Src="../OutrosControles/TextBoxNumerico.ascx" TagName="TextBoxNumerico" TagPrefix="uc1" %>
<%@ Register Src="../OutrosControles/TextBoxInteiro.ascx" TagName="TextBoxInteiro" TagPrefix="uc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="../OutrosControles/TextBoxData.ascx" TagName="TextBoxData" TagPrefix="uc3" %>

<link href="../ResultsCRM.css" rel="stylesheet" type="text/css" />
<link href="../ResultsCRMAjax.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" language="javascript" src="../ResultsCRM.js"></script>

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<table>
    <tr>
        <td>
            <table class="TextoCadastro_BGBranco" style="border: thin groove #CCCCCC; width: 495px;">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="LblBaseIcmsSubstituicao" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LblCodEmitente" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LblCNPJ" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LblUD" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LblValorUD" runat="server" Font-Bold="True" Text="0,0000" Style="text-align: right"
                            Width="60px" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="left">
                        <img alt="Detalhe do Item da Negociação"
                            src="../Imagens/DetalheItemNegociacao2.png" style="width: 420px; height: 18px" /></td>
                </tr>
                <tr>
                    <td style="width: 95px; text-align: right;">Seq. Item:</td>
                    <td class="CelulaCampoCadastro" colspan="1">
                        <asp:Label ID="LblSeqItem" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="Erro" colspan="4">
                        <asp:Label ID="LblErro" runat="server"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">Item:</td>
                    <td class="CelulaCampoCadastro" colspan="5">
                        <asp:TextBox ID="TxtCodItem" runat="server" CssClass="CampoCadastro"
                            Width="90px" AutoPostBack="True"></asp:TextBox>
                        <asp:ImageButton ID="BtnFiltrarItem" runat="server"
                            ImageUrl="~/Imagens/search.png" ToolTip="Pesquisar"
                            OnClientClick="ShowEditModal('../Pesquisas/WFPItem.aspx?textbox=TxtCodItem','EditModalPopupClientes','IframeEdit');" />

                        <asp:Label ID="LblDescricaoItem" runat="server" Font-Bold="True"
                            Height="17px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">Natur. Oper:</td>
                    <td class="CelulaCampoCadastro" colspan="5">
                        <asp:DropDownList ID="DdlNaturOper" runat="server" CssClass="CampoCadastro"
                            Width="400px" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">Qtd. Logística:</td>
                    <td class="CelulaCampoCadastro" style="vertical-align: bottom">
                        <asp:TextBox ID="TxtQuantidadeUD" runat="server" AutoPostBack="True"
                            Style="text-align: right" CssClass="CampoCadastro" Width="70px"></asp:TextBox>
                    </td>
                    <td class="CelulaCampoCadastro"
                        style="text-align: right">Un. Logística:</td>
                    <td class="CelulaCampoCadastro" colspan="3">
                        <asp:Label ID="LblDescricaoUD" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        <asp:Label ID="Label15" runat="server" Text="Qtd. Unitária:"></asp:Label>
                    </td>
                    <td class="CelulaCampoCadastro" style="vertical-align: bottom">
                        <asp:TextBox ID="TxtQuantidade" runat="server" AutoPostBack="True"
                            Style="text-align: right" CssClass="CampoCadastro" Width="70px"></asp:TextBox>
                    </td>
                    <td class="CelulaCampoCadastro" style="text-align: right;">Entrega:</td>
                    <td class="CelulaCampoCadastro" style="vertical-align: bottom">
                        <uc3:TextBoxData ID="TxtDataEntrega" runat="server" Width="70" />
                    </td>
                    <td class="CelulaCampoCadastro" style="vertical-align: bottom">&nbsp;</td>
                    <td class="CelulaCampoCadastro" style="vertical-align: bottom">&nbsp;</td>
                </tr>
                <tr>
                    <td style="vertical-align: top; text-align: right;">
                        <asp:Label ID="Label1" runat="server" Text="Narrativa:"></asp:Label>
                    </td>
                    <td class="CelulaCampoCadastro" colspan="5">
                        <asp:TextBox ID="TxtNarrativa" runat="server" CssClass="CampoCadastro"
                            Height="40px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="border-width: 1px; border-color: #C0C0C0; border-top-style: solid; border-left-style: solid;">R$ Fábrica:</td>
                    <td class="CelulaCampoCadastro"
                        style="border-width: 1px; border-color: #C0C0C0; border-top-style: solid;">% Desc.Com.1:</td>
                    <td class="CelulaCampoCadastro"
                        style="border-width: 1px; border-color: #C0C0C0; border-top-style: solid;">% Desc.Com.2:</td>
                    <td class="CelulaCampoCadastro"
                        style="border-width: 1px; border-color: #C0C0C0; border-top-style: solid;">% Desc.Com.3:</td>
                    <td class="CelulaCampoCadastro"
                        style="border-width: 1px; border-color: #C0C0C0; border-top-style: solid;">% Desc.Com.4:</td>
                    <td class="CelulaCampoCadastro"
                        style="border-width: 1px; border-color: #C0C0C0; border-top-style: solid; border-right-style: solid;">% Repasse:</td>
                </tr>
                <tr>
                    <td style="border-width: 1px; border-color: #C0C0C0; border-left-style: solid;">
                        <asp:TextBox ID="TxtPrecoUnitarioTabela" runat="server" CssClass="CampoCadastro"
                            Style="text-align: right" Width="70px"></asp:TextBox>
                    </td>
                    <td class="CelulaCampoCadastro">
                        <asp:TextBox ID="TxtDescCom1" runat="server" AutoPostBack="True"
                            Style="text-align: right" CssClass="CampoCadastro" Width="70px"></asp:TextBox>
                    </td>
                    <td class="CelulaCampoCadastro">
                        <asp:TextBox ID="TxtDescCom2" runat="server" AutoPostBack="True"
                            Style="text-align: right" CssClass="CampoCadastro" Width="70px"></asp:TextBox>
                    </td>
                    <td class="CelulaCampoCadastro">
                        <asp:TextBox ID="TxtDescCom3" runat="server" AutoPostBack="True"
                            Style="text-align: right" CssClass="CampoCadastro" Width="70px"></asp:TextBox>
                    </td>
                    <td class="CelulaCampoCadastro">
                        <asp:TextBox ID="TxtDescCom4" runat="server" AutoPostBack="True"
                            Style="text-align: right" CssClass="CampoCadastro" Width="70px"></asp:TextBox>
                    </td>
                    <td class="CelulaCampoCadastro"
                        style="border-width: 1px; border-color: #C0C0C0; border-right-style: solid;">
                        <asp:TextBox ID="TxtDescCom5" runat="server" AutoPostBack="True"
                            Style="text-align: right" CssClass="CampoCadastro" Width="70px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="border-width: 1px; border-color: #C0C0C0; border-left-style: solid;">
                        <asp:Label ID="Label2" runat="server"
                            Text="Unit. Líquido:" ToolTip="Preço unitário em Reais."></asp:Label>
                    </td>
                    <td class="CelulaCampoCadastro">
                        <asp:Label ID="LblLabelRecurso" runat="server"
                            Text="Recurso:"></asp:Label>
                    </td>
                    <td class="CelulaCampoCadastro">&nbsp;</td>
                    <td class="CelulaCampoCadastro">ICMS
            <asp:Label ID="LblAliquotaICMS" runat="server" BackColor="#F0F0F0"
                Style="background-color: #FFFFFF">0</asp:Label>
                        <asp:Label ID="Label8" runat="server" BackColor="#F0F0F0" Text="%:"
                            Style="background-color: #FFFFFF"></asp:Label>
                    </td>
                    <td class="CelulaCampoCadastro">
                        <asp:Label ID="Label3" runat="server" Text="ICMS ST:"></asp:Label>
                    </td>
                    <td class="CelulaCampoCadastro"
                        style="border-width: 1px; border-color: #C0C0C0; border-right-style: solid;">
                        <asp:Label ID="Label5" runat="server" Text="IPI"></asp:Label>
                        &nbsp;<asp:Label ID="LblAliquotaIPI" runat="server" BackColor="#F0F0F0"
                            Style="background-color: #FFFFFF">0</asp:Label>
                        <asp:Label ID="Label9" runat="server" BackColor="#F0F0F0" Text="%:"
                            Style="background-color: #FFFFFF"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="border-width: 1px; border-color: #C0C0C0; border-left-style: solid; border-bottom-style: solid;">R$ 
            <asp:Label ID="LblPrecoUnitario" runat="server" Font-Bold="True" Text="0,0000"></asp:Label>
                    </td>
                    <td class="CelulaCampoCadastro"
                        style="border-width: 1px; border-color: #C0C0C0; border-bottom-style: solid;">
                        <asp:Label ID="LblLabelRSRecurso" runat="server" Text="R$"></asp:Label>
                        &nbsp;<asp:Label ID="LblRecurso" runat="server" Font-Bold="True" Text="0,0000"></asp:Label>
                    </td>
                    <td class="CelulaCampoCadastro"
                        style="border-width: 1px; border-color: #C0C0C0; border-bottom-style: solid;">&nbsp;</td>
                    <td class="CelulaCampoCadastro"
                        style="border-width: 1px; border-color: #C0C0C0; border-bottom-style: solid;">R$
                        <asp:Label ID="LblICMS" runat="server" Font-Bold="True">0,0000</asp:Label>
                    </td>
                    <td class="CelulaCampoCadastro"
                        style="border-width: 1px; border-color: #C0C0C0; border-bottom-style: solid;">
                        <asp:Label ID="Label7" runat="server" Text="R$"></asp:Label>
                        &nbsp;<asp:Label ID="LblICMSST" runat="server" Font-Bold="True">0,0000</asp:Label>
                    </td>
                    <td class="CelulaCampoCadastro"
                        style="border-width: 1px; border-color: #C0C0C0; border-bottom-style: solid; border-right-style: solid;">
                        <asp:Label ID="Label17" runat="server" Text="R$"></asp:Label>
                        &nbsp;<asp:Label ID="LblIPI" runat="server" Font-Bold="True">0,0000</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="CelulaCampoCadastro" style="text-align: right">% Desc. Nota:</td>
                    <td class="CelulaCampoCadastro">
                        <asp:TextBox ID="TxtPercDesconto" runat="server" CssClass="CampoCadastro"
                            Width="70px"></asp:TextBox>
                    </td>
                    <td class="CelulaCampoCadastro" style="text-align: right">&nbsp;</td>
                    <td class="CelulaCampoCadastro" colspan="2" style="text-align: right">R$ Desc. Nota:</td>
                    <td class="CelulaCampoCadastro">
                        <asp:TextBox ID="TxtValorDesconto" runat="server" CssClass="CampoCadastro"
                            Style="text-align: right" Width="70px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">Vlr.&nbsp;Merc. 
            R$:</td>
                    <td class="CelulaCampoCadastro">
                        <asp:Label ID="LblValorMercadoria" runat="server" Font-Bold="True">0,00</asp:Label>
                    </td>
                    <td class="CelulaCampoCadastro" style="text-align: right">
                        <asp:Label ID="Label13" runat="server" Text="Vlr.Total R$:"></asp:Label>
                    </td>
                    <td class="CelulaCampoCadastro" style="text-align: left">
                        <asp:Label ID="LblValorTotal" runat="server" Font-Bold="True" Font-Size="8pt"
                            Style="text-align: right; background-color: #ECFFEC;" Width="60px"
                            BorderColor="#CCFFFF" BorderStyle="Solid" BorderWidth="1px"
                            ForeColor="#535353" Height="16px">0,00</asp:Label>
                    </td>
                    <td colspan="2" style="text-align: left">
                        <asp:Button ID="BtnGravar" runat="server" CssClass="Botao" Text="Gravar"
                            Width="60px" />
                        <asp:Button ID="Button1" runat="server" CssClass="Botao" Text="Voltar" />
                    </td>
                </tr>
            </table>
        </td>
        <td >
            <table class="TextoCadastro_BGBranco"  style="border: thin groove #CCCCCC; width: 495px;">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="Labelespacamento" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="left">
                        <img alt="Detalhes da Ficha de desenvolvimento do Produto"
                            src="../Imagens/DetalheFichaDesenvolvimento.png" style="width: 420px; height: 18px" /></td>
                </tr>
                 <tr>
                    <td style="vertical-align: top; text-align: right;">
                        <asp:Label ID="Label19" runat="server" Text="Nome do Produto:"></asp:Label>
                    </td>

                    <td colspan="5">
                        <asp:TextBox ID="TxtFdNomeProduto" runat="server" CssClass="CampoCadastro"
                            Width="379px"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td style="vertical-align: top; text-align: right;">
                        <asp:Label ID="Label18" runat="server" Text="Ação Desejada/Finalidade:"></asp:Label>
                    </td>

                    <td colspan="5">
                        <asp:TextBox ID="TxtFdAcaoDesejadaProduto" runat="server" CssClass="CampoCadastro"
                            Height="43px" TextMode="MultiLine" Width="379px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="CelulaCampoCadastro" style="text-align: right">
                        <asp:Label ID="Label4" runat="server" Text="Coloração do Produto:"></asp:Label></td>
                    <td colspan="5">
                        <asp:DropDownList ID="DdlFdColoracao" runat="server"
                            CssClass="CampoCadastro" Width="383px">
                            <asp:ListItem Value="0">-- Selecione --</asp:ListItem>
                            <asp:ListItem Value="1">Incolor</asp:ListItem>
                            <asp:ListItem Value="2">Com Pigmento</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                 <tr>
                    <td style="vertical-align: top; text-align: right;">
                        <asp:Label ID="Label20" runat="server" Text="Cor de referência:"></asp:Label>
                    </td>

                    <td colspan="5">
                        <asp:TextBox ID="TxtFdCorReferencia" runat="server" CssClass="CampoCadastro"
                            Width="379px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="CelulaCampoCadastro" style="text-align: right">
                        <asp:Label ID="Label6" runat="server" Text="Definição de Fragrância:"></asp:Label></td>
                    <td colspan="5">
                        <asp:DropDownList ID="DdlFdOdor" runat="server"
                            CssClass="CampoCadastro" Width="383px">
                            <asp:ListItem Value="0">-- Selecione --</asp:ListItem>
                            <asp:ListItem Value="1">Inodoro</asp:ListItem>
                            <asp:ListItem Value="2">Sem adição de Fragrância</asp:ListItem>
                            <asp:ListItem Value="3">Com adição de Fragrância</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="CelulaCampoCadastro" style="text-align: right">
                        <asp:Label ID="Label10" runat="server" Text="Direcionamento Olfativo da Fragrância:"></asp:Label></td>
                    <td colspan="5">
                        <asp:DropDownList ID="DdlFdOdorDirecionamento" runat="server"
                            CssClass="CampoCadastro" Width="383px">
                            <asp:ListItem Value="0">-- Selecione --</asp:ListItem>
                            <asp:ListItem Value="1">Doce</asp:ListItem>
                            <asp:ListItem Value="2">Floral</asp:ListItem>
                            <asp:ListItem Value="3">Frutal</asp:ListItem>
                            <asp:ListItem Value="4">Amadeirado</asp:ListItem>
                            <asp:ListItem Value="5">Suave</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
               
               
               
                <tr>
                    <td style="vertical-align: top; text-align: right;">
                        <asp:Label ID="Label21" runat="server" Text="Fragrância de referência:"></asp:Label>
                    </td>

                    <td colspan="5">
                        <asp:TextBox ID="TxtFdOdorReferencia" runat="server" CssClass="CampoCadastro"
                            Width="379px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="vertical-align: top; text-align: right;">
                        <asp:Label ID="Label22" runat="server" Text="Descrição do Produto:"></asp:Label>
                    </td>

                    <td colspan="5">
                        <asp:TextBox ID="TxtFdDescricaoProduto" runat="server" CssClass="CampoCadastro"
                            Height="43px" TextMode="MultiLine" Width="379px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top; text-align: right;">
                        <asp:Label ID="Label11" runat="server" Text="Produto de Referência:"></asp:Label>
                    </td>

                    <td colspan="5">
                        <asp:TextBox ID="TxtFdProdutoReferencia" runat="server" CssClass="CampoCadastro"  Width="379px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top; text-align: right;">
                        <asp:Label ID="Label12" runat="server" Text="Volume da Embalagem:"></asp:Label>
                    </td>
                    <td colspan="5">
                        <asp:TextBox ID="TxtFdVolumeEmbalagem" runat="server" Height="43px" TextMode="MultiLine" CssClass="CampoCadastro"  Width="379px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="CelulaCampoCadastro" style="text-align: right">
                        <asp:Label ID="Label14" runat="server" Text="Coloração da Embalagem:"></asp:Label>

                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="DdlFdCorEmbalagem" runat="server"
                            CssClass="CampoCadastro" Width="200px">
                            <asp:ListItem Value="0">-- Selecione --</asp:ListItem>
                            <asp:ListItem Value="1">Transparente</asp:ListItem>
                            <asp:ListItem Value="2">Branca</asp:ListItem>
                            <asp:ListItem Value="3">Preta</asp:ListItem>
                            <asp:ListItem Value="4">Ambar</asp:ListItem>
                            <asp:ListItem Value="5">Colorida</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="Label16" runat="server" Text="Em embalagens pretas, não é possível codificar data e validade, sendo necessário um espaço retangulo no rótulo"></asp:Label>
                        
                    </td>
                </tr>
                <tr>
                    <td class="CelulaCampoCadastro" style="text-align: right">
                        <asp:Label ID="Label23" runat="server" Text="Tipo de Material da Embalagem:"></asp:Label>

                    </td>
                    <td colspan="5">
                        <asp:DropDownList ID="DdlFdMpEmbalagem" runat="server"
                            CssClass="CampoCadastro" Width="383px">
                            <asp:ListItem Value="0">-- Selecione --</asp:ListItem>
                            <asp:ListItem Value="1">Vidro</asp:ListItem>
                            <asp:ListItem Value="2">Plástico</asp:ListItem>                          
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                     <td class="CelulaCampoCadastro" style="text-align: right">
                        <asp:Label ID="Label24" runat="server" Text="Tipo de Embalagem:"></asp:Label>

                    </td>
                    <td colspan="5">
                        <asp:DropDownList ID="DdlFdTipoEmbalagem" runat="server"
                            CssClass="CampoCadastro" Width="383px">
                            <asp:ListItem Value="0">-- Selecione --</asp:ListItem>
                            <asp:ListItem Value="1">Bisnaga</asp:ListItem>
                            <asp:ListItem Value="2">Pote</asp:ListItem>                          
                            <asp:ListItem Value="3">Frasco</asp:ListItem>  
                            <asp:ListItem Value="99">Outros</asp:ListItem>  
                        </asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                     <td class="CelulaCampoCadastro" style="text-align: right">
                        <asp:Label ID="Label25" runat="server" Text="Quantidade a Produzir:"></asp:Label>

                    </td>
                    <td colspan="5">
                        <asp:DropDownList ID="DdlFdQtdProduzir" runat="server"
                            CssClass="CampoCadastro" Width="383px">
                            <asp:ListItem Value="0">-- Selecione --</asp:ListItem>
                            <asp:ListItem Value="1">100 Un</asp:ListItem>
                            <asp:ListItem Value="2">500 Un</asp:ListItem>                          
                            <asp:ListItem Value="3">1000 Un</asp:ListItem>  
                            <asp:ListItem Value="4">1500 Un</asp:ListItem>  
                            <asp:ListItem Value="5">2000 Un</asp:ListItem>  
                            <asp:ListItem Value="6">2500 Un</asp:ListItem>  
                            <asp:ListItem Value="7">3000 Un</asp:ListItem>  
                            <asp:ListItem Value="8">3500 Un</asp:ListItem>  
                            <asp:ListItem Value="9">4000 Un</asp:ListItem>  
                            <asp:ListItem Value="10">4500 Un</asp:ListItem>  
                            <asp:ListItem Value="11">5000 Un</asp:ListItem>  
                            <asp:ListItem Value="12">Acima 5000 Un</asp:ListItem>  
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<%--este é o html para pesquisa de itens--%>
<cc1:ModalPopupExtender ID="ModalPopupExtender2" BackgroundCssClass="ModalPopupBG"
    runat="server" CancelControlID="ButtonEditCancel" OkControlID="ButtonEditDone"
    TargetControlID="BtnFiltrarItem" PopupControlID="DivEditWindow"
    OnCancelScript="EditCancelScript('IframeEdit');" OnOkScript="EditOkayScript('IframeEdit');"
    BehaviorID="EditModalPopupClientes">
</cc1:ModalPopupExtender>
<%--botões padrão que ficam ocultos, são necessários, não remover--%>
<div class="popup_Buttons" style="display: none">
    <input id="ButtonEditDone" value="Done" type="button" />
    <input id="ButtonEditCancel" value="Cancel" type="button" />
</div>
<%--frame onde é mostrado o popup--%>
<div id="DivEditWindow" style="display: none;" class="popupConfirmation">
    <iframe id="IframeEdit" frameborder="0" width="480" height="350" scrolling="no"></iframe>
</div>
