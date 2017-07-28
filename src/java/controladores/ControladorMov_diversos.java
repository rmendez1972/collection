/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

//import Modelo.GestionBeneficiario;
import Modelo.GestionBendiv;
import Modelo.GestionMov_diversos;
import Modelo.GestionClaveDiversos;
import Modelo.GestionEmisor;

import Modelo.GestionProgramas;
import Modelo.GestionTipocredito;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
//import javabeans.Beneficiario;
import javabeans.BeneficiarioDiv;
import javabeans.Candidatos;
import javabeans.CatProgramas;
import javabeans.MovDiversos;
import javabeans.ParametrosApertura;
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
 * @author Rafael Mendez
 */
@WebServlet(name = "ControladorMov_diversos", urlPatterns = {"/controladormov_diversos"})
public class ControladorMov_diversos extends ControladorBase 
{ 
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionMov_diversos modelo=new GestionMov_diversos();
        ArrayList movimientos=modelo.obtenerMovimientos();
        request.setAttribute("movimientos", movimientos);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_mov_diversos.jsp");
        rd.forward(request,response);
    }
    
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionMov_diversos modelo=new GestionMov_diversos();
        
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. Este Movimiento cuenta con bonificación.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladormov_diversos?operacion=listar");
        rd.forward(request,response);
    }
    
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        //Obteniendo el registro del movimiento diverso a editar
        int id=Integer.parseInt(request.getParameter("id"));
        GestionMov_diversos modelo=new GestionMov_diversos();        
        MovDiversos movimiento=modelo.obtenerPorId(id);
        
        //int id_bendiv=movimiento.getId_bendiv();
        //Obteniendo el catalogo de beneficiarios diversos
        GestionBendiv modelo_benDiv= new GestionBendiv();
        ArrayList beneficiarios=modelo_benDiv.obtenerTodos();
        
        //Obteniendo el catalogo de movimientos diversos
        GestionClaveDiversos modelo_claveDiv= new GestionClaveDiversos();
        ArrayList clavediv=modelo_claveDiv.obtenerTodos();
        
        //Obteniendo el catalogo de programas
        GestionProgramas modelo_programas= new GestionProgramas();
        ArrayList programas=modelo_programas.obtenerTodos();
        
        //Obteniendo el catalogo de emisores
        GestionEmisor modelo_emisores= new GestionEmisor();
        ArrayList emisores=modelo_emisores.obtenerTodos();
        
        request.setAttribute("movimiento", movimiento);
        request.setAttribute("beneficiarios", beneficiarios);
        request.setAttribute("clavediv", clavediv);
        request.setAttribute("programas", programas);
        request.setAttribute("emisores", emisores);
                    
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificamov_diversos.jsp");
        rd.forward(request,response);
    }
    
  
   
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        MovDiversos movimiento=new MovDiversos();
        
        Integer id_movdiversos=Integer.parseInt(request.getParameter("id_movdiversos"));
        movimiento.setId_movdiversos(id_movdiversos);
        Integer id_bendiv=Integer.parseInt(request.getParameter("id_bendiv"));
        movimiento.setId_bendiv(id_bendiv);
        String clave_div=request.getParameter("clave_div").toUpperCase();
        movimiento.setClave_div(clave_div);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha_div = df.parse(request.getParameter("fecha_div"));
        movimiento.setFecha_div(fecha_div);
        String poliza=request.getParameter("poliza").toUpperCase();
        movimiento.setPoliza(poliza);
        Integer recibo=Integer.parseInt(request.getParameter("recibo"));
        movimiento.setRecibo(recibo);
        
        BigDecimal cargo = new BigDecimal(request.getParameter("cargo"));
        movimiento.setCargo(cargo);
        BigDecimal abono = new BigDecimal(request.getParameter("abono"));
        movimiento.setAbono(abono);
        BigDecimal moratorios = new BigDecimal(request.getParameter("moratorios"));
        movimiento.setMoratorios(moratorios);
        BigDecimal otros = new BigDecimal(request.getParameter("otros"));
        movimiento.setOtros(otros);
        Date fecha_pol = df.parse(request.getParameter("fecha_pol"));
        movimiento.setFecha_pol(fecha_pol);
        String estatus=request.getParameter("estatus").toUpperCase();
        movimiento.setEstatus(estatus);
        
        String valAplicado = request.getParameter("aplicado");
        Boolean aplicado = Boolean.parseBoolean(valAplicado);
        movimiento.setAplicado(aplicado);
              
        String descripcion=request.getParameter("descripcion").toUpperCase();
        movimiento.setDescripcion(descripcion);
        Integer id_catprog=Integer.parseInt(request.getParameter("id_catprog"));
        movimiento.setId_catprog(id_catprog);
        BigDecimal bonificacion = new BigDecimal(request.getParameter("bonificacion"));
        movimiento.setBonificacion(bonificacion);
        String serie=request.getParameter("serie").toUpperCase();
        movimiento.setSerie(serie);
        String poliza_apli=request.getParameter("poliza_apli").toUpperCase();
        movimiento.setPoliza_apli(poliza_apli);
        Date fecha_apli = df.parse(request.getParameter("fecha_apli"));
        movimiento.setFecha_apli(fecha_apli);
        BigDecimal interes = new BigDecimal(request.getParameter("interes"));
        movimiento.setInteres(interes);
        BigDecimal seguro = new BigDecimal(request.getParameter("seguro"));
        movimiento.setSeguro(seguro);
        Integer id_emisor=Integer.parseInt(request.getParameter("id_emisor"));
        movimiento.setId_emisor(id_emisor);
        String clave_b=request.getParameter("clave_b").toUpperCase();
        movimiento.setClave_b(clave_b);
        String numcontrato=request.getParameter("numcontrato").toUpperCase();
        movimiento.setNumcontrato(numcontrato);

        String valBonific = request.getParameter("bonific");
        Boolean bonific = Boolean.parseBoolean(valBonific);
        movimiento.setBonific(bonific);
        

        
        Integer id_caja=Integer.parseInt(request.getParameter("id_caja"));
        movimiento.setId_caja(id_caja);
        
        HttpSession objSession = request.getSession(); 
        Usuario usuario = (Usuario)(objSession.getAttribute("usuario")); 
        Integer id_usuario=usuario.getId_usuario();
        movimiento.setId_usuario(id_usuario);
        
        GestionMov_diversos modelo=new GestionMov_diversos();
        if(modelo.actualizarMov_diversos(movimiento)){
            RequestDispatcher rd=request.getRequestDispatcher("controladormov_diversos?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladormov_diversos?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
/*     
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionProgramas mod_prog=new GestionProgramas();
        GestionTipocredito mod_tcr=new GestionTipocredito();
        ArrayList prog=mod_prog.obtenerTodos();
        ArrayList tipo=mod_tcr.obtenerTodos();
        
        request.setAttribute("prog", prog);
        request.setAttribute("tipo", tipo);
        RequestDispatcher rd=request.getRequestDispatcher("frm_candidato.jsp");
        rd.forward(request,response);
    }
  
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Candidatos candidato=new Candidatos();
        Integer id_catprog=Integer.parseInt(request.getParameter("id_catprog"));
        candidato.setId_catprog(id_catprog);
        String num_contrato=request.getParameter("numcontrato");
        candidato.setNumcontrato(num_contrato);
        String clave_elect=request.getParameter("clave_elect").toUpperCase();
        candidato.setClave_elect(clave_elect);
        String curp=request.getParameter("curp").toUpperCase();
        candidato.setCurp(curp);
        String rfc=request.getParameter("rfc").toUpperCase();
        candidato.setRfc(rfc);
        String nombre=request.getParameter("nombre").toUpperCase();
        candidato.setNombre(nombre);
        String conyuge=request.getParameter("conyuge").toUpperCase();
        candidato.setConyuge(conyuge);
               
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha_con = df.parse(request.getParameter("fecha_con"));
        candidato.setFecha_con(fecha_con);
        String mza=request.getParameter("mza").toUpperCase();
        candidato.setMza(mza);
        String lte=request.getParameter("lte").toUpperCase();
        candidato.setLte(lte);
        BigDecimal area = new BigDecimal(request.getParameter("area"));
        candidato.setArea(area);
        String domicilio=request.getParameter("domicilio").toUpperCase();
        candidato.setDomicilio(domicilio);
        String clave_cat=request.getParameter("clave_cat").toUpperCase();
        candidato.setClave_cat(clave_cat);
        Integer id_tipocredito=Integer.parseInt(request.getParameter("id_tipocredito"));
        candidato.setId_tipocredito(id_tipocredito);   
        candidato.setId_usuario(1);
        GestionCandidatos modelo=new GestionCandidatos();
        if(modelo.registroCandidatos(candidato)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorcandidato?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorcandidato?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
*/   
    /*
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteCpp.jasper", param, request, response);
    } */
}
