<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DashBoardCliente.aspx.cs" Inherits="Views_DashBoardCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assets/fontello/css/fontello.css" rel="stylesheet" />
    <style>
        .box-dashboard {
            border-radius: 15px;
            border: 4px solid #fff;
            height: 300px;
        }

        .texto-dashborad {
            color: #fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <h5 class="col-12 col-lg-12 alert alert-success text-lg-right">Dashboard
                </h5>
            </div>

            
            <div class="row">

                <a href="" target="conteudo" class="col-12 col-lg-3" style="text-decoration: none;">
                    <center>

                    <div class=" box-dashboard bg-success">
                        <p>
                            <span class="icon-user texto-dashborad" style="font-size:150px;"></span>
                        </p>
                        <h3 class="texto-dashborad">
                            Perfil
                        </h3>
                    </div>
                    </center>
                </a>

                <a href="ContratoServicos.aspx" target="conteudo" class="col-12 col-lg-3" style="text-decoration: none;">
                    <center>

                    <div class=" box-dashboard bg-danger">
                        <p>
                            <span class="icon-cart-plus texto-dashborad" style="font-size:150px;"></span>
                        </p>
                        <h3 class="texto-dashborad">
                            Serviços
                        </h3>
                    </div>
                    </center>
                </a>

                <a href="" target="conteudo" class="col-12 col-lg-3" style="text-decoration: none;">
                    <center>

                    <div class=" box-dashboard bg-info">
                        <p>
                            <span class="icon-list texto-dashborad" style="font-size:150px;"></span>
                        </p>
                        <h3 class="texto-dashborad">
                            Meus Contratos
                        </h3>
                    </div>
                    </center>
                </a>

                <a href="" target="conteudo" class="col-12 col-lg-3" style="text-decoration: none;">
                    <center>

                    <div class=" box-dashboard bg-dark">
                        <p>
                            <span class="icon-star texto-dashborad" style="font-size:150px;"></span>
                        </p>
                        <h3 class="texto-dashborad">
                            Avaliar Serviços
                        </h3>
                    </div>
                    </center>
                </a>

                <a href="" target="conteudo" class="col-12 col-lg-3" style="text-decoration: none;">
                    <center>

                    <div class=" box-dashboard bg-warning">
                        <p>
                            <span class="icon-wrench texto-dashborad" style="font-size:150px;"></span>
                        </p>
                        <h3 class="texto-dashborad">
                            Profissionais
                        </h3>
                    </div>
                    </center>
                </a>


            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="../Assets/js/bootstrap.min.js"></script>
</body>
</html>
