/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Blob;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import javabeans.Firmantes;
import javax.imageio.ImageIO;

/**
 *
 * @author Marlon
 */
public class GestionFirmantes {
    
    public ArrayList obtenerTodos(){
        ArrayList lista = new ArrayList();
        ResultSet res = Conexion.ejecutarConsulta("select * from firmantes order by nombre asc", null);
            try{
                while(res.next()){
                    Firmantes fir=new Firmantes(res.getInt("id_firmante"), res.getString("nombre"), res.getString("cargo"), res.getString("firma"));
                    /*Blob blob = res.getBlob("imagen");
                    byte[] data = blob.getBytes(1, (int)blob.length());
                    BufferedImage img = null;
                    try{
                        img = ImageIO.read(new ByteArrayInputStream(data));
                    }catch(IOException ex){}*/
                    //grabamos en variable tipo string la ruta a la imagen con la firma registro a registro
                    //String ruta = "C:/Users/USUARIO/Documents/Netbeansprojects/cobranza/web/firmantes/"+fir.getFirma();
                      String ruta = "C:/Users/rmendez1972/Documents/NetBeansProjects/cobranza/web/firmantes/"+fir.getFirma();
                    //construimos un objeto tipo File con la imagen referenciada por ruta
                    File file = new File(ruta);
                    //construimos un objeto tipo FileInputStream a partir del objeto tipo File
                    FileInputStream fis = new FileInputStream(file);
                    //implementa un stream de salida donde la salida es escrito en un array de bytes
                    ByteArrayOutputStream bos = new ByteArrayOutputStream();
                    int b;
                    // se inicializa un arreglo a longitud de 1024 bits que es el tamaño del buffer a utilizar
                    byte [] buffer = new byte[1024];
                    while((b=fis.read(buffer))!= -1){
                        bos.write(buffer,0,b);
                    }
                    // convertimos el stream de salida don la salida es escrito en un array de bytes a vector de bytes
                    byte[] fileBytes = bos.toByteArray();
                    fis.close();
                    bos.close();
                    
                    //codificadomos en Base64 el vector que contiene la imagen en arreglo de longitud de byte
                    byte[] encoded = Base64.getEncoder().encode(fileBytes);
                    //convertimos a String el vector codificado en base 64 que contiene la imagen en arreglo de longitud byte
                    String encodedString = new String(encoded);
                    fir.setImagen(encodedString);
                    lista.add(fir);
                }
                res.close();
            }catch(Exception e){}
        return lista;
    }
    
    public boolean registroFirm(Firmantes firm) throws FileNotFoundException{
        
         String ruta = "C:/Users/rmendez1972/Documents/NetBeansProjects/cobranza/web/firmantes/"+firm.getFirma();

        Object params[]={firm.getNombre(), firm.getCargo(), firm.getFirma()};
        return Conexion.ejecutarImagen("insert into firmantes(nombre, cargo, firma, imagen) values (UPPER(?), UPPER(?), ?, ?)", params, ruta);
    }
    
    public Firmantes obtenerPorId(int id_firmante){
        Object params[]={id_firmante};
        Firmantes firm = null;
        ResultSet res=Conexion.ejecutarConsulta("select * from firmantes where id_firmante=?", params);
        try{
            while(res.next()){
                firm=new Firmantes(res.getInt("id_firmante"), res.getString("nombre"), res.getString("cargo"), res.getString("firma"));
            }
            res.close();
        }catch(Exception e){}
        return firm;
    }
    
    public boolean actualizar(Firmantes firm){
        Object params[]={firm.getNombre(), firm.getCargo(), firm.getFirma(), firm.getId_firmante()};
        return Conexion.ejecutar("update firmantes set nombre=UPPER(?), cargo=UPPER(?), firma=?  where id_firmante=?", params);
    }
    
    public boolean eliminarPorId(int id_firmante){
        Object params[]={id_firmante};
        return Conexion.ejecutar("delete from firmantes where id_firmante=?", params);
    }
    
}
