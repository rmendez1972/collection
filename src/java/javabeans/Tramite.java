/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author arturo
 */
public class Tramite {
    private int id_tramite;
    private int dias_resolucion;
    private int id_unidadadministrativa;
    private int id_direccion;
    private String nombre;
    private String unidadAdministrativa;
    private String direccion;
    private String costo;
    
    public Tramite(){}
    
    /*public Tramite(int id_tramite, int dias_resolucion, int id_unidadadministrativa, int id_direccion, String nombre){
        this.id_tramite=id_tramite;
        this.dias_resolucion=dias_resolucion;
        this.id_unidadadministrativa=id_unidadadministrativa;
        this.id_direccion=id_direccion;
        this.nombre=nombre;
     
    }*/
    
     public Tramite(int id_tramite, int dias_resolucion,int id_unidadadministrativa, int id_direccion, String nombre, String costo){
        this.id_tramite=id_tramite;
        this.dias_resolucion=dias_resolucion;
        this.id_unidadadministrativa=id_unidadadministrativa;
        this.id_direccion=id_direccion;
        this.nombre=nombre;
        this.costo=costo;
     
    }

    

    public int getId_tramite() {
        return id_tramite;
    }

    public void setId_tramite(int id_tramite) {
        this.id_tramite = id_tramite;
    }

    public int getDias_resolucion() {
        return dias_resolucion;
    }

    public void setDias_resolucion(int dias_resolucion) {
        this.dias_resolucion = dias_resolucion;
    }

    public int getId_unidadadministrativa() {
        return id_unidadadministrativa;
    }

    public void setId_unidadadministrativa(int id_unidadadministrativa) {
        this.id_unidadadministrativa = id_unidadadministrativa;
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

    public String getUnidadAdministrativa() {
        return unidadAdministrativa;
    }

    public void setUnidadAdministrativa(String unidadAdministrativa) {
        this.unidadAdministrativa = unidadAdministrativa;
    }
    
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public String getCosto() {
        return costo;
    }

    public void setCosto(String costo) {
        this.costo = costo;
    }
}
