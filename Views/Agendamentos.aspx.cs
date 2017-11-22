using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Agendamentos : System.Web.UI.Page
{
    BancoDados banco = new BancoDados();
    static string codUsuario;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["autenticado"].ToString().Equals("N"))
        {
            Response.Redirect("../Index.aspx");
        }

        if (!IsPostBack)
        {
            codUsuario = Session["codUsuario"].ToString();
            atualizaGridAgendamentos();
            atualizaGridConfirmados();
        }
    }


    protected void atualizaGridAgendamentos()
    {
        banco.Query(@"SELECT    CON_CODIGO_ID,
                                SER_NOME,
                                P.USU_NOME,
                                CON_DATA_AGENDAMENTO,
                                CON_VALOR_SERVICO,
                                CON_DATA_TERMINO
                                FROM contrato
                                INNER JOIN servico ON (ser_codigo_id = CON_CODIGO_SERVICO)
                                inner join usuario P on ( CON_CODIGO_CLIENTE = USU_CODIGO_ID)
                                WHERE CON_CODIGO_PROFISSIONAL = ?CON_CODIGO_PROFISSIONAL and CON_CONFIRMADO = 'N' order by CON_DATA_CONTRATO Desc");
        banco.SetParametro("?CON_CODIGO_PROFISSIONAL", codUsuario);
        _gridAgendamentos.DataSource = banco.ExecutarDataTable();
        _gridAgendamentos.DataBind();
    }

    protected void atualizaGridConfirmados()
    {
        banco.Query(@"SELECT    CON_CODIGO_ID,
                                SER_NOME,
                                P.USU_NOME,
                                CON_DATA_AGENDAMENTO,
                                CON_VALOR_SERVICO,
                                CON_DATA_TERMINO
                                FROM contrato
                                INNER JOIN servico ON (ser_codigo_id = CON_CODIGO_SERVICO)
                                inner join usuario P on ( CON_CODIGO_CLIENTE = USU_CODIGO_ID)
                                WHERE CON_CODIGO_PROFISSIONAL = ?CON_CODIGO_PROFISSIONAL and CON_CONFIRMADO <> 'N' order by CON_DATA_CONTRATO Desc");
        banco.SetParametro("?CON_CODIGO_PROFISSIONAL", codUsuario);
        _gridConfirmados.DataSource = banco.ExecutarDataTable();
        _gridConfirmados.DataBind();
    }
    protected void _gridAgendamentos_SelectedIndexChanged(object sender, EventArgs e)
    {
        string codigo = _gridAgendamentos.SelectedRow.Cells[0].Text;
        banco.Query("UPDATE CONTRATO SET CON_CONFIRMADO = 'S' WHERE CON_CODIGO_ID = ?CON_CODIGO_ID");
        banco.SetParametro("?CON_CODIGO_ID", codigo);
        try{
            banco.Executar();
            atualizaGridAgendamentos();
            atualizaGridConfirmados();
        }
        catch{
            new ShowMenssage(this, "Falha de Confirmação", "Não foi possivel confirmar esta solicitação.");
            return;
        }
    }
    protected void _gridConfirmados_SelectedIndexChanged(object sender, EventArgs e)
    {
        string codigo = _gridConfirmados.SelectedRow.Cells[0].Text;
        banco.Query("SELECT CON_CONFIRMADO FROM CONTRATO WHERE CON_CODIGO_ID = ?CON_CODIGO_ID");
        banco.SetParametro("?CON_CODIGO_ID", codigo);
        DataTable dt = banco.ExecutarDataTable();
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["CON_CONFIRMADO"].ToString() == "P")
            {
                new ShowMenssage(this, "Falha no Cancelamento", "Não foi possivel cancelar esta solicitação pois ja foi realizado um pagamento.");
                return;
            }
            else if (dt.Rows[0]["CON_CONFIRMADO"].ToString() == "S")
            {
                banco.Query("UPDATE CONTRATO SET CON_CONFIRMADO = 'N' WHERE CON_CODIGO_ID = ?CON_CODIGO_ID");
                banco.SetParametro("?CON_CODIGO_ID", codigo);
                try
                {
                    banco.Executar();
                    atualizaGridAgendamentos();
                    atualizaGridConfirmados();
                }
                catch
                {
                    new ShowMenssage(this, "Falha de Cancelamento", "Não foi possivel cancelar esta solicitação.");
                    return;
                }
            }
        }
        
    }
}