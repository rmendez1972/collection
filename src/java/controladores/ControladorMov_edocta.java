/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionBeneficiario;
import Modelo.GestionBonificacion;
import Modelo.GestionClavemov;
import Modelo.GestionMovBonific;
import Modelo.GestionMov_edocta;

import Modelo.GestionProgramas;
import Modelo.GestionTipocredito;
import Modelo.Gestionvencidos;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
import java.util.Iterator;
import java.util.Map;
import javabeans.Beneficiario;
import javabeans.Candidatos;
import javabeans.CatProgramas;
import javabeans.Mov_edocta;
import javabeans.ParametrosApertura;
import javabeans.Usuario;
import javabeans.Bonificacion;
import javabeans.MovBonific;
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
@WebServlet(name = "ControladorMov_edocta", urlPatterns = {"/controladormov_edocta"})
public class ControladorMov_edocta extends ControladorBase 
{ 
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionMov_edocta modelo=new GestionMov_edocta();
        ArrayList movimientos=modelo.obtenerMovimientos();
        request.setAttribute("movimientos", movimientos);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_mov_edoscta.jsp");
        rd.forward(request,response);
    }
    
 //listar Json Movimientos
    public void listarJsonbyMovimientos(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        
        String valorcriterio = request.getParameter("valorcriterio");
        
        GestionBeneficiario gbenef = new GestionBeneficiario();
        Beneficiario benef = gbenef.obtenerGenerico(valorcriterio);
                
        Integer id_benef = benef.getId_beneficiario();
        
        GestionMov_edocta modelo=new GestionMov_edocta();
        ArrayList movimientos=modelo.obtenerMovimientosPorBenefId(id_benef);
        
        
        GsonBuilder builder=new GsonBuilder().setDateFormat("yyyy-MM-dd");
        Gson gson=builder.create();
            
        //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
        response.getWriter().write("{\"mov_edoscta\":"+gson.toJson(movimientos)+"}");
    }
    
   /* public void listarporidJson(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionMov_edocta modelo = new GestionMov_edocta();
        ArrayList edocta = modelo.obtenerPorClave();
        
        GsonBuilder builder=new GsonBuilder();
        Gson gson=builder.create();
        
        //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
        response.getWriter().write("{\"mov_edoscta\":"+gson.toJson(edocta)+"}");
    
    }*/
    
    public void listarPorBenefId(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        
        GestionMov_edocta modelo=new GestionMov_edocta();
        ArrayList movimientos=modelo.obtenerMovimientosPorBenefId(id);
        
        request.setAttribute("movimientos", movimientos);
       
        RequestDispatcher rd=request.getRequestDispatcher("listar_mov_edoscta.jsp");
        rd.forward(request,response);
    }
    
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionMov_edocta modelo=new GestionMov_edocta();
        
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. Este Movimiento cuenta con bonificación.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladormov_edocta?operacion=listar");
        rd.forward(request,response);
    }
    
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionMov_edocta modelo=new GestionMov_edocta();
        Mov_edocta movimiento=modelo.obtenerPorId(id);
        int id_benef=movimiento.getId_benef();
        GestionBeneficiario modelo_ben= new GestionBeneficiario();
        ArrayList beneficiarios=modelo_ben.obtenerBeneficiarios();
        GestionClavemov modelo_clavemov= new GestionClavemov();
        ArrayList clavemovs=modelo_clavemov.obtenerTodos();
        
        request.setAttribute("movimiento", movimiento);
        request.setAttribute("beneficiarios", beneficiarios);
        request.setAttribute("clavemovs", clavemovs);
                    
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificamov_edocta.jsp");
        rd.forward(request,response);
    }
    
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Mov_edocta movimiento=new Mov_edocta();
        Integer id_movedoscta=Integer.parseInt(request.getParameter("id_movedoscta"));
        movimiento.setId_movedoscta(id_movedoscta);
        Integer id_benef=Integer.parseInt(request.getParameter("id_benef"));
        movimiento.setId_benef(id_benef);
        String clave_b=request.getParameter("clave_b").toUpperCase();
        movimiento.setClave_b(clave_b);
        String clave_mov=request.getParameter("clave_mov").toUpperCase();
        movimiento.setClave_mov(clave_mov);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha_mov = df.parse(request.getParameter("fecha_mov"));
        movimiento.setFecha_mov(fecha_mov);
        String poliza=request.getParameter("poliza").toUpperCase();
        movimiento.setPoliza(poliza);
        
        BigDecimal capital = new BigDecimal(request.getParameter("capital"));
        movimiento.setCapital(capital);
        BigDecimal admon = new BigDecimal(request.getParameter("admon"));
        movimiento.setAdmon(admon);
        BigDecimal seguro = new BigDecimal(request.getParameter("seguro"));
        movimiento.setSeguro(seguro);
        BigDecimal o_seguro = new BigDecimal(request.getParameter("o_seguro"));
        movimiento.setO_seguro(o_seguro);
        BigDecimal comisiones = new BigDecimal(request.getParameter("comisiones"));
        movimiento.setComisiones(comisiones);
        BigDecimal tit = new BigDecimal(request.getParameter("tit"));
        movimiento.setTit(tit);
        BigDecimal interes = new BigDecimal(request.getParameter("interes"));
        movimiento.setInteres(interes);
        BigDecimal moratorios = new BigDecimal(request.getParameter("moratorios"));
        movimiento.setMoratorios(moratorios);
        Integer recibo=Integer.parseInt(request.getParameter("recibo"));
        movimiento.setRecibo(recibo);
        String status=request.getParameter("estatus").toUpperCase();
        movimiento.setStatus(status);
        String serie=request.getParameter("serie").toUpperCase();
        movimiento.setSerie(serie);
        
        HttpSession objSession = request.getSession(); 
        Usuario usuario = (Usuario)(objSession.getAttribute("usuario")); 
        Integer id_usuario=usuario.getId_usuario();
        movimiento.setId_usuario(id_usuario);
        
        GestionMov_edocta modelo=new GestionMov_edocta();
        if(modelo.actualizarMov_edocta(movimiento)){
            RequestDispatcher rd=request.getRequestDispatcher("controladormov_edocta?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladormov_edocta?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionMov_edocta modelo=new GestionMov_edocta();
        GestionBeneficiario modelo_ben= new GestionBeneficiario();
        ArrayList beneficiarios=modelo_ben.obtenerBeneficiarios();
        GestionClavemov modelo_clavemov= new GestionClavemov();
        ArrayList clavemovs=modelo_clavemov.obtenerTodos();
        GestionProgramas modelo_prog= new GestionProgramas();
        ArrayList progs=modelo_prog.obtenerTodos();
                
        request.setAttribute("beneficiarios", beneficiarios);
        request.setAttribute("clavemovs", clavemovs);
        request.setAttribute("progs", progs);
        
        
        RequestDispatcher rd=request.getRequestDispatcher("frm_mov_edocta.jsp");
        rd.forward(request,response);
    }
    /*ismael
    /* Método para aplicar_las letras a cubrir por un beneficiario
    /* Este método es consumido desde la app cobranza
    */
    public void aplica_Movedocta_app(HttpServletRequest request, HttpServletResponse response) throws Exception{
        response.setContentType("text/html;charset=UTF-8");
        String lista="";
        
        PrintWriter out = response.getWriter();
        try {
                Gestionvencidos vencidos = new Gestionvencidos();
                //acceder al metodo buscaPaises
                
                String clave_b = request.getParameter("clave_b");
                SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
                Date fecha_corte=sdf.parse(request.getParameter("fecha_corte"));
                
                ArrayList fechas = vencidos.localizaFechasparaJson (clave_b,fecha_corte);
                ArrayList jurs = vencidos.localizaMovJurparaJson (clave_b);
                ArrayList movss = vencidos.localizaMovCanparaJson (clave_b);
                //ArrayList vencidoss = vencidos.listarvencidosparaJson(clave_b);
                ArrayList vencidoss = null;
                response.setHeader("Access-Control-Allow-Origin", "*");
                response.setHeader("Access-Control-Allow-Methods", "POST, GET");
                response.setHeader("Access-Control-Max-Age", "3600");
                response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

                
          if ((movss !=null) && (movss.size() != 0))
          {    
                    lista = "\"" + "vencidos" + "\":" + "[";
                    for (int x = 0; x < movss.size(); x=x+10) 
                    {
                        lista += "{" + "\"" + "fecha" + "\"" + ":" + " \"" + movss.get(x) + "\""+ ","+ "\"" + "letra" + "\"" + ":" + " \"" + movss.get(x+1) + " \"" + "," +"\"" + "capital" + "\"" + ":" + " \"" + movss.get(x+2)+ " \""+ "," +"\"" + "interes" + "\"" + ":" + " \""  + movss.get(x+3) + " \""+ "," +"\"" + "seguro" + "\"" + ":" + " \""  + movss.get(x+4) + " \""+ "," +"\"" + "admon" + "\"" + ":" + " \""  + movss.get(x+5) + " \""+ "," +"\"" + "oseg" + "\"" + ":" + " \""  + movss.get(x+6) + " \""+ "," +"\"" + "com" + "\"" + ":" + " \""  + movss.get(x+7) + " \""+ "," +"\"" + "tit" + "\"" + ":" + " \""  + movss.get(x+8) + " \""+ "," +"\"" + "mor" + "\"" + ":" + " \""  + movss.get(x+9) + " \""  + "}" + ",";
                        //formar la cadena en formato JSON para enviarlo a la vista con jquery
                    }
                    //quitar la ultima coma para parsear la cadena JSON
                    lista = lista.substring(0, lista.length() - 1);
                    
          }
          else
          {
             if ((jurs !=null) && (jurs.size() != 0))
             {    
                    lista = "\"" + "vencidos" + "\":" + "[";
                    for (int x = 0; x < jurs.size(); x=x+10) 
                    {
                        lista += "{" + "\"" + "fecha" + "\"" + ":" + " \"" + jurs.get(x) + "\""+ ","+ "\"" + "letra" + "\"" + ":" + " \"" + jurs.get(x+1) + " \"" + "," +"\"" + "capital" + "\"" + ":" + " \"" + jurs.get(x+2)+ " \""+ "," +"\"" + "interes" + "\"" + ":" + " \""  + jurs.get(x+3) + " \""+ "," +"\"" + "seguro" + "\"" + ":" + " \""  + jurs.get(x+4) + " \""+ "," +"\"" + "admon" + "\"" + ":" + " \""  + jurs.get(x+5) + " \""+ "," +"\"" + "oseg" + "\"" + ":" + " \""  + jurs.get(x+6) + " \""+ "," +"\"" + "com" + "\"" + ":" + " \""  + jurs.get(x+7) + " \""+ "," +"\"" + "tit" + "\"" + ":" + " \""  + jurs.get(x+8) + " \""+ "," +"\"" + "mor" + "\"" + ":" + " \""  + jurs.get(x+9) + " \""  + "}" + ",";
                        //formar la cadena en formato JSON para enviarlo a la vista con jquery
                    }
                    //quitar la ultima coma para parsear la cadena JSON
                    lista = lista.substring(0, lista.length() - 1);
                    
             }
             else
             {    
                if ((fechas !=null) && (fechas.size() != 0))
                {    
                    lista = "\"" + "vencidos" + "\":" + "[";
                    for (int x = 0; x < fechas.size(); x=x+10) 
                    {
                        lista += "{" + "\"" + "fecha" + "\"" + ":" + " \"" + fechas.get(x) + "\""+ ","+ "\"" + "letra" + "\"" + ":" + " \"" + fechas.get(x+1) + " \"" + "," +"\"" + "capital" + "\"" + ":" + " \"" + fechas.get(x+2)+ " \""+ "," +"\"" + "interes" + "\"" + ":" + " \""  + fechas.get(x+3) + " \""+ "," +"\"" + "seguro" + "\"" + ":" + " \""  + fechas.get(x+4) + " \""+ "," +"\"" + "admon" + "\"" + ":" + " \""  + fechas.get(x+5) + " \""+ "," +"\"" + "oseg" + "\"" + ":" + " \""  + fechas.get(x+6) + " \""+ "," +"\"" + "com" + "\"" + ":" + " \""  + fechas.get(x+7) + " \""+ "," +"\"" + "tit" + "\"" + ":" + " \""  + fechas.get(x+8) + " \""+ "," +"\"" + "mor" + "\"" + ":" + " \""  + fechas.get(x+9) + " \""  + "}" + ",";
                        //formar la cadena en formato JSON para enviarlo a la vista con jquery
                    }
                    //quitar la ultima coma para parsear la cadena JSON
                    lista = lista.substring(0, lista.length() - 1);
                    
                }
                else 
                {
                    if (vencidoss.size() != 0) 
                    {
                        lista = "\"" + "vencidos" + "\":" + "[";
                            for (int x = 0; x < vencidoss.size(); x=x+3) 
                            {
                                lista += "{" + "\"" + "capital" + "\"" + ":" + vencidoss.get(x).toString() + "," +"\"" + "interes" + "\"" + ":" + " \"" + vencidoss.get(x+1)+ " \""+ "," +"\"" + "admon" + "\"" + ":" + " \""  + vencidoss.get(x+2)+ " \""  + "}" + ",";
                                //formar la cadena en formato JSON para enviarlo a la vista con jquery
                            }
                            //quitar la ultima coma para parsear la cadena JSON
                            lista = lista.substring(0, lista.length() - 1);
                    } else 
                    {
                        out.println("No se logro obtener datos");
                    }
                }
             }
           }
            }    
               
            
            finally 
            { 
                    out.println("{" + lista + "]}");
                    System.out.println("{" + lista + "]}");
                    out.close();
            }
}
    
    
    
    /*
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

