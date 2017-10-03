/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author Marlon
 */
public class Delegacion {
    private int id_delegacion;
    private String descripcion;
    private String direccion;
    
    //constructor
    public Delegacion(){}
    
    public Delegacion(int id_delegacion, String descripcion, String direccion){
        this.id_delegacion=id_delegacion;
        this.descripcion=descripcion;
        this.direccion=direccion;
    }
    
    //get y set id_delegacion
    public int getId_delegacion() {
        return id_delegacion;
    }

    public void setId_delegacion(int id_delegacion) {
        this.id_delegacion = id_delegacion;
    }
    
    //get y set descripcion
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    //get y set direccion
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
        
}
