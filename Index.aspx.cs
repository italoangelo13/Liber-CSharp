using System;
using System.Collections.Generic;
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
            new ShowMenssage(this).Show("Informe o seu Login.");
            _edLogin.Focus();
            return;
        }

        if (String.IsNullOrEmpty(_edSenha.Text))
        {
            new ShowMenssage(this).Show("Informe o sua Senha.");
            _edLogin.Focus();
        }

        if()
    }
}