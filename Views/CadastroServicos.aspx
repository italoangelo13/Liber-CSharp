<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CadastroServicos.aspx.cs" Inherits="Views_CadastroServicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .form-control-lg{
            height: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <h5 class="alert alert-dark col-12 col-lg-12 text-lg-right">Cadastro de Serviços</h5>
            </div>

            <asp:Panel ID="_pnlInicial" runat="server" CssClass="row">
                <div class="col-12 col-lg-12" style="margin-bottom: 10px;">

                    <div class="form-group form-row" style="margin-top: 10px;">
                        <div class="col-lg-2" style="text-align: right;">
                            <p>
                                <label>Codigo</label>
                            </p>
                        </div>

                        <div class="col-lg-1">
                            <p>
                                <asp:TextBox ID="_edcodServico" runat="server" CssClass="form-control upper-case form-control-lg" TextMode="SingleLine" Placeholder="Codigo" Enabled="false"></asp:TextBox>
                            </p>
                        </div>
                    </div>

                    <div class="form-group form-row" style="margin-top: 10px;">
                        <div class="col-lg-2" style="text-align: right;">
                            <p>
                                <label>Serviço</label>
                            </p>
                        </div>

                        <div class="col-lg-5">
                            <p>
                                <asp:TextBox ID="_edNome" runat="server" CssClass="form-control upper-case form-control-lg" TextMode="SingleLine" Placeholder="Diga-nos o nome deste Serviço" Enabled="true"></asp:TextBox>
                            </p>
                        </div>

                        <div class="col-lg-2" style="text-align: right;">
                            <p>
                                <label>Tempo Estimado p/ realizar este serviço</label>
                            </p>
                        </div>

                        <div class="col-lg-2">
                            <p>
                                <asp:TextBox ID="_edTempo" runat="server" CssClass="form-control upper-case form-control-lg" TextMode="SingleLine" Placeholder="Em Minutos" Enabled="true"></asp:TextBox>
                            </p>
                        </div>
                    </div>

                    <div class="form-group form-row" style="margin-top: 10px;">
                        <div class="col-lg-2" style="text-align: right;">
                            <p>
                                <label>Categoria</label>
                            </p>
                        </div>

                        <div class="col-lg-3">
                            <p>
                                <asp:DropDownList ID="_ddlCategoria" runat="server" CssClass="form-control upper-case " Height="50px"></asp:DropDownList>
                            </p>
                        </div>

                        <div class="col-lg-2" style="text-align: right;">
                            <p>
                                <label>Valor</label>
                            </p>
                        </div>

                        <div class="col-lg-2">
                            <p>
                                <asp:TextBox ID="_edValor" runat="server" CssClass="form-control upper-case" TextMode="SingleLine" Placeholder="Qual é o Valor?" Enabled="true" Height="50px"></asp:TextBox>
                            </p>
                        </div>

                        <div class="col-lg-2">
                            <p>
                                <asp:DropDownList ID="_ddlMedida" runat="server" CssClass="form-control" Height="50px">
                                    <asp:ListItem Value="PH">Por Hora</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="PS">Por Serviço Prestado</asp:ListItem>
                                    <asp:ListItem Value="PD">Por Dia</asp:ListItem>
                                    <asp:ListItem Value="PM">Por Mês</asp:ListItem>
                                </asp:DropDownList>
                            </p>
                        </div>
                    </div>

                    <div class="form-group form-row" style="margin-top: 10px;">
                        <div class="col-lg-2" style="text-align: right;">
                            <p>
                                <label>Descrição do Serviço</label>
                            </p>
                        </div>

                        <div class="col-lg-9">
                            <p>
                                <asp:TextBox ID="_edDescricao" runat="server" CssClass="form-control upper-case form-control-lg" TextMode="MultiLine" onKeyDown="MaxLenght(this,500);" Placeholder="Conte-nos mais sobre o seu serviço." Enabled="true" Height="100px"></asp:TextBox>
                            </p>
                        </div>
                    </div>
                    <asp:Button ID="_btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-success btn-lg col-lg-4" OnClick="_btnSalvar_Click" />
                </div>



            </asp:Panel>

            <asp:Panel ID="_pnlRegistros" runat="server" CssClass="row">
                <div class="col-12 col-lg-12">
                    <h4 style="text-align: center" class="alert alert-warning">Meus Serviços</h4>
                    <asp:GridView ID="_gridServicos" runat="server" CssClass="table table-striped table-responsive" Width="100%" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EmptyDataText="NENHUM SERVIÇO REGISTRADO." ForeColor="Black" GridLines="Horizontal" OnRowDeleting="_gridServicos_RowDeleting" OnSelectedIndexChanged="_gridServicos_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="SER_CODIGO_ID" HeaderText="Cod" SortExpression="SER_CODIGO_ID" />
                            <asp:BoundField DataField="SER_NOME" HeaderText="Serviço" SortExpression="SER_NOME" />
                            <asp:BoundField DataField="SER_DESCRICAO" HeaderText="Descrição" SortExpression="SER_DESCRICAO" />
                            <asp:BoundField DataField="SER_PRECO" DataFormatString="{0:c}" HeaderText="Valor" SortExpression="SER_PRECO" />
                            <asp:BoundField DataField="CAT_NOME" HeaderText="Categoria" SortExpression="CAT_NOME" />
                            <asp:BoundField HeaderText="Pontuação" DataField="SER_PONTUACAO" SortExpression="SER_PONTUACAO" />
                            <asp:BoundField DataField="SER_DATA_CADASTRO" DataFormatString="{0:d}" HeaderText="Dt. Cadastro" SortExpression="SER_DATA_CADASTRO" />
                            <asp:CommandField ButtonType="Image" HeaderText="Editar" SelectImageUrl="~/Assets/img/edit.png" ShowSelectButton="True" />
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Assets/img/trash.png" HeaderText="Apagar" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                </div>
            </asp:Panel>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="../Assets/js/bootstrap.min.js"></script>
    <script src="../Assets/js/MascaraDinheiro.js"></script>
    <script src="../Assets/js/Mascaras.js"></script>
    <script type="text/javascript">
        $("#_edValor").maskMoney({ prefix: 'R$ ', allowNegative: true, thousands: '.', decimal: ',', affixesStay: false });
    </script>
    <script type="text/javascript">
        function MaxLenght(text, long) {

            var maxlength = new Number(long); // Change number to your max length.

            if (text.value.length > maxlength) {

                text.value = text.value.substring(0, maxlength);

                //alert(" Limite de " + long + " Caracteres");

            }
        }
    </script>
</body>
</html>
