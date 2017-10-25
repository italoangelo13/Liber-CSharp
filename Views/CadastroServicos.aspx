<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CadastroServicos.aspx.cs" Inherits="Views_CadastroServicos" %>

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
                <h5 class="alert alert-dark col-12 col-lg-12 text-lg-right">Cadastro de Serviços</h5>
            </div>

            <asp:Panel ID="_pnlInicial" runat="server" CssClass="row">
                <div class="col-12 col-lg-12">

                    <div class="form-group form-row" style="margin-top: 10px;">
                        <div class="col-lg-1">
                            <p>
                                <label>Codigo</label>
                            </p>
                        </div>

                        <div class="col-lg-1">
                            <p>
                                <asp:TextBox ID="_edcodServico" runat="server" CssClass="form-control upper-case" TextMode="SingleLine" Placeholder="Codigo" Enabled="false"></asp:TextBox>
                            </p>
                        </div>
                    </div>

                    <div class="form-group form-row" style="margin-top: 10px;">
                        <div class="col-lg-1">
                            <p>
                                <label>Serviço</label>
                            </p>
                        </div>

                        <div class="col-lg-3">
                            <p>
                                <asp:TextBox ID="_edNome" runat="server" CssClass="form-control upper-case" TextMode="SingleLine" Placeholder="Serviço" Enabled="true"></asp:TextBox>
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
</body>
</html>
