/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controladores;

import Modelo.GestionBendiv;
import Modelo.GestionBeneficiario;
import Modelo.GestionDelegacion;
import Modelo.GestionUsuario;
import Modelo.GestionProgramas;

import Modelo.conectaMysql;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import javabeans.Beneficiario;

import javabeans.BeneficiarioDiv;
import javabeans.Usuario;
import javabeans.CatProgramas;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;


/**
 *
 * @author Isamel
 */
@WebServlet(name = "ControladorBendiv", urlPatterns = {"/controladorbendiv"})
public class ControladorBendiv extends ControladorBase {
    public Connection cn;
    
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

    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionBendiv modelo=new GestionBendiv();
        ArrayList bendivs=modelo.obtenerTodos();
        request.setAttribute("bendivs", bendivs);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_bendiv.jsp");
        rd.forward(request,response);
    }
    
    
    //listar JsonBeneficiarioByBeneficiarioDiv
    public void listarJsonbyIdBeneficiarioDiv(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String valorcriterio = request.getParameter("valorcriterio");
        
        GestionBendiv gbenef = new GestionBendiv();
        BeneficiarioDiv benef = gbenef.obtenerGenerico(valorcriterio);
        
        ArrayList beneficiariodiv = new ArrayList();
        
        beneficiariodiv.add(benef);
        GsonBuilder builder=new GsonBuilder().setDateFormat("yyyy-MM-dd");
        Gson gson=builder.create();
            
        //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
        response.getWriter().write("{\"beneficiario_div\":"+gson.toJson(beneficiariodiv)+"}");
    }
    
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionBendiv modelo=new GestionBendiv();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. Este Beneficiario ya cuenta con Movimientos en diversos.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladorbendiv?operacion=listar");
        rd.forward(request,response);
        
    }
    

    
   
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionBendiv modelo=new GestionBendiv();
        BeneficiarioDiv bendiv=modelo.obtenerPorId(id);
        //GestionDelegacion modelodelegacion= new GestionDelegacion();
        //GestionUsuario modelousuario= new GestionUsuario();
        GestionProgramas modeloprogramas= new GestionProgramas();
        ArrayList programas = modeloprogramas.obtenerTodos();
        //ArrayList usuarios = modelousuario.obtenerUsuarios();
        //request.setAttribute("usuarios", usuarios);
        request.setAttribute("bendiv", bendiv);
        request.setAttribute("programas", programas);
        
        
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificabendiv.jsp");
        rd.forward(request,response);
    }
    
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        BeneficiarioDiv bendiv=new BeneficiarioDiv();
        Integer id_bendiv=Integer.parseInt(request.getParameter("id_bendiv"));
        bendiv.setId_bendiv(id_bendiv);
        bendiv.setClave_elect(request.getParameter("clave_elect").toUpperCase());
        bendiv.setCurp(request.getParameter("curp").toUpperCase());
        bendiv.setClave_b(request.getParameter("clave_b").toUpperCase());
        bendiv.setNombre(request.getParameter("nombre").toUpperCase());
       
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha_con = df.parse(request.getParameter("fecha_con"));
        bendiv.setFecha_con(fecha_con);
        BigDecimal capital = new BigDecimal(request.getParameter("capital"));
        bendiv.setCapital(capital);
        BigDecimal sub_inic = new BigDecimal(request.getParameter("sub_inic"));
        bendiv.setSub_inic(sub_inic);
        BigDecimal enganche = new BigDecimal(request.getParameter("enganche"));
        bendiv.setEnganche(enganche);
        BigDecimal interes = new BigDecimal(request.getParameter("interes"));
        bendiv.setInteres(interes);
        BigDecimal admon = new BigDecimal(request.getParameter("admon"));
        bendiv.setAdmon(admon);
        BigDecimal seguro = new BigDecimal(request.getParameter("seguro"));
        bendiv.setSeguro(seguro);
        BigDecimal o_seg = new BigDecimal(request.getParameter("o_seg"));
        bendiv.setO_seg(o_seg);
        bendiv.setPlazo(Integer.parseInt(request.getParameter("plazo")));
        BigDecimal pago_mes = new BigDecimal(request.getParameter("pago_mes"));
        bendiv.setPago_mes(pago_mes);
        BigDecimal sal_con = new BigDecimal(request.getParameter("sal_con"));
        bendiv.setSal_con(sal_con);
        bendiv.setJuridico(request.getParameter("juridico").toUpperCase());
        bendiv.setReferencia_jur(request.getParameter("referencia_jur").toUpperCase());
        
        Date fecha_jur = df.parse(request.getParameter("fecha_jur"));
        bendiv.setFecha_jur(fecha_jur);
        bendiv.setMza(request.getParameter("mza").toUpperCase());
        bendiv.setLte(request.getParameter("lte").toUpperCase());
        bendiv.setConyuge(request.getParameter("conyuge").toUpperCase());
        Date fecha = df.parse(request.getParameter("fecha"));
        bendiv.setFecha(fecha);
        
        Integer id_catprog=Integer.parseInt(request.getParameter("id_catprog"));
        bendiv.setId_catprog(id_catprog);
        //bendiv.setId_catprog(Integer.parseInt(request.getParameter("id_catprog")));
        //bendiv.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));
        String num_contrato=request.getParameter("numcontrato");
        bendiv.setNumcontrato(num_contrato);
        
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario)(session.getAttribute("usuario"));
        Integer id_usuario = usuario.getId_usuario();
        bendiv.setId_usuario(id_usuario);
        
        GestionProgramas mod_gp= new GestionProgramas();
        CatProgramas programa=mod_gp.obtenerPorId(id_catprog);
        String clave_b=programa.getClave()+'-'+num_contrato;
        bendiv.setClave_b(clave_b);
        
        GestionBendiv modelo=new GestionBendiv();
        if(modelo.actualizarBendiv(bendiv)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorbendiv?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorbendiv?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        //Se obtienen los programas para poblar el select en la vista para añadir un beneficiario div
        GestionProgramas modelo= new GestionProgramas();
        ArrayList programas = modelo.obtenerTodos();
        request.setAttribute("programas", programas);
        
        RequestDispatcher rd=request.getRequestDispatcher("frm_bendiv.jsp");
            rd.forward(request,response);
    }
   
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        BeneficiarioDiv bendiv=new BeneficiarioDiv();
        
        bendiv.setClave_elect(request.getParameter("clave_elect").toUpperCase());
        bendiv.setCurp(request.getParameter("curp").toUpperCase());
        bendiv.setClave_b(request.getParameter("clave_b").toUpperCase());
        bendiv.setNombre(request.getParameter("nombre").toUpperCase());
        
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha_con = df.parse(request.getParameter("fecha_con"));
        bendiv.setFecha_con(fecha_con);
        BigDecimal capital = new BigDecimal(request.getParameter("capital"));
        bendiv.setCapital(capital);
        BigDecimal sub_inic = new BigDecimal(request.getParameter("sub_inic"));
        bendiv.setSub_inic(sub_inic);
        BigDecimal enganche = new BigDecimal(request.getParameter("enganche"));
        bendiv.setEnganche(enganche);
        BigDecimal interes = new BigDecimal(request.getParameter("interes"));
        bendiv.setInteres(interes);
        BigDecimal admon = new BigDecimal(request.getParameter("admon"));
        bendiv.setAdmon(admon);
        BigDecimal seguro = new BigDecimal(request.getParameter("seguro"));
        bendiv.setSeguro(seguro);
        BigDecimal o_seg = new BigDecimal(request.getParameter("o_seg"));
        bendiv.setO_seg(o_seg);
        bendiv.setPlazo(Integer.parseInt(request.getParameter("plazo")));
        BigDecimal pago_mes = new BigDecimal(request.getParameter("pago_mes"));
        bendiv.setPago_mes(pago_mes);
        BigDecimal sal_con = new BigDecimal(request.getParameter("sal_con"));
        bendiv.setSal_con(sal_con);
        bendiv.setJuridico(request.getParameter("juridico").toUpperCase());
        bendiv.setReferencia_jur(request.getParameter("referencia_jur").toUpperCase());
        
        Date fecha_jur = df.parse(request.getParameter("fecha_jur"));
        bendiv.setFecha_jur(fecha_jur);
        bendiv.setMza(request.getParameter("mza").toUpperCase());
        bendiv.setLte(request.getParameter("lte").toUpperCase());
        bendiv.setConyuge(request.getParameter("conyuge").toUpperCase());
        Date fecha = df.parse(request.getParameter("fecha"));
        bendiv.setFecha(fecha);
        
        Integer id_catprog=Integer.parseInt(request.getParameter("id_catprog"));
        bendiv.setId_catprog(id_catprog);
        //bendiv.setId_catprog(Integer.parseInt(request.getParameter("id_catprog")));
        //bendiv.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));
        String num_contrato=request.getParameter("numcontrato");
        bendiv.setNumcontrato(num_contrato);
        
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario)(session.getAttribute("usuario"));
        Integer id_usuario = usuario.getId_usuario();
        bendiv.setId_usuario(id_usuario);
        
        GestionProgramas mod_gp= new GestionProgramas();
        CatProgramas programa=mod_gp.obtenerPorId(id_catprog);
        String clave_b=programa.getClave()+'-'+num_contrato;
        bendiv.setClave_b(clave_b);
        
           
        GestionBendiv modelo=new GestionBendiv();
        if(modelo.registroBendiv(bendiv)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorbendiv?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorbendiv?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
     
    /*
    public void imprimir(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        Usuario usuario;
        HttpSession objSession = request.getSession(); 
        usuario = (Usuario)(objSession.getAttribute("usuario")); 
        Integer id_seguimiento;
        Integer id_grupo=usuario.getId_grupo();
        Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
        String midseguimiento;   
        midseguimiento = request.getParameter("id_seguimiento");  
        id_seguimiento=Integer.parseInt(midseguimiento);
            
        try 
        {
            cn=conectaMysql.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(ControladorRegistro.class.getName()).log(Level.SEVERE, null, ex);
        }
            
                       
        ServletOutputStream servletOutputStream = response.getOutputStream();
        File reportFile = new File(getServletConfig().getServletContext().getRealPath("/Reportes/adjuntos.jasper"));
            
            
        try
        {
                
            Map param = new HashMap(); //inicializo un objeto HashMap variable,valor
            param.put("sql","where AD.id_seguimiento='"+id_seguimiento+"'");
                    
                
            byte[] bytes = null;
            bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),param, cn);  //el segundo parametro es un hashmap para el paso de parametros al jasperreport
            response.setContentType("application/pdf");
                
            response.setContentLength(bytes.length);
            servletOutputStream.write(bytes, 0, bytes.length);
                
            servletOutputStream.flush();
            servletOutputStream.close();
        }
        catch (JRException e)
        {
            // display stack trace in the browser
            StringWriter stringWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(stringWriter);
            e.printStackTrace(printWriter);
            response.setContentType("text/plain");
            response.getOutputStream().print(stringWriter.toString());
        } 
        
    }*/
    
        public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteBendiv.jasper", param, request, response);
    }
}

