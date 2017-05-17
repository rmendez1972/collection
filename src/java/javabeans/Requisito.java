/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author arturo
 */
public class Requisito {
    private int id_requisito;
    private String nombre;
    
    public Requisito(){}
    
    public Requisito(int id_requisito, String nombre){
        this.id_requisito=id_requisito;
        this.nombre=nombre;
    }

    public int getId_requisito() {
        return id_requisito;
    }

    public void setId_requisito(int id_requisito) {
        this.id_requisito = id_requisito;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
