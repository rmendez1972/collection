/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionAutoriza;
import Modelo.GestionBonificacion;
import Modelo.GestionMovBonific;
import Modelo.GestionMov_diversos;
import Modelo.GestionMov_edocta;
import Modelo.GestionProgramas;
import java.math.BigDecimal;
import java.util.ArrayList;
import javabeans.Bonificacion;
import javabeans.CatProgramas;
import javabeans.MovBonific;
import javabeans.Mov_edocta;
import javabeans.Usuario;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SEDUVI
 */
@WebServlet(name = "ControladorMovBonific", urlPatterns = {"/controladormovbonific"})
public class ControladorMovBonific extends ControladorBase{
    
    public void listarbonific(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id;
        
        if(request.getAttribute("id")!=null){
            id = Integer.parseInt((String)request.getAttribute("id"));
            
        }else{
            id=Integer.parseInt(request.getParameter("id"));
        }
        
        GestionMovBonific modelo = new GestionMovBonific();
        ArrayList movbonific = modelo.obtenerPorId(id);

        request.setAttribute("movbonific", movbonific);
        
        request.setAttribute("id", id);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_mov_bonific.jsp");
        rd.forward(request,response);        
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        
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
            //request.setAttribute("movdiv", mov_div);
        
            RequestDispatcher rd=request.getRequestDispatcher("frm_mov_bonific.jsp");
            rd.forward(request,response);
        }else{
            
            request.setAttribute("msg", "No se puede agregar porque ya existe una bonificación para este movimiento del estado de cuenta");
            RequestDispatcher rd=request.getRequestDispatcher("controladormov_edocta?operacion=listar");
            rd.forward(request,response);
        }
      
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
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
    }
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
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
        
        
        
        RequestDispatcher rd=request.getRequestDispatcher("frm_modifica_movbonific.jsp");
        rd.forward(request,response);
    
    }
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
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
            /*GestionMov_edocta mod_edocta = new GestionMov_edocta();
            mod_edocta.cambiarBonific(id_movedoscta);*/
            
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
    
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
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
    }
    
}
