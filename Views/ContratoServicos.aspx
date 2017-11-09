<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContratoServicos.aspx.cs" Inherits="Views_ContratoServicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .box-servicos tr {
            margin-bottom: 5px;
            margin-top: 5px;
        }
        .auto-style1 {
            width: 119px;
        }
        .auto-style2 {
            width: 161px;
        }
        .auto-style3 {
            width: 105px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="_pnlPrincipal" runat="server" CssClass="container-fluid">
            <div class="row">
                <h4 class="col-12 col-lg-12 alert alert-dark text-lg-right">Serviços</h4>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <h5>Critérios De Busca</h5>
                    <hr />
                    <table class="table-responsive" style="width:100%">
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label1" runat="server" Text="Pesquisar por:"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="_edServico" runat="server" CssClass="form-control" Width="100%" Placeholder="Nome do serviço"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="_btnPesquisar" runat="server" Text="Pesquisar" CssClass="btn btn-outline-primary" OnClick="_btnPesquisar_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label2" runat="server" Text="Filtros:"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:DropDownList ID="_ddlCategoria" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="_ddlCategoria_SelectedIndexChanged" Width="250px"></asp:DropDownList>
                            </td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="_ddlUF" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="_ddlUF_SelectedIndexChanged" Width="100px"></asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="_edCidade" runat="server" CssClass="form-control" Placeholder="Cidade" AutoCompleteType="Search" Width="400px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>

                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-12">

                    <asp:GridView ID="_Gridservicos" runat="server" CssClass="table table-responsive box-servicos" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" EmptyDataText="Nenhum Serviço Cadastrado em Nossa Base de Dados." ForeColor="#333333" GridLines="None" PageSize="25" OnSelectedIndexChanged="_Gridservicos_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:ImageField DataImageUrlField="imagem" ItemStyle-CssClass="img-thumbnail img-fluid">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:ImageField>
                            <asp:BoundField DataField="SER_CODIGO_ID" HeaderText="Cod" SortExpression="SER_CODIGO_ID">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SER_NOME" HeaderText="Serviço" SortExpression="SER_NOME" />
                            <asp:BoundField DataField="LOCALIDADE" HeaderText="Localidade" SortExpression="LOCALIDADE" />
                            <asp:BoundField DataField="SER_PRECO" DataFormatString="{0:c}" HeaderText="Valor" SortExpression="SER_PRECO" />
                            <asp:BoundField DataField="USU_NOME" HeaderText="Profissional" SortExpression="USU_NOME" />
                            <asp:BoundField DataField="CAT_NOME" HeaderText="Categoria" SortExpression="CAT_NOME" />
                            <asp:CommandField HeaderText="Contratar" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Assets/img/contrato.png">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:CommandField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </div>

            </div>
            </asp:Panel>

        <asp:Panel ID="_pnlContrato" runat="server" CssClass="container-fluid" Visible="False">
            <div class="row">
                <h4 class="col-12 col-lg-12 alert alert-dark text-lg-right">Serviços</h4>
            </div>

            <div class="row">
                <div class="col-lg-12">
                                       
                </div>
            </div>
        </asp:Panel>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="../Assets/js/bootstrap.min.js"></script>
    <script src="../Assets/js/Mascaras.js"></script>

</body>
</html>
