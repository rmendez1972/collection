/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionStatus;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javabeans.Status;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author arturo
 */
public class ControladorEstatus extends ControladorBase {

    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionStatus modelo=new GestionStatus();
        ArrayList status=modelo.obtenerTodos();
        request.setAttribute("status", status);
        RequestDispatcher rd=request.getRequestDispatcher("listar_status.jsp");
        rd.forward(request,response);
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionStatus modelo=new GestionStatus();
        if(modelo.eliminarPorId(id))
            request.setAttribute("msg", "Registro eliminado");
        else
            request.setAttribute("msg", "No se pudo eliminar, el status se encuentra en uso");
        RequestDispatcher rd=request.getRequestDispatcher("controladorestatus?operacion=listar");
        rd.forward(request,response);
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        RequestDispatcher rd=request.getRequestDispatcher("frm_status.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionStatus modelo=new GestionStatus();
        Status status=new Status();
        status.setNombre(request.getParameter("nombre"));
        if(modelo.registroStatus(status))
            request.setAttribute("msg", "Datos guardados");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladorestatus?operacion=listar");
        rd.forward(request,response);
    }
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionStatus modelo=new GestionStatus();
        Status status=modelo.obtenerPorId(id);
        request.setAttribute("status", status);
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificastatus.jsp");
        rd.forward(request,response);
    }
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionStatus modelo=new GestionStatus();
        Status status=new Status();
        status.setId_status(Integer.parseInt(request.getParameter("id_status")));
        status.setNombre(request.getParameter("nombre"));
        if(modelo.actualizar(status))
            request.setAttribute("msg", "Datos guardados");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladorestatus?operacion=listar");
        rd.forward(request,response);
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteStatus.jasper", param, request, response);
    }
}
