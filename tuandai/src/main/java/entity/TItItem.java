package entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * TItItem entity. @author MyEclipse Persistence Tools
 */

public class TItItem implements java.io.Serializable {

	// Fields

	private Integer itiid;
	private Integer userid;
	private String itititle;
	private Double ititrmoney;
	private Double itidisprice;
	private Double itisapai;
	private Double itisatp;
	private Date itidanp;
	private Integer itihp;
	private Timestamp itistime;
	private Double itioutinterest;
	private String itiplan;

	// Constructors

	/** default constructor */
	public TItItem() {
	}

	/** full constructor */
	public TItItem(Integer userid, String itititle, Double ititrmoney,
			Double itidisprice, Double itisapai, Double itisatp, Date itidanp,
			Integer itihp, Timestamp itistime, Double itioutinterest,
			String itiplan) {
		this.userid = userid;
		this.itititle = itititle;
		this.ititrmoney = ititrmoney;
		this.itidisprice = itidisprice;
		this.itisapai = itisapai;
		this.itisatp = itisatp;
		this.itidanp = itidanp;
		this.itihp = itihp;
		this.itistime = itistime;
		this.itioutinterest = itioutinterest;
		this.itiplan = itiplan;
	}

	// Property accessors

	public Integer getItiid() {
		return this.itiid;
	}

	public void setItiid(Integer itiid) {
		this.itiid = itiid;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getItititle() {
		return this.itititle;
	}

	public void setItititle(String itititle) {
		this.itititle = itititle;
	}

	public Double getItitrmoney() {
		return this.ititrmoney;
	}

	public void setItitrmoney(Double ititrmoney) {
		this.ititrmoney = ititrmoney;
	}

	public Double getItidisprice() {
		return this.itidisprice;
	}

	public void setItidisprice(Double itidisprice) {
		this.itidisprice = itidisprice;
	}

	public Double getItisapai() {
		return this.itisapai;
	}

	public void setItisapai(Double itisapai) {
		this.itisapai = itisapai;
	}

	public Double getItisatp() {
		return this.itisatp;
	}

	public void setItisatp(Double itisatp) {
		this.itisatp = itisatp;
	}

	public Date getItidanp() {
		return this.itidanp;
	}

	public void setItidanp(Date itidanp) {
		this.itidanp = itidanp;
	}

	public Integer getItihp() {
		return this.itihp;
	}

	public void setItihp(Integer itihp) {
		this.itihp = itihp;
	}

	public Timestamp getItistime() {
		return this.itistime;
	}

	public void setItistime(Timestamp itistime) {
		this.itistime = itistime;
	}

	public Double getItioutinterest() {
		return this.itioutinterest;
	}

	public void setItioutinterest(Double itioutinterest) {
		this.itioutinterest = itioutinterest;
	}

	public String getItiplan() {
		return this.itiplan;
	}

	public void setItiplan(String itiplan) {
		this.itiplan = itiplan;
	}

}