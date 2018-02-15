/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import javax.servlet.annotation.WebServlet;
import Modelo.GestionCaja;
import Modelo.GestionUsuario;
import javabeans.Caja;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.util.Date;
import java.text.SimpleDateFormat;
import javabeans.Usuario;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
/**
 *
 * @author Marlon
 */
@WebServlet(name = "ControladorCaja", urlPatterns = {"/controladorcaja"})
public class ControladorCaja extends ControladorBase{
    
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionCaja modelo = new GestionCaja();
        ArrayList caja = modelo.obtenerTodos();
        request.setAttribute("caja", caja);
        RequestDispatcher rd=request.getRequestDispatcher("listar_cajas.jsp");
        rd.forward(request,response);
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionUsuario modelo = new GestionUsuario();
        ArrayList usuario = modelo.obtenerUsuarios();
        request.setAttribute("usuario", usuario);
        RequestDispatcher rd=request.getRequestDispatcher("frm_caja.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Caja caja = new Caja();
        //se crea el formato
        //se obtiene el parametro de fecha y se guarda en una variable
        String mfecha = request.getParameter("fecha");
        //se le da un formato a la fecha y se almacena en una variable
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        //se hace la conversion de Date -> String
        Date fecha = df.parse(mfecha);
        //se setea
        caja.setFecha(fecha);
        caja.setFolio_inicial(Integer.parseInt(request.getParameter("folio_inicial")));
        caja.setFolio_final(Integer.parseInt(request.getParameter("folio_final")));
        caja.setPoliza(request.getParameter("poliza").toUpperCase());
        //conversion del dato a bigdecimal
        BigDecimal big = new BigDecimal(request.getParameter("monto_inicial"));
        caja.setMonto_inicial(big);
        
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario)(session.getAttribute("usuario"));
        Integer id_usuario = usuario.getId_usuario();
        caja.setId_usuario(id_usuario);
        //caja.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));
        
        GestionCaja modelo = new GestionCaja();
        if(modelo.registroCaja(caja)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorcaja?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
            }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorcaja?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionCaja modelo = new GestionCaja();
        Caja caja = modelo.obtenerPorId(id);
        
        GestionUsuario modeloU = new GestionUsuario();
        ArrayList usuario = modeloU.obtenerUsuarios();
        
        request.setAttribute("usuario", usuario);
        request.setAttribute("caja", caja);
                    
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificacaja.jsp");
        rd.forward(request,response);
    }
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Caja caja = new Caja();
        Integer id_caja = Integer.parseInt(request.getParameter("id_caja"));
        caja.setId_caja(id_caja);
        //se obtiene el parametro de fecha y se guarda en una variable
        String mfecha = request.getParameter("fecha");
        //se le da un formato a la fecha y se almacena en una variable
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        //se hace la conversion de Date -> String
        Date fecha = df.parse(mfecha);
        //se setea
        caja.setFecha(fecha);
        caja.setFolio_inicial(Integer.parseInt(request.getParameter("folio_inicial")));
        caja.setFolio_final(Integer.parseInt(request.getParameter("folio_final")));
        caja.setPoliza(request.getParameter("poliza").toUpperCase());
        //conversion del dato a bigdecimal
        BigDecimal big = new BigDecimal(request.getParameter("monto_inicial"));
        caja.setMonto_inicial(big);
        
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario)(session.getAttribute("usuario"));
        Integer id_usuario = usuario.getId_usuario();
        caja.setId_usuario(id_usuario);
        //caja.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));
        
        GestionCaja modelo = new GestionCaja();
        if(modelo.actualizarCaja(caja)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorcaja?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
            }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorcaja?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionCaja modelo=new GestionCaja();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. El usuario tiene solicitudes registradas.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladorcaja?operacion=listar");
        rd.forward(request,response);
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteCaja.jasper", param, request, response);
    } 
    
    public void grabarfromApp(HttpServletRequest request, HttpServletResponse response) throws Exception    {
        Caja caja = new Caja();
        
        String mfecha = request.getParameter("fecha");
        //se le da un formato a la fecha y se almacena en una variable
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        //se hace la conversion de Date -> String
        Date fecha = df.parse(mfecha);
        //se setea
        caja.setFecha(fecha);
        caja.setFolio_inicial(Integer.parseInt(request.getParameter("folio_inicial")));
        caja.setFolio_final(Integer.parseInt(request.getParameter("folio_final")));
        caja.setPoliza(request.getParameter("poliza").toUpperCase());
        //conversion del dato a bigdecimal
        BigDecimal monto_inicial = new BigDecimal(request.getParameter("monto_inicial"));
        caja.setMonto_inicial(monto_inicial);
        caja.setId_usuario(Integer.parseInt(request.getParameter("id")));
                
        Boolean result=false;
        Boolean valida=false;
        GestionCaja modelo = new GestionCaja();
        if(modelo.obtenerPorId_usuarioFecha(caja)){
            valida=true;
        }
        if (valida==false){
            if(modelo.registroCaja(caja)){
                
                result=true;
                }
            else{
                
                result=false;
            } 
        }
                         
            ArrayList resultado = new ArrayList();
            if (result != null){
                                          
                resultado.add(result);
            }
            
            GsonBuilder builder=new GsonBuilder();
            Gson gson=builder.create();
            
            //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "POST, GET");
            response.setHeader("Content-Type", "application/json; charset=UTF-8");
            response.setHeader("Access-Control-Max-Age", "3600");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Charset");
            response.getWriter().write("{\"cajas\":"+gson.toJson(resultado)+"}");
            
          
    }
    
    public void listarJson(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionCaja modelo=new GestionCaja();
        ArrayList cajas=modelo.obtenerTodos();
        
            
        GsonBuilder builder=new GsonBuilder().setDateFormat("yyyy-MM-dd");
        Gson gson=builder.create();

        //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
        response.getWriter().write("{\"caja\":"+gson.toJson(cajas)+"}");
    }
    
    public void editarGuardarfromApp(HttpServletRequest request, HttpServletResponse response) throws Exception    {
        Caja caja = new Caja();
        caja.setId_caja(Integer.parseInt(request.getParameter("id_caja")));
        String mfecha = request.getParameter("fecha");
        //se le da un formato a la fecha y se almacena en una variable
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        //se hace la conversion de Date -> String
        Date fecha = df.parse(mfecha);
        //se setea
        caja.setFecha(fecha);
        caja.setFolio_inicial(Integer.parseInt(request.getParameter("folio_inicial")));
        caja.setFolio_final(Integer.parseInt(request.getParameter("folio_final")));
        caja.setPoliza(request.getParameter("poliza").toUpperCase());
        //conversion del dato a bigdecimal
        BigDecimal monto_inicial = new BigDecimal(request.getParameter("monto_inicial"));
        caja.setMonto_inicial(monto_inicial);
        caja.setId_usuario(Integer.parseInt(request.getParameter("id")));
        
        Boolean result;
        GestionCaja modelo = new GestionCaja();
        if(modelo.actualizarCaja(caja)){
            
            result=true;
            }
        else{
            
            result=false;
        } 
            
                         
            ArrayList resultado = new ArrayList();
            if (result != null){
                                          
                resultado.add(result);
            }
            
            GsonBuilder builder=new GsonBuilder();
            Gson gson=builder.create();
            
            //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "POST, GET");
            response.setHeader("Content-Type", "application/json; charset=UTF-8");
            response.setHeader("Access-Control-Max-Age", "3600");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Charset");
            response.getWriter().write("{\"cajas\":"+gson.toJson(resultado)+"}");
            
          
    }
    
}
