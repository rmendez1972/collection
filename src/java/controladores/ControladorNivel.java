/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionNiveles;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javabeans.Usuario;
import javabeans.Nivel;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author Marlon
 */
@WebServlet(name = "ControladorNivel", urlPatterns = {"/controladornivel"})
public class ControladorNivel extends ControladorBase {
    
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        //el modelo llamado GestionNiveles es el que hace llamado a los datos de Niveles, UnidadAdministrativa = Niveles
        GestionNiveles modelo=new GestionNiveles();
        ArrayList niveles=modelo.obtenerTodos();
        request.setAttribute("niveles", niveles);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_niveles.jsp");
        rd.forward(request,response);
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        RequestDispatcher rd=request.getRequestDispatcher("frm_nivel.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionNiveles modelo=new GestionNiveles();
        Nivel nivel=new Nivel();
        nivel.setDescripcion(request.getParameter("descripcion").toUpperCase());
        nivel.setPrivilegios(request.getParameter("privilegios").toUpperCase());
        
        if(modelo.registroNivel(nivel))
            request.setAttribute("msg", "Datos guardados");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladornivel?operacion=listar");
        rd.forward(request,response);
    }
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id = Integer.parseInt(request.getParameter("id"));
        GestionNiveles modelo = new GestionNiveles();
        
        Nivel niveles = modelo.obtenerPorId(id);
        
        request.setAttribute("niveles", niveles);
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificanivel.jsp");
        rd.forward(request,response);
    
    }
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionNiveles modelo=new GestionNiveles();
        Nivel nivel=new Nivel();
        nivel.setId_nivel(Integer.parseInt(request.getParameter("id_nivel")));
        nivel.setDescripcion(request.getParameter("descripcion").toUpperCase());
        nivel.setPrivilegios(request.getParameter("privilegios").toUpperCase());
        
        if(modelo.actualizar(nivel))
            request.setAttribute("msg", "Datos guardados");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladornivel?operacion=listar");
        rd.forward(request,response);
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionNiveles modelo=new GestionNiveles();
        
        if(modelo.eliminarPorId(id))
            request.setAttribute("msg", "Registro eliminado");
        else
            request.setAttribute("msg", "No se pudo eliminar, el status se encuentra en uso");
        RequestDispatcher rd=request.getRequestDispatcher("controladornivel?operacion=listar");
        rd.forward(request,response);
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteNiveles.jasper", param, request, response);
    }
    
    
    
}
