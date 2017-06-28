/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionDirecciones;
import Modelo.GestionDelegacion;
import Modelo.GestionNiveles;
import Modelo.GestionUsuario;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javabeans.Usuario;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author arturo
 */
@WebServlet(name = "ControladorUsuario", urlPatterns = {"/controladorusuario"})
public class ControladorUsuario extends ControladorBase {

    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionUsuario modelo=new GestionUsuario();
            ArrayList usuarios=modelo.obtenerUsuarios();
            request.setAttribute("usuarios", usuarios);
            
            RequestDispatcher rd=request.getRequestDispatcher("listar_usuarios.jsp");
            rd.forward(request,response);
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
            GestionUsuario modelo=new GestionUsuario();
            if(modelo.eliminarPorId(id))
                request.setAttribute("msg", "Registro eliminado");
            else
                request.setAttribute("msg", "No es posible eliminar. El usuario tiene solicitudes registradas.");
            
            RequestDispatcher rd=request.getRequestDispatcher("controladorusuario?operacion=listar");
            rd.forward(request,response);
    }
    
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
            GestionUsuario modelo=new GestionUsuario();
            Usuario usr=modelo.obtenerPorId(id);
            
            GestionNiveles mod_niv=new GestionNiveles();
            GestionDelegacion mod_del=new GestionDelegacion();
            //GestionDirecciones mod_dir=new GestionDirecciones();
            
            ArrayList niv=mod_niv.obtenerTodos();
            ArrayList del=mod_del.obtenerTodos();
            //ArrayList dir=mod_dir.obtenerTodos();
            
            request.setAttribute("usr", usr);
            request.setAttribute("niv", niv);
            //request.setAttribute("dir", dir);
            request.setAttribute("del", del);
            
            RequestDispatcher rd=request.getRequestDispatcher("frm_modificausuario.jsp");
            rd.forward(request,response);
    }
    
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Usuario usr=new Usuario();
            usr.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));
            usr.setNombre(request.getParameter("nombre").toUpperCase());
            usr.setId_nivel(Integer.parseInt(request.getParameter("id_nivel")));
            usr.setDireccion(request.getParameter("direccion").toUpperCase());
            usr.setCargo(request.getParameter("cargo").toUpperCase());
            usr.setId_del(Integer.parseInt(request.getParameter("id_delegacion")));
            usr.setSerie(request.getParameter("serie").toUpperCase());
            usr.setUsuario(request.getParameter("usuario").toUpperCase());
            usr.setPassword(request.getParameter("password"));
         
            GestionUsuario modelo=new GestionUsuario();
            if(modelo.actualizarUsuario(usr)){
                RequestDispatcher rd=request.getRequestDispatcher("controladorusuario?operacion=listar");
                request.setAttribute("msg", "Datos guardados");
                rd.forward(request,response);
            }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("controladorusuario?operacion=editar");
                request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
                rd.forward(request,response);
            }
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
            GestionNiveles mod_niv=new GestionNiveles();
            GestionDelegacion mod_del=new GestionDelegacion();
            ArrayList niv=mod_niv.obtenerTodos();
            ArrayList del=mod_del.obtenerTodos();
            
            request.setAttribute("niv", niv);
            request.setAttribute("del", del);
            
            RequestDispatcher rd=request.getRequestDispatcher("frm_usuario.jsp");
            rd.forward(request,response);
    }
    
    public void nuevoLogin(HttpServletRequest request, HttpServletResponse response) throws Exception{
                        
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
            rd.forward(request,response);
    }
    
    public void login(HttpServletRequest request, HttpServletResponse response) throws Exception{
                        
            Usuario usuario=new Usuario();
            usuario.setUsuario(request.getParameter("usuario")); 
            usuario.setPassword(request.getParameter("password"));
            
            // verificando la existencia del usuario en la db
            GestionUsuario gu=new GestionUsuario(); //instancia del objeto Modelo que gestiona las operaciones
            usuario = gu.login(usuario);
           
            if (usuario!=null)
            {

                //int id_grupo=usuario.getId_grupo();
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                request.setAttribute("usuario", usuario);
                
                RequestDispatcher rd=request.getRequestDispatcher("bienvenida.jsp");
                rd.forward(request,response);
          
                
            }
            else
            {

               request.setAttribute("msg", "¡Usuario o Password incorrecto, intente de nuevo!");
                //RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                //rd.forward(request,response);
               
               RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
               rd.forward(request,response);
               //response.sendRedirect("login.jsp");
            }    
                
        
    }
    
    public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        HttpSession session = request.getSession();
        
        session.setAttribute("usuario", null);
        request.setAttribute("usuario", null);
        request.setAttribute("msg", "Se cerró la sesión correctamente!");
        
        RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Usuario usr=new Usuario();
            usr.setNombre(request.getParameter("nombre").toUpperCase());
            usr.setId_nivel(Integer.parseInt(request.getParameter("id_nivel")));
            usr.setDireccion(request.getParameter("direccion").toUpperCase());
            usr.setCargo(request.getParameter("cargo").toUpperCase());
            usr.setId_del(Integer.parseInt(request.getParameter("id_delegacion")));
            usr.setSerie(request.getParameter("serie").toUpperCase());
            usr.setUsuario(request.getParameter("usuario").toUpperCase());
            usr.setPassword(request.getParameter("password"));
            
            
            GestionUsuario modelo=new GestionUsuario();
            if(modelo.registroUsuario(usr)){
                RequestDispatcher rd=request.getRequestDispatcher("controladorusuario?operacion=listar");
                request.setAttribute("msg", "Datos guardados");
                rd.forward(request,response);
            }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("controladorusuario?operacion=nuevo");
                request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
                rd.forward(request,response);
            }
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteUsuarios.jasper", param, request, response);
    }
    /*
    public void validarPass(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Usuario usr = new Usuario();
        GestionUsuario modelo = new GestionUsuario();
        
        
    }*/
}
