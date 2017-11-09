using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_ContratoServicos : System.Web.UI.Page
{
    BancoDados banco = new BancoDados();
    List<Servico> listaServicos = new List<Servico>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            atualizaUF();
            atualizaCategoria();
            banco.Query("SELECT USU_UF FROM usuario WHERE USU_CODIGO_ID = " + Session["codUsuario"].ToString());
            DataTable dt = banco.ExecutarDataTable();
            if (dt.Rows.Count > 0)
            {
                _ddlUF.SelectedValue = dt.Rows[0]["USU_UF"].ToString();
            }
            atualizaGridServicos();

            _edServico.Attributes.Add("onkeydown", "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {document.getElementById('_btnPesquisar').click();return false;}} else {return true}; ");
            _edCidade.Attributes.Add("onkeydown", "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {document.getElementById('_btnPesquisar').click();return false;}} else {return true}; ");
        }
       
    }

    protected void atualizaUF()
    {
        banco.Query(@"SELECT UF_SIGLA FROM estado");
        _ddlUF.DataSource = banco.ExecutarDataTable();
        _ddlUF.DataTextField = "UF_SIGLA";
        _ddlUF.DataValueField = "UF_SIGLA";
        _ddlUF.DataBind();
        _ddlUF.Items.Insert(0, new ListItem("Selecionar UF", "0"));
    }



    protected void atualizaCategoria()
    {
        banco.Query(@"SELECT CAT_CODIGO_ID, CAT_NOME FROM categoriaservico;");
        _ddlCategoria.DataSource = banco.ExecutarDataTable();
        _ddlCategoria.DataTextField = "CAT_NOME";
        _ddlCategoria.DataValueField = "CAT_CODIGO_ID";
        _ddlCategoria.DataBind();
        _ddlCategoria.Items.Insert(0, new ListItem("Selecionar Categoria", "0"));
    }


    protected void atualizaGridServicos()
    {
        string query = "";
        query = @"SELECT SER_CODIGO_ID,
                               SER_NOME,
                               USU_NOME,
                               cONCAT(MUN_NOME,' - ',MUN_UF) AS LOCALIDADE,
                               SER_DESCRICAO,
                               SER_PRECO,
                               SER_PONTUACAO,
                               CAT_NOME,
                               SER_CATEGORIA,
                               SER_TEMPO
                        FROM servico
                              INNER JOIN USUARIO ON (SER_CODIGO_USUARIO = USU_CODIGO_ID)
                              INNER JOIN MUNICIPIO ON (USU_CIDADE = MUN_CODIGO_IBGE)
                              inner join CATEGORIASERVICO on (SER_CATEGORIA = CAT_CODIGO_ID)
                        where 1=1";

        if (!String.IsNullOrEmpty(_edServico.Text))
        {
            query += " and SER_NOME like '%" + _edServico.Text + "%'";
        }

        if (_ddlUF.SelectedIndex != 0)
        {
            query += " and USU_UF = '" + _ddlUF.SelectedValue + "'";
        }

        if (_ddlCategoria.SelectedIndex != 0)
        {
            query += " and SER_CATEGORIA = '" + _ddlCategoria.SelectedValue + "'";
        }

        if (!String.IsNullOrEmpty(_edCidade.Text))
        {
            query += " and MUN_NOME like '%" + _edCidade.Text + "%'";
        }
        banco.Query(query);
        DataTable dt = banco.ExecutarDataTable();
        dt.Columns.Add("imagem");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dt.Rows[i]["imagem"] = "~/Assets/img/" + dt.Rows[i]["SER_CATEGORIA"].ToString() + ".png";
        }
        _Gridservicos.DataSource = dt;
        _Gridservicos.DataBind();

        
    }
    protected void _ddlUF_SelectedIndexChanged(object sender, EventArgs e)
    {
        atualizaGridServicos();
    }
    protected void _ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
    {
        atualizaGridServicos();
    }
    protected void _btnPesquisar_Click(object sender, EventArgs e)
    {
        atualizaGridServicos();
    }
    protected void _Gridservicos_SelectedIndexChanged(object sender, EventArgs e)
    {
        _pnlContrato.Visible = true;
        _pnlPrincipal.Visible = false;
    }
}