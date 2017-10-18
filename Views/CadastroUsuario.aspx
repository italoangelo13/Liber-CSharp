<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CadastroUsuario.aspx.cs" Inherits="Views_CadastroUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LIBER</title>
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../Assets/js/Mascaras.js"></script>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }

        .auto-style2 {
            height: 29px;
        }

        .upper-case {
            text-transform: uppercase;
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
                <div class="col-12 col-lg-12">
                    <fieldset>
                        <legend class="alert alert-success">Dados do Usuario</legend>
                        <div class="form-group form-row">
                            <div class="col-lg-6">

                                <p>
                                    <asp:TextBox ID="_edNome" runat="server" CssClass="form-control upper-case" Placeholder="Nome" title="Informe o seu nome!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-3">

                                <p>
                                    <asp:TextBox ID="_edEmail" runat="server" CssClass="form-control upper-case" TextMode="Email" Placeholder="Email" title="Informe o seu email!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-3">

                                <p>
                                    <asp:TextBox ID="_edLogin" runat="server" CssClass="form-control upper-case" Placeholder="Login" title="Informe o seu login!"></asp:TextBox>
                                </p>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <div class="col-lg-4">
                                <p>
                                    <asp:TextBox ID="_edSenha" runat="server" CssClass="form-control upper-case" TextMode="Password" Placeholder="Senha" title="Informe a sua senha!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-4">
                                <p>
                                    <asp:TextBox ID="_edConfSenha" runat="server" CssClass="form-control upper-case" TextMode="Password" Placeholder="Confirmar Senha" title="Confirme a sua senha!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-2">
                                <p>
                                    <asp:TextBox ID="_edTelefone" runat="server" CssClass="form-control upper-case" TextMode="Phone" Placeholder="Telefone" onKeydown="Mascara(this,Telefone);" title="Informe o seu telefone!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-2">
                                <p>
                                    <asp:TextBox ID="_edCelular" runat="server" CssClass="form-control upper-case" TextMode="Phone" Placeholder="Celular" onKeydown="Mascara(this,Telefone);" title="Informe o seu celular!"></asp:TextBox>
                                </p>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-12">
                    <div class="form-group form-row">
                        <div class="col-lg-12">
                            <p>
                                <asp:Label ID="Label1" runat="server" Text="Perfil Desejado" Font-Bold="True" Font-Names="Arial" Font-Size="Large"></asp:Label>
                            </p>
                            <p>
                                <asp:RadioButtonList ID="_rblPerfil" runat="server" RepeatDirection="Horizontal" CellPadding="3" CellSpacing="0">
                                    <asp:ListItem Selected="True" Value="1">Cliente</asp:ListItem>
                                    <asp:ListItem Value="2">Profissional Liberal</asp:ListItem>
                                    <asp:ListItem Value="3">Profissional Autônomo</asp:ListItem>
                                </asp:RadioButtonList>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-12">
                    <asp:Panel ID="_pnlCliente" runat="server" CssClass="form-group">
                        <div class="form-row">
                            <div class="col-lg-3">
                                <p>
                                    <asp:TextBox ID="_edCPD" runat="server" CssClass="form-control upper-case" Placeholder="CPF" onKeydown="Mascara(this,Cpf);" title="Informe o seu CPF!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-3">
                                <p>
                                    <asp:TextBox ID="_edCep" runat="server" CssClass="form-control upper-case" Placeholder="Cep" onKeydown="Mascara(this,Cep);" title="Informe o seu Cep!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-1">
                                <p>
                                    <asp:DropDownList ID="_ddlUF" runat="server" CssClass="form-control upper-case" title="Informe a sua UF!">
                                        <asp:ListItem Value="0">UF</asp:ListItem>
                                    </asp:DropDownList>
                                </p>
                            </div>

                            <div class="col-lg-5">
                                <p>
                                    <asp:DropDownList ID="_ddlCidade" runat="server" CssClass="form-control upper-case" title="Informe a sua Cidade!">
                                        <asp:ListItem Value="0">Selecione uma Cidade</asp:ListItem>
                                    </asp:DropDownList>
                                </p>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="col-lg-3">
                                <p>
                                    <asp:TextBox ID="_edBairro" runat="server" CssClass="form-control upper-case" Placeholder="bairro"  title="Informe o seu Bairro!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-4">
                                <p>
                                    <asp:TextBox ID="_edEndereco" runat="server" CssClass="form-control upper-case" Placeholder="Endereço"  title="Informe o seu Enderço!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-1">
                                <p>
                                    <asp:TextBox ID="_edNumero" runat="server" CssClass="form-control upper-case" Placeholder="Numero" onKeydown="Mascara(this,Integer);"  title="Informe o numero da sua residencia!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-4">
                                <p>
                                    <asp:TextBox ID="_edComplemento" runat="server" CssClass="form-control upper-case" Placeholder="Complemento"   title="Informe o complemento da sua residencia!"></asp:TextBox>
                                </p>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>

        </div>
    </form>
    <script src="../Assets/js/bootstrap.min.js"></script>
</body>
</html>
