/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author Marlon
 */
public class CatBonificacion {
    
    private int id_bonific;
    private String clave_bonific;
    private String descripcion;
    
    public CatBonificacion(){
        super();
    }
    
    public CatBonificacion(int id_bonific, String clave_bonific, String descripcion){
        this.id_bonific = id_bonific;
        this.clave_bonific = clave_bonific;
        this.descripcion = descripcion;
    }
    
    //get y set de id_bonific
    public int getId_bonific(){
        return id_bonific;
    }
    
    public void setId_bonific(int id_bonific){
        this.id_bonific = id_bonific;
    }
    
    //get y set clave_bonific
    public String getClave_bonific(){
        return clave_bonific;
    }
    
    public void setClave_bonific(String clave_bonific){
        this.clave_bonific = clave_bonific;
    }
    
    //get y set descripcion
    public String getDescripcion(){
        return descripcion;
    }
    
    public void setDescripcion(String descripcion){
        this.descripcion = descripcion;
    }
    
}
