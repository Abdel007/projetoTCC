/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Modelo.Mensalista;
import Modelo.Pagamento;
import Modelo.Pagamento;
import Modelo.Pagamento;
import dao.MensalistaDAO;
import dao.PagamentoDAO;
import dao.PagamentoDAO;
import dao.PagamentoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.FormataData;

/**
 *
 * @author lucas
 */
@WebServlet(name = "PagamentoWS", urlPatterns = {"/admin/pagamento/PagamentoWS"})
public class PagamentoWS extends HttpServlet {

    private PagamentoDAO dao;
    private Pagamento obj;
    private String pagina;
    private String acao;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        acao = request.getParameter("acao");
        List<Pagamento> lista = null;
        String id;
        switch (String.valueOf(acao)) {
            
            case "levarPagamentos":
                request.setAttribute("pagamentos", this.listaPag());
                pagina = "controleCaixa.jsp";
                break;
            
            case "add":
                request.setAttribute("mensalista", this.listaMensalista());
                pagina = "add.jsp";
                break;

            case "del":
                id = request.getParameter("id");
                dao = new PagamentoDAO();
                pagina = "index.jsp";
                obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
                Boolean deucerto = dao.excluir(obj);
                if (deucerto) {
                    lista = dao.listar();
                    request.setAttribute("lista", lista);
                    request.setAttribute("msg", "Excluído com sucesso");
                } else {
                    request.setAttribute("msg", "Erro ao excluir");
                }
                break;

            case "edit":
                id = request.getParameter("id");
                dao = new PagamentoDAO();
                Pagamento obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
                request.setAttribute("obj", obj);
                request.setAttribute("mensalista", this.listaMensalista());
                pagina = "edita.jsp";
                break;

            case "filter":
                pagina = "index.jsp";

                //ega a informação digitada pelo usuário do sistema
                String filtro = request.getParameter("txtFiltro");
                List<Pagamento> lista2 = this.listar(filtro);
                request.setAttribute("lista", lista2);
                break;

            default:
                dao = new PagamentoDAO();
                if (request.getParameter("filtro") != null) {
                    try {
                        lista = dao.listar(request.getParameter("filtro"));
                    } catch (Exception ex) {
                        Logger.getLogger(PagamentoWS.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    lista = dao.listar();
                }
                //pra onde deve ser redirecionada a página
                pagina = "index.jsp";
                //passar a listagem para a página
                request.setAttribute("lista", lista);
                break;

        }
        RequestDispatcher destino = request.getRequestDispatcher(pagina);
        destino.forward(request, response);
        
    }
    public List<Pagamento> listar(String filtro){
        List<Pagamento> lista;
        PagamentoDAO dao = new PagamentoDAO();
        lista = dao.listar(filtro);
        dao.fecharConexao();
        return lista;
        
    }
    
    private List<Pagamento> listaPag() {
        PagamentoDAO dao = new PagamentoDAO();
        List<Pagamento> pagamentos = dao.listar();
        dao.fecharConexao();
        return pagamentos;
    }
    
    private List<Mensalista> listaMensalista() {
        MensalistaDAO dao = new MensalistaDAO();
        List<Mensalista> mensalistas = dao.listar();
        dao.fecharConexao();
        return mensalistas;
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String msg;
        request.setCharacterEncoding("UTF-8");
        //verificar campos obrigatórios
        if (request.getParameter("txtMesAno") == null) {
            msg = "Campos obrigatórios não informados";
        } else {
            dao = new PagamentoDAO();
            obj = new Pagamento();
            //preencho o objeto com o que vem do post

            Boolean deucerto;
            
            Long Mensalistas = Long.parseLong(request.getParameter("txtMensalista"));
            MensalistaDAO mdao;
            Mensalista mensalista;
            MensalistaDAO mensalistadao = new MensalistaDAO();
            mensalista = mensalistadao.buscarPorChavePrimaria(Mensalistas);
            Boolean estaAtivo;
            //se veio com a chave primaria então tem q alterar
            if (request.getParameter("txtId") != null) {
                
                boolean Ativo = mensalista.getAtivo();
                if (request.getParameter("txtAtivo") != null) {
                    Ativo = true;
                } else {
                    Ativo = false;
                }
                
                obj = dao.buscarPorChavePrimaria(Long.parseLong(request.getParameter("txtId")));
                obj.setMesAno(request.getParameter("txtMesAno"));
                String hora = request.getParameter("txtDataPagamento");
                Date d = FormataData.formata(hora,"yyyy-MM-dd");
                obj.setDataPagamento(d);
                obj.setValor(Double.parseDouble(request.getParameter("txtValor")));
                obj.setMensalista(mensalista);
                
                Mensalista mensalistaAtual = obj.getMensalista();
                mdao = new MensalistaDAO();
                estaAtivo = mensalista.getAtivo();
               
                if (mensalista.getNome() != mensalistaAtual.getNome() && Ativo == true) {
                    mensalistaAtual.setAtivo(false);
                    mensalista.setAtivo(true);
                    mdao.alterar(mensalistaAtual);
                    mdao.alterar(mensalista);
                }
                if (Ativo == false) {
                    mensalistaAtual.setAtivo(false);
                    mensalista.setAtivo(false);
                    mdao.alterar(mensalistaAtual);
                    mdao.alterar(mensalista);
                }
                deucerto = dao.alterar(obj);
                
                pagina = "edita-ok.jsp";
            } else {
                obj.setMesAno(request.getParameter("txtMesAno"));
                String hora = request.getParameter("txtDataPagamento");
                Date d = FormataData.formata(hora,"yyyy-MM-dd");
                obj.setDataPagamento(d);
                obj.setValor(Double.parseDouble(request.getParameter("txtValor")));
                obj.setMensalista(mensalista);
                deucerto = dao.alterar(obj);
                pagina = "add-ok.jsp";
            }
            if (deucerto) {
                msg = "Operação realizada com sucesso";
            } else {
                msg = "Erro ao realizar a operação";
            }
        }
        dao.fecharConexao();
        request.setAttribute("msg", msg);
        RequestDispatcher destino = request.getRequestDispatcher(pagina);
        destino.forward(request, response);
        
    }

    

}
