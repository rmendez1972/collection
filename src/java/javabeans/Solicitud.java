/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import java.util.Date;

/**
 *
 * @author arturo
 */
public class Solicitud {
    private int id_solicitud;
    private Date fecha_ingreso, fecha_termino;

    
    private int id_tramite, id_solicitante, id_usuario_ingreso, id_usuario_seguimiento, id_status,dias_resolucion,dias_diferencia;
    private String tramite,solicitante,status,unidadadministrativa,direccion;

    
    
    public Solicitud(){}
    
    public Solicitud(int id_solicitud, Date fecha_ingreso, Date fecha_termino, int id_tramite, int id_solicitante, int id_usuario_ingreso, int id_usuario_seguimiento, int id_status){
        this.id_solicitud=id_solicitud;
        this.fecha_ingreso=fecha_ingreso;
        this.fecha_termino=fecha_termino;
        this.id_tramite=id_tramite;
        this.id_solicitante=id_solicitante;
        this.id_usuario_ingreso=id_usuario_ingreso;
        this.id_usuario_seguimiento=id_usuario_seguimiento;
        this.id_status=id_status;
    }
    
      
    
    
    public Solicitud(int id_solicitud, Date fecha_ingreso, Date fecha_termino, int id_tramite, int id_solicitante, int id_usuario_ingreso, int id_usuario_seguimiento, int id_status, String tramite, String solicitante, String status, String unidadadministrativa, int dias_resolucion){
        this.id_solicitud=id_solicitud;
        this.fecha_ingreso=fecha_ingreso;
        this.fecha_termino=fecha_termino;
        this.id_tramite=id_tramite;
        this.id_solicitante=id_solicitante;
        this.id_usuario_ingreso=id_usuario_ingreso;
        this.id_usuario_seguimiento=id_usuario_seguimiento;
        this.id_status=id_status;
        this.tramite=tramite;
        this.solicitante=solicitante;
        this.status=status;
        this.unidadadministrativa=unidadadministrativa;
        this.dias_resolucion=dias_resolucion;
    }
    
    public Solicitud(int id_solicitud, Date fecha_ingreso, Date fecha_termino, int id_tramite, int id_solicitante, int id_usuario_ingreso, int id_usuario_seguimiento, int id_status, String tramite, String solicitante, String status, String unidadadministrativa, int dias_resolucion,int dias_diferencia){
        this.id_solicitud=id_solicitud;
        this.fecha_ingreso=fecha_ingreso;
        this.fecha_termino=fecha_termino;
        this.id_tramite=id_tramite;
        this.id_solicitante=id_solicitante;
        this.id_usuario_ingreso=id_usuario_ingreso;
        this.id_usuario_seguimiento=id_usuario_seguimiento;
        this.id_status=id_status;
        this.tramite=tramite;
        this.solicitante=solicitante;
        this.status=status;
        this.unidadadministrativa=unidadadministrativa;
        this.dias_resolucion=dias_resolucion;
        this.dias_diferencia=dias_diferencia;
    }
    
     public Solicitud( Date fecha_ingreso, Date fecha_termino,  int id_status){
        
        this.fecha_ingreso=fecha_ingreso;
        this.fecha_termino=fecha_termino;
        this.id_status=id_status;
    }
     

    public int getId_solicitud() {
        return id_solicitud;
    }

    public void setId_solicitud(int id_solicitud) {
        this.id_solicitud = id_solicitud;
    }

    public Date getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(Date fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public Date getFecha_termino() {
        return fecha_termino;
    }

    public void setFecha_termino(Date fecha_termino) {
        this.fecha_termino = fecha_termino;
    }

    public int getId_tramite() {
        return id_tramite;
    }

    public void setId_tramite(int id_tramite) {
        this.id_tramite = id_tramite;
    }

    public int getId_solicitante() {
        return id_solicitante;
    }

    public void setId_solicitante(int id_solicitante) {
        this.id_solicitante = id_solicitante;
    }

    public int getId_usuario_ingreso() {
        return id_usuario_ingreso;
    }

    public void setId_usuario_ingreso(int id_usuario_ingreso) {
        this.id_usuario_ingreso = id_usuario_ingreso;
    }

    public int getId_usuario_seguimiento() {
        return id_usuario_seguimiento;
    }

    public void setId_usuario_seguimiento(int id_usuario_seguimiento) {
        this.id_usuario_seguimiento = id_usuario_seguimiento;
    }

    public int getId_status() {
        return id_status;
    }

    public void setId_status(int id_status) {
        this.id_status = id_status;
    }

    public String getTramite() {
        return tramite;
    }

    public void setTramite(String tramite) {
        this.tramite = tramite;
    }

    public String getSolicitante() {
        return solicitante;
    }

    public void setSolicitante(String solicitante) {
        this.solicitante = solicitante;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getUnidadadministrativa() {
        return unidadadministrativa;
    }

    public void setUnidadadministrativa(String unidadadministrativa) {
        this.unidadadministrativa = unidadadministrativa;
    }
    
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    
    public int getDias_resolucion() {
        return dias_resolucion;
    }

    public void setDias_resolucion(int dias_resolucion) {
        this.dias_resolucion = dias_resolucion;
    }
    
    public int getDias_diferencia() {
        return dias_diferencia;
    }

    public void setDias_diferencia(int dias_diferencia) {
        this.dias_diferencia = dias_diferencia;
    }
}
