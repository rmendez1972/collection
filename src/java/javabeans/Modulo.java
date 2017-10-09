/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author arturo
 */
public class Modulo {
    private int id_modulo;
    private String nombre;
    private String vista;
    
    public Modulo(int id_modulo, String nombre, String vista){
        this.id_modulo=id_modulo;
        this.nombre=nombre;
        this.vista=vista;
    }

    public int getId_modulo() {
        return id_modulo;
    }

    public void setId_modulo(int id_modulo) {
        this.id_modulo = id_modulo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getVista() {
        return vista;
    }

    public void setVista(String vista) {
        this.vista = vista;
    }
    
    
}
