/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionAutoriza;

import Modelo.GestionBeneficiario;

import Modelo.GestionBendiv;

import Modelo.GestionBonificacion;
import Modelo.GestionMovBonific;
import Modelo.GestionMov_diversos;
import Modelo.GestionMov_edocta;
import Modelo.GestionProgramas;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javabeans.Beneficiario;

import javabeans.BeneficiarioDiv;

import javabeans.Bonificacion;
import javabeans.CatProgramas;
import javabeans.MovBonific;
import javabeans.MovDiversos;
import javabeans.Mov_edocta;
import javabeans.Usuario;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Marlon
 */
@WebServlet(name = "ControladorMovBonific", urlPatterns = {"/controladormovbonific"})
public class ControladorMovBonific extends ControladorBase{
    
    public void listarbonific(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id;
        
        if(request.getParameter("id") != null || request.getAttribute("id") != null){
            if(request.getAttribute("id")!=null){
                id = Integer.parseInt((String)request.getAttribute("id"));

            }else{
                id=Integer.parseInt(request.getParameter("id"));
            }

            GestionMovBonific modelo = new GestionMovBonific();
            ArrayList movbonific = modelo.obtenerPorId(id);
            //iterador para iterar sobre el arreglo de movbonific para sacar el valor de id_bonificacion
            Iterator<MovBonific> it = movbonific.iterator();
            MovBonific bonific = new MovBonific();
            while(it.hasNext()){
                bonific = it.next();
            }       
            Integer id_bonificacion = bonific.getId_bonificacion();

            request.setAttribute("movbonific", movbonific);
            request.setAttribute("id", id);
            request.setAttribute("id_bonificacion", id_bonificacion);
            
        }else if(request.getParameter("iddiv") != null || request.getAttribute("iddiv") != null){
            
            if(request.getAttribute("iddiv")!=null){
               id = Integer.parseInt((String)request.getAttribute("iddiv"));
            }else{
               id = Integer.parseInt(request.getParameter("iddiv")); 
            }
            
            GestionMovBonific modelo = new GestionMovBonific();
            ArrayList movbonific = modelo.obtenerPorIdDiv(id);
            //iterador para iterar sobre el arreglo de movbonific para sacar el valor de id_bonificacion
            Iterator<MovBonific> it = movbonific.iterator();
            MovBonific bonific = new MovBonific();
            while(it.hasNext()){
                bonific = it.next();
            }       
            Integer id_bonificacion = bonific.getId_bonificacion();
            
            request.setAttribute("movbonific", movbonific);
            request.setAttribute("iddiv", id);
            request.setAttribute("id_bonificacion", id_bonificacion);
            
        }
         RequestDispatcher rd=request.getRequestDispatcher("listar_mov_bonific.jsp");
         rd.forward(request,response);
                
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        if(request.getParameter("id") != null){
            int id=Integer.parseInt(request.getParameter("id"));
            //buscamos los datos en movimientos estado de cuenta
            GestionMov_edocta mod_edocta = new GestionMov_edocta();
            Mov_edocta edocta = mod_edocta.obtenerPorId(id);
            //buscando el catalogo de bonificaciones
            GestionBonificacion mod_bonificacion = new GestionBonificacion();
            ArrayList bonificacion = mod_bonificacion.obtenerTodos();
            //buscamos en el modelo si existe el movedocta en la tabla bonific
            GestionMovBonific mod_movBonific = new GestionMovBonific();
            MovBonific idmovbon = mod_movBonific.obtenerPorIdEdit(id);
            //buscando el catalogo de programmas
            GestionProgramas mod_programas = new GestionProgramas();
            ArrayList catprogramas = mod_programas.obtenerTodos();
            //buscando el catalogo de autoriza
            GestionAutoriza mod_autoriza = new GestionAutoriza();
            ArrayList autoriza = mod_autoriza.obtenerTodos();


            if(idmovbon==null){
                request.setAttribute("edocta", edocta);
                request.setAttribute("bonificacion", bonificacion);
                request.setAttribute("cp", catprogramas);
                request.setAttribute("aut", autoriza);
                request.setAttribute("id", id);
                

                RequestDispatcher rd=request.getRequestDispatcher("frm_mov_bonific.jsp");
                rd.forward(request,response);
            }else{

                request.setAttribute("msg", "No se puede agregar porque ya existe una bonificación para este movimiento del estado de cuenta");
                RequestDispatcher rd=request.getRequestDispatcher("controladormov_edocta?operacion=listar");
                rd.forward(request,response);
            }
        }else if(request.getParameter("iddiv") != null){
            int iddiv=Integer.parseInt(request.getParameter("iddiv"));
            
            //buscamos los datos en movimientos diversos
            GestionMov_diversos mod_diversos = new GestionMov_diversos();
            MovDiversos movdiversos = mod_diversos.obtenerPorId(iddiv);
            //buscando el catalogo de bonificaciones
            GestionBonificacion mod_bonificacion = new GestionBonificacion();
            ArrayList bonificacion = mod_bonificacion.obtenerTodos();
            //buscamos en el modelo si existe el movedocta en la tabla bonific
            GestionMovBonific mod_movBonific = new GestionMovBonific();
            MovBonific idmovbon = mod_movBonific.obtenerPorIddivEdit(iddiv);
            //buscando el catalogo de programmas
            GestionProgramas mod_programas = new GestionProgramas();
            ArrayList catprogramas = mod_programas.obtenerTodos();
            //buscando el catalogo de autoriza
            GestionAutoriza mod_autoriza = new GestionAutoriza();
            ArrayList autoriza = mod_autoriza.obtenerTodos();
            
            if(idmovbon==null){
                request.setAttribute("movdiv", movdiversos);
                request.setAttribute("bonificacion", bonificacion);
                request.setAttribute("cp", catprogramas);
                request.setAttribute("aut", autoriza);
                request.setAttribute("iddiv", iddiv);

                RequestDispatcher rd=request.getRequestDispatcher("frm_mov_bonific.jsp");
                rd.forward(request,response);
            }else{

                request.setAttribute("msg", "No se puede agregar porque ya existe una bonificación para este movimiento del estado de cuenta");
                RequestDispatcher rd=request.getRequestDispatcher("controladormov_diversos?operacion=listar");
                rd.forward(request,response);
            }   
        }  
    }
    
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        if(request.getParameter("id_movedoscta") != null){
            
            MovBonific bon = new MovBonific();
        
            Integer id_movedoscta = Integer.parseInt(request.getParameter("id_movedoscta"));
            bon.setId_movedoscta(id_movedoscta);

            Integer id_benef = Integer.parseInt(request.getParameter("id_benef"));
            bon.setId_benef(id_benef);

            BigDecimal imp_cap = new BigDecimal(request.getParameter("imp_cap"));
            bon.setImp_cap(imp_cap);

            BigDecimal imp_int = new BigDecimal(request.getParameter("imp_int"));
            bon.setImp_int(imp_int);

            BigDecimal imp_adm = new BigDecimal(request.getParameter("imp_adm"));
            bon.setImp_adm(imp_adm);

            BigDecimal imp_seg = new BigDecimal(request.getParameter("imp_seg"));
            bon.setImp_seg(imp_seg);

            BigDecimal imp_osg = new BigDecimal(request.getParameter("imp_osg"));
            bon.setImp_osg(imp_osg);

            Integer id_catbonific = Integer.parseInt(request.getParameter("id_catbonific"));
            bon.setId_catbonific(id_catbonific);

            bon.setEstatus(request.getParameter("estatus").toUpperCase());

            HttpSession session = request.getSession();
            Usuario usuario = (Usuario)(session.getAttribute("usuario"));
            Integer id_usuario = usuario.getId_usuario();
            bon.setId_usuario(id_usuario);

            bon.setClave_b(request.getParameter("clave_b"));

            Integer recibo = Integer.parseInt(request.getParameter("recibo"));
            bon.setRecibo(recibo);

            bon.setSerie(request.getParameter("serie").toUpperCase());

            bon.setNumcontrato(request.getParameter("numcontrato"));

            Integer id_catprog = Integer.parseInt(request.getParameter("id_catprog"));
            bon.setId_catprog(id_catprog);

            Integer id_autoriza = Integer.parseInt(request.getParameter("id_autoriza"));
            bon.setId_autoriza(id_autoriza);

            GestionMovBonific modelo = new GestionMovBonific();

            if(modelo.registroMovBonific(bon)){
                GestionMov_edocta mod_edocta = new GestionMov_edocta();
                mod_edocta.cambiarBonificTrue(id_movedoscta);

                String mid_movedoscta = id_movedoscta.toString();

                RequestDispatcher rd=request.getRequestDispatcher("controladormovbonific?operacion=listarbonific");
                request.setAttribute("msg", "Datos guardados");
                request.setAttribute("id", mid_movedoscta);
                rd.forward(request,response);
                }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("controladormovbonific?operacion=nuevo");
                request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
                rd.forward(request,response);
            }
        }else if (request.getParameter("id_movdiversos") != null){
            
            MovBonific bon = new MovBonific();
        
            Integer id_movdiversos = Integer.parseInt(request.getParameter("id_movdiversos"));
            bon.setId_movdiversos(id_movdiversos);

            Integer id_benef = Integer.parseInt(request.getParameter("id_benef"));
            bon.setId_benef(id_benef);

            BigDecimal imp_cap = new BigDecimal(request.getParameter("imp_cap"));
            bon.setImp_cap(imp_cap);

            BigDecimal imp_int = new BigDecimal(request.getParameter("imp_int"));
            bon.setImp_int(imp_int);

            BigDecimal imp_adm = new BigDecimal(request.getParameter("imp_adm"));
            bon.setImp_adm(imp_adm);

            BigDecimal imp_seg = new BigDecimal(request.getParameter("imp_seg"));
            bon.setImp_seg(imp_seg);

            BigDecimal imp_osg = new BigDecimal(request.getParameter("imp_osg"));
            bon.setImp_osg(imp_osg);

            Integer id_catbonific = Integer.parseInt(request.getParameter("id_catbonific"));
            bon.setId_catbonific(id_catbonific);

            bon.setEstatus(request.getParameter("estatus").toUpperCase());

            HttpSession session = request.getSession();
            Usuario usuario = (Usuario)(session.getAttribute("usuario"));
            Integer id_usuario = usuario.getId_usuario();
            bon.setId_usuario(id_usuario);

            bon.setClave_b(request.getParameter("clave_b"));

            Integer recibo = Integer.parseInt(request.getParameter("recibo"));
            bon.setRecibo(recibo);

            bon.setSerie(request.getParameter("serie").toUpperCase());

            bon.setNumcontrato(request.getParameter("numcontrato"));

            Integer id_catprog = Integer.parseInt(request.getParameter("id_catprog"));
            bon.setId_catprog(id_catprog);

            Integer id_autoriza = Integer.parseInt(request.getParameter("id_autoriza"));
            bon.setId_autoriza(id_autoriza);

            GestionMovBonific modelo = new GestionMovBonific();

            if(modelo.registroMovBonificDiv(bon)){
                
                GestionMov_diversos mod_diversos = new GestionMov_diversos();
                mod_diversos.cambiarBonificTrue(id_movdiversos);
                
                String mid_movdiversos = id_movdiversos.toString();

                RequestDispatcher rd=request.getRequestDispatcher("controladormovbonific?operacion=listarbonific");
                request.setAttribute("msg", "Datos guardados");
                request.setAttribute("iddiv", mid_movdiversos);
                rd.forward(request,response);
                }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("controladormovbonific?operacion=nuevo");
                request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
                rd.forward(request,response);
            }
        }
        
        
    }
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        if(request.getParameter("id") != null){
            int id=Integer.parseInt(request.getParameter("id"));

            GestionMov_edocta mod_edocta = new GestionMov_edocta();
            Mov_edocta edocta = mod_edocta.obtenerPorId(id);

            GestionBonificacion mod_bonificacion = new GestionBonificacion();
            ArrayList bonificacion = mod_bonificacion.obtenerTodos();

            GestionMovBonific mod_movbonific = new GestionMovBonific();
            MovBonific bon = mod_movbonific.obtenerPorIdEdit(id);

            //buscando el catalogo de programmas
            GestionProgramas mod_programas = new GestionProgramas();
            ArrayList catprogramas = mod_programas.obtenerTodos();
            //buscando el catalogo de autoriza
            GestionAutoriza mod_autoriza = new GestionAutoriza();
            ArrayList autoriza = mod_autoriza.obtenerTodos();


            request.setAttribute("bon", bon);
            request.setAttribute("edocta", edocta);
            request.setAttribute("bonificacion", bonificacion);
            request.setAttribute("cp", catprogramas);
            request.setAttribute("aut", autoriza);
            request.setAttribute("id", id);

            RequestDispatcher rd=request.getRequestDispatcher("frm_modifica_movbonific.jsp");
            rd.forward(request,response);    
        
        }else if(request.getParameter("iddiv") != null){
            int iddiv=Integer.parseInt(request.getParameter("iddiv"));
            
            //buscamos los datos en movimientos diversos
            GestionMov_diversos mod_diversos = new GestionMov_diversos();
            MovDiversos movdiversos = mod_diversos.obtenerPorId(iddiv);
            //buscando el catalogo de bonificaciones
            GestionBonificacion mod_bonificacion = new GestionBonificacion();
            ArrayList bonificacion = mod_bonificacion.obtenerTodos();
            //buscamos en el modelo el mov diversos para editarlo
            GestionMovBonific mod_movBonific = new GestionMovBonific();
            MovBonific bon = mod_movBonific.obtenerPorIddivEdit(iddiv);
            //buscando el catalogo de programmas
            GestionProgramas mod_programas = new GestionProgramas();
            ArrayList catprogramas = mod_programas.obtenerTodos();
            //buscando el catalogo de autoriza
            GestionAutoriza mod_autoriza = new GestionAutoriza();
            ArrayList autoriza = mod_autoriza.obtenerTodos();
            
            request.setAttribute("bon", bon);
            request.setAttribute("movdiversos", movdiversos);
            request.setAttribute("bonificacion", bonificacion);
            request.setAttribute("cp", catprogramas);
            request.setAttribute("aut", autoriza);
            request.setAttribute("iddiv", iddiv);
            
            RequestDispatcher rd=request.getRequestDispatcher("frm_modifica_movbonific.jsp");
            rd.forward(request,response); 
            
            
        }
        
        
    
    }
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        if(request.getParameter("id_movedoscta") != null){
            
            MovBonific bon = new MovBonific();

            Integer id_bonificacion = Integer.parseInt(request.getParameter("id_bonificacion"));
            bon.setId_bonificacion(id_bonificacion);

            Integer id_movedoscta = Integer.parseInt(request.getParameter("id_movedoscta"));
            bon.setId_movedoscta(id_movedoscta);

            Integer id_benef = Integer.parseInt(request.getParameter("id_benef"));
            bon.setId_benef(id_benef);

            BigDecimal imp_cap = new BigDecimal(request.getParameter("imp_cap"));
            bon.setImp_cap(imp_cap);

            BigDecimal imp_int = new BigDecimal(request.getParameter("imp_int"));
            bon.setImp_int(imp_int);

            BigDecimal imp_adm = new BigDecimal(request.getParameter("imp_adm"));
            bon.setImp_adm(imp_adm);

            BigDecimal imp_seg = new BigDecimal(request.getParameter("imp_seg"));
            bon.setImp_seg(imp_seg);

            BigDecimal imp_osg = new BigDecimal(request.getParameter("imp_osg"));
            bon.setImp_osg(imp_osg);

            Integer id_catbonific = Integer.parseInt(request.getParameter("id_catbonific"));
            bon.setId_catbonific(id_catbonific);

            bon.setEstatus(request.getParameter("estatus").toUpperCase());

            HttpSession session = request.getSession();
            Usuario usuario = (Usuario)(session.getAttribute("usuario"));
            Integer id_usuario = usuario.getId_usuario();
            bon.setId_usuario(id_usuario);

            bon.setClave_b(request.getParameter("clave_b"));

            Integer recibo = Integer.parseInt(request.getParameter("recibo"));
            bon.setRecibo(recibo);

            bon.setSerie(request.getParameter("serie").toUpperCase());

            bon.setNumcontrato(request.getParameter("numcontrato"));

            Integer id_catprog = Integer.parseInt(request.getParameter("id_catprog"));
            bon.setId_catprog(id_catprog);

            Integer id_autoriza = Integer.parseInt(request.getParameter("id_autoriza"));
            bon.setId_autoriza(id_autoriza);

            GestionMovBonific modelo = new GestionMovBonific();

            if(modelo.actualizarMovBonific(bon)){

                String mid_movedoscta = id_movedoscta.toString();

                RequestDispatcher rd=request.getRequestDispatcher("controladormovbonific?operacion=listarbonific");
                request.setAttribute("msg", "Datos guardados");
                request.setAttribute("id", mid_movedoscta);
                rd.forward(request,response);
                }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("controladormovbonific?operacion=nuevo");
                request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
                rd.forward(request,response);
            }
            
        }else if (request.getParameter("id_movdiversos") != null){
            MovBonific bon = new MovBonific();

            Integer id_bonificacion = Integer.parseInt(request.getParameter("id_bonificacion"));
            bon.setId_bonificacion(id_bonificacion);

            Integer id_movdiversos = Integer.parseInt(request.getParameter("id_movdiversos"));
            bon.setId_movdiversos(id_movdiversos);

            Integer id_benef = Integer.parseInt(request.getParameter("id_benef"));
            bon.setId_benef(id_benef);

            BigDecimal imp_cap = new BigDecimal(request.getParameter("imp_cap"));
            bon.setImp_cap(imp_cap);

            BigDecimal imp_int = new BigDecimal(request.getParameter("imp_int"));
            bon.setImp_int(imp_int);

            BigDecimal imp_adm = new BigDecimal(request.getParameter("imp_adm"));
            bon.setImp_adm(imp_adm);

            BigDecimal imp_seg = new BigDecimal(request.getParameter("imp_seg"));
            bon.setImp_seg(imp_seg);

            BigDecimal imp_osg = new BigDecimal(request.getParameter("imp_osg"));
            bon.setImp_osg(imp_osg);

            Integer id_catbonific = Integer.parseInt(request.getParameter("id_catbonific"));
            bon.setId_catbonific(id_catbonific);

            bon.setEstatus(request.getParameter("estatus").toUpperCase());

            HttpSession session = request.getSession();
            Usuario usuario = (Usuario)(session.getAttribute("usuario"));
            Integer id_usuario = usuario.getId_usuario();
            bon.setId_usuario(id_usuario);

            bon.setClave_b(request.getParameter("clave_b"));

            Integer recibo = Integer.parseInt(request.getParameter("recibo"));
            bon.setRecibo(recibo);

            bon.setSerie(request.getParameter("serie").toUpperCase());

            bon.setNumcontrato(request.getParameter("numcontrato"));

            Integer id_catprog = Integer.parseInt(request.getParameter("id_catprog"));
            bon.setId_catprog(id_catprog);

            Integer id_autoriza = Integer.parseInt(request.getParameter("id_autoriza"));
            bon.setId_autoriza(id_autoriza);

            GestionMovBonific modelo = new GestionMovBonific();

            if(modelo.actualizarMovBonificDiv(bon)){

                String mid_movedoscta = id_movdiversos.toString();

                RequestDispatcher rd=request.getRequestDispatcher("controladormovbonific?operacion=listarbonific");
                request.setAttribute("msg", "Datos guardados");
                request.setAttribute("iddiv", mid_movedoscta);
                rd.forward(request,response);
                }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("controladormovbonific?operacion=nuevo");
                request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
                rd.forward(request,response);
            }
        }
    }
    
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        if(request.getParameter("id_movedoscta") != null){
            int id=Integer.parseInt(request.getParameter("id"));
        
            Integer id_movedoscta=Integer.parseInt(request.getParameter("id_movedoscta"));

            GestionMovBonific modelo = new GestionMovBonific();

            if(modelo.eliminarPorId(id)){
                    GestionMov_edocta mod_edocta = new GestionMov_edocta();
                    mod_edocta.cambiarBonificFalse(id_movedoscta);
                    request.setAttribute("msg", "Registro eliminado");     
            }
            else{
                    request.setAttribute("msg", "No es posible eliminar. Intentelo mas tarde.");
            }
            String mid_movedoscta = id_movedoscta.toString();        
            request.setAttribute("id", mid_movedoscta);
            RequestDispatcher rd=request.getRequestDispatcher("controladormovbonific?operacion=listarbonific");
            rd.forward(request,response);
            
        }else if (request.getParameter("id_movdiversos") != null){
            
            int id=Integer.parseInt(request.getParameter("iddiv"));
        
            Integer id_movdiversos=Integer.parseInt(request.getParameter("id_movdiversos"));

            GestionMovBonific modelo = new GestionMovBonific();

            if(modelo.eliminarPorId(id)){
                    GestionMov_diversos mod_diversos = new GestionMov_diversos();
                    mod_diversos.cambiarBonificFalse(id_movdiversos);
                    request.setAttribute("msg", "Registro eliminado");     
            }
            else{
                    request.setAttribute("msg", "No es posible eliminar. Intentelo mas tarde.");
            }
            String mid_movdiversos = id_movdiversos.toString();        
            request.setAttribute("iddiv", mid_movdiversos);
            RequestDispatcher rd=request.getRequestDispatcher("controladormovbonific?operacion=listarbonific");
            rd.forward(request,response); 
        }
        
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        Integer id_bonificacion=Integer.parseInt(request.getParameter("id_bonificacion"));
        
        //obtener el nombre del beneficiario
        GestionMovBonific modelo = new GestionMovBonific();
        ArrayList bonificacion = modelo.obtenerPorIdReporte(id_bonificacion);
        
        //iterador para iterar sobre el arreglo de movbonific para sacar el valor de id_bonificacion
        Iterator<MovBonific> it = bonificacion.iterator();
        MovBonific bonific = new MovBonific();
            while(it.hasNext()){
                bonific = it.next();
            }       
        String beneficiario = bonific.getNombrebenef();
      
        param.put("sql", "where BO.id_bonificacion='"+id_bonificacion+"'");
        param.put("titulo", "Reporte de Bonificación para: "+beneficiario);
        generarReporte("ReporteMovBonificaciones.jasper", param, request, response);
    
    }
    
    public void reportediv(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        Integer id_bonificacion=Integer.parseInt(request.getParameter("id_bonificacion"));
        
        //obtener el nombre del beneficiario
        GestionMovBonific modelo = new GestionMovBonific();
        ArrayList bonificacion = modelo.obtenerPorIdDivReporte(id_bonificacion);
        
        //iterador para iterar sobre el arreglo de movbonific para sacar el valor de id_bonificacion
        Iterator<MovBonific> it = bonificacion.iterator();
        MovBonific bonific = new MovBonific();
            while(it.hasNext()){
                bonific = it.next();
            }       
        String beneficiario = bonific.getNombrebenef();
        
        param.put("sql", "where BO.id_bonificacion='"+id_bonificacion+"'");
        param.put("titulo", "Reporte de Bonificación para: "+beneficiario);
        generarReporte("ReporteMovBonificacionesDiv.jasper", param, request, response);
    
    }
    
    public void listarJsonbyCriterio(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        String criterio = request.getParameter("criterio");
        String valorcriterio = request.getParameter("valorcriterio");
        
        if(criterio.equals("clave_b")){
            GestionMovBonific modelo=new GestionMovBonific();
            ArrayList bonificaciones=modelo.obtenerPorClave_b(valorcriterio);
            
            GsonBuilder builder=new GsonBuilder();
            Gson gson=builder.create();

            //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "POST, GET");
            response.setHeader("Access-Control-Max-Age", "3600");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
            response.getWriter().write("{\"bonificacion\":"+gson.toJson(bonificaciones)+"}");
        }else if(criterio.equals("nombre")){
            //obtenemos el nombre del beneficiario
            GestionBeneficiario mod_ben = new GestionBeneficiario();
            Beneficiario beneficiario = mod_ben.obtenerPorNombre(valorcriterio);
            //obtenemos el id del beneficiario
            Integer id_benef = beneficiario.getId_beneficiario();
            
            //obtenemos las bonificaciones del beneficiario
            GestionMovBonific mod_bon = new GestionMovBonific();
            ArrayList bonificaciones = mod_bon.obtenerPorIdBenef(id_benef);
            
            GsonBuilder builder=new GsonBuilder();
            Gson gson=builder.create();

            //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "POST, GET");
            response.setHeader("Access-Control-Max-Age", "3600");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
            response.getWriter().write("{\"bonificacion\":"+gson.toJson(bonificaciones)+"}");
        }
        
    }
    
    //By ismael. Método invocado desde la appCobranza para obtener
    // El listado de bonificaciones de un contrato de diversos (valorcriterio)
    public void listarJsonbyCriterioDiv(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        String criterio = request.getParameter("criterio");
        String valorcriterio = request.getParameter("valorcriterio");
 
        GestionMovBonific modelo=new GestionMovBonific();
        ArrayList bonificaciones=modelo.obtenerPorClave_bdiv(valorcriterio);
        
        GsonBuilder builder=new GsonBuilder();
        Gson gson=builder.create();
            
        //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
        response.getWriter().write("{\"bonificacion\":"+gson.toJson(bonificaciones)+"}");
    }
    
}
