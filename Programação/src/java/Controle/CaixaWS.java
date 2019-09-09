/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Modelo.VwCaixa;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import dao.CaixaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import static java.util.Calendar.DAY_OF_MONTH;
import static java.util.Calendar.MONTH;
import static java.util.Calendar.YEAR;
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
@WebServlet(name = "CaixaWS", urlPatterns = {"/admin/caixa/CaixaWS"})
public class CaixaWS extends HttpServlet {

    private CaixaDAO dao;
    private VwCaixa obj;
    private String pagina;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        pagina = "controleCaixa.jsp";
        
        Calendar cal = Calendar.getInstance();
        String primeirodia,ultimodia;
        primeirodia = String.valueOf(cal.get(YEAR)) + "-"+String.valueOf(cal.get(MONTH)+1) + "-01"  ;
        ultimodia = String.valueOf(cal.get(YEAR)) + "-"+String.valueOf(cal.get(MONTH)+1) + "-" + cal.getMaximum(DAY_OF_MONTH);
        
        Date data1 = FormataData.formata(primeirodia,"yyyy-MM-dd");
        Date data2 = FormataData.formata(ultimodia,"yyyy-MM-dd");
        
        List<VwCaixa> lista = this.listarTodosTipos(data1, data2);
        Double valor = this.listarSomaTodosTipos(data1, data2);
        request.setAttribute("valor", valor);
        request.setAttribute("lista", lista);
        
        RequestDispatcher destino;
        destino = request.getRequestDispatcher(pagina);
        destino.forward(request, response);
    }

    public List<VwCaixa> listarTipoEspecifico(String tipo, Date data1, Date data2)  {
        List<VwCaixa> lista;
        CaixaDAO dao = new CaixaDAO();
        lista = dao.listarTipoEspecifico(tipo,data1,data2);
        dao.fecharConexao();
        return lista;
    }  
        
     public List<VwCaixa> listarTodosTipos(Date data1, Date data2)  {
        List<VwCaixa> lista;
        CaixaDAO novadao = new CaixaDAO();
        lista = novadao.listarTodosTipos(data1,data2);
        novadao.fecharConexao();
        return lista;
    }
     
     public Double listarSomaTipoEspecifico(String tipo, Date data1, Date data2)  {
        Double valor;
        CaixaDAO dao = new CaixaDAO();
        valor = dao.listarSomaTipoEspecifico(tipo,data1,data2);
        dao.fecharConexao();
        return valor;
    }  
     
     public Double listarSomaTodosTipos(Date data1, Date data2)  {
        Double valor;
        CaixaDAO novadao = new CaixaDAO();
        valor = novadao.listarSomaTodosTipos(data1,data2);
        novadao.fecharConexao();
        return valor;
    }
     
//    public List<VwCaixa> listarTodosTiposMes()  {
//        List<VwCaixa> lista;
//        CaixaDAO novadao = new CaixaDAO();
//        lista = novadao.listarTodosTiposMes();
//        novadao.fecharConexao();
//        return lista;
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String msg;
        request.setCharacterEncoding("UTF-8");
        //verificar campos obrigatórios
        if (request.getParameter("txtTipo") == null) {
            msg = "Campos obrigatórios não informados";
        } else {
            dao = new CaixaDAO();
            obj = new VwCaixa();
            
            String TipoFiltro = request.getParameter("txtTipo");
                    
            if ("lavagem".equals(TipoFiltro) || "locacaotempo".equals(TipoFiltro) || "pagamento".equals(TipoFiltro) ) {
                
                String tipo = request.getParameter("txtTipo");

                
                String dia1 = request.getParameter("txtData1");
                Date d = FormataData.formata(dia1,"yyyy-MM-dd");

                
                String dia2 = request.getParameter("txtData2");
                Date dd = FormataData.formata(dia2,"yyyy-MM-dd");

                
                List<VwCaixa> lista = this.listarTipoEspecifico(tipo, d, dd);
                Double valor = this.listarSomaTipoEspecifico(tipo, d, dd);
                
                pagina = "controleCaixa.jsp";
                request.setAttribute("lista", lista);
                request.setAttribute("valor", valor);
                
                request.setAttribute("obj", tipo);
                
            }else if ("todos".equals(TipoFiltro) ) {
                
                String dia1 = request.getParameter("txtData1");
                Date d = FormataData.formata(dia1,"yyyy-MM-dd");
                obj.setDatasaida(d);
                
                String dia2 = request.getParameter("txtData2");
                Date dd = FormataData.formata(dia2,"yyyy-MM-dd");
                obj.setDatasaida(dd);
                
                List<VwCaixa> lista = this.listarTodosTipos(d, dd);
                Double valor = this.listarSomaTodosTipos(d, dd);
                
                pagina = "controleCaixa.jsp";
                request.setAttribute("lista", lista);
                request.setAttribute("valor", valor);
                
                Object tipo = "todos";
                request.setAttribute("obj", tipo);
            }
        dao.fecharConexao();
        RequestDispatcher destino = request.getRequestDispatcher(pagina);
        destino.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}


