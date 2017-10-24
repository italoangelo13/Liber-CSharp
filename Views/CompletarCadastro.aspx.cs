using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_CompletarCadastro : System.Web.UI.Page
{
    
    BancoDados banco = new BancoDados();
    
    protected void Page_Load(object sender, EventArgs e)
    {


        

        if (Session["autenticado"].ToString().Equals("N"))
        {
            Response.Redirect("../Index.aspx");
        }


        if (!IsPostBack)
        {
            string perfil;
            try
            {
                perfil = Session["perfil"].ToString();
            }
            catch
            {
                perfil = "1";
            }
            atualizaProfissoesPA();
            atualizaProfissoesPL();
            if (perfil.Equals("1"))
            {
                _camposPL.Visible = false;
                _CamposPA.Visible = false;
            }
            else if (perfil.Equals("2"))
            {
                _camposPL.Visible = true;
                _CamposPA.Visible = false;
            }
            else if(perfil.Equals("3"))
            {
                _camposPL.Visible = false;
                _CamposPA.Visible = true;
            }

            
        }
        
    }

    protected void atualizaProfissoesPL()
    {
        banco.Query("SELECT PROF_CODIGO_ID, PROF_NOME FROM profissao WHERE PROF_CATEGORIA = 2");
        _ddlProfissaoPL.DataSource = banco.ExecutarDataTable();
        _ddlProfissaoPL.DataTextField = "PROF_NOME";
        _ddlProfissaoPL.DataValueField = "PROF_CODIGO_ID";
        _ddlProfissaoPL.DataBind();
        _ddlProfissaoPL.Items.Insert(0, new ListItem("Selecione sua Profissão", "0"));
    }

    protected void atualizaProfissoesPA()
    {
        banco.Query("SELECT PROF_CODIGO_ID, PROF_NOME FROM profissao WHERE PROF_CATEGORIA = 3");
        _ddlProfissaoPA.DataSource = banco.ExecutarDataTable();
        _ddlProfissaoPA.DataTextField = "PROF_NOME";
        _ddlProfissaoPA.DataValueField = "PROF_CODIGO_ID";
        _ddlProfissaoPA.DataBind();
        _ddlProfissaoPA.Items.Insert(0, new ListItem("Selecione sua Profissão", "0"));
    }

    protected void _btnSalvar_Click(object sender, EventArgs e)
    {
        string perfil = Session["perfil"].ToString();
        if (String.IsNullOrEmpty(_edDataNascimento.Text) || _edDataNascimento.Equals("__/__/____"))
        {
            new ShowMenssage(this, "Campo vazio", "O campo Data de Nascimento é obrigatorio.");
            return;
        }

        banco.Query(@"UPDATE USUARIO SET USU_NASC = ?USU_NASC, USU_ESPECIALIDADE = ?USU_ESPECIALIDADE, USU_PROFISSAO = ?USU_PROFISSAO, USU_REGISTRO_PROF = ?USU_REGISTRO_PROF, USU_COMPLETO = 'S' WHERE USU_CODIGO_ID = ?USU_CODIGO_ID");

        if (perfil.Equals("2"))
        {
            if (_ddlProfissaoPL.SelectedIndex == 0)
            {
                new ShowMenssage(this, "Campo não Selecionado", "O campo de Profissão é obrigatorio.");
                return;
            }

            if (String.IsNullOrEmpty(_edEspecialidadePL.Text))
            {
                new ShowMenssage(this, "Campo vazio", "O campo Especialidade é obrigatorio.");
                return;
            }

            if (String.IsNullOrEmpty(_edRegistro.Text))
            {
                new ShowMenssage(this, "Campo vazio", "O campo Registro Profissional é obrigatorio.");
                return;
            }
            
            banco.SetParametro("?USU_ESPECIALIDADE", _edEspecialidadePL.Text);
            banco.SetParametro("?USU_PROFISSAO", _ddlProfissaoPL.SelectedValue);
            banco.SetParametro("?USU_REGISTRO_PROF", _edRegistro.Text);
        }

        else if (perfil.Equals("3"))
        {
            if (_ddlProfissaoPA.SelectedIndex == 0)
            {
                new ShowMenssage(this, "Campo não Selecionado", "O campo de Profissão é obrigatorio.");
                return;
            }

            if (String.IsNullOrEmpty(_edEspecialidadePA.Text))
            {
                new ShowMenssage(this, "Campo vazio", "O campo Especialidade é obrigatorio.");
                return;
            }

            
            banco.SetParametro("?USU_ESPECIALIDADE", _edEspecialidadePL.Text);
            banco.SetParametro("?USU_PROFISSAO", _ddlProfissaoPL.SelectedValue);
            banco.SetParametro("?USU_REGISTRO_PROF", _edRegistro.Text);
        }

        banco.SetParametro("?USU_NASC", DateTime.Parse(_edDataNascimento.Text));
        banco.SetParametro("?USU_CODIGO_ID", Session["codUsuario"].ToString());





        try
        {
            banco.Executar();
            new ShowMenssage(this, "Informações Salvas", "Seu cadastro foi completado com sucesso");
            if (perfil.Equals("1"))
            {
                Response.Redirect("PainelCliente.aspx");
            }
            else
            {
                Response.Redirect("PainelProfissional.aspx");
            }
            
        }
        catch(Exception ex)
        {
            new ShowMenssage(this, "Erro ao Salvar", "Não foi possivel salvar as informações. " + ex.Message);
            return;
        }
        



    }
}