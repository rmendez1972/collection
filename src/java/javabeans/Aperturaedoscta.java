/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author Rafael Mendez
 */

import java.math.BigDecimal;
import java.util.Date;

public class Aperturaedoscta
{
    private Integer id_candidato;
    private Integer id_catprog;
    private String numcontrato;
    private String clave_elect;
    private String curp;
    private String rfc;
    private String nombre;
    private String conyuge;
    private BigDecimal capital;
    private BigDecimal sub_inic;
    private BigDecimal enganche;
    private BigDecimal interes;
    private BigDecimal admon;
    private BigDecimal o_seg;
    private BigDecimal sub_inf;
    private Date fecha_cont;
    private String descripcion;
    private String mza;
    private String lte;
    private BigDecimal area;
    private String domicilio;
    private String clave_cat;
    private Date fecha_ip;
    private BigDecimal por_eng;
    private BigDecimal seguro;
    private BigDecimal pagant;
    private Integer plazo;
    private BigDecimal pago_mes;
    private BigDecimal adm_seg;
    private BigDecimal costo_m2;
    private BigDecimal engacubrir;
    private Date fecha_if;
    private String poliza;
    private Date fecha_pol;
    private String clave_b;

    
    

    
    
    public Aperturaedoscta(){ super(); }
    //constructor que permite crear un objeto
    //Mensaje a partir de los datos del mismo
    public Aperturaedoscta(Integer id_candidato,Integer id_catprog,String numcontrato, String clave_elect, String curp, String rfc, String nombre, String conyuge,BigDecimal capital,BigDecimal sub_inic,BigDecimal enganche,BigDecimal interes,BigDecimal admon,BigDecimal o_seg,BigDecimal sub_inf,Date fecha_cont)
    {
        this.id_candidato=id_candidato;
        this.id_catprog=id_catprog;
        this.numcontrato=numcontrato;
        this.clave_elect=clave_elect;
        this.curp=curp;
        this.rfc=rfc;
        this.nombre=nombre;
        this.conyuge=conyuge;
        this.capital=capital;
        this.sub_inic=sub_inic;
        this.enganche=enganche;
        this.interes=interes;
        this.admon=admon;
        this.o_seg=o_seg;
        this.sub_inf=sub_inf;
        this.fecha_cont=fecha_cont;
        
    }
    
    public Aperturaedoscta(Integer id_candidato,Integer id_catprog,String numcontrato, String clave_elect, String curp, String rfc, String nombre, String conyuge,BigDecimal capital,BigDecimal sub_inic,BigDecimal enganche,BigDecimal interes,BigDecimal admon,BigDecimal o_seg,BigDecimal sub_inf,Date fecha_cont,String descripcion)
    {
        this.id_candidato=id_candidato;
        this.id_catprog=id_catprog;
        this.numcontrato=numcontrato;
        this.clave_elect=clave_elect;
        this.curp=curp;
        this.rfc=rfc;
        this.nombre=nombre;
        this.conyuge=conyuge;
        this.capital=capital;
        this.sub_inic=sub_inic;
        this.enganche=enganche;
        this.interes=interes;
        this.admon=admon;
        this.o_seg=o_seg;
        this.sub_inf=sub_inf;
        this.fecha_cont=fecha_cont;
        this.descripcion=descripcion;
        
    }
    
