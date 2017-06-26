/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionFirmantes;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javabeans.Firmantes;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author Marlon
 */
@MultipartConfig
@WebServlet(name = "ControladorFirmantes", urlPatterns = {"/controladorfirmantes"})
public class ControladorFirmantes extends ControladorBase{
    
        private String getFileName(Part part) 
    {

        String partHeader = part.getHeader("content-disposition");

        //logger.info(“Part Header = ” + partHeader);

        for (String cd : part.getHeader("content-disposition").split(";")) 
        {

            if (cd.trim().startsWith("filename")) 
            {

                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                
            }

        }

        return null;

    }

    private Boolean subirFirma(Part p1)
    {
        String filename = getFileName(p1);
        if (!filename.isEmpty())
        {    
            // en caso de querer escupir en un PrintWriter
            //response.setContentType("text/html;charset=UTF-8");
            //PrintWriter out = response.getWriter();
            try {
                            
                InputStream is = p1.getInputStream();
                //String ruta="/firmantes";
                // ruta relativa a donde subo el archivo adjunto
                //String outputfile = this.getServletContext().getRealPath("/adjuntos/");  // get path on the server
<<<<<<< HEAD
                String outputfile = "C:/Users/rmendez1972/Documents/NetBeansProjects/cobranza/web/firmantes";
=======
                String outputfile = "C:/Users/SEDUVI/Documents/neatbeans-project/cobranza/web/firmantes";
>>>>>>> 29312a21dcf05c78deed015e30bdf23da252b17f
                File saveFile = new File(outputfile+"/" + filename);
                FileOutputStream os = new FileOutputStream (saveFile);
            
                // lee bytes del archivo q esta como inputstream
                int ch = is.read();
                while (ch != -1)  //-1 significa q se alcalzó el final del stream
                {
                    os.write(ch);    //grabo el archivo como un outputstream
                    ch = is.read(); //lee de nuevo el stream de entrada
                }
                os.close();  //dejo de grabar al archivo en disco duro
                //out.println("<h3>Archivo adjunto subido exitosamente!</h3><a href='controladorseguimiento?operacion=listar&id_solicitud=48' ><img src='imagenes/listar.png' class='btn-tabla'  alt='Listar'  title='listar seguimientos de la solicitud'/></a>");
            }
            catch(Exception ex) {
                //out.println("Exception -->" + ex.getMessage());
                return false;
            }
            finally { 
                //out.close();
            }
            return true;
        }
        return false;
    
    }
    
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        String pathfirmantes = "firmantes/";
        GestionFirmantes modelo = new GestionFirmantes();
        ArrayList firm = modelo.obtenerTodos();
  
        request.setAttribute("pathfirmantes", pathfirmantes);
        request.setAttribute("firm", firm);
        RequestDispatcher rd=request.getRequestDispatcher("listar_firmantes.jsp");
        rd.forward(request,response);
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        RequestDispatcher rd=request.getRequestDispatcher("frm_firmantes.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        Part p1 = request.getPart("firma");
        //obtenemos el nombre de la imagen
        String nombrefirma = getFileName(p1);
        //se realiza el upload de la imagen
        Boolean firmaupload = subirFirma(p1);
    
        Firmantes firm = new Firmantes();
        firm.setNombre(request.getParameter("nombre"));
        firm.setCargo(request.getParameter("cargo"));
        firm.setFirma(nombrefirma);
        
        GestionFirmantes modelo = new GestionFirmantes();
        
        if(modelo.registroFirm(firm))
            request.setAttribute("msg", "Datos guardados e imagen grabada exitosamente");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladorfirmantes?operacion=listar");
        rd.forward(request,response);
        
    }
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id = Integer.parseInt(request.getParameter("id"));
        GestionFirmantes modelo = new GestionFirmantes();
        Firmantes firm = modelo.obtenerPorId(id);
        
        String pathfirmantes = "firmantes/";
        
        request.setAttribute("pathfirmantes", pathfirmantes);        
        request.setAttribute("firm", firm);
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificafirmantes.jsp");
        rd.forward(request,response);
    
    }
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        
        Part p1 = request.getPart("firma");
        
        String nombrefirma = getFileName(p1);
        Boolean firmaupload = subirFirma(p1);
        Firmantes firm = new Firmantes();
        firm.setId_firmante(Integer.parseInt(request.getParameter("id_firmante")));
        firm.setNombre(request.getParameter("nombre"));
        firm.setCargo(request.getParameter("cargo"));
        firm.setFirma(nombrefirma);
        
        GestionFirmantes modelo = new GestionFirmantes();
        
        if(modelo.actualizar(firm))
            request.setAttribute("msg", "Datos actualizados");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladorfirmantes?operacion=listar");
        rd.forward(request,response);
        
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
         int id = Integer.parseInt(request.getParameter("id"));
         //GestionEmisor modelo = new GestionEmisor();
         GestionFirmantes modelo = new GestionFirmantes();
         
        if(modelo.eliminarPorId(id))
            request.setAttribute("msg", "Registro Eliminado");
        else
            request.setAttribute("msg", "No se pudo eliminar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladorfirmantes?operacion=listar");
        rd.forward(request,response);
         
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteFirmante.jasper", param, request, response);
    }
    
}
