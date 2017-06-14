/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import java.awt.Image;

/**
 *
 * @author Marlon
 */
public class Firmantes {

    private Integer id_firmante;
    private String nombre;
    private String cargo;
    private String firma;
    private String imagen;

       
    public Firmantes(){
        super();
    }
    
    public Firmantes(Integer id_firmante, String nombre, String cargo, String firma) {
        this.id_firmante = id_firmante;
        this.nombre = nombre;
        this.cargo = cargo;
        this.firma = firma;
    }
    
    public Integer getId_firmante() {
        return id_firmante;
    }

    public void setId_firmante(Integer id_firmante) {
        this.id_firmante = id_firmante;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getFirma() {
        return firma;
    }

    public void setFirma(String firma) {
        this.firma = firma;
    }
    /*
     public Image getImagen() {
        return imagen;
    }

    public void setImagen(Image imagen) {
        this.imagen = imagen;
    }*/
    
    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
}
