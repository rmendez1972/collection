/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author Rafael Méndez
*/

public class Clavemov {
        
    private int id_clave_mov;
    private String clave_mov;
    private String descripcion;

           
    //constructor de la clase
    public Clavemov(){
        super();
    }
    
    public Clavemov(int id_clave_mov, String clave_mov, String descripcion) {
        this.id_clave_mov = id_clave_mov;
        this.clave_mov = clave_mov;
        this.descripcion = descripcion;
    }
    
    public int getId_clave_mov() {
        return id_clave_mov;
    }

    public void setId_clave_mov(int id_clave_mov) {
        this.id_clave_mov = id_clave_mov;
    }

    public String getClave_mov() {
        return clave_mov;
    }

    public void setClave_mov(String clave_mov) {
        this.clave_mov = clave_mov;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
        
    
}
