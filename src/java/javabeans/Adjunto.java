/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author Rafael
 */
public class Adjunto {
    private int id_adjunto;
    private String nombre;
    private int id_seguimiento;
    private int id_usuario;
    private String nombreusuario;

      

    public Adjunto(){}
    
    public Adjunto(int id_adjunto, String nombre, int id_seguimiento, int id_usuario){
        this.id_adjunto=id_adjunto;
        this.nombre=nombre;
        this.id_seguimiento=id_seguimiento;
        this.id_usuario=id_usuario;
    }
    
    
    public int getId_adjunto() {
        return id_adjunto;
    }

    public void setId_adjunto(int id_adjunto) {
        this.id_adjunto = id_adjunto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId_seguimiento() {
        return id_seguimiento;
    }

    public void setId_seguimiento(int id_seguimiento) {
        this.id_seguimiento = id_seguimiento;
    }
 
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
   
    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }
}
