using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Descrição resumida de ShowMenssage
/// </summary>
public class ShowMenssage
{
    Page pg;
    string head = @"
    <style>
        .modalDialog {
            position: fixed;
            font-family: Arial, Helvetica, sans-serif;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: rgba(0,0,0,0.5);
            z-index: 99999;
            opacity: 0;
            -webkit-transition: opacity 400ms ease-in;
            -moz-transition: opacity 400ms ease-in;
            transition: opacity 400ms ease-in;
            pointer-events: none;
        }

          .modalDialog:target {
            opacity: 1;
            pointer-events: auto;
        }

          .modalDialog > div {
            width: 95%;
            height: 500px;
            position: relative;
            margin: 5% auto;
            padding: 5px 20px 13px 20px;
            border-radius: 10px;
            background: #fff;
            background: -moz-linear-gradient(#fff, #999);
            background: -webkit-linear-gradient(#fff, #999);
            background: -o-linear-gradient(#fff, #999);
              -moz-box-shadow: 1px 1px 30px #000;
            -webkit-box-shadow: 1px 1px 30px #000;
            box-shadow: 1px 1px 30px #000;
        }

          .clo {
            background: #606061;
            color: #FFFFFF;
            line-height: 25px;
            position: absolute;
            right: -12px;
            text-align: center;
            top: -10px;
            width: 24px;
            text-decoration: none;
            font-weight: bold;
            -webkit-border-radius: 12px;
            -moz-border-radius: 12px;
            border-radius: 12px;
            -moz-box-shadow: 1px 1px 3px #000;
            -webkit-box-shadow: 1px 1px 3px #000;
            box-shadow: 1px 1px 3px #000;
        }

              .clo:hover {
                background: #00d9ff;
            }

          .modalpic {
            float: left;
            padding: 6px;
            width: 300px;
            display: block;
            border: 4px solid #ffffff;
            border-radius: 30%;
            box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            -moz-box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            margin-right: 100%;
            margin-bottom: 20px;
        }
    </style>
    <script src='//code.jquery.com/jquery-1.10.2.js'></script>
    <script src='//code.jquery.com/ui/1.11.2/jquery-ui.js'></script>
    <a id='link' href='#abrirModal' hidden='hidden'>link</a>
    <script type='text/javascript'>
        var evt = document.createEvent('MouseEvents');
        evt.initMouseEvent('click', true, true, window,
          0, 0, 0, 0, 0, false, false, false, false, 0, null);
        var a = document.getElementById('link');
        a.dispatchEvent(evt);
       function clicLikc(){
        var evt = document.createEvent('MouseEvents');
        evt.initMouseEvent('click', true, true, window,
          0, 0, 0, 0, 0, false, false, false, false, 0, null);
        var a = document.getElementById('closeitnow');
        a.dispatchEvent(evt);
      }
    </script>

    <div id='abrirModal' class='modalDialog'>
        <div >
            <a href='#close' id='closeitnow' title='Fechar' class='clo' onclick='try {atualizagrupo();}catch(err){} window.close;'>X</a> ";  
           // <a href='#close' id='closeitnow' title='Fechar' class='clo'>X</a>   ";
    string head2 = @"
    <style>
        .modalDialog {
            position: fixed;
            font-family: Arial, Helvetica, sans-serif;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: rgba(0,0,0,0.5);
            z-index: 99999;
            opacity: 0;
            -webkit-transition: opacity 400ms ease-in;
            -moz-transition: opacity 400ms ease-in;
            transition: opacity 400ms ease-in;
            pointer-events: none;
        }

          .modalDialog:target {
            opacity: 1;
            pointer-events: auto;
        }

          .modalDialog > div {
            width: 400px;
            position: relative;
            margin: 10% auto;
            padding: 5px 20px 13px 20px;
            border-radius: 10px;
            background: #fff;
              -moz-box-shadow: 1px 1px 30px #000;
            -webkit-box-shadow: 1px 1px 30px #000;
            box-shadow: 1px 1px 30px #000;
        }

          .clo {
            background: #606061;
            color: #FFFFFF;
            line-height: 25px;
            position: absolute;
            right: -12px;
            text-align: center;
            top: -10px;
            width: 24px;
            text-decoration: none;
            font-weight: bold;
            -webkit-border-radius: 12px;
            -moz-border-radius: 12px;
            border-radius: 12px;
            -moz-box-shadow: 1px 1px 3px #000;
            -webkit-box-shadow: 1px 1px 3px #000;
            box-shadow: 1px 1px 3px #000;
        }

              .clo:hover {
                background: #00d9ff;
            }

          .modalpic {
            float: left;
            padding: 6px;
            width: 300px;
            display: block;
            border: 4px solid #ffffff;
            border-radius: 30%;
            box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            -moz-box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            margin-right: 100%;
            margin-bottom: 20px;
        }
    </style>
    <script src='//code.jquery.com/jquery-1.10.2.js'></script>
    <script src='//code.jquery.com/ui/1.11.2/jquery-ui.js'></script>
    <a id='link' href='#abrirModal' hidden='hidden'>link</a>
    <script type='text/javascript'>
        var evt = document.createEvent('MouseEvents');
        evt.initMouseEvent('click', true, true, window,
          0, 0, 0, 0, 0, false, false, false, false, 0, null);
        var a = document.getElementById('link');
        a.dispatchEvent(evt);
    </script>

    <div id='abrirModal' class='modalDialog'>
        <div>
            <a href='#close' title='Fechar' class='clo'>X</a>   ";
    string head3 = @"
    <style>
        .modalDialog {
            position: fixed;
            font-family: Arial, Helvetica, sans-serif;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: rgba(0,0,0,0.5);
            z-index: 99999;
            opacity: 0;
            -webkit-transition: opacity 400ms ease-in;
            -moz-transition: opacity 400ms ease-in;
            transition: opacity 400ms ease-in;
            pointer-events: none;
        }

          .modalDialog:target {
            opacity: 1;
            pointer-events: auto;
        }

          .modalDialog > div {
            width: 400px;
            position: relative;
            margin: 10% auto;
            padding: 0px 5px 10px 0px;
            border-radius: 10px;
            background: #fff;
              -moz-box-shadow: 1px 1px 30px #000;
            -webkit-box-shadow: 1px 1px 30px #000;
            box-shadow: 1px 1px 30px #000;

        }

          .clo {
            background: #B8B8B8 ;
            color: #000000;
            line-height: 25px;
            position: absolute;
            right: -12px;
            text-align: center;
            top: -10px;
            width: 24px;
            font-weight: bold;
            -webkit-border-radius: 12px;
            -moz-border-radius: 12px;
            border-radius: 12px;
            -moz-box-shadow: 1px 1px 3px #000;
            -webkit-box-shadow: 1px 1px 3px #000;
            box-shadow: 1px 1px 3px #000;
        }

              .clo:hover {
                background: #00d9ff;
            }

          .modalpic {
            float: left;
            padding: 6px;
            width: 300px;
            display: block;
            border: 4px solid #ffffff;
            border-radius: 30%;
            box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            -moz-box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            margin-right: 100%;
            margin-bottom: 20px;
        }
    </style>
    <script src='//code.jquery.com/jquery-1.10.2.js'></script>
    <script src='//code.jquery.com/ui/1.11.2/jquery-ui.js'></script>
    <a id='link' href='#open' hidden='hidden'>link</a>
    <script type='text/javascript'>

        var evt = document.createEvent('MouseEvents');
        evt.initMouseEvent('click', true, true, window,
          0, 0, 0, 0, 0, false, false, false, false, 0, null);
        var a = document.getElementById('link');
        a.dispatchEvent(evt);

document.onkeyup=handleKeyboardAction;
function handleKeyboardAction(e){
if(e.keyCode == '13')
{
	var evt = document.createEvent('MouseEvents');
        evt.initMouseEvent('click', true, true, window,
          0, 0, 0, 0, 0, false, false, false, false, 0, null);
        var a = document.getElementById('link2');
        a.dispatchEvent(evt);
    }
}
</script>

    <div id='open' class='modalDialog'>
        <div>
            <a id='link2' href='#close' title='Fechar' class='clo'>X</a>   ";
    string head4 = @"
    <style>
        .modalDialog {
            position: fixed;
            font-family: Arial, Helvetica, sans-serif;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: rgba(0,0,0,0.5);
            z-index: 99999;
            opacity: 0;
            -webkit-transition: opacity 400ms ease-in;
            -moz-transition: opacity 400ms ease-in;
            transition: opacity 400ms ease-in;
            pointer-events: none;
        }

          .modalDialog:target {
            opacity: 1;
            pointer-events: auto;
        }

          .modalDialog > div {
            width: 1050px;
            height: 900px;
            position: relative;
            margin: 0% auto;
            padding: 5px 20px 13px 20px;
            border-radius: 10px;
            background: #fff;
            background: -moz-linear-gradient(#fff, #999);
            background: -webkit-linear-gradient(#fff, #999);
            background: -o-linear-gradient(#fff, #999);
              -moz-box-shadow: 1px 1px 30px #000;
            -webkit-box-shadow: 1px 1px 30px #000;
            box-shadow: 1px 1px 30px #000;
        }

          .clo {
            background: #606061;
            color: #FFFFFF;
            line-height: 25px;
            position: absolute;
            right: -12px;
            text-align: center;
            top: -10px;
            width: 24px;
            text-decoration: none;
            font-weight: bold;
            -webkit-border-radius: 12px;
            -moz-border-radius: 12px;
            border-radius: 12px;
            -moz-box-shadow: 1px 1px 3px #000;
            -webkit-box-shadow: 1px 1px 3px #000;
            box-shadow: 1px 1px 3px #000;
        }

              .clo:hover {
                background: #00d9ff;
            }

          .modalpic {
            float: left;
            padding: 6px;
            width: 300px;
            display: block;
            border: 4px solid #ffffff;
            border-radius: 30%;
            box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            -moz-box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            margin-right: 100%;
            margin-bottom: 20px;
        }
    </style>
    <script src='//code.jquery.com/jquery-1.10.2.js'></script>
    <script src='//code.jquery.com/ui/1.11.2/jquery-ui.js'></script>
    <a id='link' href='#abrirModal' hidden='hidden'>link</a>
    <script type='text/javascript'>
        var evt = document.createEvent('MouseEvents');
        evt.initMouseEvent('click', true, true, window,
          0, 0, 0, 0, 0, false, false, false, false, 0, null);
        var a = document.getElementById('link');
        a.dispatchEvent(evt);
       function clicLikc(){
        var evt = document.createEvent('MouseEvents');
        evt.initMouseEvent('click', true, true, window,
          0, 0, 0, 0, 0, false, false, false, false, 0, null);
        var a = document.getElementById('closeitnow');
        a.dispatchEvent(evt);
      }
    </script>

    <div id='abrirModal' class='modalDialog'>
        <div >
                <a id='closeitnow' href='#close' title='Fechar' class='clo' hidden='hidden'>X</a>   ";
    string headDCQ = @"
    <style>
        .modalDialog {
            position: fixed;
            font-family: Arial, Helvetica, sans-serif;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: rgba(0,0,0,0.5);
            z-index: 99999;
            opacity: 0;
            -webkit-transition: opacity 400ms ease-in;
            -moz-transition: opacity 400ms ease-in;
            transition: opacity 400ms ease-in;
            pointer-events: none;
        }

          .modalDialog:target {
            opacity: 1;
            pointer-events: auto;
        }

          .modalDialog > div {
            width: 30%;
            height: 10%;
            position: relative;
            margin: 1% auto;
            margin-left: 35%;
            padding: 5px 15px 22px 15px;
            border-radius: 10px;
            background: #fff;
            background: -moz-linear-gradient(#fff, #999);
            background: -webkit-linear-gradient(#fff, #999);
            background: -o-linear-gradient(#fff, #999);
              -moz-box-shadow: 1px 1px 30px #000;
            -webkit-box-shadow: 1px 1px 30px #000;
            box-shadow: 1px 1px 30px #000;
        }

          .clo {
            background: #606061;
            color: #FFFFFF;
            line-height: 25px;
            position: absolute;
            right: -12px;
            text-align: center;
            top: -10px;
            width: 24px;
            text-decoration: none;
            font-weight: bold;
            -webkit-border-radius: 12px;
            -moz-border-radius: 12px;
            border-radius: 12px;
            -moz-box-shadow: 1px 1px 3px #000;
            -webkit-box-shadow: 1px 1px 3px #000;
            box-shadow: 1px 1px 3px #000;
        }

              .clo:hover {
                background: #00d9ff;
            }

          .modalpic {
            float: left;
            padding: 6px;
            width: 300px;
            display: block;
            border: 4px solid #ffffff;
            border-radius: 30%;
            box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            -moz-box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 3px 6px 8px 1px rgba(0, 0, 0, 0.3);
            margin-right: 100%;
            margin-bottom: 20px;
        }
    </style>
    <script src='//code.jquery.com/jquery-1.10.2.js'></script>
    <script src='//code.jquery.com/ui/1.11.2/jquery-ui.js'></script>
    <a id='link' href='#abrirModal' hidden='hidden'>link</a>
    <script type='text/javascript'>
        var evt = document.createEvent('MouseEvents');
        evt.initMouseEvent('click', true, true, window,
          0, 0, 0, 0, 0, false, false, false, false, 0, null);
        var a = document.getElementById('link');
        a.dispatchEvent(evt);
       function clicLikc(){
        var evt = document.createEvent('MouseEvents');
        evt.initMouseEvent('click', true, true, window,
          0, 0, 0, 0, 0, false, false, false, false, 0, null);
        var a = document.getElementById('closeitnow');
        a.dispatchEvent(evt);
      }
       function hide(){
            __doPostBack();
      }
    </script>

    <div id='abrirModal' class='modalDialog'>
        <div >
            <a href='#close' id='closeitnow' title='Fechar' class='clo'  onclick='hide()'>X</a>   ";
	public ShowMenssage(Page page)
	{
        this.pg = page;
	}
    public ShowMenssage(Page page, string titulo ,string mensagem)
    {
        this.pg = page;
        mensagem = mensagem.Replace("\n", "\\n").Replace("\r", "\\r");
        pg.Response.Write(head3 + @"<div style = 'background: #888888 ; width: 400px;
                                               padding: 5px 5px 5px 5px;text-align: center;'><Font color='#FFFFFF'>"
            + titulo + "</font></div><div style = 'padding: 15px 10px 15px 10px;'>" + mensagem + "</div></div></div>");
    }
    public void Show(string mensagem)
    {
        mensagem = mensagem.Replace("\n", "\\n").Replace("\r", "\\r");
         pg.Response.Write( head+ mensagem + "</div></div>");
    }
    public void Frame(string arquivo)
    {
        arquivo = arquivo.Replace("\n", "\\n").Replace("\r", "\\r");
        pg.Response.Write(head + "<IFRAME src='" + arquivo + "' frameborder='0' name='conteudo1' style='margin-top: 0px; width: 100%; height: 500px;' width='100%' ></IFRAME></div></div>");
    }
    public void Frame2(string arquivo)
    {
        arquivo = arquivo.Replace("\n", "\\n").Replace("\r", "\\r");
        pg.Response.Write(head4 + "<IFRAME src='" + arquivo + "' frameborder='0' name='conteudo1' style='margin-top: 0px; width: 100%; height: 500px;' width='100%' ></IFRAME></div></div>");
    }
    public void Show(string mensagem, string titulo)
    {
        mensagem = mensagem.Replace("\n", "\\n").Replace("\r", "\\r");
        pg.Response.Write(head + "<h2>" + titulo + "</h2>" + mensagem + "</div></div>");
    }
    public void Greem(string mensagem, string titulo)
    {
        mensagem = mensagem.Replace("\n", "\\n").Replace("\r", "\\r");
        pg.Response.Write(@"

<link rel='stylesheet' type='text/css' href='jAlert-v2.css'>
<script src='https://code.jquery.com/jquery-2.0.3.min.js'></script>
<script src='jAlert-v2.js'></script>
<script>
function myFunction() {
$.fn.jAlert({ 'title': '" + titulo + "', 'message': '" + mensagem + "', 'theme':'success' }); }</script>");
    }
    public void FrameDCQ(string arquivo)
    {
        arquivo = arquivo.Replace("\n", "\\n").Replace("\r", "\\r");
        pg.Response.Write(headDCQ + "<IFRAME src='" + arquivo + "' frameborder='0' name='conteudo1' style='margin-top: 0px; width: 100%; height: 200px;' width='100%'; ></IFRAME></div></div>");
    }
}