    public Aperturaedoscta(Integer id_candidato,Integer id_catprog,String numcontrato, String clave_elect, String curp, String rfc, String nombre, String conyuge,Date fecha_cont,String descripcion,String mza,String lte,BigDecimal area,String domicilio,String clave_cat,Date fecha_ip,BigDecimal capital,BigDecimal sub_inic,BigDecimal enganche,BigDecimal interes,BigDecimal admon,BigDecimal o_seg,BigDecimal sub_inf,BigDecimal por_eng,BigDecimal seguro,BigDecimal pagant,Integer plazo,BigDecimal pago_mes,BigDecimal adm_seg,BigDecimal costo_m2,BigDecimal engacubrir,Date fecha_if)
    {
        this.id_candidato=id_candidato;
        this.id_catprog=id_catprog;
        this.numcontrato=numcontrato;
        this.clave_elect=clave_elect;
        this.curp=curp;
        this.rfc=rfc;
        this.nombre=nombre;
        this.conyuge=conyuge;
        
        this.fecha_cont=fecha_cont;
        this.descripcion=descripcion;
        this.mza=mza;
        this.lte=lte;
        this.area=area;
        this.domicilio=domicilio;
        this.clave_cat=clave_cat;
        this.fecha_ip=fecha_ip;
        
        this.capital=capital;
        this.sub_inic=sub_inic;
        this.enganche=enganche;
        this.interes=interes;
        this.admon=admon;
        this.o_seg=o_seg;
        this.sub_inf=sub_inf;
        this.por_eng=por_eng;
        this.seguro=seguro;
        this.pagant=pagant;
        this.plazo=plazo;
        this.pago_mes=pago_mes;
        this.adm_seg=adm_seg;
        this.costo_m2=costo_m2;
        this.fecha_if=fecha_if;
        this.engacubrir=engacubrir;
    }
    
    public Aperturaedoscta(Integer id_candidato,Integer id_catprog,String numcontrato, String clave_elect, String curp, String rfc, String nombre, String conyuge,Date fecha_cont,String descripcion,String mza,String lte,BigDecimal area,String domicilio,String clave_cat,Date fecha_ip,BigDecimal capital,BigDecimal sub_inic,BigDecimal enganche,BigDecimal interes,BigDecimal admon,BigDecimal o_seg,BigDecimal sub_inf,BigDecimal por_eng,BigDecimal seguro,BigDecimal pagant,Integer plazo,BigDecimal pago_mes,BigDecimal adm_seg,BigDecimal costo_m2,BigDecimal engacubrir,Date fecha_if,String poliza, Date fecha_pol, String clave_b)
    {
        this.id_candidato=id_candidato;
        this.id_catprog=id_catprog;
        this.numcontrato=numcontrato;
        this.clave_elect=clave_elect;
        this.curp=curp;
        this.rfc=rfc;
        this.nombre=nombre;
        this.conyuge=conyuge;
        
        this.fecha_cont=fecha_cont;
        this.descripcion=descripcion;
        this.mza=mza;
        this.lte=lte;
        this.area=area;
        this.domicilio=domicilio;
        this.clave_cat=clave_cat;
        this.fecha_ip=fecha_ip;
        
        this.capital=capital;
        this.sub_inic=sub_inic;
        this.enganche=enganche;
        this.interes=interes;
        this.admon=admon;
        this.o_seg=o_seg;
        this.sub_inf=sub_inf;
        this.por_eng=por_eng;
        this.seguro=seguro;
        this.pagant=pagant;
        this.plazo=plazo;
        this.pago_mes=pago_mes;
        this.adm_seg=adm_seg;
        this.costo_m2=costo_m2;
        this.fecha_if=fecha_if;
        this.engacubrir=engacubrir;
        this.poliza=poliza;
        this.fecha_pol=fecha_pol;
        this.clave_b=clave_b;
    }

    
    
    public Integer getId_candidato() {
        return id_candidato;
    }

    public void setId_candidato(Integer id_candidato) {
        this.id_candidato = id_candidato;
    }

    public Integer getId_catprog() {
        return id_catprog;
    }

    public void setId_catprog(Integer id_catprog) {
        this.id_catprog = id_catprog;
    }

    public String getNumcontrato() {
        return numcontrato;
    }

    public void setNumcontrato(String numcontrato) {
        this.numcontrato = numcontrato;
    }

    public String getClave_elect() {
        return clave_elect;
    }

