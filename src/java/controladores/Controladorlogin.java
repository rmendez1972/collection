/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionUsuario;
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
public class Controladorlogin extends HttpServlet 
{ 
    public Connection cn;
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //almacena la operacion que debe gestionar el controlador
        String operacion=request.getParameter("operacion");
        
        //el controlador redirecciona al formulario de captura de cpp
        if(operacion.equals("iniciar"))
        {
            Usuario usuario;
            
            usuario = (Usuario)request.getAttribute("usuario");
            /*
            //iniciando variables
            String usua = null;
            String pass = null;
            Integer id_usuario= null;
            Integer id_nivel= null;
           */
            // verificando la existencia del usuario en la db
            GestionUsuario gu=new GestionUsuario(); //instancia del objeto Modelo que gestiona las operaciones
            usuario = gu.login(usuario);
           
            if (usuario!=null)
            {
               /* usua = usuario.getUsuario();
                pass = usuario.getPassword();
                id_usuario= usuario.getId_usuario();
                id_nivel= usuario.getId_nivel(); */
                int id_grupo=usuario.getId_grupo();
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                request.setAttribute("id_grupo", id_grupo);
                
                RequestDispatcher rd=request.getRequestDispatcher("index.html");
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
        
        
    } 
}

