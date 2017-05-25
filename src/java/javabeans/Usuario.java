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
    
    private int id_usuario;
    private String usuario;
    private String password;
    private String nombre;
    private String apellido_paterno;
    private String apellido_materno;
    private int id_unidadadministrativa;
    private int id_grupo;
    private int id_direccion;
    private String unidadAdministrativa;
    private String grupo;
    private String direccion;

    
    
    public Usuario( String usuario, String password){
        this.usuario=usuario;
        this.password=password;
     }
    
    public Usuario(int id_usuario, String usuario, String password, String nombre, String apellido_paterno, String apellido_materno, int id_unidadadministrativa, int id_grupo, int id_direccion){
        this.id_usuario=id_usuario;
        this.usuario=usuario;
        this.password=password;
        this.nombre=nombre;
        this.apellido_paterno=apellido_paterno;
        this.apellido_materno=apellido_materno;
        this.id_unidadadministrativa=id_unidadadministrativa;
        this.id_grupo=id_grupo;
        this.id_direccion=id_direccion;

    }

     public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido_paterno() {
        return apellido_paterno;
    }

    public void setApellido_paterno(String apellido_paterno) {
        this.apellido_paterno = apellido_paterno;
    }

    public String getApellido_materno() {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno;
    }

    public int getId_unidadadministrativa() {
        return id_unidadadministrativa;
    }

    public void setId_unidadadministrativa(int id_unidadadministrativa) {
        this.id_unidadadministrativa = id_unidadadministrativa;
    }

    public int getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }

    public String getUnidadAdministrativa() {
        return unidadAdministrativa;
    }

    public void setUnidadAdministrativa(String unidadAdministrativa) {
        this.unidadAdministrativa = unidadAdministrativa;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }
    
    public int getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(int id_direccion) {
        this.id_direccion = id_direccion;
    }
    
    
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
}
