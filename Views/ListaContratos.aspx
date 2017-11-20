<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListaContratos.aspx.cs" Inherits="Views_ListaContratos" %>

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
                <h4 class="col-sm-12 col-lg-12 alert alert-info text-lg-right">Meus Serviços</h4>
            </div>

            <div class="row">
                <div class="col-sm-12 col-lg-12 ">
                    <asp:GridView ID="_gridContratos" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField HeaderText="CÓDIGO" DataField="CON_CODIGO_ID" SortExpression="CON_CODIGO_ID"/>
                            <asp:BoundField HeaderText="DT. CONTRATO" DataField="CON_DATA_CONTRATO" SortExpression="CON_DATA_CONTRATO" DataFormatString="{0:d}"/>
                            <asp:BoundField HeaderText="SERVIÇO" DataField="SER_NOME" SortExpression="SER_NOME"/>
                            <asp:BoundField HeaderText="PROFISSIONAL" DataField="USU_NOME" SortExpression="USU_NOME"/>
                            <asp:BoundField HeaderText="VALOR" DataField="CON_VALOR_SERVICO" SortExpression="CON_VALOR_SERVICO" DataFormatString="{0:c}"/>
                            <asp:BoundField HeaderText="DT. AGENDAMENTO" DataField="CON_DATA_AGENDAMENTO" SortExpression="CON_DATA_AGENDAMENTO" />
                            <asp:BoundField HeaderText="PREVISÃO DE TÉRMINO" DataField="CON_DATA_TERMINO" SortExpression="CON_DATA_TERMINO" />
                            <asp:BoundField HeaderText="STATUS"/>
                            <asp:BoundField HeaderText="PAGAMENTO" />
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
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
