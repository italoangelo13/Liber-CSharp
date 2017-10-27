<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContratoServicos.aspx.cs" Inherits="Views_ContratoServicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <h4 class="col-12 col-lg-12 alert alert-dark text-lg-right">Serviços</h4>
            </div>

            <div class="row">
                <div class="col-12 col-lg-12">
                    <asp:GridView ID="_Gridservicos" runat="server" CssClass="table table-responsive" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" EmptyDataText="Nenhum Serviço Cadastrado em Nossa Base de Dados." ForeColor="#333333" GridLines="None" PageSize="25">
                        <AlternatingRowStyle BackColor="White" ForeColor="#ffffff" CssClass="bg-success" />
                        <Columns>
                            <asp:ImageField DataImageUrlField="imagem" ItemStyle-CssClass="img-thumbnail img-fluid">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:ImageField>
                            <asp:BoundField DataField="SER_CODIGO_ID" HeaderText="Cod" SortExpression="SER_CODIGO_ID" >
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SER_NOME" HeaderText="Serviço" SortExpression="SER_NOME" />
                            <asp:BoundField DataField="LOCALIDADE" HeaderText="Localidade" SortExpression="LOCALIDADE" />
                            <asp:BoundField DataField="SER_PRECO" DataFormatString="{0:c}" HeaderText="Valor" SortExpression="SER_PRECO" />
                            <asp:BoundField DataField="USU_NOME" HeaderText="Profissional" SortExpression="USU_NOME" />
                            <asp:BoundField DataField="CAT_NOME" HeaderText="Categoria" SortExpression="CAT_NOME" />
                            <asp:CommandField HeaderText="Contratar" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Assets/img/contrato.png" >
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  />
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
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="../Assets/js/bootstrap.min.js"></script>
    <script src="../Assets/js/Mascaras.js"></script>
</body>
</html>
