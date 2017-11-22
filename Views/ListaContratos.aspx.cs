using System;
using System.Collections.Generic;
using System.Data;
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
        if (Session["autenticado"].ToString().Equals("N"))
        {
            Response.Redirect("../Index.aspx");
        }

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
                                WHERE CON_CODIGO_CLIENTE = ?CON_CODIGO_CLIENTE order by CON_DATA_CONTRATO Desc");
        banco.SetParametro("?CON_CODIGO_CLIENTE",codUsuario);

        _gridContratos.DataSource = banco.ExecutarDataTable();
        _gridContratos.DataBind();
        
    }
    protected void _gridContratos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.DataItem != null)
        {
            string confirmado;
            confirmado = e.Row.Cells[7].Text;

            if (confirmado == "N")
            {
                e.Row.Cells[7].Text = "AGUARDANDO CONFIRMAÇÃO";
            }
            else if(confirmado == "S")
            {
                e.Row.Cells[7].Text = "CONFIRMADO E LIBERADO PARA PAGAMENTO";
            }
            else if (confirmado == "P")
            {
                e.Row.Cells[7].Text = "PAGAMENTO REALIZADO";
            }
        }
    }
    protected void _gridContratos_SelectedIndexChanged(object sender, EventArgs e)
    {
        BancoDados banco2 = new BancoDados();
        string codigo = _gridContratos.SelectedRow.Cells[0].Text;
        banco2.Query("SELECT CON_CONFIRMADO FROM contrato WHERE CON_CODIGO_ID = " + codigo);
        DataTable dt = banco2.ExecutarDataTable();
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["CON_CONFIRMADO"].ToString() == "S")
            {
                _pnlPagamento.Visible = true;
                _pnlServicos.Visible = false;
                _lblCodigoServico.Text = Server.HtmlDecode(_gridContratos.SelectedRow.Cells[0].Text);
                _lblServico.Text = Server.HtmlDecode(_gridContratos.SelectedRow.Cells[2].Text);
                _lblValor.Text = Server.HtmlDecode(_gridContratos.SelectedRow.Cells[4].Text);
                _lblProfissional.Text = Server.HtmlDecode(_gridContratos.SelectedRow.Cells[3].Text.ToUpper());
                _lblData.Text = Server.HtmlDecode(_gridContratos.SelectedRow.Cells[5].Text);
            }
            else if (dt.Rows[0]["CON_CONFIRMADO"].ToString() == "N")
            {
                new ShowMenssage(this, "Aguardando Confirmação", "Este solicitação de Agendamento ainda não foi Confirmada pelo profissional, Aguarde a Confirmação para Efetuar o Pagamento.");
            }
        }
    }
}