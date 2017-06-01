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
public class Nivel {
    
    
    
    private int id_nivel;
    private String descripcion;
    private String privilegios;
    
    //constructor de la clase
    public Nivel(){
        super();
    }
    
    public Nivel(int id_nivel, String descripcion, String privilegios){
        this.id_nivel=id_nivel;
        this.descripcion=descripcion;
        this.privilegios=privilegios;
    }
    
    //get y set de nivel
    public int getId_nivel(){
        return id_nivel;
    }

    public void setId_nivel(int id_nivel){
        this.id_nivel = id_nivel;
    }
    
    //get y set descripcion
    public String getDescripcion(){
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }    
    
    //get y set privilegios
    public String getPrivilegios() {
        return privilegios;
    }

    public void setPrivilegios(String privilegios) {
        this.privilegios = privilegios;
    }
    
}
