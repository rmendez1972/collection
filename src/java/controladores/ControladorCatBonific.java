/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionCatBonific;
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
import javabeans.CatBonificacion;

/**
 *
 * @author Marlon
 */
@WebServlet(name = "ControladorCatBonific", urlPatterns = {"/controladorcatbonific"})
public class ControladorCatBonific extends ControladorBase{
    
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionCatBonific modelo = new GestionCatBonific();
        ArrayList catbon = modelo.obtenerTodos();
        request.setAttribute("catbon", catbon);
        RequestDispatcher rd=request.getRequestDispatcher("listar_catbonific.jsp");
        rd.forward(request,response);
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        RequestDispatcher rd=request.getRequestDispatcher("frm_catbonific.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionCatBonific modelo = new GestionCatBonific();
        CatBonificacion cb= new CatBonificacion();
        cb.setClave_bonific(request.getParameter("clave_bonific"));
        cb.setDescripcion(request.getParameter("descripcion"));
        
        if(modelo.registroCatboni(cb))
            request.setAttribute("msg", "Datos guardados");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladorcatbonific?operacion=listar");
        rd.forward(request,response);
    }
    
     public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id = Integer.parseInt(request.getParameter("id"));
        GestionCatBonific modelo = new GestionCatBonific();
        CatBonificacion catbon = modelo.obtenerPorId(id);
                
        request.setAttribute("catbon", catbon);
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificacatbonific.jsp");
        rd.forward(request,response);
    
    }
     
     public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
         int id = Integer.parseInt(request.getParameter("id"));
         GestionCatBonific modelo = new GestionCatBonific();
         
        if(modelo.eliminarPorId(id))
            request.setAttribute("msg", "Registro Eliminado");
        else
            request.setAttribute("msg", "No se pudo eliminar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladorcatbonific?operacion=listar");
        rd.forward(request,response);
         
     }
     
     public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
         GestionCatBonific modelo = new GestionCatBonific();
         CatBonificacion catbon = new CatBonificacion();
         catbon.setId_bonific(Integer.parseInt(request.getParameter("id_bonific")));
         catbon.setClave_bonific(request.getParameter("clave_bonific"));
         catbon.setDescripcion(request.getParameter("descripcion"));
         
        if(modelo.actualizar(catbon))
            request.setAttribute("msg", "Datos guardados");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladorcatbonific?operacion=listar");
        rd.forward(request,response);
         
     }
    
}
