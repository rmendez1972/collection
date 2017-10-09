/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionDirecciones;
import Modelo.GestionNiveles;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javabeans.Direcciones;
import javabeans.UnidadAdministrativa;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author rafael
 */


public class ControladorDirecciones extends ControladorBase {

   public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionDirecciones modelo=new GestionDirecciones();
            ArrayList dir=modelo.obtenerTodos();
            
            request.setAttribute("dir",dir);
            
            RequestDispatcher rd=request.getRequestDispatcher("listar_dir.jsp");
            rd.forward(request,response);
    }
   
   public void listarPorunidad(HttpServletRequest request, HttpServletResponse response) throws Exception{
            int id_unidadadministrativa=Integer.parseInt(request.getParameter("id_unidadadministrativa"));
            GestionDirecciones modelo=new GestionDirecciones();
            ArrayList dir=modelo.obtenerTodosPorunidad(id_unidadadministrativa);
            GsonBuilder builder=new GsonBuilder();
            Gson gson=builder.create();

            response.addHeader("Content-Type", "text/html; charset=utf-8");
            response.getWriter().write(gson.toJson(dir));
            
    }
   
   
    public void listarPorunidadjson(HttpServletRequest request, HttpServletResponse response) throws Exception{
            int id_unidadadministrativa=Integer.parseInt(request.getParameter("id_unidadadministrativa"));
            GestionDirecciones modelo=new GestionDirecciones();
            ArrayList dir=modelo.obtenerTodosPorunidad(id_unidadadministrativa);
            GsonBuilder builder=new GsonBuilder();
            Gson gson=builder.create();
            
            response.addHeader("Content-Type", "text/html; charset=utf-8; Access-Control-Allow-Origin http://localhost:4200");
            response.getWriter().write("{\"data\":"+gson.toJson(dir)+"}");
            
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionNiveles mod_ua=new GestionNiveles();
        ArrayList ua=mod_ua.obtenerTodos();
        request.setAttribute("ua", ua);
        RequestDispatcher rd=request.getRequestDispatcher("frm_direccion.jsp");
        rd.forward(request,response);
    }
    
    public void guardarNuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
            
            GestionDirecciones modelo=new GestionDirecciones();
            Direcciones dir=new Direcciones();
            dir.setNombre(request.getParameter("nombre"));
            dir.setId_unidadadministrativa(Integer.parseInt(request.getParameter("unidadAdministrativa")));
            if(modelo.registroDireccion(dir)){
                RequestDispatcher rd=request.getRequestDispatcher("controladordirecciones?operacion=listar");
                request.setAttribute("msg", "Datos guardados");
                rd.forward(request,response);
            }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("controladordirecciones?operacion=nuevo");
                request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
                rd.forward(request,response);
            }
    }
    
   public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id_direccion=Integer.parseInt(request.getParameter("id"));
            GestionDirecciones modelo=new GestionDirecciones();
            if(modelo.eliminarPorId(id_direccion)){
                RequestDispatcher rd=request.getRequestDispatcher("controladordirecciones?operacion=listar");
                request.setAttribute("msg", "Datos eliminados");
                rd.forward(request,response);
            }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("controladordirecciones?operacion=listar");
                request.setAttribute("msg", "Error al eliminar. La Direccion se encuentra en uso.");
                rd.forward(request,response);
            }
    }
    
    public void modificar(HttpServletRequest request, HttpServletResponse response) throws Exception{
            int id_direccion=Integer.parseInt(request.getParameter("id"));
            GestionDirecciones modelo=new GestionDirecciones();
            Direcciones di=modelo.obtenerPorId(id_direccion);
            
            GestionNiveles mod_ua=new GestionNiveles();
            ArrayList ua=mod_ua.obtenerTodos();
            
            request.setAttribute("ua", ua);
            request.setAttribute("di", di);
            RequestDispatcher rd=request.getRequestDispatcher("frm_direccionEditar.jsp");
            rd.forward(request,response);
    }
    
    public void modificarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
            Direcciones di=new Direcciones(Integer.parseInt(request.getParameter("id_direccion")), request.getParameter("nombre"),Integer.parseInt( request.getParameter("id_unidadadministrativa")));
            GestionDirecciones modelo=new GestionDirecciones();
            if(modelo.actualizar(di)){
                RequestDispatcher rd=request.getRequestDispatcher("controladordirecciones?operacion=listar");
                request.setAttribute("msg", "Datos guardados");
                rd.forward(request,response);
            }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("controladordirecciones?operacion=listar");
                request.setAttribute("msg", "Error al guardar");
                rd.forward(request,response);
            }
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteDirecciones.jasper", param, request, response);
    }
}
