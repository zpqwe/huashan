package entity;

import java.util.Date;

/**
 * TWithdrawCash entity. @author MyEclipse Persistence Tools
 */

public class TWithdrawCash implements java.io.Serializable {

	// Fields

	private Integer wcid;
	private Integer drid;
	private Integer ucid;
	private String wcnumber;
	private Date wctime;
	private Double wcmoney;
	private String wcstate;
	private String wcresult;
	private String wcmode;

	// Constructors

	public String getWcmode() {
		return wcmode;
	}

	public void setWcmode(String wcmode) {
		this.wcmode = wcmode;
	}

	public TWithdrawCash(Integer wcid, Integer drid, Integer ucid,
			String wcnumber, Date wctime, Double wcmoney, String wcstate,
			String wcresult, String wcmode) {
		super();
		this.wcid = wcid;
		this.drid = drid;
		this.ucid = ucid;
		this.wcnumber = wcnumber;
		this.wctime = wctime;
		this.wcmoney = wcmoney;
		this.wcstate = wcstate;
		this.wcresult = wcresult;
		this.wcmode = wcmode;
	}

	/** default constructor */
	public TWithdrawCash() {
	}

	/** full constructor */
	public TWithdrawCash(Integer drid, Integer ucid, String wcnumber,
			Date wctime, Double wcmoney, String wcstate, String wcresult) {
		this.drid = drid;
		this.ucid = ucid;
		this.wcnumber = wcnumber;
		this.wctime = wctime;
		this.wcmoney = wcmoney;
		this.wcstate = wcstate;
		this.wcresult = wcresult;
	}

	// Property accessors

	public Integer getWcid() {
		return this.wcid;
	}

	public void setWcid(Integer wcid) {
		this.wcid = wcid;
	}

	public Integer getDrid() {
		return this.drid;
	}

	public void setDrid(Integer drid) {
		this.drid = drid;
	}

	public Integer getUcid() {
		return this.ucid;
	}

	public void setUcid(Integer ucid) {
		this.ucid = ucid;
	}

	public String getWcnumber() {
		return this.wcnumber;
	}

	public void setWcnumber(String wcnumber) {
		this.wcnumber = wcnumber;
	}

	public Date getWctime() {
		return this.wctime;
	}

	public void setWctime(Date wctime) {
		this.wctime = wctime;
	}

	public Double getWcmoney() {
		return this.wcmoney;
	}

	public void setWcmoney(Double wcmoney) {
		this.wcmoney = wcmoney;
	}

	public String getWcstate() {
		return this.wcstate;
	}

	public void setWcstate(String wcstate) {
		this.wcstate = wcstate;
	}

	public String getWcresult() {
		return this.wcresult;
	}

	public void setWcresult(String wcresult) {
		this.wcresult = wcresult;
	}

}