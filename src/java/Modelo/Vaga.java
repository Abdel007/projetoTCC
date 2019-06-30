/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 *
 * @author lucas
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Vaga.findAll", query = "SELECT v FROM Vaga v ORDER BY v.numVaga ASC"),
    @NamedQuery(name = "Vaga.findOcupada", query = "select v from Vaga v where v.ocupada = false ORDER BY v.numVaga ASC"),
        @NamedQuery(name = "Vaga.findFilter", query = "select v from Vaga v where v.ocupada = :teste")
//,
//    @NamedQuery(name = "Vaga.findFilter", query = "select v from Vaga v" +
//            " where :filtro")
})
public class Vaga implements Serializable {

    @OneToMany(mappedBy = "vaga")
    private List<LocacaoTempo> locacaoTempos;
    
    @OneToMany(mappedBy = "vaga")
    private List<Mensalista> mensalistas;
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Integer numVaga;
    private Boolean ocupada;
    private Boolean coberta;

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
        if (!(object instanceof Vaga)) {
            return false;
        }
        Vaga other = (Vaga) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modelo.Vaga[ id=" + id + " ]";
    }

    public Integer getNumVaga() {
        return numVaga;
    }

    public void setNumVaga(Integer numVaga) {
        this.numVaga = numVaga;
    }

    public Boolean getOcupada() {
        return ocupada;
    }

    public void setOcupada(Boolean ocupada) {
        this.ocupada = ocupada;
    }

    public Boolean getCoberta() {
        return coberta;
    }

    public void setCoberta(Boolean coberta) {
        this.coberta = coberta;
    }

    public List<LocacaoTempo> getLocacaoTempos() {
        return locacaoTempos;
    }

    public void setLocacaoTempos(List<LocacaoTempo> locacaoTempos) {
        this.locacaoTempos = locacaoTempos;
    }

    public List<Mensalista> getMensalistas() {
        return mensalistas;
    }

    public void setMensalistas(List<Mensalista> mensalistas) {
        this.mensalistas = mensalistas;
    }
    
}
