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
public class CatEmisores {
    
    private int id_bonific;
    private String descripcion;
    
    public CatEmisores(){
        super();
    }
    
    public CatEmisores(int id_bonific, String descripcion){
        this.id_bonific = id_bonific;
        this.descripcion = descripcion;
    }
    
    //get y set de id_bonific
    public int getId_bonific(){
        return id_bonific;
    }
    
    public void setId_bonific(int id_bonific){
        this.id_bonific = id_bonific;
    }
    
    
    //get y set descripcion
    public String getDescripcion(){
        return descripcion;
    }
    
    public void setDescripcion(String descripcion){
        this.descripcion = descripcion;
    }
    
}
