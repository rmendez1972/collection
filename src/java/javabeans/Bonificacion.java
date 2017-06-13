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
public class Bonificacion 
{
    private Integer id_bonific;
    private String clave_bonific;
    private String descripcion;
    
    public Bonificacion(){ super();}
    //constructor que permite crear un objeto
    //Mensaje a partir de los datos del mismo
    public Bonificacion(Integer id_bonific,String clave_bonific,String descripcion)
    {
        this.id_bonific=id_bonific;
        this.clave_bonific=clave_bonific;
        this.descripcion=descripcion;
                
    }
    

    public Integer getId_bonific() {
        return id_bonific;
    }

    public void setId_bonific(Integer id_bonific) {
        this.id_bonific = id_bonific;
    }

    public String getClave_bonific() {
        return clave_bonific;
    }

    public void setClave_bonific(String clave_bonific) {
        this.clave_bonific = clave_bonific;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
