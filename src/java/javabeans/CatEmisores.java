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
    
    private int id_emisor;
    private String descripcion;
    
    public CatEmisores(){
        super();
    }
    
    public CatEmisores(int id_emisor, String descripcion){
        this.id_emisor = id_emisor;
        this.descripcion = descripcion;
    }
    
    //get y set de id_bonific
    public int getId_emisor(){
        return id_emisor;
    }
    
    public void setId_emisor(int id_emisor){
        this.id_emisor = id_emisor;
    }
    
    
    //get y set descripcion
    public String getDescripcion(){
        return descripcion;
    }
    
    public void setDescripcion(String descripcion){
        this.descripcion = descripcion;
    }
    
}
