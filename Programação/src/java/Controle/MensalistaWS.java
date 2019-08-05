/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Modelo.Lavagem;
import Modelo.Mensalista;
import Modelo.Pagamento;
import Modelo.Vaga;
import dao.LavagemDAO;
import dao.MensalistaDAO;
import dao.PagamentoDAO;
import dao.VagaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import static javafx.scene.input.KeyCode.T;
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
@WebServlet(name = "MensalistaWS", urlPatterns = {"/admin/mensalista/MensalistaWS"})
public class MensalistaWS extends HttpServlet {

    private MensalistaDAO dao;
    private Mensalista obj;
    private String pagina;
    private String acao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        acao = request.getParameter("acao");
        List<Mensalista> lista = null;
        String id;
        switch (String.valueOf(acao)) {
            case "add":
                request.setAttribute("vaga", this.listaVaga());
                request.setAttribute("pagamento", this.listaPagamento());
                pagina = "add.jsp";
                break;

            case "del":
                id = request.getParameter("id");
                dao = new MensalistaDAO();
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
                dao = new MensalistaDAO();
                Mensalista obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
                request.setAttribute("vaga", this.listaVaga());
                request.setAttribute("pagamento", this.listaPagamento());
                request.setAttribute("obj", obj);

                pagina = "edita.jsp";
                break;

            case "filter":
                pagina = "index.jsp";

                //pega a informação digitada pelo usuário do sistema
                String filtro = request.getParameter("txtFiltro");
                List<Mensalista> lista2 = this.listar(filtro);
                request.setAttribute("lista", lista2);
                break;

            case "pagamentos":
                if (request.getParameter("id") != null) {
                    Long idPag = Long.parseLong(request.getParameter("id"));
                    request.setAttribute("mensalista", this.buscaMensalista(idPag));
                    request.setAttribute("msg", this.listarr(idPag));
                    pagina = "pagamentos.jsp";

                } else {
                    request.setAttribute("msg", "Identificador não informado");
                }
                pagina = "pagamentos.jsp";
                break;

            default:
                dao = new MensalistaDAO();
                if (request.getParameter("filtro") != null) {
                    try {
                        lista = dao.listar(request.getParameter("filtro"));
                    } catch (Exception ex) {
                        Logger.getLogger(MensalistaWS.class.getName()).log(Level.SEVERE, null, ex);
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

    private List<Vaga> listaVaga() {
        VagaDAO dao = new VagaDAO();
        List<Vaga> vagas = dao.listarOcupada();
        dao.fecharConexao();
        return vagas;
    }

    private List<Pagamento> listaPagamento() {
        PagamentoDAO dao = new PagamentoDAO();
        List<Pagamento> pagamentos = dao.listar();
        dao.fecharConexao();
        return pagamentos;
    }

    public List<Mensalista> listar(String filtro) {
        List<Mensalista> lista;
        MensalistaDAO dao = new MensalistaDAO();
        lista = dao.listar(filtro);
        dao.fecharConexao();
        return lista;

    }

    private List<Pagamento> listarr(Long id) {
        PagamentoDAO dao = new PagamentoDAO();
        List<Pagamento> pagamento = dao.listar(id);
        dao.fecharConexao();
        return pagamento;
    }

    private Mensalista buscaMensalista(Long id) {
        MensalistaDAO dao = new MensalistaDAO();
        Mensalista mensalista = dao.buscarPorChavePrimaria(id);
        dao.fecharConexao();
        return mensalista;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String msg;
        request.setCharacterEncoding("UTF-8");
        //verificar campos obrigatórios
        if (request.getParameter("txtNome") == null) {
            msg = "Campos obrigatórios não informados";
        } else {
            dao = new MensalistaDAO();
            obj = new Mensalista();
            //preencho o objeto com o que vem do post
            Boolean deucerto;

            Long Vagas = Long.parseLong(request.getParameter("txtVaga"));
            
            VagaDAO vdao;
            Vaga vaga;
            VagaDAO vagadao = new VagaDAO();
            vaga = vagadao.buscarPorChavePrimaria(Vagas);

            //se veio com a chave primaria então tem q alterar
            if (request.getParameter("txtId") != null) {
                obj = dao.buscarPorChavePrimaria(Long.parseLong(request.getParameter("txtId")));
                boolean ativo;
                if (request.getParameter("txtAtivo") != null) {
                    ativo = true;
                } else {
                    ativo = false;
                }
                obj.setAtivo(ativo);
                Vaga vagaAtual = obj.getVaga();
                obj.setNome(request.getParameter("txtNome"));
                obj.setCpf(request.getParameter("txtCpf"));
                obj.setTelefone(request.getParameter("txtTelefone"));
                obj.setFoto(request.getParameter("txtFoto"));
                obj.setValorMensal(Double.parseDouble(request.getParameter("txtValorMensal")));

                obj.setObservacoes(request.getParameter("txtObservacoes"));
                obj.setModeloCarro(request.getParameter("txtModeloCarro"));
                obj.setCorCarro(request.getParameter("txtCorCarro"));
                obj.setPlacaCarro(request.getParameter("txtPlacaCarro"));

                obj.setVaga(vaga);
                vdao = new VagaDAO();
                if (vaga.getNumVaga() != vagaAtual.getNumVaga() && ativo == true) {
                    vagaAtual.setOcupada(false);
                    vaga.setOcupada(true);
                    vdao.alterar(vagaAtual);
                    vdao.alterar(vaga);
                }
                if (ativo == false) {
                    vagaAtual.setOcupada(false);
                    vaga.setOcupada(false);
                    vdao.alterar(vagaAtual);
                    vdao.alterar(vaga);
                }

                deucerto = dao.alterar(obj);
                pagina = "edita-ok.jsp";
            } else {
                obj.setNome(request.getParameter("txtNome"));
                obj.setCpf(request.getParameter("txtCpf"));
                obj.setTelefone(request.getParameter("txtTelefone"));
                obj.setFoto(request.getParameter("txtFoto"));
                obj.setValorMensal(Double.parseDouble(request.getParameter("txtValorMensal")));
                boolean ativo;
                if (request.getParameter("txtAtivo") != null) {
                    ativo = true;
                } else {
                    ativo = false;
                }
                obj.setAtivo(ativo);
                obj.setObservacoes(request.getParameter("txtObservacoes"));
                obj.setModeloCarro(request.getParameter("txtModeloCarro"));
                obj.setCorCarro(request.getParameter("txtCorCarro"));
                obj.setPlacaCarro(request.getParameter("txtPlacaCarro"));
                obj.setVaga(vaga);
                vdao = new VagaDAO();
                if (ativo == true) {
                    vaga.setOcupada(true);
                } else {
                    vaga.setOcupada(false);
                }
                vdao.alterar(vaga);
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
