using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Servico
/// </summary>
public class Servico
{
    private String _nomeServico;
    private String _descServico;
    private int _catServico;
    private Double _valorServiço;
    private int _tempoServico;
    private int _codigoServico;

    public String NomeServico
    {
        get { return _nomeServico; }
        set { _nomeServico = value; }
    }
    public String DescServico
    {
        get { return _descServico; }
        set { _descServico = value; }
    }
    public int CatServico
    {
        get { return _catServico; }
        set { _catServico = value; }
    }
    public Double ValorServiço
    {
        get { return _valorServiço; }
        set { _valorServiço = value; }
    }
    public int TempoServico
    {
        get { return _tempoServico; }
        set { _tempoServico = value; }
    }
    public int CodigoServico
    {
        get { return _codigoServico; }
        set { _codigoServico = value; }
    }



	public Servico()
	{
		
	}
}