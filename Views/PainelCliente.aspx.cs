using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_PainelCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            try
            {
                if (Session["autenticado"].ToString().Equals("N"))
                {
                    Response.Redirect("../Index.aspx");
                }

                _lblNomeUsuario.Text = Session["nomeUsuario"].ToString().ToUpper();
            }
            catch
            {
                new ShowMenssage(this, "Sessão Expirada!", "Sua Sessão Expirou.");
                Thread.Sleep(2000);
                Response.Redirect("../Index.aspx");
            }
        }
    }
    protected void _btnLogout_Click(object sender, EventArgs e)
    {
        Session["autenticado"] = "N";

        Session.RemoveAll();

        Response.Redirect("../Index.aspx");
    }
}