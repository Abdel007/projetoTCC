package Controle;

import Modelo.LocacaoTempo;
import Modelo.Pagamento;
import Modelo.Vaga;
import dao.LocacaoTempoDAO;
import dao.PagamentoDAO;
import dao.VagaDAO;
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
@WebServlet(name = "LocacaoTempoWS", urlPatterns = {"/admin/locacaoTempo/LocacaoTempoWS"})
public class LocacaoTempoWS extends HttpServlet {
    
        private LocacaoTempoDAO dao;
        private LocacaoTempo obj;
        private String pagina;
        private String acao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        acao = request.getParameter("acao");
        List<LocacaoTempo> lista = null;
        String id;
        switch (String.valueOf(acao)) {
            case "add":
                request.setAttribute("vaga", this.listaVaga());
                request.setAttribute("pagamento", this.listaPagamento());
                pagina = "add.jsp";
                break;
                
            case "del":
                id = request.getParameter("id");
                dao = new LocacaoTempoDAO();
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
                dao = new LocacaoTempoDAO();
                LocacaoTempo obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
                request.setAttribute("obj", obj);
                request.setAttribute("vaga", this.listaVaga());
                pagina = "edita.jsp";
                break;

            case "filter":
                pagina = "index.jsp";

                //ega a informação digitada pelo usuário do sistema
                String filtro = request.getParameter("txtFiltro");
                List<LocacaoTempo> lista2 = this.listar(filtro);
                request.setAttribute("lista", lista2);
                break;

            default:
                dao = new LocacaoTempoDAO();
                if (request.getParameter("filtro") != null) {
                    try {
                        lista = dao.listar(request.getParameter("filtro"));
                    } catch (Exception ex) {
                        Logger.getLogger(LocacaoTempoWS.class.getName()).log(Level.SEVERE, null, ex);
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
    
    public List<LocacaoTempo> listar(String filtro){
        List<LocacaoTempo> lista;
        LocacaoTempoDAO dao = new LocacaoTempoDAO();
        lista = dao.listar(filtro);
        dao.fecharConexao();
        return lista;
        
    }
    
     private List<Vaga> listaVaga() {
        VagaDAO dao = new VagaDAO();
        List<Vaga> vagas = dao.listar();
        dao.fecharConexao();
        return vagas;
    }
    
    private List<Pagamento> listaPagamento() {
        PagamentoDAO dao = new PagamentoDAO();
        List<Pagamento> pagamentos = dao.listar();
        dao.fecharConexao();
        return pagamentos;
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String msg;
        request.setCharacterEncoding("UTF-8");
        //verificar campos obrigatórios
        if (request.getParameter("txtPlacaCarro") == null) {
            msg = "Campos obrigatórios não informados";
        } else {
            dao = new LocacaoTempoDAO();
            obj = new LocacaoTempo();
            //preencho o objeto com o que vem do post

            Boolean deucerto;
            
            Long Vagas = Long.parseLong(request.getParameter("txtVaga"));
            
            Vaga vaga;
            VagaDAO vagadao = new VagaDAO();
            vaga = vagadao.buscarPorChavePrimaria(Vagas);

            //se veio com a chave primaria então tem q alterar
            if (request.getParameter("txtId") != null) {
                obj = dao.buscarPorChavePrimaria(Long.parseLong(request.getParameter("txtId")));
                obj.setPlacaCarro(request.getParameter("txtPlacaCarro"));
                obj.setNome(request.getParameter("txtNome"));
                
                String dia = request.getParameter("txtDiaInicio");
                Date d = FormataData.formata(dia,"yyyy-MM-dd");
                obj.setDiaInicio(d);
                
                String hora = request.getParameter("txtHoraInicio");
                Date dd = FormataData.formata(hora,"HH:mm");
                obj.setHoraInicio(dd);
                
                String diaa = request.getParameter("txtDiaTermino");
                Date ddd = FormataData.formata(diaa,"yyyy-MM-dd");
                obj.setDiaTermino(ddd);
                
                String horaa = request.getParameter("txtHoraTermino");
                Date dddd = FormataData.formata(horaa,"HH:mm");
                obj.setHoraTermino(dddd);
                
                obj.setVaga(vaga);
                obj.setValor(Double.parseDouble(request.getParameter("txtValor")));
                
                deucerto = dao.alterar(obj);
                pagina = "edita-ok.jsp";
            } else {
                obj.setPlacaCarro(request.getParameter("txtPlacaCarro"));
                obj.setNome(request.getParameter("txtNome"));
                
                String dia = request.getParameter("txtDiaInicio");
                Date d = FormataData.formata(dia,"yyyy-MM-dd");
                obj.setDiaInicio(d);
                
                String hora = request.getParameter("txtHoraInicio");
                Date dd = FormataData.formata(hora,"HH:mm");
                obj.setHoraInicio(dd);
                
                String diaa = request.getParameter("txtDiaTermino");
                Date ddd = FormataData.formata(diaa,"yyyy-MM-dd");
                obj.setDiaTermino(ddd);
                
                String horaa = request.getParameter("txtHoraTermino");
                Date dddd = FormataData.formata(horaa,"HH:mm");
                obj.setHoraTermino(dddd);
                
                obj.setVaga(vaga);
                obj.setValor(Double.parseDouble(request.getParameter("txtValor")));

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
