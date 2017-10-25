<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PainelProfissional.aspx.cs" Inherits="Views_PainelCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <header class="row">
                <nav class="navbar navbar-expand-lg navbar-dark bg-danger col-12">
                    <asp:Label ID="_lblNomeUsuario" runat="server" Text="" CssClass="navbar-brand text-capitalize"></asp:Label>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto ">
                            <li class="nav-item active">
                                <asp:HyperLink ID="_lkperfil" runat="server" CssClass="nav-link" NavigateUrl="~/Views/DashBoardProfissional.aspx" Target="conteudo">Dashboard</asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:HyperLink ID="_lkRanking" runat="server" CssClass="nav-link" NavigateUrl="">Perfil</asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="_btnLogout" runat="server" CssClass="nav-link" OnClick="_btnLogout_Click">Sair</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>

            <div class="row">
                <iframe name="conteudo" id="conteudo" class="col-12" height="550px" src="DashBoardProfissional.aspx" style="border:0px;">

                </iframe>
            </div>


            <footer class="row" style="height: 70px; background-color: #1f1e1e; margin-top:0px;">
                <h4 style="color: #fff;">@Liber</h4>
            </footer>
        </div>


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="../Assets/js/bootstrap.min.js"></script>
        <script>

        </script>
    </form>
</body>
</html>
