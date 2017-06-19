/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author Ismael
 */
public class Autoriza {
    private int id_autoriza;
    private String nombre;
    private int id_delegacion;
    private String delegacion;
    private String cargo;
       
    public Autoriza(){}
    
    public Autoriza(int id_autoriza, String nombre, String cargo, int id_delegacion){
        this.id_autoriza=id_autoriza;
        this.nombre=nombre;
        this.cargo=cargo;
        this.id_delegacion=id_delegacion;
       
        
    }

    public int getId_autoriza() {
        return id_autoriza;
    }

    public void setId_autoriza(int id_autoriza) {
        this.id_autoriza = id_autoriza;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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
    
    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
}
