/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Modelo.Lavagem;
import java.util.List;


/**
 *
 * @author dappo
 */
public class LavagemDAO extends GenericDAO<Lavagem, Long>{
    
    public LavagemDAO(){
        super(Lavagem.class);
    }
    public List<Lavagem> listar(String filtro){
        return em.createNamedQuery("Lavagem.findFilter").setParameter("filtro","%" + filtro.toUpperCase() + "%").getResultList();
    }
}
