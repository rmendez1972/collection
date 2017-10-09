/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionNiveles;
import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javabeans.UnidadAdministrativa;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author arturo
 */
/*
public class ControladorUnidadAdtva extends ControladorBase {

    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionNiveles modelo=new GestionNiveles();
            ArrayList ua=modelo.obtenerTodos();
            
            request.setAttribute("ua",ua);
            
            RequestDispatcher rd=request.getRequestDispatcher("listar_ua.jsp");
            rd.forward(request,response);
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        RequestDispatcher rd=request.getRequestDispatcher("frm_unidadAdministrativa.jsp");
            rd.forward(request,response);
    }
    
    public void guardarNuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String nombre=request.getParameter("nombre");
        String email=request.getParameter("email");
            GestionNiveles modelo=new GestionNiveles();
            UnidadAdministrativa ua=new UnidadAdministrativa();
            ua.setNombre(nombre);
            ua.setEmail(email);
            if(modelo.registroUnidadAdministrativa(ua)){
                RequestDispatcher rd=request.getRequestDispatcher("controladorunidadadtva?operacion=listar");
                request.setAttribute("msg", "Datos guardados");
                rd.forward(request,response);
            }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("controladorunidadadtva?operacion=nuevo");
                request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
                rd.forward(request,response);
            }
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id_unidad=Integer.parseInt(request.getParameter("id"));
            GestionNiveles modelo=new GestionNiveles();
            if(modelo.eliminarPorId(id_unidad)){
                RequestDispatcher rd=request.getRequestDispatcher("controladorunidadadtva?operacion=listar");
                request.setAttribute("msg", "Datos eliminados");
                rd.forward(request,response);
            }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("controladorunidadadtva?operacion=listar");
                request.setAttribute("msg", "Error al eliminar. La Unidad se encuentra en uso.");
                rd.forward(request,response);
            }
    }
    
    public void modificar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id_unidad=Integer.parseInt(request.getParameter("id"));
            GestionNiveles modelo=new GestionNiveles();
            UnidadAdministrativa ua=modelo.obtenerPorId(id_unidad);
            request.setAttribute("ua", ua);
            RequestDispatcher rd=request.getRequestDispatcher("frm_unidadAdministrativaEditar.jsp");
            rd.forward(request,response);
    }
    
    public void modificarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        UnidadAdministrativa ua=new UnidadAdministrativa(Integer.parseInt(request.getParameter("id_unidadAdministrativa")), request.getParameter("nombre"), request.getParameter("email"));
            GestionNiveles modelo=new GestionNiveles();
            if(modelo.actualizar(ua)){
                RequestDispatcher rd=request.getRequestDispatcher("controladorunidadadtva?operacion=listar");
                request.setAttribute("msg", "Datos guardados");
                rd.forward(request,response);
            }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("controladorunidadadtva?operacion=listar");
                request.setAttribute("msg", "Error al guardar");
                rd.forward(request,response);
            }
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteUnidades.jasper", param, request, response);
    }
}
*/