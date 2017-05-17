/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author arturo
 */
public class Solicitante {
    private int id_solicitante;
    private float costo;
    private String nombre, apellido_paterno, apellido_materno, telefono, rfc, sexo, email, direccion,password;
    
    public Solicitante(){}
    
    public Solicitante(int id_solicitante, String nombre, String apellido_paterno, String apellido_materno, String telefono, String rfc, String sexo, String email, String direccion, String password, float costo){
        this.id_solicitante=id_solicitante;
        this.nombre=nombre;
        this.apellido_paterno=apellido_paterno;
        this.apellido_materno=apellido_materno;
        this.telefono=telefono;
        this.rfc=rfc;
        this.sexo=sexo;
        this.email=email;
        this.direccion=direccion;
        this.password=password;
        this.costo=costo;
    }
    
    public Solicitante(int id_solicitante, String nombre, String apellido_paterno, String apellido_materno, String telefono, String rfc, String sexo, String email, String direccion, String password){
        this.id_solicitante=id_solicitante;
        this.nombre=nombre;
        this.apellido_paterno=apellido_paterno;
        this.apellido_materno=apellido_materno;
        this.telefono=telefono;
        this.rfc=rfc;
        this.sexo=sexo;
        this.email=email;
        this.direccion=direccion;
        this.password=password;
       
    }

    public int getId_solicitante() {
        return id_solicitante;
    }

    public void setId_solicitante(int id_solicitante) {
        this.id_solicitante = id_solicitante;
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

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public float getCosto() {
        return costo;
    }

    public void setCosto(float costo) {
        this.costo = costo;
    }
    
    
}
