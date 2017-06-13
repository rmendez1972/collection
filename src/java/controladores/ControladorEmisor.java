/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionEmisor;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperRunManager;
import javabeans.CatEmisores;

/**
 *
 * @author Marlon
 */
@WebServlet(name = "ControladorEmisor", urlPatterns = {"/controladoremisor"})
public class ControladorEmisor extends ControladorBase{
    
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionEmisor modelo = new GestionEmisor();
        ArrayList emisor = modelo.obtenerTodos();
        request.setAttribute("emisor", emisor);
        RequestDispatcher rd=request.getRequestDispatcher("listar_emisor.jsp");
        rd.forward(request,response);
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        RequestDispatcher rd=request.getRequestDispatcher("frm_emisor.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionEmisor modelo = new GestionEmisor();
        CatEmisores ce= new CatEmisores();
        ce.setDescripcion(request.getParameter("descripcion").toUpperCase());
        
        if(modelo.registroEmisor(ce))
            request.setAttribute("msg", "Datos guardados");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladoremisor?operacion=listar");
        rd.forward(request,response);
    }
    
     public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id = Integer.parseInt(request.getParameter("id"));
        GestionEmisor modelo = new GestionEmisor();
        CatEmisores emisor = modelo.obtenerPorId(id);
                
        request.setAttribute("emisor", emisor);
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificaemisor.jsp");
        rd.forward(request,response);
    
    }
     
     public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
         int id = Integer.parseInt(request.getParameter("id"));
         GestionEmisor modelo = new GestionEmisor();
         
        if(modelo.eliminarPorId(id))
            request.setAttribute("msg", "Registro Eliminado");
        else
            request.setAttribute("msg", "No se pudo eliminar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladoremisor?operacion=listar");
        rd.forward(request,response);
         
     }
     
     public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
         GestionEmisor modelo = new GestionEmisor();
         CatEmisores ce = new CatEmisores();
         ce.setId_emisor(Integer.parseInt(request.getParameter("id_emisor")));
         ce.setDescripcion(request.getParameter("descripcion").toUpperCase());
         
        if(modelo.actualizar(ce))
            request.setAttribute("msg", "Datos guardados");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladoremisor?operacion=listar");
        rd.forward(request,response);
         
     }
     
     public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteEmisor.jasper", param, request, response);
    }
   
}
