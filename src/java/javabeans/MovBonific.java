/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import java.math.BigDecimal;

/**
 *
 * @author Marlon
 */
public class MovBonific {
    
    private Integer id_bonificacion;
    private Integer id_movedoscta;
    private Integer id_benef;
    private BigDecimal imp_cap;
    private BigDecimal imp_int;
    private BigDecimal imp_adm;
    private BigDecimal imp_seg;
    private BigDecimal imp_osg;
    private Integer id_catbonific;
    private String estatus;
    private Integer id_usuario;
    private Integer id_autoriza;
    private String clave_b;
    private Integer recibo;
    private String serie;
    private Integer id_movdiversos;
    private String numcontrato;
    private Integer id_catprog;
    private BigDecimal imp_com;
    private BigDecimal imp_mor;
    private BigDecimal imp_tit;
    
    private String nombrebenef;
    private String clavebonific;
    private String usuario;
    private String movdiversos;
    private String catprograma;
    private String nombreautoriza;
    private String autoriza;
    
    
    public MovBonific(){ super();}

    public MovBonific(Integer id_bonificacion, Integer id_movedoscta, Integer id_benef, BigDecimal imp_cap, BigDecimal imp_int, BigDecimal imp_adm, BigDecimal imp_seg, BigDecimal imp_osg, Integer id_catbonific, String estatus, Integer id_usuario, Integer id_autoriza, String clave_b, Integer recibo, String serie, Integer id_movdiversos, String numcontrato, Integer id_catprog, BigDecimal imp_com, BigDecimal imp_mor, BigDecimal imp_tit) {
        this.id_bonificacion = id_bonificacion;
        this.id_movedoscta = id_movedoscta;
        this.id_benef = id_benef;
        this.imp_cap = imp_cap;
        this.imp_int = imp_int;
        this.imp_adm = imp_adm;
        this.imp_seg = imp_seg;
        this.imp_osg = imp_osg;
        this.id_catbonific = id_catbonific;
        this.estatus = estatus;
        this.id_usuario = id_usuario;
        this.id_autoriza = id_autoriza;
        this.clave_b = clave_b;
        this.recibo = recibo;
        this.serie = serie;
        this.id_movdiversos = id_movdiversos;
        this.numcontrato = numcontrato;
        this.id_catprog = id_catprog;
        this.imp_com = imp_com;
        this.imp_mor = imp_mor;
        this.imp_tit = imp_tit;
    }

    

    public Integer getId_bonificacion() {
        return id_bonificacion;
    }

    public void setId_bonificacion(Integer id_bonificacion) {
        this.id_bonificacion = id_bonificacion;
    }

    public Integer getId_movedoscta() {
        return id_movedoscta;
    }

    public void setId_movedoscta(Integer id_movedoscta) {
        this.id_movedoscta = id_movedoscta;
    }

    public Integer getId_benef() {
        return id_benef;
    }

    public void setId_benef(Integer id_benef) {
        this.id_benef = id_benef;
    }

    public BigDecimal getImp_cap() {
        return imp_cap;
    }

    public void setImp_cap(BigDecimal imp_cap) {
        this.imp_cap = imp_cap;
    }

    public BigDecimal getImp_int() {
        return imp_int;
    }

    public void setImp_int(BigDecimal imp_int) {
        this.imp_int = imp_int;
    }

    public BigDecimal getImp_adm() {
        return imp_adm;
    }

    public void setImp_adm(BigDecimal imp_adm) {
        this.imp_adm = imp_adm;
    }

    public BigDecimal getImp_seg() {
        return imp_seg;
    }

    public void setImp_seg(BigDecimal imp_seg) {
        this.imp_seg = imp_seg;
    }

    public BigDecimal getImp_osg() {
        return imp_osg;
    }

    public void setImp_osg(BigDecimal imp_osg) {
        this.imp_osg = imp_osg;
    }

    public Integer getId_catbonific() {
        return id_catbonific;
    }

    public void setId_catbonific(Integer id_catbonific) {
        this.id_catbonific = id_catbonific;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public Integer getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Integer getId_autoriza() {
        return id_autoriza;
    }

    public void setId_autoriza(Integer id_autoriza) {
        this.id_autoriza = id_autoriza;
    }

    public String getClave_b() {
        return clave_b;
    }

    public void setClave_b(String clave_b) {
        this.clave_b = clave_b;
    }

    public Integer getRecibo() {
        return recibo;
    }

    public void setRecibo(Integer recibo) {
        this.recibo = recibo;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public Integer getId_movdiversos() {
        return id_movdiversos;
    }

    public void setId_movdiversos(Integer id_movdiversos) {
        this.id_movdiversos = id_movdiversos;
    }

    public String getNumcontrato() {
        return numcontrato;
    }

    public void setNumcontrato(String numcontrato) {
        this.numcontrato = numcontrato;
    }

    public Integer getId_catprog() {
        return id_catprog;
    }

    public void setId_catprog(Integer id_catprog) {
        this.id_catprog = id_catprog;
    }

    public String getNombrebenef() {
        return nombrebenef;
    }

    public void setNombrebenef(String nombrebenef) {
        this.nombrebenef = nombrebenef;
    }

    public String getClavebonific() {
        return clavebonific;
    }

    public void setClavebonific(String clavebonific) {
        this.clavebonific = clavebonific;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getMovdiversos() {
        return movdiversos;
    }

    public void setMovdiversos(String movdiversos) {
        this.movdiversos = movdiversos;
    }

    public String getCatprograma() {
        return catprograma;
    }

    public void setCatprograma(String catprograma) {
        this.catprograma = catprograma;
    }

    public String getNombreautoriza() {
        return nombreautoriza;
    }

    public void setNombreautoriza(String nombreautoriza) {
        this.nombreautoriza = nombreautoriza;
    }

    public String getAutoriza() {
        return autoriza;
    }

    public void setAutoriza(String autoriza) {
        this.autoriza = autoriza;
    }

    public BigDecimal getImp_com() {
        return imp_com;
    }

    public void setImp_com(BigDecimal imp_com) {
        this.imp_com = imp_com;
    }

    public BigDecimal getImp_mor() {
        return imp_mor;
    }

    public void setImp_mor(BigDecimal imp_mor) {
        this.imp_mor = imp_mor;
    }

    public BigDecimal getImp_tit() {
        return imp_tit;
    }

    public void setImp_tit(BigDecimal imp_tit) {
        this.imp_tit = imp_tit;
    }
    
}
