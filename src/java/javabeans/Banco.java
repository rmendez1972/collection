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
public class Banco 
{
    private Integer id_banco;
    private String descripcion;
    
    public Banco(){ super();}
    //constructor que permite crear un objeto
    //Mensaje a partir de los datos del mismo
    public Banco(Integer id_banco,String descripcion)
    {
        this.id_banco=id_banco;
        this.descripcion=descripcion;
                
    }

    public Integer getId_banco() {
        return id_banco;
    }

    public void setId_banco(Integer id_banco) {
        this.id_banco = id_banco;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
       
    
}
