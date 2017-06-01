/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;
import java.util.Date;
import java.math.BigDecimal;

/**
 *
 * @author Marlon
 */
public class Salmin {
    //declaracion de variables
    private int id_salmin;
    private Date fecha;
    private BigDecimal importe;
    
    //constructor
    public Salmin(){}
    
    public Salmin(int id_salmin, Date fecha, BigDecimal importe){
        this.id_salmin=id_salmin;
        this.fecha=fecha;
        this.importe=importe;
    }
    
    //get y set
    public int getId_salmin(){
        return id_salmin;
    }
    
    public void setId_salmin(int id_salmin){
        this.id_salmin = id_salmin;
    }
    
    public Date getFecha(){
        return fecha;
    }
    
    public void setFecha(Date fecha){
        this.fecha=fecha;
    }
    
    public BigDecimal getImporte(){
        return importe;
    }
    
    public void setImporte(BigDecimal importe){
        this.importe = importe;
    }
    
}
