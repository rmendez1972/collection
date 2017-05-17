/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author arturo
 */
public class Direcciones {
        
    
    private int id_direccion;
    private String nombre;
    private int id_unidadadministrativa;
    private String unidadadministrativa;
    
    
    public Direcciones () {
        super();
    }
    
    
    public Direcciones(int id_direccion, String nombre, int id_unidadadministrativa){
        
        this.id_direccion=id_direccion;
        this.nombre=nombre;
        this.id_unidadadministrativa=id_unidadadministrativa;
        
        
    }
    
    

    public int getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(int id_direccion) {
        this.id_direccion = id_direccion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public int getId_unidadadministrativa() {
        return id_unidadadministrativa;
    }

    public void setId_unidadadministrativa(int id_unidadadministrativa) {
        this.id_unidadadministrativa = id_unidadadministrativa;
    }
    
     public String getUnidadadministrativa() {
        return unidadadministrativa;
    }

    public void setUnidadadministrativa(String unidadadministrativa) {
        this.unidadadministrativa = unidadadministrativa;
    }   
    
    
}
