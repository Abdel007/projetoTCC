/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Modelo.Vaga;
import java.util.List;


/**
 *
 * @author dappo
 */
public class VagaDAO extends GenericDAO<Vaga, Long>{
    
    public VagaDAO(){
        super(Vaga.class);
    }
    public List<Vaga> listar(Boolean teste){
        return em.createNamedQuery("Vaga.findFilter").setParameter("teste",teste).getResultList();
    }
    
    public Vaga buscarPorChavePrimaria(Integer chaveprimaria) {
       return em.find(Vaga.class, chaveprimaria);
   }

    public List<Vaga> listarOcupada() {
        return em.createNamedQuery("Vaga.findOcupada").getResultList();
    }
}
