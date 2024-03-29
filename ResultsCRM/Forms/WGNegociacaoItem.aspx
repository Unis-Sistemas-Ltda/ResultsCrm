﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WGNegociacaoItem.aspx.vb" Inherits="ResultsCRM.WGNegociacaoItem" %>

<%@ Register src="../UserControls/WUCNegociacaoTotais.ascx" tagname="WUCNegociacaoTotais" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../ResultsCRM.css" rel="stylesheet" type="text/css" />
</head>
<body id="body01" runat="server">
    <form id="form1" runat="server">
    <div class="SubTituloMovimento">Itens</div>
    <div>        
        <asp:Button ID="BtnNovoRegistro" runat="server" CssClass="Botao"  Text="Novo Registro" Width="102px" />&nbsp;
                <asp:LinkButton ID="BtnListarItens" runat="server"
             Height="17px" CssClass="CampoCadastro" Font-Bold="True" 
            onclientclick="window.open('WFNegociacaoItemPlanilha.aspx')">Lista Padrão</asp:LinkButton>
            
    </div>
    <div>
        <asp:Label ID="LblErro" runat="server" CssClass="Erro" Font-Bold="False"></asp:Label>
       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" CssClass="TextoCadastro" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None" Width="100%">
            <PagerSettings FirstPageText="1" LastPageText="Última" Mode="NumericFirstLast" 
                PageButtonCount="8" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Right" 
                VerticalAlign="Middle" />
            <Columns>
                <asp:BoundField DataField="seq_item" HeaderText="Seq." 
                    SortExpression="seq_item" >
                    <HeaderStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="cod_item" HeaderText="Item" 
                    SortExpression="cod_item" >
                    <HeaderStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="item_descricao" HeaderText="Descrição" 
                    SortExpression="item_descricao">
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="lote" HeaderText="Lote" >
                <FooterStyle HorizontalAlign="Center" Width="150px" />
                <HeaderStyle HorizontalAlign="Center" Width="150px" />
                <ItemStyle HorizontalAlign="Center" Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="qtd_pedida" DataFormatString="{0:F2}" 
                    HeaderText="Qtde." SortExpression="qtd_pedida" >
                    <HeaderStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="preco_unitario" DataFormatString="{0:F2}" 
                    HeaderText="R$&nbsp;Unitário" SortExpression="preco_unitario" >
                    <HeaderStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="valor_total_mercadoria" DataFormatString="{0:F2}" 
                    HeaderText="R$&nbsp;Total" SortExpression="valor_total_mercadoria" >
                    <HeaderStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" 
                            CommandArgument='<%# Eval("seq_item") %>' CommandName="ALTERAR" 
                            ImageUrl="~/Imagens/BtnEditar.png" ToolTip="Detalhes do registro" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("seq_item") %>' CommandName="ALTERARFICHA" ImageUrl="~/Imagens/BtnEditar.png" ToolTip="Ficha de Desenvolvimento" />
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton4" runat="server" CommandArgument='<%# Eval("seq_item") %>' CommandName="ALTERARFORMULA" ImageUrl="~/Imagens/BtnEditar.png" ToolTip="Fórmula do Item" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton3" runat="server" 
                            CommandArgument='<%# Eval("seq_item") %>' CommandName="EXCLUIR" 
                            ImageUrl="~/Imagens/BtnExcluir.png" 
                            onclientclick="return confirm('Deseja realmente excluir o item selecionado?');" 
                            ToolTip="Excluir o registro" Width="22px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Right" VerticalAlign="Bottom" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select ni.seq_item, ni.cod_item, i.descricao || ' ' || ni.narrativa item_descricao, ni.lote, ni.qtd_pedida, ni.preco_unitario, ni.valor_mercadoria, ni.icms_substituicao, ni.valor_ipi, ni.valor_total_mercadoria
  from negociacao_cliente_item ni inner join item i on ni.cod_item = i.cod_item
 where cod_negociacao_cliente = :codNegociacao
   and empresa = :empresa
   and estabelecimento = :estabelecimento
order by ni.seq_item ">
            <SelectParameters>
                <asp:SessionParameter Name=":codNegociacao" SessionField="SCodNegociacao" />
                <asp:SessionParameter Name=":empresa" SessionField="GlEmpresa" />
                <asp:SessionParameter Name=":estabelecimento" 
                    SessionField="SEstabelecimentoNegociacao" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    <asp:Button ID="BtnRefresh" runat="server" BackColor="White" 
        BorderColor="White" BorderStyle="None" BorderWidth="0px" ForeColor="White" 
        Height="1px" Width="1px" />
    
    </form>
</body>
</html>
