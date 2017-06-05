/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author Marlon
 */
public class Caja {
    //declaracion de variables
    private Integer id_caja;
    private Date fecha;
    private Integer folio_inicial;
    private Integer folio_final;
    private String poliza;
    private BigDecimal monto_inicial;
    private Integer id_usuario;
    private String usuario;
    
    public Caja(){
        super();
    }
    
    public Caja(Integer id_caja, Date fecha, Integer folio_inicial, Integer folio_final, String poliza, BigDecimal monto_inicial, Integer id_usuario){
        this.id_caja = id_caja;
        this.fecha = fecha;
        this.folio_inicial = folio_inicial;
        this.folio_final = folio_final;
        this.poliza = poliza;
        this.monto_inicial = monto_inicial;
        this.id_usuario = id_usuario;
    }
    //get set de id_caja
    public Integer getId_caja(){
        return id_caja;
    }
    
    public void setId_caja(Integer id_caja){
        this.id_caja = id_caja;
    }
    
    //get set Fecha
    public Date getFecha(){
        return fecha;
    }
    
    public void setFecha(Date fecha){
        this.fecha = fecha;
    }
    
    //get set folio_inicial
    public Integer getFolio_inicial(){
        return folio_inicial;
    }
    
    public void setFolio_inicial(Integer folio_inicial){
        this.folio_inicial = folio_inicial;
    }
    
    //get set folio final
    public Integer getFolio_final(){
        return folio_final;
    }
    
    public void setFolio_final(Integer folio_final){
        this.folio_final = folio_final;
    }
    
    //get set poliza
    public String getPoliza(){
        return poliza;
    }
    
    public void setPoliza(String poliza){
        this.poliza = poliza;
    }
    
    //get set monto_inicial
    public BigDecimal getMonto_inicial(){
        return monto_inicial;
    }
    
    public void setMonto_inicial(BigDecimal monto_inicial){
        this.monto_inicial = monto_inicial;
    }
    
    //get set id_usuario
    public Integer getId_usuario(){
        return id_usuario;
    }
    
    public void setId_usuario(Integer id_usuario){
        this.id_usuario = id_usuario;
    }
    
    //get set usuario
    public String getUsuario(){
        return usuario;
    }
    
    public void setUsuario(String usuario){
        this.usuario = usuario;
    }
    
    
}
