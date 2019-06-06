package entity;

import java.sql.Timestamp;

/**
 * TRecharge entity. @author MyEclipse Persistence Tools
 */

public class TRecharge implements java.io.Serializable {

	// Fields

	private Integer reid;
	private Integer ucid;
	private Integer drid;
	private String remethod;
	private Double remoney;
	private Timestamp retime;
	private String restate;

	// Constructors

	/** default constructor */
	public TRecharge() {
	}

	/** full constructor */
	public TRecharge(Integer ucid, Integer drid, String remethod,
			Double remoney, Timestamp retime, String restate) {
		this.ucid = ucid;
		this.drid = drid;
		this.remethod = remethod;
		this.remoney = remoney;
		this.retime = retime;
		this.restate = restate;
	}

	// Property accessors

	public Integer getReid() {
		return this.reid;
	}

	public void setReid(Integer reid) {
		this.reid = reid;
	}

	public Integer getUcid() {
		return this.ucid;
	}

	public void setUcid(Integer ucid) {
		this.ucid = ucid;
	}

	public Integer getDrid() {
		return this.drid;
	}

	public void setDrid(Integer drid) {
		this.drid = drid;
	}

	public String getRemethod() {
		return this.remethod;
	}

	public void setRemethod(String remethod) {
		this.remethod = remethod;
	}

	public Double getRemoney() {
		return this.remoney;
	}

	public void setRemoney(Double remoney) {
		this.remoney = remoney;
	}

	public Timestamp getRetime() {
		return this.retime;
	}

	public void setRetime(Timestamp retime) {
		this.retime = retime;
	}

	public String getRestate() {
		return this.restate;
	}

	public void setRestate(String restate) {
		this.restate = restate;
	}

}