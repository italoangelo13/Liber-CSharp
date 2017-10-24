<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DashBoardCliente.aspx.cs" Inherits="Views_DashBoardCliente" %>

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
                <h4 class="col-12 col-lg-12 alert alert-success text-lg-right display-4">Dashboard
                </h4>
            </div>
            <div class="row">
                <div class="col-12">
                    <table style="width: 100%">
                        <tr>
                            <td style="padding:10px;">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Assets/img/perfil.png" />
                            </td>

                            <td style="padding:10px;">
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Assets/img/ranking.png" />
                            </td>

                            <td style="padding:10px;">
                                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Assets/img/meusContratos.png" />
                            </td>

                            <td style="padding:10px;">
                                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Assets/img/contratar.png" />
                            </td>
                        </tr>
                    </table>
                </div>

            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="../Assets/js/bootstrap.min.js"></script>
</body>
</html>
