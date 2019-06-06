package entity;

import java.util.Date;

/**
 * TTranRecord entity. @author MyEclipse Persistence Tools
 */

public class TTranRecord implements java.io.Serializable {

	// Fields

	private Integer trid;
	private Integer userid;
	private Integer drid;
	private Double trrout;
	private Date trdate;
	private Double realvalue;
	private String trstate;
	private Double trinrepay;

	// Constructors

	/** default constructor */
	public TTranRecord() {
	}

	/** full constructor */
	public TTranRecord(Integer userid, Integer drid, Double trrout,
			Date trdate, Double realvalue, String trstate, Double trinrepay) {
		this.userid = userid;
		this.drid = drid;
		this.trrout = trrout;
		this.trdate = trdate;
		this.realvalue = realvalue;
		this.trstate = trstate;
		this.trinrepay = trinrepay;
	}

	// Property accessors

	public Integer getTrid() {
		return this.trid;
	}

	public void setTrid(Integer trid) {
		this.trid = trid;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getDrid() {
		return this.drid;
	}

	public void setDrid(Integer drid) {
		this.drid = drid;
	}

	public Double getTrrout() {
		return this.trrout;
	}

	public void setTrrout(Double trrout) {
		this.trrout = trrout;
	}

	public Date getTrdate() {
		return this.trdate;
	}

	public void setTrdate(Date trdate) {
		this.trdate = trdate;
	}

	public Double getRealvalue() {
		return this.realvalue;
	}

	public void setRealvalue(Double realvalue) {
		this.realvalue = realvalue;
	}

	public String getTrstate() {
		return this.trstate;
	}

	public void setTrstate(String trstate) {
		this.trstate = trstate;
	}

	public Double getTrinrepay() {
		return this.trinrepay;
	}

	public void setTrinrepay(Double trinrepay) {
		this.trinrepay = trinrepay;
	}

}