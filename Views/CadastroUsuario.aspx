<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CadastroUsuario.aspx.cs" Inherits="Views_CadastroUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LIBER</title>
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            height: 29px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="jumbotron jumbotron-fluid col-12">
                    <div class="container">
                        <h1 class="display-3">Cadastre-se no Liber</h1>
                        <p class="lead">Faça seu cadastro em poucos minutos e entre para a comunidade Liber</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-6">
                    <fieldset>
                        <legend>Dados do Usuario</legend>
                        <table style="width:100%">
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label1" runat="server" Text="Nome"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="_edNome" runat="server" CssClass="form-control" Width="90%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label2" runat="server" Text="Login"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="_edLogin" runat="server" CssClass="form-control" Width="30%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1" colspan="2">
                                    <asp:Label ID="Label3" runat="server" Text="Senha"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="_edSenha" runat="server" CssClass="form-control" TextMode="Password" Width="30%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label4" runat="server" Text="Confirmação de Senha"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" colspan="2">
                                    <asp:TextBox ID="_edConfSenha" runat="server" CssClass="form-control" TextMode="Password" Width="30%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="auto-style2">
                                    <asp:TextBox ID="_edEmail" runat="server" CssClass="form-control" TextMode="Email" Width="38%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label6" runat="server" Text="Telefone"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label7" runat="server" Text="Celular"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="_edTelefone" runat="server" CssClass="form-control" TextMode="Phone" Width="70%"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="_edCelular" runat="server" CssClass="form-control" TextMode="Phone" Width="70%"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </div>

                <div class="col-12 col-lg-6">
                    <fieldset>
                        <legend>Perfil do Usuario</legend>
                        <div class="form-group">
                            <asp:RadioButtonList ID="_rblPerfil" runat="server" CssClass="form-check form-check-input" style="left: -1px; top: 16px" CellPadding="2" CellSpacing="2" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="_rblPerfil_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="1" >Cliente</asp:ListItem>
                                <asp:ListItem Value="2">Profissional Liberal</asp:ListItem>
                                <asp:ListItem Value="3">Profissional Autonomo</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <asp:Panel ID="_pnlCliente" runat="server" Width="100%" CssClass="blockquote">
                            <table style="width:100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" Text="CPF"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="_edCpfCliente" runat="server" CssClass="form-control" TextMode="SingleLine" Width="40%"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </fieldset>
                </div>
            </div>

        </div>
    </form>
    <script src="../Assets/js/bootstrap.min.js"></script>
</body>
</html>
