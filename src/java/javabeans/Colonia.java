/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author Rafael
 */
public class Colonia {
    private int id_colonia;
    private String descripcion;
    private int id_delegacion;
    private String delegacion;
       
    public Colonia(){}
    
    public Colonia(int id_colonia, String descripcion, int id_delegacion){
        this.id_colonia=id_colonia;
        this.descripcion=descripcion;
        this.id_delegacion=id_delegacion;
        
    }

    public int getId_colonia() {
        return id_colonia;
    }

    public void setId_colonia(int id_colonia) {
        this.id_colonia = id_colonia;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_delegacion() {
        return id_delegacion;
    }

    public void setId_delegacion(int id_delegacion) {
        this.id_delegacion = id_delegacion;
    }
    
    public String getDelegacion() {
        return delegacion;
    }

    public void setDelegacion(String delegacion) {
        this.delegacion = delegacion;
    }
    
}