    public void setClave_elect(String clave_elect) {
        this.clave_elect = clave_elect;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getConyuge() {
        return conyuge;
    }

    public void setConyuge(String conyuge) {
        this.conyuge = conyuge;
    }

    public BigDecimal getCapital() {
        return capital;
    }

    public void setCapital(BigDecimal capital) {
        this.capital = capital;
    }

    public BigDecimal getSub_inic() {
        return sub_inic;
    }

    public void setSub_inic(BigDecimal sub_inic) {
        this.sub_inic = sub_inic;
    }

    public BigDecimal getEnganche() {
        return enganche;
    }

    public void setEnganche(BigDecimal enganche) {
        this.enganche = enganche;
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

    public BigDecimal getO_seg() {
        return o_seg;
    }

    public void setO_seg(BigDecimal o_seg) {
        this.o_seg = o_seg;
    }

    public BigDecimal getSub_inf() {
        return sub_inf;
    }

    public void setSub_inf(BigDecimal sub_inf) {
        this.sub_inf = sub_inf;
    }

    public Date getFecha_cont() {
        return fecha_cont;
    }

    public void setFecha_cont(Date fecha_cont) {
        this.fecha_cont = fecha_cont;
    }
    
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public String getMza() {
        return mza;
    }

    public void setMza(String mza) {
        this.mza = mza;
    }
    
    public String getLte() {
        return lte;
    }

    public void setLte(String lte) {
        this.lte = lte;
    }
    
    public BigDecimal getArea() {
        return area;
    }

    public void setArea(BigDecimal area) {
        this.area = area;
    }
    
    public String getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }
    
    public String getClave_cat() {
        return clave_cat;
    }

    public void setClave_cat(String clave_cat) {
        this.clave_cat = clave_cat;
    }

    public Date getFecha_ip() {
        return fecha_ip;
    }

    public void setFecha_ip(Date fecha_ip) {
        this.fecha_ip = fecha_ip;
    }
    
    public BigDecimal getPor_eng() {
        return por_eng;
    }

    public void setPor_eng(BigDecimal por_eng) {
        this.por_eng = por_eng;
    }

    public BigDecimal getSeguro() {
        return seguro;
    }

    public void setSeguro(BigDecimal seguro) {
        this.seguro = seguro;
    }

    public BigDecimal getPagant() {
        return pagant;
    }

    public void setPagant(BigDecimal pagant) {
        this.pagant = pagant;
    }
    
    public Integer getPlazo() {
        return plazo;
    }

    public void setPlazo(Integer plazo) {
        this.plazo = plazo;
    }

    public BigDecimal getPago_mes() {
        return pago_mes;
    }

    public void setPago_mes(BigDecimal pago_mes) {
        this.pago_mes = pago_mes;
    }

    public BigDecimal getAdm_seg() {
        return adm_seg;
    }

    public void setAdm_seg(BigDecimal adm_seg) {
        this.adm_seg = adm_seg;
    }

    public BigDecimal getCosto_m2() {
        return costo_m2;
    }

    public void setCosto_m2(BigDecimal costo_m2) {
        this.costo_m2 = costo_m2;
    }

    public BigDecimal getEngacubrir() {
        return engacubrir;
    }

    public void setEngacubrir(BigDecimal engacubrir) {
        this.engacubrir = engacubrir;
    }

    public Date getFecha_if() {
        return fecha_if;
    }

    public void setFecha_if(Date fecha_if) {
        this.fecha_if = fecha_if;
    }
    
    
    public String getPoliza() {
        return poliza;
    }

    public void setPoliza(String poliza) {
        this.poliza = poliza;
    }

    public Date getFecha_pol() {
        return fecha_pol;
    }

    public void setFecha_pol(Date fecha_pol) {
        this.fecha_pol = fecha_pol;
    }
    
    public String getClave_b() {
        return clave_b;
    }

    public void setClave_b(String clave_b) {
        this.clave_b = clave_b;
    }
    
}
