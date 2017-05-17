/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author arturo
 */
public class Grupo {
    private int id_grupo;
    private String nombre;
    
    public Grupo(int id_grupo, String nombre){
        this.id_grupo=id_grupo;
        this.nombre=nombre;
    }

    public int getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
