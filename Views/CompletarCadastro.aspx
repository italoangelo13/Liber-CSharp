<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompletarCadastro.aspx.cs" Inherits="Views_CompletarCadastro" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
                <div class="jumbotron jumbotron-fluid col-12">
                    <div class="container">
                        <h1 class="display-3">Conclua o seu Cadastro</h1>
                        <p class="lead">Estamos quase terminando, Falta pouco!</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class=" col-12">
                    <div class="form-group">
                        <div class="col-lg-3">
                            <asp:Button ID="_btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-success btn-lg" Width="100%" OnClick="_btnSalvar_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <asp:Panel ID="_pnlCliente" runat="server" CssClass="col-12">
                    <div class="form-group form-row" style="margin-top: 10px;">
                        <div class="col-lg-2">

                            <p>
                                <asp:Label ID="Label1" runat="server" Text="Data de Nascimento"></asp:Label>
                                <asp:TextBox ID="_edDataNascimento" runat="server" CssClass="form-control upper-case" Placeholder="Data de Nascimento" onKeydown="Mascara(this,Data);"></asp:TextBox>
                                <asp:CalendarExtender ID="_edDataNascimento_CalendarExtender" runat="server" Format="dd/MM/yyyy" TargetControlID="_edDataNascimento" TodaysDateFormat="dd/MM/yyyy"></asp:CalendarExtender>
                                <asp:MaskedEditExtender ID="_edDataNascimento_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False" Mask="99/99/9999" MaskType="Date" TargetControlID="_edDataNascimento"></asp:MaskedEditExtender>
                            </p>
                        </div>
                    </div>

                    <asp:Panel ID="_camposPL" CssClass="form-group form-row" runat="server" Style="margin-top: 10px;" Visible="False">
                        <div class="col-lg-2">
                            <p>
                                <asp:Label ID="Label2" runat="server" Text="Profissão"></asp:Label>
                                <asp:DropDownList ID="_ddlProfissaoPL" runat="server" CssClass="form-control"></asp:DropDownList>
                            </p>
                        </div>

                        <div class="col-lg-2">
                            <p>
                                <asp:Label ID="Label3" runat="server" Text="Especialidade"></asp:Label>
                                <asp:TextBox ID="_edEspecialidadePL" runat="server" CssClass="form-control" placeholder="Especialidade"></asp:TextBox>
                            </p>
                        </div>

                        <div class="col-lg-2">
                            <p>
                                <asp:Label ID="Label4" runat="server" Text="Registro Profissional"></asp:Label>
                                <asp:TextBox ID="_edRegistro" runat="server" CssClass="form-control" placeholder="CRM, OAB, CREA, ETC."></asp:TextBox>
                            </p>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="_CamposPA" CssClass="form-group form-row" runat="server" Style="margin-top: 10px;" Visible="False">
                        <div class="col-lg-2">
                            <p>
                                <asp:Label ID="Label5" runat="server" Text="Profissão"></asp:Label>
                                <asp:DropDownList ID="_ddlProfissaoPA" runat="server" CssClass="form-control"></asp:DropDownList>
                            </p>
                        </div>

                        <div class="col-lg-2">
                            <p>
                                <asp:Label ID="Label6" runat="server" Text="Especialidade"></asp:Label>
                                <asp:TextBox ID="_edEspecialidadePA" runat="server" CssClass="form-control" placeholder="Especialidade"></asp:TextBox>
                            </p>
                        </div>
                    </asp:Panel>

                </asp:Panel>
            </div>

            <footer class="row" style="height: 70px; background-color: #1f1e1e; margin-top:40px;">
                <h4 style="color: #fff;">@Liber</h4>
            </footer>

        </div>
        <script src="../Assets/js/Mascaras.js"></script>
        <script src="../Assets/js/bootstrap.min.js"></script>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True">
        </asp:ScriptManager>
    </form>
</body>
</html>
