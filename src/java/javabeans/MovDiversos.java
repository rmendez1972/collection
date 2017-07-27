/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package javabeans;

import java.math.BigDecimal;
import java.util.Date;


/**
 *
 * @author Ismael
 */
public class MovDiversos
{
    private int id_movdiversos;
    private int id_bendiv;
    private String clave_div;
    private Date fecha_div;
    private String poliza;
    private int recibo; 
    private BigDecimal cargo;
    private BigDecimal abono;
    private BigDecimal moratorios;
    private BigDecimal otros;
    private Date fecha_pol;
    private String estatus;
    private int id_usuario;
    private boolean aplicado;
    private String descripcion;
    private int id_catprog;
    private BigDecimal bonificacion;
    private String serie;
    private String poliza_apli;
    private Date fecha_apli;
    private BigDecimal interes;
    private BigDecimal seguro;
    private int id_emisor;
    private String clave_b;
    private String numcontrato;
    private boolean bonific;//
    private int id_caja;
    
    private String nombrebenef; 
    private String nombreusuario; 

  
   
    public MovDiversos(){ super();}

    public MovDiversos(int id_movdiversos, int id_bendiv, String clave_div, Date fecha_div, String poliza, int recibo, BigDecimal cargo, BigDecimal abono, BigDecimal moratorios, BigDecimal otros, Date fecha_pol, String estatus, int id_usuario, boolean aplicado, String descripcion, int id_catprog, BigDecimal bonificacion, String serie, String poliza_apli, Date fecha_apli, BigDecimal interes, BigDecimal seguro, int id_emisor, String clave_b, String numcontrato, int id_caja, boolean bonific) {
        this.id_movdiversos = id_movdiversos;
        this.id_bendiv = id_bendiv;
        this.clave_div = clave_div;
        this.fecha_div = fecha_div;
        this.poliza = poliza;
        this.recibo = recibo;
        this.cargo = cargo;
        this.abono = abono;
        this.moratorios = moratorios;
        this.otros = otros;
        this.fecha_pol = fecha_pol;
        this.estatus = estatus;
        this.id_usuario = id_usuario;
        this.aplicado = aplicado;
        this.descripcion = descripcion;
        this.id_catprog = id_catprog;
        this.bonificacion = bonificacion;
        this.serie = serie;
        this.poliza_apli = poliza_apli;
        this.fecha_apli = fecha_apli;
        this.interes = interes;
        this.seguro = seguro;
        this.id_emisor = id_emisor;
        this.clave_b = clave_b;
        this.numcontrato = numcontrato;
        this.id_caja = id_caja;
        this.bonific=bonific;
    }
    
    /*
    public MovDiversos(int id_movedoscta, int id_benef, BigDecimal capital, BigDecimal interes, BigDecimal admon, BigDecimal seguro, String clave_mov, String poliza, Date fecha_mov, int recibo, BigDecimal o_seguro, BigDecimal moratorios, String status, Date fecha_pol, int id_usuario, String prepago, int id_bonific, BigDecimal comisiones, String serie, Boolean puntual, String clave_b, BigDecimal tit, int id_catprog, String numcontrato, int id_caja, Boolean bonific) {
        this.id_movedoscta = id_movedoscta;
        this.id_benef = id_benef;
        this.capital = capital;
        this.interes = interes;
        this.admon = admon;
        this.seguro = seguro;
        this.clave_mov = clave_mov;
        this.poliza = poliza;
        this.fecha_mov = fecha_mov;
        this.recibo = recibo;
        this.o_seguro = o_seguro;
        this.moratorios = moratorios;
        this.status = status;
        this.fecha_pol = fecha_pol;
        this.id_usuario = id_usuario;
        this.prepago = prepago;
        this.id_bonific = id_bonific;
        this.comisiones = comisiones;
        this.serie = serie;
        this.puntual = puntual;
        this.clave_b = clave_b;
        this.tit = tit;
        this.id_catprog = id_catprog;
        this.numcontrato = numcontrato;
        this.id_caja = id_caja;
        this.bonific=bonific;
        
    }
    
    public MovDiversos(int id_movedoscta, int id_benef, BigDecimal capital, BigDecimal interes, BigDecimal admon, BigDecimal seguro, String clave_mov, String poliza, Date fecha_mov, int recibo, BigDecimal o_seguro, BigDecimal moratorios, String status, Date fecha_pol) {
        this.id_movedoscta = id_movedoscta;
        this.id_benef = id_benef;
        this.capital = capital;
        this.interes = interes;
        this.admon = admon;
        this.seguro = seguro;
        this.clave_mov = clave_mov;
        this.poliza = poliza;
        this.fecha_mov = fecha_mov;
        this.recibo = recibo;
        this.o_seguro = o_seguro;
        this.moratorios = moratorios;
        this.status = status;
        this.fecha_pol = fecha_pol;
        
    }
    
    public MovDiversos(int id_movedoscta, int id_benef, String clave_b, String clave_mov, Date fecha_mov, String poliza, Date fecha_pol, BigDecimal capital, BigDecimal admon, BigDecimal seguro, BigDecimal o_seguro, BigDecimal comisiones, BigDecimal tit) {
        this.id_movedoscta = id_movedoscta;
        this.id_benef = id_benef;
        this.clave_b =clave_b;
        this.clave_mov=clave_mov;
        this.fecha_mov=fecha_mov;
        this.poliza=poliza;
        this.fecha_pol=fecha_pol;
        this.capital = capital;
        this.admon = admon;
        this.seguro = seguro;
        this.o_seguro = o_seguro;
        this.comisiones = comisiones;
        this.tit = tit;
        
    }
*/
    public int getId_movdiversos() {
        return id_movdiversos;
    }

