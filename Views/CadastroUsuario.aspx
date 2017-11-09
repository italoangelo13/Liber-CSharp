<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CadastroUsuario.aspx.cs" Inherits="Views_CadastroUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LIBER</title>
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../Assets/js/Mascaras.js"></script>
    <script src="https://use.fontawesome.com/99f7fad4a9.js"></script>
    <style type="text/css">
        .upper-case {
            text-transform: uppercase;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="jumbotron jumbotron-fluid col-sm-12">
                    <div class="container">
                        <h1 class="display-3">Cadastre-se no Liber</h1>
                        <p class="lead">Faça seu cadastro em poucos minutos e entre para a comunidade Liber</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12 col-lg-12">
                    <fieldset>
                        <legend class="alert alert-success">Dados do Usuario</legend>

                        <asp:ValidationSummary ID="_boxValida" runat="server" ValidationGroup="_validacaoCampos" HeaderText="Campos Obrigatórios" ShowMessageBox="True" ShowSummary="False" />
                        <div class="form-group form-row" style="margin-top: 10px;">
                            <div class="col-lg-6">

                                <p>
                                    <asp:TextBox ID="_edNome" runat="server" CssClass="form-control upper-case" Placeholder="nome" title="Informe o seu nome!"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="_validNome" runat="server" ErrorMessage="Campo de nome é obrigatorio." ControlToValidate="_edNome" ForeColor="#FF3300" SetFocusOnError="True" ValidationGroup="_validacaoCampos">*</asp:RequiredFieldValidator>
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
                                    <asp:RequiredFieldValidator ID="_validLogin" runat="server" ErrorMessage="Campo de Login é Obrigatorio." ControlToValidate="_edLogin" ForeColor="#FF3300" SetFocusOnError="True" ValidationGroup="_validacaoCampos">*</asp:RequiredFieldValidator>
                                </p>
                            </div>
                        </div>

                        <div class="form-group form-row">


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

                            <div class="col-lg-4">
                                <p>
                                    <asp:TextBox ID="_edSenha" runat="server" CssClass="form-control upper-case" TextMode="Password" Placeholder="Senha" title="Informe a sua senha!"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="_validSenha" runat="server" ErrorMessage="Campo de Senha é Obrigatório" ForeColor="#FF3300" SetFocusOnError="True" ValidationGroup="_validacaoCampos" ControlToValidate="_edSenha">*</asp:RequiredFieldValidator>
                                </p>
                            </div>

                            <div class="col-lg-4">
                                <p>
                                    <asp:TextBox ID="_edConfSenha" runat="server" CssClass="form-control upper-case" Placeholder="Confirmar Senha" title="Confirme a sua senha!" TextMode="Password"></asp:TextBox>
                                    <asp:CompareValidator ID="_validConfirm" runat="server" ErrorMessage="Senhas Digitadas não Conferem." ControlToCompare="_edSenha" ControlToValidate="_edConfSenha" ForeColor="Red" SetFocusOnError="True" ValidationGroup="_validacaoCampos">*</asp:CompareValidator>
                                </p>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12 col-lg-12">
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
                <div class="col-sm-12 col-lg-12">
                    <asp:Panel ID="_pnlCliente" runat="server" CssClass="form-group">
                        <div class="form-row">
                            <div class="col-lg-2">
                                <p>
                                    <asp:TextBox ID="_edCPF" runat="server" CssClass="form-control upper-case" Placeholder="CPF" onKeydown="Mascara(this,Cpf);" title="Informe o seu CPF!" MaxLength="14"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-2">
                                <p>
                                    <asp:TextBox ID="_edCep" runat="server" CssClass="form-control upper-case" Placeholder="Cep" onKeydown="Mascara(this,Cep);" title="Informe o seu Cep!" MaxLength="9"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-2">
                                <p>
                                    <asp:DropDownList ID="_ddlUF" runat="server" CssClass="form-control upper-case" title="Informe a sua UF!" AutoPostBack="false">
                                        <asp:ListItem Value="0">UF</asp:ListItem>
                                    </asp:DropDownList>
                                </p>
                            </div>

                            <div class="col-lg-4">
                                <p>
                                    <asp:TextBox ID="_edCidade" runat="server" CssClass="form-control upper-case" Placeholder="Cidade" title="Informe o sua Cidade!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-1">
                                <p>
                                    <asp:TextBox ID="_edIbge" runat="server" CssClass="form-control upper-case" Placeholder="IBGE"  Visible="false"></asp:TextBox>
                                </p>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="col-lg-3">
                                <p>
                                    <asp:TextBox ID="_edBairro" runat="server" CssClass="form-control upper-case" Placeholder="bairro" title="Informe o seu Bairro!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-4">
                                <p>
                                    <asp:TextBox ID="_edEndereco" runat="server" CssClass="form-control upper-case" Placeholder="Endereço" title="Informe o seu Enderço!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-1">
                                <p>
                                    <asp:TextBox ID="_edNumero" runat="server" CssClass="form-control upper-case" Placeholder="Numero" onKeydown="Mascara(this,Integer);" title="Informe o numero da sua residencia!"></asp:TextBox>
                                </p>
                            </div>

                            <div class="col-lg-4">
                                <p>
                                    <asp:TextBox ID="_edComplemento" runat="server" CssClass="form-control upper-case" Placeholder="Complemento" title="Informe o complemento da sua residencia!"></asp:TextBox>
                                </p>
                            </div>
                        </div>
                        <div class="form-row">
                        </div>
                        <asp:Button ID="_btnSalvar" runat="server" Text="Salvar Informações" CssClass="btn btn-success btn-lg col-lg-4" ValidationGroup="_validacaoCampos" OnClick="_btnSalvar_Click" />
                    </asp:Panel>
                </div>
            </div>

            <footer class="row" style="height: 70px; background-color: #1f1e1e; margin-top: 10px;">
            <h4 style="color:#fff;">@Liber</h4>
        </footer>

        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="../Assets/js/bootstrap.min.js"></script>

    <!-- Adicionando JQuery -->
    <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

    <!-- Adicionando Javascript -->
    <script type="text/javascript">

          $(document).ready(function () {

              function limpa_formulário_cep() {
                  // Limpa valores do formulário de cep.
                  $("#_edEndereco").val("");
                  $("#_edBairro").val("");
                  $("#_edCidade").val("");
                  $("#_ddlUF").val("MG");
                  $("#_edIbge").val("");
              }

              //Quando o campo cep perde o foco.
              $("#_edCep").blur(function () {

                  //Nova variável "cep" somente com dígitos.
                  var cep = $(this).val().replace(/\D/g, '');

                  //Verifica se campo cep possui valor informado.
                  if (cep != "") {

                      //Expressão regular para validar o CEP.
                      var validacep = /^[0-9]{8}$/;

                      //Valida o formato do CEP.
                      if (validacep.test(cep)) {

                          //Preenche os campos com "..." enquanto consulta webservice.
                          $("#_edEndereco").val("...");
                          $("#_edBairro").val("...");
                          $("#_edCidade").val("...");
                          $("#_ddlUF").val("...");
                          $("#_edIbge").val("...");

                          //Consulta o webservice viacep.com.br/
                          $.getJSON("//viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                              if (!("erro" in dados)) {
                                  //Atualiza os campos com os valores da consulta.
                                  $("#_edEndereco").val(dados.logradouro);
                                  $("#_edBairro").val(dados.bairro);
                                  $("#_edCidade").val(dados.localidade);
                                  $("#_ddlUF").val(dados.uf);
                                  $("#_edIbge").val(dados.ibge);
                                  $("#_edNumero").focus();
                              } //end if.
                              else {
                                  //CEP pesquisado não foi encontrado.
                                  limpa_formulário_cep();
                                  alert("CEP não encontrado.");
                              }
                          });
                      } //end if.
                      else {
                          //cep é inválido.
                          limpa_formulário_cep();
                          alert("Formato de CEP inválido.");
                      }
                  } //end if.
                  else {
                      //cep sem valor, limpa formulário.
                      limpa_formulário_cep();
                  }
              });
          });

    </script>

</body>
</html>
