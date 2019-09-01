/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Modelo.Vaga;
import dao.VagaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lucas
 */
@WebServlet(name = "VagaWS", urlPatterns = {"/admin/vaga/VagaWS"})
public class VagaWS extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    private VagaDAO dao;
    private Vaga obj;
    private String pagina;
    private String acao;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        acao = request.getParameter("acao");
        List<Vaga> lista = null;
        String id;
        switch (String.valueOf(acao)) {
            
            case "grafico":
                request.setAttribute("vaga", this.listaVaga());
                pagina = "graficoPatio.jsp";
                break;

            case "del":
                id = request.getParameter("id");
                dao = new VagaDAO();
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
                dao = new VagaDAO();
                Vaga obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
                request.setAttribute("obj", obj);
                pagina = "edita.jsp";
                break;

            case "filter":
                pagina = "index.jsp";

                //ega a informação digitada pelo usuário do sistema
                String filtro = request.getParameter("txtFiltro");
                List<Vaga> lista2 = this.listar(filtro);
                request.setAttribute("lista", lista2);
                break;

            default:
                dao = new VagaDAO();
                if (request.getParameter("filtro") != null) {
                    try {
                        
                        lista = dao.listar(request.getParameter("filtro"));
                    } catch (Exception ex) {
                        Logger.getLogger(VagaWS.class.getName()).log(Level.SEVERE, null, ex);
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
    public List<Vaga> listar(Boolean filtro){
        List<Vaga> lista;
        VagaDAO dao = new VagaDAO();
        lista = dao.listar(filtro);
        dao.fecharConexao();
        return lista;
        
    }
    
    public List<Vaga> listar(String filtro){
        List<Vaga> lista;
        VagaDAO dao = new VagaDAO();
        lista = dao.listar();
        dao.fecharConexao();
        return lista;
        
    }
    
    private List<Vaga> listaVaga() {
        VagaDAO dao = new VagaDAO();
        List<Vaga> vagas = dao.listar();
        dao.fecharConexao();
        return vagas;
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String msg;
        request.setCharacterEncoding("UTF-8");
        //verificar campos obrigatórios
        if (request.getParameter("txtNumVaga") == null) {
            msg = "Campos obrigatórios não informados";
        } else {
            dao = new VagaDAO();
            obj = new Vaga();
            //preencho o objeto com o que vem do post

            Boolean deucerto;

            //se veio com a chave primaria então tem q alterar
            if (request.getParameter("txtId") != null) {
                obj = dao.buscarPorChavePrimaria(Long.parseLong(request.getParameter("txtId")));
                obj.setNumVaga(Integer.parseInt(request.getParameter("txtNumVaga")));
                boolean ocupada;
                    if(request.getParameter("txtOcupada")!=null)
                    {
                        ocupada = true;
                    }
                    else
                    {
                        ocupada = false;
                    }
                boolean coberta;
                    if(request.getParameter("txtCoberta")!=null)
                    {
                        coberta = true;
                    }
                    else
                    {
                        coberta = false;
                    }
                    obj.setOcupada(ocupada);
                    obj.setCoberta(coberta);
                deucerto = dao.alterar(obj);
                pagina = "edita-ok.jsp";
            } else {
                obj.setNumVaga(Integer.parseInt(request.getParameter("txtNumVaga")));
                boolean estaocupada;
                    if(request.getParameter("txtOcupada")!=null)
                    {
                        estaocupada = true;
                    }
                    else
                    {
                        estaocupada = false;
                    }
                boolean estacoberta;
                    if(request.getParameter("txtCoberta")!=null)
                    {
                        estacoberta = true;
                    }
                    else
                    {
                        estacoberta = false;
                    }
                    obj.setOcupada(estaocupada);
                    obj.setCoberta(estacoberta);
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
