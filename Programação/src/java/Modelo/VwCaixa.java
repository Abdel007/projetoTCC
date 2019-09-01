/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Calendar;
import static java.util.Calendar.DAY_OF_MONTH;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author lucas
 */
@Entity
@Table(name = "vw_caixa")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VwCaixa.findAll", query = "SELECT v FROM VwCaixa v")    
    , @NamedQuery(name = "VwCaixa.findByTipo", query = "SELECT v FROM VwCaixa v WHERE v.tipo = :tipo AND v.datasaida BETWEEN :data1 AND :data2 ORDER BY v.datasaida DESC")
    , @NamedQuery(name = "VwCaixa.findByTipoAll", query = "SELECT v FROM VwCaixa v WHERE v.datasaida BETWEEN :data1 AND :data2 ORDER BY v.datasaida DESC")
    //, @NamedQuery(name = "VwCaixa.findByTipoAllMes", query = "SELECT v FROM VwCaixa v WHERE MONTH(v.datasaida) = MONTH(current_date())")
    , @NamedQuery(name = "VwCaixa.findByTipoSoma", query = "SELECT sum(v.valor) FROM VwCaixa v WHERE v.tipo = :tipo AND v.datasaida BETWEEN :data1 AND :data2")
    , @NamedQuery(name = "VwCaixa.findByTipoAllSoma", query = "SELECT sum(v.valor) FROM VwCaixa v WHERE v.datasaida BETWEEN :data1 AND :data2")})
public class VwCaixa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id")
    private BigInteger id;
    @Column(name = "datasaida")
    @Temporal(TemporalType.DATE)
    private Date datasaida;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "valor")
    private Double valor;
    @Column(name = "tipo")
    private String tipo;
    
    

    public VwCaixa() {
    }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public Date getDatasaida() {
        return datasaida;
    }

    public void setDatasaida(Date datasaida) {
        this.datasaida = datasaida;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
}
