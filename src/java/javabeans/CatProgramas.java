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
public class CatProgramas {

    private Integer id_catprog;
    private String clave;
    private String descripcion;
    private BigDecimal sub_ini;
    private BigDecimal eng_fon;
    private BigDecimal eng_inv;
    private BigDecimal interes;
    private BigDecimal admon;
    private BigDecimal seguro;
    private BigDecimal costo_m2;
    private BigDecimal por_sub;
    private BigDecimal por_admon;
    private BigDecimal por_sv;
    private BigDecimal por_os;
    private BigDecimal sal_min;
    private BigDecimal pago_mes;
    private BigDecimal por_eng;
    private BigDecimal anual;
    private Integer plazo;
    private BigDecimal por_cap;
    private boolean status;
    private Integer mecanica;
    private Integer id_tipocred;
    private BigDecimal mensual;
    private BigDecimal sub_bp;
    private BigDecimal apor_fij;
    private BigDecimal por_pm;
    private BigDecimal por_pf;
    private String clave_ant;
    private Integer id_colonia;
    private Integer dias_gracia;
    private boolean mora;
    private BigDecimal por_ga;
    private String cuenta_cont;
    private Integer id_delegacion;
    private Integer id_modulo;
    private boolean condicion_fija;
    private Integer id_usuario;

    private String tipocredito;
    private String colonia;
    private String delegacion;
    private String modulo;
    private String usuario;

    public CatProgramas(Integer id_catprog, String clave, String descripcion, BigDecimal sub_ini, BigDecimal eng_fon, BigDecimal eng_inv, BigDecimal interes, BigDecimal admon, BigDecimal seguro, BigDecimal costo_m2, BigDecimal por_sub, BigDecimal por_admon, BigDecimal por_sv, BigDecimal por_os, BigDecimal sal_min, BigDecimal pago_mes, BigDecimal por_eng, BigDecimal anual, Integer plazo, BigDecimal por_cap, boolean status, Integer mecanica, Integer id_tipocred, BigDecimal mensual, BigDecimal sub_bp, BigDecimal apor_fij, BigDecimal por_pm, BigDecimal por_pf, String clave_ant, Integer id_colonia, Integer dias_gracia, boolean mora, BigDecimal por_ga, String cuenta_cont, Integer id_delegacion, Integer id_modulo, boolean condicion_fija, Integer id_usuario) {
        this.id_catprog = id_catprog;
        this.clave = clave;
        this.descripcion = descripcion;
        this.sub_ini = sub_ini;
        this.eng_fon = eng_fon;
        this.eng_inv = eng_inv;
        this.interes = interes;
        this.admon = admon;
        this.seguro = seguro;
        this.costo_m2 = costo_m2;
        this.por_sub = por_sub;
        this.por_admon = por_admon;
        this.por_sv = por_sv;
        this.por_os = por_os;
        this.sal_min = sal_min;
        this.pago_mes = pago_mes;
        this.por_eng = por_eng;
        this.anual = anual;
        this.plazo = plazo;
        this.por_cap = por_cap;
        this.status = status;
        this.mecanica = mecanica;
        this.id_tipocred = id_tipocred;
        this.mensual = mensual;
        this.sub_bp = sub_bp;
        this.apor_fij = apor_fij;
        this.por_pm = por_pm;
        this.por_pf = por_pf;
        this.clave_ant = clave_ant;
        this.id_colonia = id_colonia;
        this.dias_gracia = dias_gracia;
        this.mora = mora;
        this.por_ga = por_ga;
        this.cuenta_cont = cuenta_cont;
        this.id_delegacion = id_delegacion;
        this.id_modulo = id_modulo;
        this.condicion_fija = condicion_fija;
        this.id_usuario = id_usuario;
    }
  
    
    public CatProgramas(){
        super();
    }
    
    
    
    public Integer getId_catprog() {
        return id_catprog;
    }

