using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_CadastroUsuario : System.Web.UI.Page
{
    BancoDados banco = new BancoDados();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            atualizaEstado();
        }
    }

    protected void atualizaEstado()
    {
        banco.Query("SELECT UF_SIGLA FROM estado");
        _ddlUF.DataSource = banco.ExecutarDataTable();
        _ddlUF.DataTextField = "UF_SIGLA";
        _ddlUF.DataValueField = "UF_SIGLA";
        _ddlUF.DataBind();
        _ddlUF.Items.Insert(0, new ListItem("Selecione uma UF", "0"));
    }


    
    
    protected void _btnSalvar_Click(object sender, EventArgs e)
    {
        if (_ddlUF.SelectedIndex == 0)
        {
            new ShowMenssage(this, "Campo Obrigatório", "Informe a sua UF.");
            _ddlUF.Focus();
            return;
        }

        if (String.IsNullOrEmpty(_edCidade.Text))
        {
            new ShowMenssage(this, "Campo Obrigatório", "Informe a sua Cidade.");
            _edCidade.Focus();
            return;
        }

        //----- Verifica se o Login Informado ja exise ---//
        banco.Query(@"SELECT USU_LOGIN FROM USUARIO WHERE USU_LOGIN = '" + _edLogin.Text.ToUpper() + "'");
        DataTable dt = banco.ExecutarDataTable();
        if (dt.Rows.Count > 0)
        {
            new ShowMenssage(this, "Login já existe!", "Este Login ja esta cadastrado, favor informar outro.");
            _edLogin.Focus();
            return;
        }

        int codigoIBGE = 0;
        // ------ Verifica se o codigo do ibge foi informado ----//
        if (String.IsNullOrEmpty(_edIbge.Text))
        {
            banco.Query(@"SELECT MUN_CODIGO_IBGE FROM municipio where MUN_NOME = '" + _edCidade.Text.ToUpper() + "'");
            DataTable dt2 = banco.ExecutarDataTable();
            if (dt2.Rows.Count > 0)
            {
                codigoIBGE = int.Parse(dt2.Rows[0]["MUN_CODIGO_IBGE"].ToString());
            }
            else
            {
                codigoIBGE = 0;
            }
        }
        else
        {
            codigoIBGE = int.Parse(_edIbge.Text);
        }


        //----- Caadstrando Usuário ----//
        banco.Query(@"insert into usuario (
                                           PERFIL_USUARIO_PERF_CODIGO_ID, 
                                           USU_NOME, 
                                           USU_ENDERECO, 
                                           USU_NUM_ENDERECO, 
                                           USU_BAIRRO, 
                                           USU_CIDADE, 
                                           USU_UF, 
                                           USU_CPF, 
                                           USU_LOGIN, 
                                           USU_SENHA, 
                                           USU_EMAIL, 
                                           USU_CEP, 
                                           USU_TELEFONE, 
                                           USU_CELULAR,
                                           USU_COMPLETO) 
                                   values 
                                          (
                                            ?PERFIL_USUARIO_PERF_CODIGO_ID, 
                                            ?USU_NOME, 
                                            ?USU_ENDERECO, 
                                            ?USU_NUM_ENDERECO, 
                                            ?USU_BAIRRO, 
                                            ?USU_CIDADE, 
                                            ?USU_UF, 
                                            ?USU_CPF, 
                                            ?USU_LOGIN, 
                                            ?USU_SENHA, 
                                            ?USU_EMAIL, 
                                            ?USU_CEP, 
                                            ?USU_TELEFONE, 
                                            ?USU_CELULAR,
                                            'N')");

        banco.SetParametro("?PERFIL_USUARIO_PERF_CODIGO_ID", _rblPerfil.SelectedValue);
        banco.SetParametro("?USU_NOME", _edNome.Text);
        try
        {
            banco.SetParametro("?USU_ENDERECO", _edEndereco.Text);
        }
        catch
        {
            banco.SetParametroNull("?USU_ENDERECO");
        }
        

        banco.SetParametro("?USU_NUM_ENDERECO", _edNumero.Text);
        banco.SetParametro("?USU_BAIRRO", _edBairro.Text);
        banco.SetParametro("?USU_CIDADE", codigoIBGE);
        banco.SetParametro("?USU_UF", _ddlUF.SelectedValue);
        banco.SetParametro("?USU_CPF", _edCPF.Text);
        banco.SetParametro("?USU_LOGIN", _edLogin.Text);
        banco.SetParametro("?USU_SENHA", _edSenha.Text);
        banco.SetParametro("?USU_EMAIL", _edEmail.Text);
        banco.SetParametro("?USU_CEP", _edCep.Text);
        banco.SetParametro("?USU_TELEFONE", _edTelefone.Text);
        banco.SetParametro("?USU_CELULAR", _edCelular.Text);

        try
        {
            banco.Executar();
            Thread.Sleep(5000);
            new ShowMenssage(this, "Cadastro Realizado com sucesso.", "Aguarde alguns instantes para acessar sua conta.");
            
            Response.Redirect("../index.aspx");
            
        }
        catch(Exception ex)
        {
            new ShowMenssage(this, "Erro ao Cadastrar - " + ex.Message, "Não foi Possivel Realizar o Cadastro, Tente Novamente");
            return;
        }
    }
}