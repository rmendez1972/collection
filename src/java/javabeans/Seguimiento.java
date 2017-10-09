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
public class Seguimiento {
    private int id_seguimiento;
    private Date fecha;
    private String observaciones;
    private int id_usuario;
    private int id_solicitud;
    private int id_status;
    private String estatus;
    private Boolean adjunto;
    private String usuario;

    
    
    public Seguimiento(int id_seguimiento, Date fecha, String observaciones, int id_usuario, int id_solicitud, int id_status, Boolean adjunto){
        this.id_seguimiento=id_seguimiento;
        this.fecha=fecha;
        this.observaciones=observaciones;
        this.id_usuario=id_usuario;
        this.id_solicitud=id_solicitud;
        this.id_status=id_status;
        this.adjunto=adjunto;
    }
    
    public Seguimiento(int id_seguimiento, Date fecha, String observaciones, int id_usuario, int id_solicitud, int id_status, String estatus,Boolean adjunto){
        this.id_seguimiento=id_seguimiento;
        this.fecha=fecha;
        this.observaciones=observaciones;
        this.id_usuario=id_usuario;
        this.id_solicitud=id_solicitud;
        this.id_status=id_status;
        this.estatus=estatus;
        this.adjunto=adjunto;
    }

       public Seguimiento() {
        
    }

    public int getId_seguimiento() {
        return id_seguimiento;
    }

    public void setId_seguimiento(int id_seguimiento) {
        this.id_seguimiento = id_seguimiento;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_solicitud() {
        return id_solicitud;
    }

    public void setId_solicitud(int id_solicitud) {
        this.id_solicitud = id_solicitud;
    }

    public int getId_status() {
        return id_status;
    }

    public void setId_status(int id_status) {
        this.id_status = id_status;
    }
    
    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }
    
    public Boolean getAdjunto() {
        return adjunto;
    }

    public void setAdjunto(Boolean adjunto) {
        this.adjunto = adjunto;
    }
    
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
}
