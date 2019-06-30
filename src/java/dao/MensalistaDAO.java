/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Modelo.Mensalista;
import java.util.List;


/**
 *
 * @author dappo
 */
public class MensalistaDAO extends GenericDAO<Mensalista, Long>{
    
    public MensalistaDAO(){
        super(Mensalista.class);
    }
    
    public List<Mensalista> listar(String filtro){
        return em.createNamedQuery("Mensalista.findFilter").setParameter("filtro","%" + filtro.toUpperCase() + "%").getResultList();
    }
    
        public Mensalista buscarPorChavePrimaria(Integer chaveprimaria) {
       return em.find(Mensalista.class, chaveprimaria);
   }
    
}
