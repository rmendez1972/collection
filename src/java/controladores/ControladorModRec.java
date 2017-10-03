/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import javabeans.ModulosRecaudacion;
import Modelo.GestionModRec;
import Modelo.GestionDelegacion;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Marlon
 */
@WebServlet(name = "ControladorModRec", urlPatterns = {"/controladormodrec"})
public class ControladorModRec extends ControladorBase{
    
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionModRec modelo = new GestionModRec();
        ArrayList mr = modelo.obtenerTodos();
        request.setAttribute("mr", mr);
        RequestDispatcher rd=request.getRequestDispatcher("listar_modrecaudacion.jsp");
        rd.forward(request,response);
        
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionDelegacion modelo = new GestionDelegacion();
        ArrayList del = modelo.obtenerTodos();
        
        request.setAttribute("del", del);
        RequestDispatcher rd=request.getRequestDispatcher("frm_modrecaudacion.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModulosRecaudacion mr = new ModulosRecaudacion();
        
        mr.setDescripcion(request.getParameter("descripcion").toUpperCase());
        mr.setDireccion(request.getParameter("direccion").toUpperCase());
        mr.setId_delegacion(Integer.parseInt(request.getParameter("id_delegacion")));
        
        GestionModRec modelo = new GestionModRec();
        if(modelo.registroModRec(mr)){
            RequestDispatcher rd=request.getRequestDispatcher("controladormodrec?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
            }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladormodrec?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    
    }
    
     public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionModRec modeloMod = new GestionModRec();
        GestionDelegacion modeloDel = new GestionDelegacion();
        
        ModulosRecaudacion rm = modeloMod.obtenerPorId(id);
        ArrayList del = modeloDel.obtenerTodos();
        request.setAttribute("rm", rm);
        request.setAttribute("del", del);

        RequestDispatcher rd=request.getRequestDispatcher("frm_modificamodrec.jsp");
        rd.forward(request,response);
    }
     
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModulosRecaudacion mr = new ModulosRecaudacion();
        Integer id_modulo = Integer.parseInt(request.getParameter("id_modulo"));
        
        mr.setId_modulo(id_modulo);
        mr.setDescripcion(request.getParameter("descripcion").toUpperCase());
        mr.setDireccion(request.getParameter("direccion").toUpperCase());
        mr.setId_delegacion(Integer.parseInt(request.getParameter("id_delegacion")));
        
        GestionModRec modelo = new GestionModRec();
        if(modelo.actualizarModRec(mr)){
            RequestDispatcher rd=request.getRequestDispatcher("controladormodrec?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
            }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladormodrec?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
        
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionModRec modelo=new GestionModRec();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. El usuario tiene solicitudes registradas.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladormodrec?operacion=listar");
        rd.forward(request,response);
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteModuloRecaudacion.jasper", param, request, response);
    } 
    
}
