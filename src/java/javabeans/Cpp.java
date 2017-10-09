/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package javabeans;

import java.math.BigDecimal;
import java.util.Date;


/**
 *
 * @author Rafael Mendez
 */
public class Cpp 
{
    private Integer id_cpp;
    private Date fecha;
    private BigDecimal importe;
    
    public Cpp(){ super();}
    //constructor que permite crear un objeto
    //Mensaje a partir de los datos del mismo
    public Cpp(Date fecha, BigDecimal importe, Integer id_cpp)
    {
        this.fecha=fecha;
        this.importe=importe;
        this.id_cpp=id_cpp;
        
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
    
     public Integer getId_cpp() {
        return id_cpp;
    }

    public void setId_cpp(Integer id_cpp) {
        this.id_cpp = id_cpp;
    }

    
}
