/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;

/**
 *
 * @author lucas
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "LocacaoTempo.findAll", query = "SELECT lt FROM LocacaoTempo lt ORDER BY lt.diaInicio DESC"),
    @NamedQuery(name = "LocacaoTempo.findFilter", query = "select lt from LocacaoTempo lt" +
            " where UPPER(lt.placaCarro) like :filtro")
})
public class LocacaoTempo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String nome;
    private String placaCarro;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date diaInicio;
    @Temporal(javax.persistence.TemporalType.TIME)
    private Date horaInicio;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date diaTermino;
    @Temporal(javax.persistence.TemporalType.TIME)
    private Date horaTermino;
    @ManyToOne
    private Vaga vaga;
    private double valor;
    
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
        if (!(object instanceof LocacaoTempo)) {
            return false;
        }
        LocacaoTempo other = (LocacaoTempo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modelo.LocacaoTempo[ id=" + id + " ]";
    }

    public String getPlacaCarro() {
        return placaCarro;
    }

    public void setPlacaCarro(String placaCarro) {
        this.placaCarro = placaCarro;
    }

    public Date getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Date horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Date getHoraTermino() {
        return horaTermino;
    }

    public void setHoraTermino(Date horaTermino) {
        this.horaTermino = horaTermino;
    }

    public Vaga getVaga() {
        return vaga;
    }

    public void setVaga(Vaga vaga) {
        this.vaga = vaga;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getDiaInicio() {
        return diaInicio;
    }

    public void setDiaInicio(Date diaInicio) {
        this.diaInicio = diaInicio;
    }

    public Date getDiaTermino() {
        return diaTermino;
    }

    public void setDiaTermino(Date diaTermino) {
        this.diaTermino = diaTermino;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }
    
}
