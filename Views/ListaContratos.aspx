<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListaContratos.aspx.cs" Inherits="Views_ListaContratos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .grid {
            text-transform: uppercase;
            text-align: left;
            font-size: small;
            font-family: Arial;
        }

        .headerGrid {
            text-align: center;
            font-weight: 800;
            font-size: small;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <h4 class="col-sm-12 col-lg-12 alert alert-info text-lg-right">Solicitações de Agendamento & Pagamentos</h4>
            </div>


            <asp:Panel ID="_pnlServicos" runat="server" CssClass="row">
                <div class="col-sm-12 col-lg-12 ">
                    <asp:GridView ID="_gridContratos" runat="server" CssClass="table table-responsive grid" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowDataBound="_gridContratos_RowDataBound" OnSelectedIndexChanged="_gridContratos_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField HeaderText="CÓD" DataField="CON_CODIGO_ID" SortExpression="CON_CODIGO_ID" />
                            <asp:BoundField HeaderText="DT. CONTRATO" DataField="CON_DATA_CONTRATO" SortExpression="CON_DATA_CONTRATO" DataFormatString="{0:d}" />
                            <asp:BoundField HeaderText="SERVIÇO" DataField="SER_NOME" SortExpression="SER_NOME" />
                            <asp:BoundField HeaderText="PROFISSIONAL" DataField="USU_NOME" SortExpression="USU_NOME" />
                            <asp:BoundField HeaderText="VALOR" DataField="CON_VALOR_SERVICO" SortExpression="CON_VALOR_SERVICO" DataFormatString="{0:c}" />
                            <asp:BoundField HeaderText="DT. AGENDAMENTO" DataField="CON_DATA_AGENDAMENTO" SortExpression="CON_DATA_AGENDAMENTO" />
                            <asp:BoundField HeaderText="PREVISÃO DE TÉRMINO" DataField="CON_DATA_TERMINO" SortExpression="CON_DATA_TERMINO" />
                            <asp:BoundField HeaderText="STATUS" DataField="CON_CONFIRMADO" SortExpression="CON_CONFIRMADO" />
                            <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Assets/img/cartaoCredito.png" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="headerGrid" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                </div>
            </asp:Panel>


            <asp:Panel ID="_pnlPagamento" runat="server" CssClass="row" Visible="False">
                <div class="col-lg-12 col-sm-12">
                    <h3>Informações do Serviço</h3>
                    <div class="form-group form-row alert alert-warning">
                        
                        <div class="col-lg-2">
                            <p>
                                <h4>Código: <asp:Label ID="_lblCodigoServico" runat="server" Text=""></asp:Label></h4>
                            </p>
                        </div>

                        <div class="col-lg-8">
                            <p>
                               <h4>Serviço: <asp:Label ID="_lblServico" runat="server" Text=""></asp:Label></h4>
                            </p>
                        </div>

                        <div class="col-lg-2">
                            <p>
                               <h4>Valor: <asp:Label ID="_lblValor" runat="server" Text=""></asp:Label></h4>
                            </p>
                        </div>

                        <div class="col-lg-6">
                            <p>
                               <h4>Data Agendada: <asp:Label ID="_lblData" runat="server" Text=""></asp:Label></h4>
                            </p>
                        </div>

                        <div class="col-lg-6">
                            <p>
                               <h4>Profissional: <asp:Label ID="_lblProfissional" runat="server" Text=""></asp:Label></h4>
                            </p>
                        </div>
                    </div>

                    <h3>Informações Para Pagamento</h3>
                    <div class="form-group form-row">
                        <div class="col-lg-3">
                            <p>
                                <asp:TextBox ID="_ednumCartao" runat="server" CssClass="form-control upper-case form-control-lg" TextMode="SingleLine" Placeholder="Numero do cartão" Enabled="true"></asp:TextBox>
                            </p>
                        </div>

                        <div class="col-lg-1">
                            <p>
                               <asp:TextBox ID="_edCC" runat="server" CssClass="form-control upper-case form-control-lg" TextMode="SingleLine" Placeholder="CC" Enabled="true"></asp:TextBox>
                            </p>
                        </div>
                    </div>

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
