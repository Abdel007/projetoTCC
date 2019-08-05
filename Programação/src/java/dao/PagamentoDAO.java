/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Modelo.Pagamento;
import java.util.List;


/**
 *
 * @author dappo
 */
public class PagamentoDAO extends GenericDAO<Pagamento, Long>{
    
    public PagamentoDAO(){
        super(Pagamento.class);
    }
    public List<Pagamento> listar(String filtro){
        return em.createNamedQuery("Pagamento.findFilter").setParameter("filtro","%" + filtro.toUpperCase() + "%").getResultList();
    }
           
         public List<Pagamento> listar(Long filtro){
        return em.createNamedQuery("Pagamento.findPagamento").setParameter("filtro", filtro ).getResultList();
    }      

    public Pagamento buscarPorChavePrimaria(Long chaveprimaria) {
       return em.find(Pagamento.class, chaveprimaria);
   }
}
