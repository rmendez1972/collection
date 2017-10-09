/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import java.math.BigDecimal;

/**
 *
 * @author SEDUVI
 */
public class ClaveDiversos {

    private Integer id_clave_div;
    private String clave_div;
    private String descripcion;
    private BigDecimal importe;
    private String cuenta_cont;
    
    public ClaveDiversos(){
        super();
    }
    
    public ClaveDiversos(Integer id_clave_div, String clave_div, String descripcion, BigDecimal importe, String cuenta_cont) {
        this.id_clave_div = id_clave_div;
        this.clave_div = clave_div;
        this.descripcion = descripcion;
        this.importe = importe;
        this.cuenta_cont = cuenta_cont;
    }
    
     public Integer getId_clave_div() {
        return id_clave_div;
    }

    public void setId_clave_div(Integer id_clave_div) {
        this.id_clave_div = id_clave_div;
    }

    public String getClave_div() {
        return clave_div;
    }

    public void setClave_div(String clave_div) {
        this.clave_div = clave_div;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public BigDecimal getImporte() {
        return importe;
    }

    public void setImporte(BigDecimal importe) {
        this.importe = importe;
    }

    public String getCuenta_cont() {
        return cuenta_cont;
    }

    public void setCuenta_cont(String cuenta_cont) {
        this.cuenta_cont = cuenta_cont;
    }
}
