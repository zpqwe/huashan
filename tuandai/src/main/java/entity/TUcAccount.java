package entity;

import java.text.DecimalFormat;

/**
 * TUcAccount entity. @author MyEclipse Persistence Tools
 */

public class TUcAccount implements java.io.Serializable {

	// Fields
	DecimalFormat df = new DecimalFormat("#.00");
	private Integer ucid;
	private Integer userid;
	private Double ucavail;
	private Double ucwmoney;
	private Double ucinterest;
	private Double ucodraft;
	private Double ucmoney;
	private Double ucaccp;
	private Double ucfrcp;

	// Constructors

	/** default constructor */
	public TUcAccount() {
	}

	/** full constructor */
	public TUcAccount(Integer userid, Double ucavail, Double ucwmoney,
			Double ucinterest, Double ucodraft, Double ucmoney, Double ucaccp,
			Double ucfrcp) {
		this.userid = userid;
		this.ucavail = ucavail;
		this.ucwmoney = ucwmoney;
		this.ucinterest = ucinterest;
		this.ucodraft = ucodraft;
		this.ucmoney = ucmoney;
		this.ucaccp = ucaccp;
		this.ucfrcp = ucfrcp;
	}



	public TUcAccount(Integer userid, Double ucavail) {
		super();
		this.userid = userid;
		this.ucavail = ucavail;
	}

	public Integer getUcid() {
		return this.ucid;
	}

	public void setUcid(Integer ucid) {
		this.ucid = ucid;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Double getUcavail() {
		if(null==this.ucavail){
			this.ucavail=0.0;
		}
		return this.ucavail;
	}

	public void setUcavail(Double ucavail) {
		this.ucavail = ucavail;
	}

	public Double getUcwmoney() {
		return this.ucwmoney;
	}

	public void setUcwmoney(Double ucwmoney) {
		this.ucwmoney = ucwmoney;
	}

	public Double getUcinterest() {
		if(null==this.ucinterest){
			this.ucinterest=0.0;
		}
		return this.ucinterest;
	}

	public void setUcinterest(Double ucinterest) {
		this.ucinterest = ucinterest;
	}

	public Double getUcodraft() {
		return this.ucodraft;
	}

	public void setUcodraft(Double ucodraft) {
		this.ucodraft = ucodraft;
	}

	public Double getUcmoney() {
		return this.ucmoney;
	}

	public void setUcmoney(Double ucmoney) {
		this.ucmoney = ucmoney;
	}

	public Double getUcaccp() {
		return this.ucaccp;
	}

	public void setUcaccp(Double ucaccp) {
		this.ucaccp = ucaccp;
	}

	public Double getUcfrcp() {
		return this.ucfrcp;
	}

	public void setUcfrcp(Double ucfrcp) {
		this.ucfrcp = ucfrcp;
	}

}