package cn.doublehh.system.model;

import java.io.Serializable;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;

//import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
//import javax.persistence.Transient;

//import net.zjwu.mis.base.audit.CreateBy;
//import net.zjwu.mis.base.audit.CreateDate;
//import net.zjwu.mis.base.audit.UpdateBy;
//import net.zjwu.mis.base.audit.UpdateDate;

@Table(name = "t_s_class")
public class ClassEntity implements Serializable {
    @Id
    private Integer id;

    /**
     * class id
     */
    private String cid;

    /**
     * sit number
     */
    private String sit;
    
    private String zjbrand;
    private String zjtype;
    private String zjinstrumentnum;
    private String zjstartdate;
    private String protect;
    private String attention;
    private String tybrand;
    private String tytype;
    private String tyinstrumentnum;
    private String tystartdate;
    private String bulbstartdate;
    private String addup;


    /**
     * project id
     */
    private String tyid;

    /**
     * project status
     */
    private String tyzt;

    /**
     * computer id
     */
    private String zjid;

    /**
     * computer status
     */
    private String zjzt;
    
    /**
     * cent controller id
     */
    private String ccid;

    /**
     * cent controller status
     */
    private String cczt;

    /**
     * display id
     */
    private String xsqid;

    /**
     * dispaly status
     */
    private String xsqzt;

    /**
     * class status
     */
    private String czt;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getSit() {
		return sit;
	}

	public void setSit(String sit) {
		this.sit = sit;
	}

	public String getZjbrand() {
		return zjbrand;
	}

	public void setZjbrand(String zjbrand) {
		this.zjbrand = zjbrand;
	}

	public String getZjtype() {
		return zjtype;
	}

	public void setZjtype(String zjtype) {
		this.zjtype = zjtype;
	}

	public String getZjinstrumentnum() {
		return zjinstrumentnum;
	}

	public void setZjinstrumentnum(String zjInstrumentNum) {
		this.zjinstrumentnum = zjInstrumentNum;
	}

	public String getZjstartdate() {
		return zjstartdate;
	}

	public void setZjstartdate(String zjstartdate) {
		this.zjstartdate = zjstartdate;
	}

	public String getProtect() {
		return protect;
	}

	public void setProtect(String protect) {
		this.protect = protect;
	}

	public String getAttention() {
		return attention;
	}

	public void setAttention(String attention) {
		this.attention = attention;
	}

	public String getTybrand() {
		return tybrand;
	}

	public void setTybrand(String tybrand) {
		this.tybrand = tybrand;
	}

	public String getTytype() {
		return tytype;
	}

	public void setTytype(String tytype) {
		this.tytype = tytype;
	}

	public String getTyinstrumentnum() {
		return tyinstrumentnum;
	}

	public void setTyinstrumentnum(String tyInstrumentNum) {
		this.tyinstrumentnum = tyInstrumentNum;
	}

	public String getTystartdate() {
		return tystartdate;
	}

	public void setTystartdate(String tystartdate) {
		this.tystartdate = tystartdate;
	}

	public String getBulbstartdate() {
		return bulbstartdate;
	}

	public void setBulbstartdate(String bulbstartdate) {
		this.bulbstartdate = bulbstartdate;
	}

	public String getAddup() {
		return addup;
	}

	public void setAddup(String addup) {
		this.addup = addup;
	}

	public String getTyid() {
		return tyid;
	}

	public void setTyid(String tyid) {
		this.tyid = tyid;
	}

	public String getTyzt() {
		return tyzt;
	}

	public void setTyzt(String tyzt) {
		this.tyzt = tyzt;
	}

	public String getZjid() {
		return zjid;
	}

	public void setZjid(String zjid) {
		this.zjid = zjid;
	}

	public String getZjzt() {
		return zjzt;
	}

	public void setZjzt(String zjzt) {
		this.zjzt = zjzt;
	}

	public String getCcid() {
		return ccid;
	}

	public void setCcid(String ccid) {
		this.ccid = ccid;
	}

	public String getCczt() {
		return cczt;
	}

	public void setCczt(String cczt) {
		this.cczt = cczt;
	}

	public String getXsqid() {
		return xsqid;
	}

	public void setXsqid(String xsqid) {
		this.xsqid = xsqid;
	}

	public String getXsqzt() {
		return xsqzt;
	}

	public void setXsqzt(String xsqzt) {
		this.xsqzt = xsqzt;
	}

	public String getCzt() {
		return czt;
	}

	public void setCzt(String czt) {
		this.czt = czt;
	}


 //   @Transient
 //   private List<Role> roles = new ArrayList<Role>();
//    
//    private static final long serialVersionUID = 1L;

    
    
}