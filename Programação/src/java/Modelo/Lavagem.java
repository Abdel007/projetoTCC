/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;

/**
 *
 * @author lucas
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Lavagem.findAll", query = "SELECT l FROM Lavagem l ORDER BY l.dataLavagem DESC"),
    @NamedQuery(name = "Lavagem.findFilter", query = "select l from Lavagem l" +
            " where UPPER(l.nome) like :filtro"),
    @NamedQuery(name = "Lavagem.findByDataLavagem", query = "SELECT l FROM Lavagem l WHERE l.dataLavagem = false ORDER BY l.dataLavagem DESC"),
    @NamedQuery(name = "Lavagem.findLavagem", query = "select l from Lavagem l")
})
public class Lavagem implements Serializable {
    
    

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String nome;
    private String placa;
    private String tipoLavagem;
    private double precoLavagem;
    @Temporal(javax.persistence.TemporalType.TIME)
    private Date horaEntrega;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dataLavagem;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Lavagem)) {
            return false;
        }
        Lavagem other = (Lavagem) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modelo.Lavagem[ id=" + id + " ]";
    }

    public String getTipoLavagem() {
        return tipoLavagem;
    }

    public void setTipoLavagem(String tipoLavagem) {
        this.tipoLavagem = tipoLavagem;
    }

    public double getPrecoLavagem() {
        return precoLavagem;
    }

    public void setPrecoLavagem(double precoLavagem) {
        this.precoLavagem = precoLavagem;
    }

    public Date getHoraEntrega() {
        return horaEntrega;
    }

    public void setHoraEntrega(Date horaEntrega) {
        this.horaEntrega = horaEntrega;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public Date getDataLavagem() {
        return dataLavagem;
    }

    public void setDataLavagem(Date dataLavagem) {
        this.dataLavagem = dataLavagem;
    }

   

    

    

    
    
}
