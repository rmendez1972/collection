/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javabeans.Solicitud;
/**
 *
 * @author arturo
 */
public class GestionSolicitud {
    
    public boolean registroSolicitud(Solicitud sol){
        Object params[]={ sol.getFecha_ingreso(), sol.getFecha_termino(), sol.getId_tramite(), sol.getId_solicitante(), sol.getId_usuario_ingreso(), sol.getId_usuario_seguimiento(), sol.getId_status()};
        return Conexion.ejecutar("insert into solicitud (fecha_ingreso, fecha_termino, id_tramite, id_solicitante, id_usuario_ingreso, id_usuario_seguimiento, id_status) values (?,?,?,?,?,?,?)", params);
    }
    
    public boolean actualizarSolicitud(Solicitud sol){
        Object params[]={sol.getFecha_ingreso(), sol.getFecha_termino(), sol.getId_tramite(), sol.getId_solicitante(), sol.getId_usuario_ingreso(), sol.getId_usuario_seguimiento(), sol.getId_status(), sol.getId_solicitud()};
        return Conexion.ejecutar("update solicitud set fecha_ingreso=?, fecha_termino=?, id_tramite=?, id_solicitante=?, id_usuario_ingreso=?, id_usuario_seguimiento=?, id_status=? where id_solicitud=?", params);
    }
    
    public ArrayList obtenerSolicitudes(){
        ArrayList sol=new ArrayList();
        
        Date now = new Date();
        
        
        ResultSet res=Conexion.ejecutarConsulta("select S.id_solicitud, S.fecha_ingreso, S.fecha_termino, S.id_tramite, S.id_solicitante, S.id_usuario_ingreso, S.id_usuario_seguimiento, S.id_status, T.nombre as tramite, concat(P.nombre,' ',P.apellido_paterno,' ',P.apellido_materno) as solicitante, ST.nombre as status, UA.nombre as ua, T.dias_resolucion as dias_resolucion from solicitud S inner join tramite T on S.id_tramite=T.id_tramite inner join solicitante P on S.id_solicitante=P.id_solicitante inner join status ST on S.id_status=ST.id_status inner join unidadadministrativa UA on T.id_unidadadministrativa=UA.id_unidadadministrativa order by S.fecha_ingreso desc", null);
        try{
            while(res.next()){
                Date fechaingreso = new Date(res.getTimestamp("fecha_ingreso").getTime());
                int diffInDays = (int)( (now.getTime() - fechaingreso.getTime())/ (1000 * 60 * 60 * 24) );
                Solicitud s=new Solicitud(res.getInt("id_solicitud"), res.getTimestamp("fecha_ingreso"), res.getDate("fecha_termino"), res.getInt("id_tramite"), res.getInt("id_solicitante"), res.getInt("id_usuario_ingreso"), res.getInt("id_usuario_seguimiento"), res.getInt("id_status"), res.getString("tramite"), res.getString("solicitante"), res.getString("status"),res.getString("ua"),res.getInt("dias_resolucion"),diffInDays);
                sol.add(s);
            }
            res.close();
        }catch(Exception e){}
        return sol;
    }
    
    public ArrayList obtenerPorUnidad(int id_unidadadministrativa, int id_direccion){
        ArrayList sol=new ArrayList();
        Date now = new Date();
        Object params[]={id_unidadadministrativa, id_direccion};
        ResultSet res=Conexion.ejecutarConsulta("select S.id_solicitud, S.fecha_ingreso, S.fecha_termino, S.id_tramite, S.id_solicitante, S.id_usuario_ingreso, S.id_usuario_seguimiento, S.id_status, T.nombre as tramite, concat(P.nombre,' ',P.apellido_paterno,' ',P.apellido_materno) as solicitante, ST.nombre as status, UA.nombre as ua, T.dias_resolucion as dias_resolucion from solicitud S inner join tramite T on S.id_tramite=T.id_tramite inner join solicitante P on S.id_solicitante=P.id_solicitante inner join status ST on S.id_status=ST.id_status inner join unidadadministrativa UA on T.id_unidadadministrativa=UA.id_unidadadministrativa  where T.id_unidadadministrativa=? and T.id_direccion=? order by S.fecha_Ingreso desc", params);
        try{
            while(res.next()){
                Date fechaingreso = new Date(res.getTimestamp("fecha_ingreso").getTime());
                int diffInDays = (int)( (now.getTime() - fechaingreso.getTime())/ (1000 * 60 * 60 * 24) );
                Solicitud s=new Solicitud(res.getInt("id_solicitud"), res.getTimestamp("fecha_ingreso"), res.getDate("fecha_termino"), res.getInt("id_tramite"), res.getInt("id_solicitante"), res.getInt("id_usuario_ingreso"), res.getInt("id_usuario_seguimiento"), res.getInt("id_status"), res.getString("tramite"), res.getString("solicitante"), res.getString("status"),res.getString("ua"),res.getInt("dias_resolucion"),diffInDays);
                sol.add(s);
            }
            res.close();
        }catch(Exception e){}
        return sol;
    }
    
