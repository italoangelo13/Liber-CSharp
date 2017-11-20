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
        String codigo;
        codigo = _Gridservicos.SelectedRow.Cells[1].Text;
        _edCodServico.Text = codigo;
        banco.Query(@"SELECT SER_CODIGO_ID,
                                SER_NOME,
                                USU_NOME,
                                SER_CODIGO_USUARIO,
                                SER_DESCRICAO,
                                SER_PRECO,
                                SER_PONTUACAO,
                                CAT_NOME,
                                SER_TEMPO
                              FROM servico
                              INNER JOIN categoriaservico ON SER_CATEGORIA = CAT_CODIGO_ID
                              INNER JOIN usuario ON SER_CODIGO_USUARIO = USU_CODIGO_ID
                              where SER_CODIGO_ID = ?SER_CODIGO_ID");
        banco.SetParametro("?SER_CODIGO_ID", codigo);
        DataTable servico = banco.ExecutarDataTable();
        if (servico.Rows.Count > 0)
        {
            _edNomeServico.Text = servico.Rows[0]["SER_NOME"].ToString().ToUpper();
            _edProfissionalservico.Text = servico.Rows[0]["USU_NOME"].ToString().ToUpper();
            _edDescricaoServico.Text = servico.Rows[0]["SER_DESCRICAO"].ToString().ToUpper();
            _edValorServico.Text = servico.Rows[0]["SER_PRECO"].ToString().ToUpper();
            _edPontuacao.Text = servico.Rows[0]["SER_PONTUACAO"].ToString().ToUpper();
            _edCategoria.Text = servico.Rows[0]["CAT_NOME"].ToString().ToUpper();
            _tempoServico.Text = servico.Rows[0]["SER_TEMPO"].ToString().ToUpper();
            _lblCodProf.Text = servico.Rows[0]["SER_CODIGO_USUARIO"].ToString().ToUpper();
        }
    }
    protected void _btnSalvar_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(_edData.Text))
        {
            new ShowMenssage(this, "Campo Obrigatório", "Favor Informar a Data Escolhida.");
            _edData.Focus();
            return;
        }

        if (String.IsNullOrEmpty(_edHora.Text))
        {
            new ShowMenssage(this, "Campo Obrigatório", "Favor Informar o Horario Escolhido.");
            _edHora.Focus();
            return;
        }


        string data = _edData.Text + " " + _edHora.Text + ":00";
        DateTime dataFinal = calcularData(DateTime.Parse(data), int.Parse(_tempoServico.Text));

        bool vago = horarioValido(DateTime.Parse(data).ToString("yyyy-MM-dd HH:mm:ss"), dataFinal.ToString("yyyy-MM-dd HH:mm:ss"));

        if (vago != true)
        {
            new ShowMenssage(this, "Campo Obrigatório", "O horario escolhido para esta data ja está ocupado, escolha outro Horario");
            _edHora.Focus();
            return;
        }

        banco.Query(@"insert into contrato (CON_DATA_CONTRATO,
                      CON_CODIGO_SERVICO,
                      CON_CODIGO_CLIENTE,
                      CON_CODIGO_PROFISSIONAL,
                      CON_DATA_AGENDAMENTO,
                      CON_VALOR_SERVICO,
                      CON_DATA_TERMINO)
                values(CURRENT_TIMESTAMP,
                      ?CON_CODIGO_SERVICO,
                      ?CON_CODIGO_CLIENTE,
                      ?CON_CODIGO_PROFISSIONAL,
                      ?CON_DATA_AGENDAMENTO,
                      ?CON_VALOR_SERVICO,
                      ?CON_DATA_TERMINO)");
        banco.SetParametro("?CON_CODIGO_SERVICO",_edCodServico.Text);
        banco.SetParametro("?CON_CODIGO_CLIENTE",Session["codUsuario"].ToString());
        banco.SetParametro("?CON_CODIGO_PROFISSIONAL",_lblCodProf.Text);
        banco.SetParametro("?CON_DATA_AGENDAMENTO", DateTime.Parse(data));
        banco.SetParametro("?CON_VALOR_SERVICO",Double.Parse(_edValorServico.Text));
        banco.SetParametro("?CON_DATA_TERMINO", dataFinal);

        try
        {
            banco.Executar();
            
        }
        catch
        {
            new ShowMenssage(this, "Erro ao Realizar Contratação", "Não foi possivel registrar a sua solicitação de contrato. Aguarde e Tente novamente.");
            return;
        }

        banco.Query("SELECT Max(CON_CODIGO_ID) as ULTIMO FROM contrato WHERE CON_CODIGO_CLIENTE = ?CON_CODIGO_CLIENTE");
        banco.SetParametro("?CON_CODIGO_CLIENTE", Session["codUsuario"].ToString());
        DataTable dt = banco.ExecutarDataTable();
        if (dt.Rows.Count > 0)
        {
            new ShowMenssage(this, "Solicitação Registrada.", "Sua solicitação de contrato deste serviço foi registrada com sucesso, Aguarde a confirmação do Profissional para Realizar o Pagamento. Numero da Solicitação: " + dt.Rows[0]["ULTIMO"].ToString());

            _btnVoltar_Click(null, null);
        }

    }

    protected bool horarioValido(string data1, string data2)
    {
        banco.Query("SELECT CON_CODIGO_ID,CON_DATA_AGENDAMENTO, CON_DATA_TERMINO FROM contrato WHERE CON_DATA_AGENDAMENTO BETWEEN ?PDATAI AND ?PDATAF");
        banco.SetParametro("?PDATAI", DateTime.Parse(data1));
        banco.SetParametro("?PDATAF", DateTime.Parse(data2));
        DataTable dt = banco.ExecutarDataTable();
        if (dt.Rows.Count > 0)
        {
            return false;
        }
        else
        {
            return true;
        }

    }

    protected DateTime calcularData(DateTime dataInicio, int tempo){
        DateTime dataFinal = dataInicio.AddMinutes(Double.Parse(tempo.ToString()));
        return dataFinal;
    }
    protected void _btnVoltar_Click(object sender, EventArgs e)
    {
        _pnlContrato.Visible = false;
        _pnlPrincipal.Visible = true;
    }
}