/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package javabeans;

import java.math.BigDecimal;
import java.util.Date;


/**
 *
 * @author Rafael Mendez
 */
public class Contratados
{
    private int id_candidato;
    private int id_catprog;
    private String numcontrato;
    private String clave_elect;
    private String curp;
 
    private String rfc;
    private String nombre;
    private String conyuge;
    private Date fecha;
    private BigDecimal capital;
    private BigDecimal sub_inic;
    private BigDecimal enganche;
    private BigDecimal interes;
    private BigDecimal o_seg;
    private BigDecimal sub_inf;
    private int por_eng;
    private Date fecha_con;
    private String mza;
    private String lte;
    private BigDecimal area;
    private String clave_cat;
    private String domicilio;
    private String poliza;
    private Boolean status;
    private Date fecha_pol;
    private BigDecimal pagant;
    private String ref_cont;
    private BigDecimal seguro;
    private int plazo;
    private BigDecimal pago_mes;
    private BigDecimal adm_seg;
    private BigDecimal costo_m2;
    private int id_tipocredito;
    private Date fecha_if;
    private BigDecimal engacubrir;
    private String dsolid;
    private String domicilio_dsolid;
    private Date fecha_ip;
    private String clave_b;
    
    public Contratados(){ super();}
    //constructor que permite crear un objeto
    
     public Contratados(int id_candidato,int id_catprog, String numcontrato, String clave_elect, String curp, String rfc, String nombre, String conyuge, Date fecha_con, String mza, String lte, BigDecimal area, String domicilio,String clave_cat, Date fecha_ip){
         this.id_candidato=id_candidato;
         this.id_catprog=id_catprog;
         this.numcontrato = numcontrato;
         this.clave_elect=clave_elect;
         this.curp=curp;
         this.rfc=rfc;
         this.nombre=nombre;
         this.conyuge=conyuge;
         this.fecha_con=fecha_con;
         this.mza=mza;
         this.lte=lte;
         this.area=area;
     }
    
    public int getId_candidato() {
        return id_candidato;
    }

    public void setId_candidato(Integer id_candidato) {
        this.id_candidato = id_candidato;
    }

    public int getId_catprog() {
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

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
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

    public int getPor_eng() {
        return por_eng;
    }

    public void setPor_eng(Integer por_eng) {
        this.por_eng = por_eng;
    }

    public Date getFecha_con() {
        return fecha_con;
    }

    public void setFecha_con(Date fecha_con) {
        this.fecha_con = fecha_con;
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

    public String getClave_cat() {
        return clave_cat;
    }

    public void setClave_cat(String clave_cat) {
        this.clave_cat = clave_cat;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public String getPoliza() {
        return poliza;
    }

    public void setPoliza(String poliza) {
        this.poliza = poliza;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Date getFecha_pol() {
        return fecha_pol;
    }

    public void setFecha_pol(Date fecha_pol) {
        this.fecha_pol = fecha_pol;
    }

    public BigDecimal getPagant() {
        return pagant;
    }

    public void setPagant(BigDecimal pagant) {
        this.pagant = pagant;
    }

    public String getRef_cont() {
        return ref_cont;
    }

    public void setRef_cont(String ref_cont) {
        this.ref_cont = ref_cont;
    }

    public BigDecimal getSeguro() {
        return seguro;
    }

    public void setSeguro(BigDecimal seguro) {
        this.seguro = seguro;
    }

    public int getPlazo() {
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

    public int getId_tipocredito() {
        return id_tipocredito;
    }

    public void setId_tipocredito(Integer id_tipocredito) {
        this.id_tipocredito = id_tipocredito;
    }

    public Date getFecha_if() {
        return fecha_if;
    }

    public void setFecha_if(Date fecha_if) {
        this.fecha_if = fecha_if;
    }

    public BigDecimal getEngacubrir() {
        return engacubrir;
    }

    public void setEngacubrir(BigDecimal engacubrir) {
        this.engacubrir = engacubrir;
    }

    public String getDsolid() {
        return dsolid;
    }

    public void setDsolid(String dsolid) {
        this.dsolid = dsolid;
    }

    public String getDomicilio_dsolid() {
        return domicilio_dsolid;
    }

    public void setDomicilio_dsolid(String domicilio_dsolid) {
        this.domicilio_dsolid = domicilio_dsolid;
    }

    public Date getFecha_ip() {
        return fecha_ip;
    }

    public void setFecha_ip(Date fecha_ip) {
        this.fecha_ip = fecha_ip;
    }

    public String getClave_b() {
        return clave_b;
    }

    public void setClave_b(String clave_b) {
        this.clave_b = clave_b;
    }
        
    
    
}
