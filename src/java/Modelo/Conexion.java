/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author arturo
 */
import java.io.File;
import java.io.FileInputStream;
import java.sql.*;

public class Conexion {
    public static Connection conex=null;
    
    private Conexion(){
        
    }
    
    public static boolean conectar(){
        try{
            if(conex==null){
                conectarse();
            }
            else if(conex.isClosed())
                conectarse();
        }catch(Exception e){}
        
        return true;
    }
    
    private static void conectarse(){
        try{
            conex=conectaMysql.getConnection();
        }
        catch(Exception e){}
    }
    
    public static void cerrarConexion(){
        try{
            if(conex!=null){
                conex.close();
                conex=null;
            }
        }catch(Exception e){}
    }
    
    public static boolean ejecutar(String sql, Object parametros[]){
        try{
            conectar();
            PreparedStatement st=conex.prepareStatement(sql);
            establecerParametros(st,parametros);
            st.execute();
            st.close();
            parametros=null;
            return true;
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    }
    
    public static boolean ejecutarImagen(String sql, Object parametros[], String ruta){
        try{
            conectar();
            
           
            File file = new File(ruta);
        
            FileInputStream fis = new FileInputStream(file);
            
            PreparedStatement st=conex.prepareStatement(sql);
            st.setString(1,(String)parametros[0]);
            st.setString(2,(String)parametros[1]);
            st.setString(3,(String)parametros[2]);
            st.setBinaryStream(4, fis, (int)file.length());
            
            //establecerParametros(st,parametros);
            st.execute();
            st.close();
            fis.close();
            parametros=null;
            return true;
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    }
    
    public static Object ejecutarEscalar(String sql, Object parametros[]){
        try{
            conectar();
            PreparedStatement st=conex.prepareStatement(sql);
            establecerParametros(st,parametros);
            ResultSet res=st.executeQuery();
            Object resultado=null;
            if(res.next())
                resultado=res.getObject(1);
            
            st.close();
            parametros=null;
            return resultado;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }
    }
    
    public static long ejecutarCount(String sql, Object parametros[]){
        conectar();
        Object resultado=ejecutarEscalar(sql, parametros);
        if(resultado==null)
            return 0;
        else
            return (Long)resultado;
    }
    
    public static int ejecutarMax(String sql, Object parametros[]){
        conectar();
        Object resultado=ejecutarEscalar(sql, parametros);
        if(resultado==null)
            return 0;
        else
            return (Integer)resultado;
    }
    
    public static ResultSet ejecutarConsulta(String sql, Object parametros[]){
        try{
            conectar();
            PreparedStatement st=conex.prepareStatement(sql);
            establecerParametros(st,parametros);
            ResultSet res=st.executeQuery();
            parametros=null;
            return res;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public static ResultSet obtenerPor(String tabla, String campo, Object valor){
        Object parametros[]={valor};
        return ejecutarConsulta("select * from "+tabla+" where "+campo+"=?", parametros);
    }
    
    public static ResultSet obtenerTodos(String tabla, String orden){
        return ejecutarConsulta("select * from "+tabla+(orden!=null?" order by "+orden+" asc":""), null);
    }
    
    private static void establecerParametros(PreparedStatement st, Object parametros[]){
        try{
            int i;
            if(parametros!=null){
                for(i=0;i<parametros.length;i++){
                    st.setObject(i+1, parametros[i]);
                }
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
}
