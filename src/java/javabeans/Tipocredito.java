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
public class Tipocredito 
{
    private Integer id_tipocredito;
    private String descripcion;
    
    public Tipocredito(){ super();}
    //constructor que permite crear un objeto
    //Mensaje a partir de los datos del mismo
    public Tipocredito(Integer id_tipocredito,String descripcion)
    {
        this.id_tipocredito=id_tipocredito;
        this.descripcion=descripcion;
                
    }
    
    public Integer getId_tipocredito() {
        return id_tipocredito;
    }

    public void setId_tipocredito(Integer id_tipocredito) {
        this.id_tipocredito = id_tipocredito;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