    public void setId_movdiversos(int id_movdiversos) {
        this.id_movdiversos = id_movdiversos;
    }

    public int getId_bendiv() {
        return id_bendiv;
    }

    public void setId_bendiv(int id_bendiv) {
        this.id_bendiv = id_bendiv;
    }

    public String getClave_div() {
        return clave_div;
    }

    public void setClave_div(String clave_div) {
        this.clave_div = clave_div;
    }

    public Date getFecha_div() {
        return fecha_div;
    }

    public void setFecha_div(Date fecha_div) {
        this.fecha_div = fecha_div;
    }

    public String getPoliza() {
        return poliza;
    }

    public void setPoliza(String poliza) {
        this.poliza = poliza;
    }

    public int getRecibo() {
        return recibo;
    }

    public void setRecibo(int recibo) {
        this.recibo = recibo;
    }

    public BigDecimal getCargo() {
        return cargo;
    }

    public void setCargo(BigDecimal cargo) {
        this.cargo = cargo;
    }

    public BigDecimal getAbono() {
        return abono;
    }

    public void setAbono(BigDecimal abono) {
        this.abono = abono;
    }

    public BigDecimal getMoratorios() {
        return moratorios;
    }

    public void setMoratorios(BigDecimal moratorios) {
        this.moratorios = moratorios;
    }

    public BigDecimal getOtros() {
        return otros;
    }

    public void setOtros(BigDecimal otros) {
        this.otros = otros;
    }

    public Date getFecha_pol() {
        return fecha_pol;
    }

    public void setFecha_pol(Date fecha_pol) {
        this.fecha_pol = fecha_pol;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public boolean isAplicado() {
        return aplicado;
    }

    public void setAplicado(boolean aplicado) {
        this.aplicado = aplicado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_catprog() {
        return id_catprog;
    }

    public void setId_catprog(int id_catprog) {
        this.id_catprog = id_catprog;
    }

    public BigDecimal getBonificacion() {
        return bonificacion;
    }

    public void setBonificacion(BigDecimal bonificacion) {
        this.bonificacion = bonificacion;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getPoliza_apli() {
        return poliza_apli;
    }

    public void setPoliza_apli(String poliza_apli) {
        this.poliza_apli = poliza_apli;
    }

    public Date getFecha_apli() {
        return fecha_apli;
    }

    public void setFecha_apli(Date fecha_apli) {
        this.fecha_apli = fecha_apli;
    }

    public BigDecimal getInteres() {
        return interes;
    }

    public void setInteres(BigDecimal interes) {
        this.interes = interes;
    }

    public BigDecimal getSeguro() {
        return seguro;
    }

    public void setSeguro(BigDecimal seguro) {
        this.seguro = seguro;
    }

    public int getId_emisor() {
        return id_emisor;
    }

    public void setId_emisor(int id_emisor) {
        this.id_emisor = id_emisor;
    }

    public String getClave_b() {
        return clave_b;
    }

    public void setClave_b(String clave_b) {
        this.clave_b = clave_b;
    }

    public String getNumcontrato() {
        return numcontrato;
    }

    public void setNumcontrato(String numcontrato) {
        this.numcontrato = numcontrato;
    }

    public int getId_caja() {
        return id_caja;
    }

    public void setId_caja(int id_caja) {
        this.id_caja = id_caja;
    }

    public String getNombrebenef() {
        return nombrebenef;
    }

    public void setNombrebenef(String nombrebenef) {
        this.nombrebenef = nombrebenef;
    }

    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    public boolean isBonific() {
        return bonific;
    }

    public void setBonific(boolean bonific) {
        this.bonific = bonific;
    }

         
}
