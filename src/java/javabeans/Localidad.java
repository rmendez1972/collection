/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author Rafael
 */
public class Localidad {
    private int id_localidad;
    private String descripcion;
    private int id_delegacion;
    private String delegacion;
       
    public Localidad(){}
    
    public Localidad(int id_localidad, String descripcion, int id_delegacion){
        this.id_localidad=id_localidad;
        this.descripcion=descripcion;
        this.id_delegacion=id_delegacion;
        
    }

    public int getId_localidad() {
        return id_localidad;
    }

    public void setId_localidad(int id_localidad) {
        this.id_localidad = id_localidad;
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
