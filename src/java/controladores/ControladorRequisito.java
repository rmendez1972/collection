/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionRequisito;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javabeans.Requisito;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author arturo
 */
public class ControladorRequisito extends ControladorBase {

    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionRequisito modelo=new GestionRequisito();
        ArrayList req=modelo.obtenerTodos();
        request.setAttribute("req",req);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_requisitos.jsp");
        rd.forward(request,response);
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionRequisito modelo=new GestionRequisito();
        int id=Integer.parseInt(request.getParameter("id_requisito"));
        if(modelo.eliminarPorId(id)){
            request.setAttribute("msg", "Requisito eliminado");
        }
        else{
            request.setAttribute("msg", "Error al eliminar. El requisito se encuentra en uso");
        }
            
        RequestDispatcher rd=request.getRequestDispatcher("controladorrequisito?operacion=listar");
        rd.forward(request,response);
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{        
        RequestDispatcher rd=request.getRequestDispatcher("frm_requisito.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionRequisito modelo=new GestionRequisito();
        Requisito req=new Requisito();
        req.setNombre(request.getParameter("nombre"));
        if(modelo.registroRequisito(req)){
            request.setAttribute("msg", "Requisito guardado");
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladorrequisito?operacion=listar");
        rd.forward(request,response);
    }
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionRequisito modelo=new GestionRequisito();
        Requisito req=modelo.obtenerPorId(Integer.parseInt(request.getParameter("id_requisito")));
        request.setAttribute("req", req);
        
        RequestDispatcher rd=request.getRequestDispatcher("frmmodifica_requisito.jsp");
        rd.forward(request,response);
    }
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionRequisito modelo=new GestionRequisito();
        Requisito req=new Requisito();
        req.setId_requisito(Integer.parseInt(request.getParameter("id_requisito")));
        req.setNombre(request.getParameter("nombre"));
        
        if(modelo.actualizar(req)){
            request.setAttribute("msg", "Datos actualizados");
        }
        else
            request.setAttribute("msg", "Error al actualizar");
        
        RequestDispatcher rd=request.getRequestDispatcher("controladorrequisito?operacion=listar");
        rd.forward(request,response);
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        param.put("titulo", "Reporte de Requisitos");
        param.put("sql", "");
        generarReporte("ReporteRequisitos.jasper", param, request, response);
    }
}
