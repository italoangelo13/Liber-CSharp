<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Agendamentos.aspx.cs" Inherits="Views_Agendamentos" %>

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
                <h4 class="col-sm-12 col-lg-12 alert alert-warning text-lg-right">Agendamentos</h4>
            </div>
            <asp:Panel ID="_pnlAgendamentos" runat="server" CssClass="row">
                <div class="col-lg-12" style="margin-bottom:15px;">
                    <h3>Agendamentos à confirmar</h3>
                    <hr />
                    <asp:GridView ID="_gridAgendamentos" CssClass="table table-responsive" runat="server" AlternatingRowStyle-CssClass="bg-primary text-warning" HeaderStyle-CssClass="bg-dark text-white" SelectedRowStyle-CssClass="bg-success text-white" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" EmptyDataText="NENHUM AGENDAMENTO ENCONTRADO." OnSelectedIndexChanged="_gridAgendamentos_SelectedIndexChanged">
                        <AlternatingRowStyle CssClass="bg-primary text-warning" />
                        <Columns>
                            <asp:BoundField HeaderText="Cod. Solicitação" DataField="CON_CODIGO_ID" SortExpression="CON_CODIGO_ID" />
                            <asp:BoundField HeaderText="Serviço" DataField="SER_NOME" SortExpression="SER_NOME"/>
                            <asp:BoundField HeaderText="Cliente" DataField="USU_NOME" SortExpression="USU_NOME"/>
                            <asp:BoundField HeaderText="Dt. Agendamento" DataField="CON_DATA_AGENDAMENTO" SortExpression="CON_DATA_AGENDAMENTO" />
                            <asp:BoundField HeaderText="Previsão de Término" DataField="CON_DATA_TERMINO" SortExpression="CON_DATA_TERMINO" />
                            <asp:BoundField HeaderText="Valor" DataField="CON_VALOR_SERVICO" SortExpression="CON_VALOR_SERVICO" DataFormatString="{0:c}"/>
                            <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Assets/img/confirmar.png" HeaderText="Confirmar" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle CssClass="bg-dark text-white" BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle CssClass="bg-success text-white" BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                </div>

                <div class="col-lg-12">
                    <h3>Agendamentos Confirmados e Pagos</h3>
                    <hr />
                    <asp:GridView ID="_gridConfirmados" CssClass="table table-responsive" EmptyDataText="NENHUM AGENDAMENTO ENCONTRADO." runat="server" AlternatingRowStyle-CssClass="bg-primary text-warning" HeaderStyle-CssClass="bg-dark text-white" SelectedRowStyle-CssClass="bg-success text-white" AutoGenerateColumns="False" OnSelectedIndexChanged="_gridConfirmados_SelectedIndexChanged">
                        <AlternatingRowStyle CssClass="bg-primary text-warning" />
                        <Columns>
                            <asp:BoundField HeaderText="Cod. Solicitação" DataField="CON_CODIGO_ID" SortExpression="CON_CODIGO_ID" />
                            <asp:BoundField HeaderText="Serviço" DataField="SER_NOME" SortExpression="SER_NOME"/>
                            <asp:BoundField HeaderText="Cliente" DataField="USU_NOME" SortExpression="USU_NOME"/>
                            <asp:BoundField HeaderText="Dt. Agendamento" DataField="CON_DATA_AGENDAMENTO" SortExpression="CON_DATA_AGENDAMENTO" />
                            <asp:BoundField HeaderText="Previsão de Término" DataField="CON_DATA_TERMINO" SortExpression="CON_DATA_TERMINO" />
                            <asp:BoundField HeaderText="Valor" DataField="CON_VALOR_SERVICO" SortExpression="CON_VALOR_SERVICO" DataFormatString="{0:c}"/>
                            <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Assets/img/cancelar.png" HeaderText="Confirmar" />
                        </Columns>
                        <HeaderStyle CssClass="bg-dark text-white" />
                        <SelectedRowStyle CssClass="bg-success text-white" />
                    </asp:GridView>
                </div>
            </asp:Panel>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="../Assets/js/bootstrap.min.js"></script>
    <script src="../Assets/js/Mascaras.js"></script>
</body>
</html>
