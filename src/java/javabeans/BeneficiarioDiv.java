/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author Ismael
 */
public class BeneficiarioDiv {
    private int id_bendiv;
    private String clave_elect;
    private String curp;
    private String clave_b;
    private String nombre;
    private int id_catprog;
    private int id_usuario;
    //
    private String catprog;
    private String usuario;
    private boolean aperturado;
    private String numcontrato;
       
    public BeneficiarioDiv(){}
    
    public BeneficiarioDiv(int id_bendiv, String clave_elect, String curp, String clave_b, 
            String nombre, int id_catprog, int id_usuario, boolean aperturado, String numcontrato){
        
        this.id_bendiv=id_bendiv;
        this.clave_elect=clave_elect;
        this.curp=curp;
        this.clave_b=clave_b;
        this.nombre=nombre;
        this.id_catprog=id_catprog;
        this.id_usuario=id_usuario;
        this.aperturado=aperturado;
        this.numcontrato=numcontrato;
    }

    public int getId_bendiv() {
        return id_bendiv;
    }

    public void setId_bendiv(int id_bendiv) {
        this.id_bendiv = id_bendiv;
    }

    public String getClave_elect() {
        return clave_elect;
    }

    public void setClave_elect(String clave_elect) {
        this.clave_elect = clave_elect;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getClave_b() {
        return clave_b;
    }

    public void setClave_b(String clave_b) {
        this.clave_b = clave_b;
    }

    public int getId_catprog() {
        return id_catprog;
    }

    public void setId_catprog(int id_catprog) {
        this.id_catprog = id_catprog;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCatprog() {
        return catprog;
    }

    public void setCatprog(String catprog) {
        this.catprog = catprog;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public boolean isAperturado() {
        return aperturado;
    }

    public void setAperturado(boolean aperturado) {
        this.aperturado = aperturado;
    }

    public String getNumcontrato() {
        return numcontrato;
    }

    public void setNumcontrato(String numcontrato) {
        this.numcontrato = numcontrato;
    }
    
    
}