    public ArrayList obtenerPorUnidad2(int id_unidadadministrativa, String fecha_inicio, String fecha_final){ //igh 11/11/2016
        ArrayList sol=new ArrayList();
        Object params[]={id_unidadadministrativa};
        String consulta ="select S.id_solicitud, S.fecha_ingreso, S.fecha_termino, S.id_tramite, S.id_solicitante, S.id_usuario_ingreso, S.id_usuario_seguimiento, S.id_status, T.nombre as tramite, concat(P.nombre,' ',P.apellido_paterno,' ',P.apellido_materno) as solicitante, ST.nombre as status, UA.nombre as ua, T.dias_resolucion as dias_resolucion from solicitud S inner join tramite T on S.id_tramite=T.id_tramite inner join solicitante P on S.id_solicitante=P.id_solicitante inner join status ST on S.id_status=ST.id_status inner join unidadadministrativa UA on T.id_unidadadministrativa=UA.id_unidadadministrativa  where T.id_unidadadministrativa=? and DATE(S.fecha_ingreso) between '"+fecha_inicio.toString()+"' and '"+fecha_final.toString()+"' order by S.fecha_Ingreso desc"; 
        ResultSet res=Conexion.ejecutarConsulta(consulta, params);
       // ResultSet res=Conexion.ejecutarConsulta("select S.id_solicitud, S.fecha_ingreso, S.id_tramite, T.nombre as tramite, UA.nombre as ua from solicitud S inner join tramite T on S.id_tramite=T.id_tramite inner join unidadadministrativa UA on T.id_unidadadministrativa=UA.id_unidadadministrativa where T.id_unidadadministrativa=? order by S.fecha_Ingreso desc", params);
        try{
            while(res.next()){
                Solicitud s=new Solicitud(res.getInt("id_solicitud"), res.getTimestamp("fecha_ingreso"), 
                        res.getDate("fecha_termino"), res.getInt("id_tramite"), res.getInt("id_solicitante"), 
                        res.getInt("id_usuario_ingreso"), res.getInt("id_usuario_seguimiento"), 
                        res.getInt("id_status"), res.getString("tramite"), res.getString("solicitante"), 
                        res.getString("status"),res.getString("ua"),res.getInt("dias_resolucion"));
                sol.add(s);
            }
            res.close();
        }catch(Exception e){}
        return sol;
    }
    
    
    public Solicitud obtenerPorId(int id_solicitud){
        Solicitud sol=null;
        Object params[]={id_solicitud};
        ResultSet res=Conexion.ejecutarConsulta("select S.id_solicitud, S.fecha_ingreso, S.fecha_termino, S.id_tramite, S.id_solicitante, S.id_usuario_ingreso, S.id_usuario_seguimiento, S.id_status, T.nombre as tramite, concat(P.nombre,' ',P.apellido_paterno,' ',P.apellido_materno) as solicitante, ST.nombre as status,UA.nombre as ua, T.dias_resolucion as dias_resolucion from solicitud S inner join tramite T on S.id_tramite=T.id_tramite inner join solicitante P on S.id_solicitante=P.id_solicitante inner join status ST on S.id_status=ST.id_status inner join unidadadministrativa UA on UA.id_unidadadministrativa=T.id_unidadadministrativa where S.id_solicitud=?", params);
        try{
            if(res.next()){
                sol=new Solicitud(res.getInt("id_solicitud"), res.getDate("fecha_ingreso"), res.getDate("fecha_termino"), res.getInt("id_tramite"), res.getInt("id_solicitante"), res.getInt("id_usuario_ingreso"), res.getInt("id_usuario_seguimiento"), res.getInt("id_status"), res.getString("tramite"), res.getString("solicitante"), res.getString("status"),res.getString("ua"), res.getInt("dias_resolucion"));
            }
            res.close();
        }catch(Exception e){}
        return sol;
    }
    
    
     public Solicitud obtenerPorIdDatetime(int id_solicitud){
        Solicitud sol=null;
        Object params[]={id_solicitud};
        ResultSet res=Conexion.ejecutarConsulta("select S.id_solicitud, S.fecha_ingreso, S.fecha_termino, S.id_tramite, S.id_solicitante, S.id_usuario_ingreso, S.id_usuario_seguimiento, S.id_status, T.nombre as tramite, concat(P.nombre,' ',P.apellido_paterno,' ',P.apellido_materno) as solicitante, ST.nombre as status,UA.nombre as ua, T.dias_resolucion as dias_resolucion from solicitud S inner join tramite T on S.id_tramite=T.id_tramite inner join solicitante P on S.id_solicitante=P.id_solicitante inner join status ST on S.id_status=ST.id_status inner join unidadadministrativa UA on UA.id_unidadadministrativa=T.id_unidadadministrativa where S.id_solicitud=?", params);
        try{
            if(res.next()){
                sol=new Solicitud(res.getInt("id_solicitud"), res.getTimestamp("fecha_ingreso"), res.getDate("fecha_termino"), res.getInt("id_tramite"), res.getInt("id_solicitante"), res.getInt("id_usuario_ingreso"), res.getInt("id_usuario_seguimiento"), res.getInt("id_status"), res.getString("tramite"), res.getString("solicitante"), res.getString("status"),res.getString("ua"), res.getInt("dias_resolucion"));
            }
            res.close();
        }catch(Exception e){}
        return sol;
    }
    
