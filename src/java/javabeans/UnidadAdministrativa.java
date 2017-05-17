/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author arturo
 */
public class UnidadAdministrativa {
    private int id_unidadAdministrativa;
    private String nombre;
    private String email;

    public int getId_unidadAdministrativa() {
        return id_unidadAdministrativa;
    }

    public void setId_unidadAdministrativa(int id_unidadAdministrativa) {
        this.id_unidadAdministrativa = id_unidadAdministrativa;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public UnidadAdministrativa(){}
    
    public UnidadAdministrativa(int id_unidadAdministrativa, String nombre, String email){
        this.id_unidadAdministrativa=id_unidadAdministrativa;
        this.nombre=nombre;
        this.email=email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
