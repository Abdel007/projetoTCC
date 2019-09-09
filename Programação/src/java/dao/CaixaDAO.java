/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Modelo.VwCaixa;
import java.time.Year;
import java.util.Calendar;
import static java.util.Calendar.DAY_OF_MONTH;
import java.util.Date;
import java.util.*;
import static java.util.Calendar.MONTH;
import static java.util.Calendar.YEAR;
import java.util.List;
import javax.persistence.TemporalType;
import util.FormataData;

/**
 *
 * @author dappo
 */
public class CaixaDAO extends GenericDAO<VwCaixa, Long> {

    public CaixaDAO() {
        super(VwCaixa.class);
    }

    public List<VwCaixa> listarTipoEspecifico(String tipo, Date data1, Date data2) {
        return em.createNamedQuery("VwCaixa.findByTipo")
                .setParameter("tipo", tipo)
                .setParameter("data1", data1, TemporalType.DATE)
                .setParameter("data2", data2, TemporalType.DATE)
                .getResultList();
    }

    public List<VwCaixa> listarTodosTipos(Date data1, Date data2) {
        return em.createNamedQuery("VwCaixa.findByTipoAll")
                .setParameter("data1", data1, TemporalType.DATE)
                .setParameter("data2", data2, TemporalType.DATE)
                .getResultList();
    }

    public Double listarSomaTipoEspecifico(String tipo, Date data1, Date data2) {
        return Double.parseDouble(em.createNamedQuery("VwCaixa.findByTipoSoma")
                .setParameter("tipo", tipo)
                .setParameter("data1", data1, TemporalType.DATE)
                .setParameter("data2", data2, TemporalType.DATE)
                .getSingleResult().toString());
    }
    
    public Double listarSomaTodosTipos(Date data1, Date data2) {
        return Double.parseDouble(em.createNamedQuery("VwCaixa.findByTipoAllSoma")
                .setParameter("data1", data1, TemporalType.DATE)
                .setParameter("data2", data2, TemporalType.DATE)
                .getSingleResult().toString());
    }
    
//    public List<VwCaixa> listarTodosTiposMes() {
//        Calendar cal = Calendar.getInstance();
//        String primeirodia,ultimodia;
//        primeirodia = String.valueOf(cal.get(YEAR)) + "-"+String.valueOf(cal.get(MONTH)+1) + "-01"  ;
//        ultimodia = String.valueOf(cal.get(YEAR)) + "-"+String.valueOf(cal.get(MONTH)+1) + "-" + cal.getMaximum(DAY_OF_MONTH);
//        
//        Date data1 = FormataData.formata(primeirodia,"yyyy-MM-dd");
//        Date data2 = FormataData.formata(ultimodia,"yyyy-MM-dd");
//        
//        return this.listarTodosTipos(data1, data2);
//    }

    public VwCaixa buscarPorChavePrimaria(Integer chaveprimaria) {
        return em.find(VwCaixa.class, chaveprimaria);
    }

    public void fecharConexao() {
        Conexao.closeConexao();
    }

}
