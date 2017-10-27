using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_CadastroServicos : System.Web.UI.Page
{
    BancoDados banco = new BancoDados();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            atualizaCategoria();
            atualizaGridServico();
        }
    }

    protected void atualizaCategoria()
    {
        banco.Query("SELECT CAT_CODIGO_ID, CAT_NOME FROM categoriaservico order by CAT_NOME");
        _ddlCategoria.DataSource = banco.ExecutarDataTable();
        _ddlCategoria.DataTextField = "CAT_NOME";
        _ddlCategoria.DataValueField = "CAT_CODIGO_ID";
        _ddlCategoria.DataBind();
        _ddlCategoria.Items.Insert(0, new ListItem("Selecione uma Categoria", "0"));
    }
    protected void _btnSalvar_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(_edNome.Text))
        {
            new ShowMenssage(this, "Campo Obrigatório", "Favor Informar o nome do Serviço.");
            _edNome.Focus();
            return;
        }

        if (String.IsNullOrEmpty(_edDescricao.Text))
        {
            new ShowMenssage(this, "Campo Obrigatório", "Favor Informar a Descrição do Serviço.");
            _edDescricao.Focus();
            return;
        }

        if (String.IsNullOrEmpty(_edValor.Text))
        {
            new ShowMenssage(this, "Campo Obrigatório", "Favor Informar o valor do Serviço.");
            _edValor.Focus();
            return;
        }

        if (_edValor.Text == "0,00")
        {
            new ShowMenssage(this, "Campo Obrigatório", "O Serviço não pode ser Gratuito. Favor Informar o valor do Serviço.");
            _edValor.Focus();
            return;
        }

        if (_ddlCategoria.SelectedIndex == 0)
        {
            new ShowMenssage(this, "Campo Obrigatório", "Favor Informar a categoria do Serviço.");
            _edValor.Focus();
            return;
        }

        if (String.IsNullOrEmpty(_edTempo.Text))
        {
            new ShowMenssage(this, "Campo Obrigatório", "Favor Informar o tempo estimado do Serviço.");
            _edTempo.Focus();
            return;
        }

        if (String.IsNullOrEmpty(_edcodServico.Text))
        {
            string query = @"INSERT INTO SERVICO (
                                                  SER_NOME,
                                                  SER_CODIGO_USUARIO,
                                                  SER_DESCRICAO,
                                                  SER_PRECO,
                                                  SER_DATA_CADASTRO,
                                                  SER_TEMPO,
                                                  SER_MEDIDA,
                                                  SER_CATEGORIA)
                                            VALUES(
                                                  ?SER_NOME,
                                                  ?SER_CODIGO_USUARIO,
                                                  ?SER_DESCRICAO,
                                                  ?SER_PRECO,
                                                  CURRENT_TIMESTAMP,
                                                  ?SER_TEMPO,
                                                  ?SER_MEDIDA,
                                                  ?SER_CATEGORIA)";
            banco.Query(query);
            banco.SetParametro("?SER_NOME", _edNome.Text.ToUpper());
            banco.SetParametro("?SER_CODIGO_USUARIO", Session["codUsuario"].ToString());
            banco.SetParametro("?SER_DESCRICAO", _edDescricao.Text.ToUpper());
            banco.SetParametro("?SER_MEDIDA", _ddlMedida.SelectedValue);
            banco.SetParametro("?SER_TEMPO", _edTempo.Text.ToUpper());
            banco.SetParametro("?SER_PRECO",Double.Parse(_edValor.Text));
            banco.SetParametro("?SER_CATEGORIA", _ddlCategoria.SelectedValue);
            try
            {
                banco.Executar();
                new ShowMenssage(this, "Serviço Cadastrado", "O Serviço foi cadastrado com sucesso.");
                limparCampos();
                atualizaGridServico();
            }
            catch{
                new ShowMenssage(this, "Erro ao Cadastrar", "Não foi possivel realizar esta operação.");
                return;
            }
        }
        else
        {
            string query = @"UPDATE SERVICO SET   SER_NOME = ?SER_NOME,
                                                  SER_DESCRICAO = ?SER_DESCRICAO,
                                                  SER_PRECO = ?SER_PRECO,
                                                  SER_CATEGORIA = ?SER_CATEGORIA
                                                  SER_TEMPO = ?SER_TEMPO,
                                                  SER_MEDIDA = ?SER_MEDIDA,
                                                  WHERE SER_CODIGO_ID = ?SER_CODIGO_ID";
            banco.Query(query);
            banco.SetParametro("?SER_NOME", _edNome.Text.ToUpper());
            banco.SetParametro("?SER_DESCRICAO", _edDescricao.Text.ToUpper());
            banco.SetParametro("?SER_PRECO", Double.Parse(_edValor.Text));
            banco.SetParametro("?SER_CATEGORIA", _ddlCategoria.SelectedValue);
            banco.SetParametro("?SER_CODIGO_ID", _edcodServico.Text);
            banco.SetParametro("?SER_MEDIDA", _ddlMedida.SelectedValue);
            banco.SetParametro("?SER_TEMPO", _edTempo.Text.ToUpper());
            try
            {
                banco.Executar();
                new ShowMenssage(this, "Serviço Alterado", "O Serviço foi alterado com sucesso.");
                limparCampos();
                atualizaGridServico();
            }
            catch
            {
                new ShowMenssage(this, "Erro ao Alterar", "Não foi possivel realizar esta operação.");
                return;
            }
        }
        
    }

    protected void limparCampos()
    {
        _edcodServico.Text = "";
        _edNome.Text = "";
        _ddlCategoria.SelectedIndex = 0;
        _edValor.Text = "";
        _edDescricao.Text = "";
        _edTempo.Text = "";
        _ddlMedida.SelectedValue = "PS";
        atualizaGridServico();
    }

    protected void atualizaGridServico()
    {
        banco.Query(@"SELECT 
                            SER_CODIGO_ID, 
                            SER_NOME, 
                            SER_CODIGO_USUARIO, 
                            SER_DESCRICAO, 
                            SER_PRECO, 
                            SER_DATA_CADASTRO, 
                            SER_PONTUACAO,
                            CAT_NOME
                        FROM servico 
                            INNER JOIN CATEGORIASERVICO ON (SER_CATEGORIA = CAT_CODIGO_ID)
                            where SER_CODIGO_USUARIO = ?SER_CODIGO_USUARIO");
        banco.SetParametro("?SER_CODIGO_USUARIO", Session["codUsuario"].ToString());
        _gridServicos.DataSource = banco.ExecutarDataTable();
        _gridServicos.DataBind();
    }
    protected void _gridServicos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int codigo = e.RowIndex;
        banco.Query("DELETE FROM SERVICO WHERE SER_CODIGO_ID = ?SER_CODIGO_ID");
        banco.SetParametro("?SER_CODIGO_ID",_gridServicos.Rows[codigo].Cells[0].Text);
        try
        {
            banco.Executar();
            new ShowMenssage(this, "Serviço Deletado", "O Serviço foi deletado com sucesso.");
            atualizaGridServico();
        }
        catch
        {
            new ShowMenssage(this, "Operação não realizada", "O Serviço Ja está sendo Utilizado, exclusão não permitida.");
            return;
        }
    }
    protected void _gridServicos_SelectedIndexChanged(object sender, EventArgs e)
    {
        _edcodServico.Text = _gridServicos.SelectedRow.Cells[0].Text;
        banco.Query(@"SELECT  
                            SER_NOME,
                            SER_DESCRICAO, 
                            SER_PRECO,
                            SER_TEMPO, SER_MEDIDA,
                            SER_CATEGORIA FROM servico where SER_CODIGO_ID = ?SER_CODIGO_ID");
        banco.SetParametro("?SER_CODIGO_ID",_edcodServico.Text);
        DataTable dt = banco.ExecutarDataTable();
        if (dt.Rows.Count > 0)
        {
            _edDescricao.Text = dt.Rows[0]["SER_DESCRICAO"].ToString();
            _edNome.Text = dt.Rows[0]["SER_NOME"].ToString();
            _edValor.Text = dt.Rows[0]["SER_PRECO"].ToString();
            _ddlCategoria.SelectedValue = dt.Rows[0]["SER_CATEGORIA"].ToString();
            _ddlMedida.SelectedValue = dt.Rows[0]["SER_MEDIDA"].ToString();
            _edTempo.Text = dt.Rows[0]["SER_TEMPO"].ToString();
        }
    }
}