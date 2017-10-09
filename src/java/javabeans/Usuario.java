/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author arturo
 */
public class Usuario {
    
    public Usuario () {
        super();
    }
    
    private String usuario;
    private String password;
    private int id_usuario;
    private int id_nivel;
    private int id_del;
    private String serie;
    private String delegacion;
    private String nombre;
    private String cargo;
    private String direccion;
    private String nivel;

    
    
    public Usuario( String usuario, String password){
        this.usuario=usuario;
        this.password=password;
     }
    
    public Usuario(int id_usuario, String usuario, String password, int id_nivel, int id_del, String serie, String nombre, String cargo, String direccion){
        this.usuario = usuario;
        this.password = password;
        this.id_usuario = id_usuario;
        this.id_nivel = id_nivel;
        this.id_del = id_del;
        this.serie = serie;
        this.nombre = nombre;
        this.cargo = cargo;
        this.direccion = direccion;


    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Integer getId_nivel() {
        return id_nivel;
    }

    public void setId_nivel(Integer id_nivel) {
        this.id_nivel = id_nivel;
    }

    public Integer getId_del() {
        return id_del;
    }

    public void setId_del(Integer id_del) {
        this.id_del = id_del;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }
    
    public String getDelegacion() {
        return delegacion;
    }

    public void setDelegacion(String delegacion) {
        this.delegacion = delegacion;
    }
    
    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
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

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
}
