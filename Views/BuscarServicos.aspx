<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BuscarServicos.aspx.cs" Inherits="Views_ContratoServicos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"></asp:ScriptManager>
        <asp:Panel ID="_pnlPrincipal" runat="server" CssClass="container-fluid">
            <div class="row">
                <h4 class="col-sm-12 col-lg-12 alert alert-dark text-lg-right">Serviços</h4>
            </div>

            <div class="row">
                <div class="col-sm-12 col-lg-12">
                    <h5>Critérios De Busca</h5>
                    <hr />
                    <table class="table-responsive" style="width: 100%">
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
                            <asp:CommandField HeaderText="Contratar" ShowSelectButton="True" SelectImageUrl="~/Assets/img/contrato.png" SelectText="Contratar">
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
            <div class="row alert alert-dark">
                <h6 class="col-sm-12 col-lg-10 ">Informações do Serviços</h6>
                <asp:Button ID="_btnVoltar" runat="server" Text="Fechar" CssClass="col-sm-12 col-lg-2 btn btn-danger" />
            </div>

            <div class="row">
                <div class="col-sm-12 col-lg-12">
                    <div class="form-row">
                        <div class="form-group col-lg-1">
                            <label for="_edCodServico">Código</label>
                            <asp:TextBox ID="_edCodServico" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="_edNomeServico">Serviço</label>
                            <asp:TextBox ID="_edNomeServico" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="form-group col-lg-2">
                            <label for="_edValorServico">Valor</label>
                            <asp:TextBox ID="_edValorServico" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="form-group col-lg-2">
                            <label for="_edCategoria">Categoria</label>
                            <asp:TextBox ID="_edCategoria" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group col-lg-3">
                            <label for="_tempoServico">Tempo de Execução</label>
                            <asp:TextBox ID="_tempoServico" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-lg-7">
                            <label for="_edDescricaoServico">Descrição</label>
                            <asp:TextBox ID="_edDescricaoServico" runat="server" CssClass="form-control" Height="50px" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group col-lg-3">
                            <label for="_edProfissionalservico">Profissional</label>
                            <asp:TextBox ID="_edProfissionalservico" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group col-lg-1">
                            <label for="_edPontuacao">Pontuação</label>
                            <asp:TextBox ID="_edPontuacao" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-lg-2">
                            <label for="_edData">Data</label>
                            <asp:TextBox ID="_edData" runat="server" CssClass="form-control" MaxLength="10" onblur="" onkeydown="Mascara(this,Data);"></asp:TextBox>
                            <asp:CalendarExtender ID="_edData_CalendarExtender" runat="server" Format="dd/MM/yyyy" TargetControlID="_edData" TodaysDateFormat="dd/MM/yyyy"></asp:CalendarExtender>
                                <asp:MaskedEditExtender ID="_edData_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False" Mask="99/99/9999" MaskType="Date" TargetControlID="_edData"></asp:MaskedEditExtender>
                        </div>
                        <div class="form-group col-lg-1">
                            <label for="_edHora">Horario</label>
                            <asp:TextBox ID="_edHora" runat="server" CssClass="form-control" onkeydown="Mascara(this,Hora);" MaxLength="5"></asp:TextBox>
                        </div>
                    </div>
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
