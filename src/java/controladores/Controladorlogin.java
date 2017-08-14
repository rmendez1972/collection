/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionUsuario;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javabeans.Usuario;
import javabeans.UsuarioApi;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;



/**
 *
 * @author Rafael Mendez
 */


@WebServlet(name = "Controladorlogin", urlPatterns = {"/controladorlogin"})
public class Controladorlogin extends ControladorBase 
{ 
    public Connection cn;
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //almacena la operacion que debe gestionar el controlador
        String operacion=request.getParameter("operacion");
        //String usuario=request.getParameter("usuario");
        //String password=request.getParameter("password");
        
     
        if(operacion.equals("iniciar"))
        {
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
                //request.setAttribute("id_grupo", id_grupo);
                
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request,response);
          
                
            }
            else
            {
               String mensaje="Fracaso en Login";
               request.setAttribute("mensaje",mensaje);
                //RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                //rd.forward(request,response);
               response.sendRedirect("login.jsp");
            }    
                
        }
        
        
        if(operacion.equals("apilogin"))
        {
            
            
            String username = request.getParameter("username").toUpperCase();
            String password = request.getParameter("password").toUpperCase();
            GestionUsuario gusua=new GestionUsuario(); 
            Usuario usua = gusua.obtenerPorEmailPassword(username, password);
            
            UsuarioApi user= new UsuarioApi(); 
            ArrayList usuario = new ArrayList();
            if (usua != null){
                user.setId(usua.getId_usuario());
                user.setUsername(usua.getUsuario());
                user.setPassword(usua.getPassword());
                user.setFirstname(usua.getNombre());
                
                           
                usuario.add(user);
            }else{
                usuario.add(user);
            }
                
            
            GsonBuilder builder=new GsonBuilder();
            Gson gson=builder.create();
            
            //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "POST, GET");
            response.setHeader("Access-Control-Max-Age", "3600");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
            response.getWriter().write("{\"user\":"+gson.toJson(usuario)+"}");
            
          
        }
        
        
    } 
}

