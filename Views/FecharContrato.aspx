<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FecharContrato.aspx.cs" Inherits="Views_BuscarServicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="_pnlContrato" runat="server" CssClass="container-fluid" Visible="False">
            <div class="row alert alert-dark">
                <h4 class="col-sm-12 col-lg-10 ">Serviços</h4>
                <asp:Button ID="_btnVoltar" runat="server" Text="Fechar" CssClass="col-sm-12 col-lg-2 btn btn-danger" />
            </div>

            <div class="row">
                <div class="col-sm-12 col-lg-12">
                    <div class="form-row">
                        <div class="form-group col-md-1">
                            <label for="_edCodServico">Código</label>
                            <asp:TextBox ID="_edCodServico" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="_edNomeServico">Serviço</label>
                            <asp:TextBox ID="_edNomeServico" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-2">
                            <label for="_edValorServico">Valor</label>
                            <asp:TextBox ID="_edValorServico" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-2">
                            <label for="_edCategoria">Categoria</label>
                            <asp:TextBox ID="_edCategoria" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="_tempoServico">Tempo de Execução</label>
                            <asp:TextBox ID="_tempoServico" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-7">
                            <label for="_edDescricaoServico">Descrição</label>
                            <asp:TextBox ID="_edDescricaoServico" runat="server" CssClass="form-control" Height="50px" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="_edProfissionalservico">Profissional</label>
                            <asp:TextBox ID="_edProfissionalservico" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-1">
                            <label for="_edPontuacao">Pontuação</label>
                            <asp:TextBox ID="_edPontuacao" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
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
