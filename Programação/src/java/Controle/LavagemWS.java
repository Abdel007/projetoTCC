/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Modelo.Lavagem;
import dao.LavagemDAO;
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
@WebServlet(name = "LavagemWS", urlPatterns = {"/admin/lavagem/LavagemWS"})
public class LavagemWS extends HttpServlet {
       
    private LavagemDAO dao;
    private Lavagem obj;
    private String pagina;
    private String acao;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        acao = request.getParameter("acao");
        List<Lavagem> lista = null;
        String id;
        switch (String.valueOf(acao)) {

            case "del":
                id = request.getParameter("id");
                dao = new LavagemDAO();
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
                dao = new LavagemDAO();
                Lavagem obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
                request.setAttribute("obj", obj);
                pagina = "edita.jsp";
                break;

            case "filter":
                pagina = "index.jsp";

                //ega a informação digitada pelo usuário do sistema
                String filtro = request.getParameter("txtFiltro");
                List<Lavagem> lista2 = this.listar(filtro);
                request.setAttribute("lista", lista2);
                break;

            default:
                dao = new LavagemDAO();
                if (request.getParameter("filtro") != null) {
                    try {
                        lista = dao.listar(request.getParameter("filtro"));
                    } catch (Exception ex) {
                        Logger.getLogger(LavagemWS.class.getName()).log(Level.SEVERE, null, ex);
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
    
    public List<Lavagem> listar(String filtro){
        List<Lavagem> lista;
        LavagemDAO dao = new LavagemDAO();
        lista = dao.listar(filtro);
        dao.fecharConexao();
        return lista;
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String msg;
        request.setCharacterEncoding("UTF-8");
        //verificar campos obrigatórios
        if (request.getParameter("txtTipoLavagem") == null) {
            msg = "Campos obrigatórios não informados";
        } else {
            dao = new LavagemDAO();
            obj = new Lavagem();
            //preencho o objeto com o que vem do post

            Boolean deucerto;

            //se veio com a chave primaria então tem q alterar
            if (request.getParameter("txtId") != null) {
                obj = dao.buscarPorChavePrimaria(Long.parseLong(request.getParameter("txtId")));
                
                String dia = request.getParameter("txtDataLavagem");
                Date dd = FormataData.formata(dia,"yyyy-MM-dd");
                obj.setDataLavagem(dd);
                
                obj.setNome(request.getParameter("txtNome"));
                obj.setPlaca(request.getParameter("txtPlaca"));
                obj.setTipoLavagem(request.getParameter("txtTipoLavagem"));
                obj.setPrecoLavagem(Double.parseDouble(request.getParameter("txtPrecoLavagem")));
                String hora = request.getParameter("txtHoraEntrega");
                Date d = FormataData.formata(hora,"HH:mm");
                //Date d = FormataData.formata(hora,"yyyy-MM-dd");
                //d.setTime(((Date)FormataData.formata(request.getParameter("txtHoraEntraga"))).getTime());
                obj.setHoraEntrega(d);
                deucerto = dao.alterar(obj);
                
                pagina = "edita-ok.jsp";
            } else {
                String diaa = request.getParameter("txtDataLavagem");
                Date ddd = FormataData.formata(diaa,"yyyy-MM-dd");
                obj.setDataLavagem(ddd);
                
                obj.setNome(request.getParameter("txtNome"));
                obj.setPlaca(request.getParameter("txtPlaca"));
                obj.setTipoLavagem(request.getParameter("txtTipoLavagem"));
                obj.setPrecoLavagem(Double.parseDouble(request.getParameter("txtPrecoLavagem")));
                String hora = request.getParameter("txtHoraEntrega");
                Date d = FormataData.formata(hora,"HH:mm");
                //Date d = FormataData.formata(hora,"yyyy-MM-dd");
                //d.setTime(((Date)FormataData.formata(request.getParameter("txtHoraEntraga"))).getTime());
                obj.setHoraEntrega(d);
                deucerto = dao.incluir(obj);
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
