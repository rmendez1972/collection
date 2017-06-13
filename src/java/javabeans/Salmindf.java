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
 * @author Ismael
 */
public class Salmindf {
    private int id_salmindf;
    private Date fecha;
    private BigDecimal importe;
    
    //constructor de la clase
    public Salmindf(){
    }
    
    public Salmindf(int id_salmindf, Date fecha, BigDecimal importe)
    {
        this.id_salmindf=id_salmindf;
        this.fecha=fecha;
        this.importe=importe;
        
    }
    
    //get y set de nivel
    
    public int getId_salmindf() {
        return id_salmindf;
    }

    public void setId_salmindf(int id_salmindf) {
        this.id_salmindf = id_salmindf;
    }
    
    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public BigDecimal getImporte() {
        return importe;
    }

    public void setImporte(BigDecimal importe) {
        this.importe = importe;
    }

    
}