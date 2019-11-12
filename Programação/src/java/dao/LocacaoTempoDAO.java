/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Modelo.LocacaoTempo;
import java.util.List;


/**
 *
 * @author dappo
 */
public class LocacaoTempoDAO extends GenericDAO<LocacaoTempo, Long>{
    
    public LocacaoTempoDAO(){
        super(LocacaoTempo.class);
    }
    public List<LocacaoTempo> listar(String filtro){
        return em.createNamedQuery("LocacaoTempo.findFilter").setParameter("filtro","%" + filtro.toUpperCase() + "%").getResultList();
    }
    
    public List<LocacaoTempo> listar(Long filtro){
        return em.createNamedQuery("Pagamento.findPagamento").setParameter("filtro", filtro ).getResultList();
    }      
}