    public ArrayList obtenerPorSolicitante(int id_solicitante){
        ArrayList sol=new ArrayList();
        Object params[]={id_solicitante};
        ResultSet res=Conexion.ejecutarConsulta("select S.id_solicitud, S.fecha_ingreso, S.fecha_termino, S.id_tramite, S.id_solicitante, S.id_usuario_ingreso, S.id_usuario_seguimiento, S.id_status, T.nombre as tramite, concat(P.nombre,' ',P.apellido_paterno,' ',P.apellido_materno) as solicitante, ST.nombre as status, UA.nombre as ua,T.dias_resolucion as dias_resolucion from solicitud S inner join tramite T on S.id_tramite=T.id_tramite inner join solicitante P on S.id_solicitante=P.id_solicitante inner join status ST on S.id_status=ST.id_status inner join unidadadministrativa UA on T.id_unidadadministrativa=UA.id_unidadadministrativa where S.id_solicitante=?", params);
        try {
            while(res.next()){
                Solicitud solx=new Solicitud(res.getInt("id_solicitud"), res.getDate("fecha_ingreso"), res.getDate("fecha_termino"), res.getInt("id_tramite"), res.getInt("id_solicitante"), res.getInt("id_usuario_ingreso"), res.getInt("id_usuario_seguimiento"), res.getInt("id_status"), res.getString("tramite"), res.getString("solicitante"), res.getString("status"),res.getString("ua"), res.getInt("dias_resolucion"));
                sol.add(solx);
            }
            res.close();
        } catch (Exception ex) {}
        return sol;
    }
    
    public boolean eliminarPorId(int id_solicitud){
        Object params[]={id_solicitud};
        GestionSeguimiento seg=new GestionSeguimiento();
        seg.eliminarPorSolicitud(id_solicitud);
        return Conexion.ejecutar("delete from solicitud where id_solicitud=?", params);
    }
    
    public boolean eliminarPorSolicitante(int id_solicitante){
        ArrayList sol=this.obtenerPorSolicitante(id_solicitante);
        boolean res=true;
        for(int i=0;i<sol.size();i++){
            Solicitud s=(Solicitud)sol.get(i);
            res=eliminarPorId(s.getId_solicitud()) && res;
        }
        return res;
    }

    
}
