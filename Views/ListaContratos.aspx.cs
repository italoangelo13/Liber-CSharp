using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_ListaContratos : System.Web.UI.Page
{
    BancoDados banco = new BancoDados();
    static string codUsuario;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            codUsuario = Session["codUsuario"].ToString();
            atualizaGridContratos();
        }
    }

    protected void atualizaGridContratos()
    {
        banco.Query(@"SELECT    CON_CODIGO_ID,
                                CON_DATA_CONTRATO,
                                SER_NOME,
                                P.USU_NOME,
                                CON_DATA_AGENDAMENTO,
                                CON_VALOR_SERVICO,
                                CON_DATA_TERMINO,
                                CON_CONFIRMADO
                                FROM contrato
                                INNER JOIN servico ON (ser_codigo_id = CON_CODIGO_SERVICO)
                                inner join usuario P on (CON_CODIGO_PROFISSIONAL = USU_CODIGO_ID)
                                WHERE CON_CODIGO_CLIENTE = ?CON_CODIGO_CLIENTE");
        banco.SetParametro("?CON_CODIGO_CLIENTE",codUsuario);

        _gridContratos.DataSource = banco.ExecutarDataTable();
        _gridContratos.DataBind();
        
    }
}