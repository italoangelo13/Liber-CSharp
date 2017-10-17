<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LIBER</title>
    <link href="Assets/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background-image:url('Assets/img/backgrounds/1.jpg')">
    <form id="form1" runat="server">
    <div class="container-fluid">
        <header class="row">
            <div class="col-12" style="background-color:#1f1e1e; padding: 5px; height: 50px">
            </div>
        </header>

        <div class="row">
            <div class="col-12 col-lg-8" style="text-align:center; padding-top: 100px; padding-bottom: 100px;">
                <h1 style="color:#fff; font-size: 400%;">Plataforma de Serviços Online!</h1>
                <img src="Assets/img/logo.png"  width="100%"/>
            </div>

            <div class="col-12 col-lg-4" style="background:#01579B; padding: 2%; padding-top: 150px; padding-bottom: 150px;">
                <h2 class="alert alert-primary" style="text-align:center">Acesso Restrito</h2>
                <div class="form-group">
                    <asp:TextBox ID="_edLogin" runat="server" CssClass="form-control" placeholder="Login"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="_edSenha" runat="server" CssClass="form-control" placeholder="Senha" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="_btnEntrar" runat="server" Text="Acessar" CssClass="btn btn-outline-success btn-lg" Width="100%" OnClick="_btnEntrar_Click"/>
                </div>
                <p style="color:#fff;">
                    Ainda não é Cadastrado no Liber? <asp:HyperLink ID="_cad" runat="server" ForeColor="White" NavigateUrl="~/Views/CadastroUsuario.aspx" Font-Size="Smaller" Font-Bold="True">Cadastre-se Agora</asp:HyperLink> e seja mais um usuario desta plataforma incrivel.
                </p>
            </div>
        </div>

        <footer class="row" style="height:70px; background-color:#1f1e1e">
            <h4 style="color:#fff;">@Liber</h4>
        </footer>
    </div>
    </form>

    <script src="Assets/js/bootstrap.min.js"></script>
</body>
</html>
