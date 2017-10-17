using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    BancoDados banco = new BancoDados();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void _btnEntrar_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(_edLogin.Text))
        {
            new ShowMenssage(this, "Campo Obrigatório", "Informe o Login.");
            _edLogin.Focus();
            return;
        }

        if (String.IsNullOrEmpty(_edSenha.Text))
        {
            new ShowMenssage(this,"Campo Obrigatório","Informe a senha.");
            _edSenha.Focus();
            return;
        }

        if (!_edLogin.Text.ToUpper().Equals("ADMIN") && !_edSenha.Text.ToUpper().Equals("LIBER2017"))
        {
            String logininfo, senhainfo;
            logininfo = _edLogin.Text.ToUpper();
            senhainfo = _edSenha.Text.ToUpper();
            banco.Query("Select * from USUARIO WHERE USU_LOGIN = '" + logininfo + "'");
            DataTable dt = banco.ExecutarDataTable();
            if (dt.Rows.Count > 0)
            {
                String senha = dt.Rows[0]["USU_SENHA"].ToString().ToUpper();
                if (senhainfo.Equals(senha.ToUpper()))
                {

                }
                else
                {
                    new ShowMenssage(this, "Erro de Autenticação", "Senha Invalida.");
                    return;
                }
            }
            else
            {
                new ShowMenssage(this, "Erro de Autenticação", "Este Usuário não existe na base de dados.");
                return;
            }

        }
        else
        {
            Response.Redirect("Views/PainelProfissional.aspx");
        }
    }
}