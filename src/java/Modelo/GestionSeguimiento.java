/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javabeans.Seguimiento;
import javabeans.Solicitud;
/**
 *
 * @author arturo
 */
public class GestionSeguimiento {
    
    public boolean registroSeguimiento(Seguimiento s){
        boolean res=false;
        Seguimiento seguimiento;
        Solicitud solicitud;
        Integer id_solicitud=s.getId_solicitud();
        Integer id_status=s.getId_status();
        
        
          
        Object params[]={s.getFecha(), s.getObservaciones(), s.getId_usuario(), s.getId_solicitud(), s.getId_status(),s.getAdjunto()};
        res=Conexion.ejecutar("insert into seguimiento (fecha, observaciones, id_usuario, id_solicitud, id_status,adjunto) values (?,?,?,?,?,?)", params);
        if(res)
        {
            GestionSolicitud gs =new GestionSolicitud();
            solicitud=gs.obtenerPorIdDatetime(id_solicitud);
            solicitud.setId_status(id_status);
            res=gs.actualizarSolicitud(solicitud);
        }
        return res;
    }
    
    public boolean actualizarSeguimiento(Seguimiento s){
        boolean res=false;
        Seguimiento seguimiento;
        Solicitud solicitud;
        Integer id_solicitud=s.getId_solicitud();
        Integer id_status=s.getId_status();
        Object params[]={s.getFecha(), s.getObservaciones(), s.getId_usuario(), s.getId_solicitud(), s.getId_status(),s.getAdjunto(), s.getId_seguimiento()};
        res=Conexion.ejecutar("update seguimiento set fecha=?, observaciones=?, id_usuario=?, id_solicitud=?, id_status=?, adjunto=? where id_seguimiento=?", params);
        if(res)
        {
            GestionSolicitud gs =new GestionSolicitud();
            solicitud=gs.obtenerPorIdDatetime(id_solicitud);
            solicitud.setId_status(id_status);
            res=gs.actualizarSolicitud(solicitud);
        }    
        return res;
    }
    
    public boolean actualizarSeguimientoDateTime(Seguimiento s){
        boolean res=false;
        Seguimiento seguimiento;
        Solicitud solicitud;
        Integer id_solicitud=s.getId_solicitud();
        Integer id_status=s.getId_status();
        Object params[]={s.getFecha(), s.getObservaciones(), s.getId_usuario(), s.getId_solicitud(), s.getId_status(),s.getAdjunto(), s.getId_seguimiento()};
        res=Conexion.ejecutar("update seguimiento set fecha=?, observaciones=?, id_usuario=?, id_solicitud=?, id_status=?, adjunto=? where id_seguimiento=?", params);
        if(res)
        {
            GestionSolicitud gs =new GestionSolicitud();
            solicitud=gs.obtenerPorIdDatetime(id_solicitud);
            solicitud.setId_status(id_status);
            res=gs.actualizarSolicitud(solicitud);
        }    
        return res;
    }
     
    public boolean actualizarSeguimientoAdjunto(int id_seguimiento){
        boolean res=false;
        
        Object params[]={true, id_seguimiento};
        res=Conexion.ejecutar("update seguimiento set adjunto=? where id_seguimiento=?", params);
        if(res)
        {
            
        }    
        return res;
    }
     
    public Seguimiento obtenerPorId(int id_seguimiento){
        Seguimiento seg=null;
        Object params[]={id_seguimiento};
        ResultSet res=Conexion.ejecutarConsulta("select * from seguimiento where id_seguimiento=?", params);
        try{
            if(res.next()){
                seg=new Seguimiento(res.getInt("id_seguimiento"), res.getDate("fecha"), res.getString("observaciones"), res.getInt("id_usuario"), res.getInt("id_solicitud"), res.getInt("id_status"), res.getBoolean("adjunto"));
            }
            res.close();
        }catch(Exception e){}
        return seg;
    }
    
    public Seguimiento obtenerPorIdDateTime(int id_seguimiento){
        Seguimiento seg=null;
        Object params[]={id_seguimiento};
        ResultSet res=Conexion.ejecutarConsulta("select * from seguimiento where id_seguimiento=?", params);
        try{
            if(res.next()){
                seg=new Seguimiento(res.getInt("id_seguimiento"), res.getTimestamp("fecha"), res.getString("observaciones"), res.getInt("id_usuario"), res.getInt("id_solicitud"), res.getInt("id_status"), res.getBoolean("adjunto"));
            }
            res.close();
        }catch(Exception e){}
        return seg;
    }
    
    public ArrayList obtenerPorSolicitud(int id_solicitud){
        ArrayList seg=new ArrayList();
        Object params[]={id_solicitud};
        ResultSet res=Conexion.ejecutarConsulta("select S.id_seguimiento,S.fecha,S.observaciones,S.id_usuario,S.id_solicitud,S.id_status,E.nombre as estatus,S.adjunto,U.nombre as usuario from seguimiento S inner join status E on S.id_status=E.id_status inner join usuario U on S.id_usuario=U.id_usuario where id_solicitud=? order by S.fecha desc", params);
        try{
            while(res.next()){
                Seguimiento s=new Seguimiento(res.getInt("id_seguimiento"), res.getTimestamp("fecha"), res.getString("observaciones"), res.getInt("id_usuario"), res.getInt("id_solicitud"), res.getInt("id_status"),res.getString("estatus"),res.getBoolean("adjunto"));
                s.setUsuario(res.getString("usuario"));
                seg.add(s);
            }
            res.close();
        }catch(Exception e){}
        return seg;
    }
    
    public boolean eliminarPorId(int id_seguimiento){
        Object params[]={id_seguimiento};
        return Conexion.ejecutar("delete from seguimiento where id_seguimiento=?", params);
    }
    
    public boolean eliminarPorSolicitud(int id_solicitud){
        Object params[]={id_solicitud};
        return Conexion.ejecutar("delete from seguimiento where id_solicitud=?", params);
    }
}
