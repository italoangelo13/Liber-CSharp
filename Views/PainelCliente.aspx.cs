using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_PainelCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["autenticado"].ToString().Equals("N"))
        {
            Response.Redirect("../Index.aspx");
        }

        _lblNomeUsuario.Text = Session["nomeUsuario"].ToString().ToUpperInvariant();
        if (!IsPostBack)
        {
            
        }
    }
}