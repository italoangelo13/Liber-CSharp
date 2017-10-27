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
    protected void Page_Load(object sender, EventArgs e)
    {
        atualizaGridServicos();
    }

    protected void atualizaGridServicos()
    {
        banco.Query(@"SELECT SER_CODIGO_ID,
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
                              inner join CATEGORIASERVICO on (SER_CATEGORIA = CAT_CODIGO_ID)");
        DataTable dt = banco.ExecutarDataTable();
        dt.Columns.Add("imagem");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dt.Rows[i]["imagem"] = "~/Assets/img/" + dt.Rows[i]["SER_CATEGORIA"].ToString() + ".png";
        }
        _Gridservicos.DataSource = dt;
        _Gridservicos.DataBind();

        
    }
}