    public void setId_catprog(Integer id_catprog) {
        this.id_catprog = id_catprog;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public BigDecimal getSub_ini() {
        return sub_ini;
    }

    public void setSub_ini(BigDecimal sub_ini) {
        this.sub_ini = sub_ini;
    }

    public BigDecimal getEng_fon() {
        return eng_fon;
    }

    public void setEng_fon(BigDecimal eng_fon) {
        this.eng_fon = eng_fon;
    }

    public BigDecimal getEng_inv() {
        return eng_inv;
    }

    public void setEng_inv(BigDecimal eng_inv) {
        this.eng_inv = eng_inv;
    }

    public BigDecimal getInteres() {
        return interes;
    }

    public void setInteres(BigDecimal interes) {
        this.interes = interes;
    }

    public BigDecimal getAdmon() {
        return admon;
    }

    public void setAdmon(BigDecimal admon) {
        this.admon = admon;
    }

    public BigDecimal getSeguro() {
        return seguro;
    }

    public void setSeguro(BigDecimal seguro) {
        this.seguro = seguro;
    }

    public BigDecimal getCosto_m2() {
        return costo_m2;
    }

    public void setCosto_m2(BigDecimal costo_m2) {
        this.costo_m2 = costo_m2;
    }

    public BigDecimal getPor_sub() {
        return por_sub;
    }

    public void setPor_sub(BigDecimal por_sub) {
        this.por_sub = por_sub;
    }

    public BigDecimal getPor_admon() {
        return por_admon;
    }

    public void setPor_admon(BigDecimal por_admon) {
        this.por_admon = por_admon;
    }

    public BigDecimal getPor_sv() {
        return por_sv;
    }

    public void setPor_sv(BigDecimal por_sv) {
        this.por_sv = por_sv;
    }

    public BigDecimal getPor_os() {
        return por_os;
    }

    public void setPor_os(BigDecimal por_os) {
        this.por_os = por_os;
    }

    public BigDecimal getSal_min() {
        return sal_min;
    }

    public void setSal_min(BigDecimal sal_min) {
        this.sal_min = sal_min;
    }

    public BigDecimal getPago_mes() {
        return pago_mes;
    }

    public void setPago_mes(BigDecimal pago_mes) {
        this.pago_mes = pago_mes;
    }

    public BigDecimal getPor_eng() {
        return por_eng;
    }

    public void setPor_eng(BigDecimal por_eng) {
        this.por_eng = por_eng;
    }

    public BigDecimal getAnual() {
        return anual;
    }

    public void setAnual(BigDecimal anual) {
        this.anual = anual;
    }

    public Integer getPlazo() {
        return plazo;
    }

    public void setPlazo(Integer plazo) {
        this.plazo = plazo;
    }

    public BigDecimal getPor_cap() {
        return por_cap;
    }

    public void setPor_cap(BigDecimal por_cap) {
        this.por_cap = por_cap;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Integer getMecanica() {
        return mecanica;
    }

    public void setMecanica(Integer mecanica) {
        this.mecanica = mecanica;
    }

    public Integer getId_tipocred() {
        return id_tipocred;
    }

    public void setId_tipocred(Integer id_tipocred) {
        this.id_tipocred = id_tipocred;
    }

    public BigDecimal getMensual() {
        return mensual;
    }

    public void setMensual(BigDecimal mensual) {
        this.mensual = mensual;
    }

    public BigDecimal getSub_bp() {
        return sub_bp;
    }

    public void setSub_bp(BigDecimal sub_bp) {
        this.sub_bp = sub_bp;
    }

    public BigDecimal getApor_fij() {
        return apor_fij;
    }

    public void setApor_fij(BigDecimal apor_fij) {
        this.apor_fij = apor_fij;
    }

    public BigDecimal getPor_pm() {
        return por_pm;
    }

    public void setPor_pm(BigDecimal por_pm) {
        this.por_pm = por_pm;
    }

    public BigDecimal getPor_pf() {
        return por_pf;
    }

    public void setPor_pf(BigDecimal por_pf) {
        this.por_pf = por_pf;
    }

    public String getClave_ant() {
        return clave_ant;
    }

    public void setClave_ant(String clave_ant) {
        this.clave_ant = clave_ant;
    }

    public Integer getId_colonia() {
        return id_colonia;
    }

    public void setId_colonia(Integer id_colonia) {
        this.id_colonia = id_colonia;
    }

    public Integer getDias_gracia() {
        return dias_gracia;
    }

    public void setDias_gracia(Integer dias_gracia) {
        this.dias_gracia = dias_gracia;
    }

    public boolean isMora() {
        return mora;
    }

    public void setMora(boolean mora) {
        this.mora = mora;
    }

    public BigDecimal getPor_ga() {
        return por_ga;
    }

    public void setPor_ga(BigDecimal por_ga) {
        this.por_ga = por_ga;
    }

    public String getCuenta_cont() {
        return cuenta_cont;
    }

    public void setCuenta_cont(String cuenta_cont) {
        this.cuenta_cont = cuenta_cont;
    }

    public Integer getId_delegacion() {
        return id_delegacion;
    }

    public void setId_delegacion(Integer id_delegacion) {
        this.id_delegacion = id_delegacion;
    }

    public Integer getId_modulo() {
        return id_modulo;
    }

    public void setId_modulo(Integer id_modulo) {
        this.id_modulo = id_modulo;
    }

    public String getTipocredito() {
        return tipocredito;
    }

    public void setTipocredito(String tipocredito) {
        this.tipocredito = tipocredito;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getDelegacion() {
        return delegacion;
    }

    public void setDelegacion(String delegacion) {
        this.delegacion = delegacion;
    }

    public String getModulo() {
        return modulo;
    }

    public void setModulo(String modulo) {
        this.modulo = modulo;
    }

    public boolean isCondicion_fija() {
        return condicion_fija;
    }

    public void setCondicion_fija(boolean condicion_fija) {
        this.condicion_fija = condicion_fija;
    }

    public Integer getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
    
    
}
