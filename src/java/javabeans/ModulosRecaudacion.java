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
public class ModulosRecaudacion {

    private Integer id_modulo;
    private String descripcion;
    private String direccion;
    private Integer id_delegacion;
    private String delegacion;
    
    public ModulosRecaudacion(){
        super();
    }
    
    public ModulosRecaudacion(Integer id_modulo, String descripcion, String direccion, Integer id_delegacion) {
        this.id_modulo = id_modulo;
        this.descripcion = descripcion;
        this.direccion = direccion;
        this.id_delegacion = id_delegacion;
    }
    
    public Integer getId_modulo() {
        return id_modulo;
    }

    public void setId_modulo(Integer id_modulo) {
        this.id_modulo = id_modulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Integer getId_delegacion() {
        return id_delegacion;
    }

    public void setId_delegacion(Integer id_delegacion) {
        this.id_delegacion = id_delegacion;
    }

    public String getDelegacion() {
        return delegacion;
    }

    public void setDelegacion(String delegacion) {
        this.delegacion = delegacion;
    }
    
}
