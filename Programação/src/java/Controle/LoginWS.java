/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Modelo.Admin;
import Modelo.TabelaPreco;
import dao.AdminDAO;
import dao.TabelaPrecoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.Criptografia;

/**
 *
 * @author lucas
 */
@WebServlet(name = "LoginWS", urlPatterns = {"/admin/login/LoginWS"})
public class LoginWS extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("txtNome");
        String senha;
        String pagina;
        try {
            senha = Criptografia.convertPasswordToMD5(request.getParameter("txtSenha"));
            AdminDAO dao = new AdminDAO();
            Admin admin = dao.fazerLogin(nome, senha);
            if(admin.getId()!=null){
                request.getSession().setAttribute("admin",admin);
                request.setAttribute("lista", this.listaTabelaPreco());
                pagina = "../tabelaPreco/index.jsp";
                
            }else{
                request.setAttribute("msg", "Senha e/ou Login incorretos!");
                pagina = "login.jsp";
            }
            RequestDispatcher destino = request.getRequestDispatcher(pagina);
            destino.forward(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginWS.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    private List<TabelaPreco> listaTabelaPreco() {
        TabelaPrecoDAO dao = new TabelaPrecoDAO();
        List<TabelaPreco> lista = dao.listar();
        dao.fecharConexao();
        return lista;
    }
    

}
