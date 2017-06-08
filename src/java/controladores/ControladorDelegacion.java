/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionDelegacion;
import javabeans.Delegacion;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SEDUVI
 */
@WebServlet(name = "ControladorDelegacion", urlPatterns = {"/controladordelegacion"})
public class ControladorDelegacion extends ControladorBase{
    
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionDelegacion modelo = new GestionDelegacion();
        ArrayList del=modelo.obtenerTodos();
        request.setAttribute("del", del);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_delegaciones.jsp");
        rd.forward(request,response);
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        RequestDispatcher rd=request.getRequestDispatcher("frm_delegacion.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionDelegacion modelo=new GestionDelegacion();
        Delegacion del = new Delegacion();
        del.setDescripcion(request.getParameter("descripcion").toUpperCase());
        del.setDireccion(request.getParameter("direccion").toUpperCase());
        
        
        if(modelo.registroDelegacion(del))
            request.setAttribute("msg", "Datos guardados");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladordelegacion?operacion=listar");
        rd.forward(request,response);
    }
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id = Integer.parseInt(request.getParameter("id"));
        GestionDelegacion modelo = new GestionDelegacion();
        Delegacion del = modelo.obtenerPorId(id);
        
        request.setAttribute("del", del);
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificadelegacion.jsp");
        rd.forward(request,response);
    
    }
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionDelegacion modelo=new GestionDelegacion();
        Delegacion del = new Delegacion();
        del.setId_delegacion(Integer.parseInt(request.getParameter("id_delegacion")));
        del.setDescripcion(request.getParameter("descripcion").toUpperCase());
        del.setDireccion(request.getParameter("direccion").toUpperCase());
        
        if(modelo.actualizar(del))
            request.setAttribute("msg", "Datos guardados");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladordelegacion?operacion=listar");
        rd.forward(request,response);
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionDelegacion modelo=new GestionDelegacion();
        
        if(modelo.eliminarPorId(id))
            request.setAttribute("msg", "Registro eliminado");
        else
            request.setAttribute("msg", "No se pudo eliminar, el status se encuentra en uso");
        RequestDispatcher rd=request.getRequestDispatcher("controladordelegacion?operacion=listar");
        rd.forward(request,response);
    }
    
}
