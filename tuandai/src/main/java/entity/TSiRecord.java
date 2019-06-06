package entity;

import java.math.BigDecimal;
import java.util.Date;

/**
 * TSiRecord entity. @author MyEclipse Persistence Tools
 */

public class TSiRecord implements java.io.Serializable {

	private TSiItem tSiItem;
	private TUserData tUserData;
	public TUserData gettUserData() {
		return tUserData;
	}

	public void settUserData(TUserData tUserData) {
		this.tUserData = tUserData;
	}

	public TSiItem gettSiItem() {
		return tSiItem;
	}

	public void settSiItem(TSiItem tSiItem) {
		this.tSiItem = tSiItem;
	}

	private Integer sirid;
	private Integer drid;
	private Integer userid;
	private Double sirinmoney;
	private String sirmethod;
	private Date sirdate;
	private String sirstate;
	private Integer sirisfinish;
	private Integer siiid;
	private BigDecimal sirreinst;
	private BigDecimal sirinst;
	public BigDecimal getSirreinst() {
		return sirreinst;
	}

	public void setSirreinst(BigDecimal sirreinst) {
		this.sirreinst = sirreinst;
	}

	public BigDecimal getSirinst() {
		return sirinst;
	}

	public void setSirinst(BigDecimal sirinst) {
		this.sirinst = sirinst;
	}

	/** default constructor */
	public TSiRecord() {
	}

	public TSiRecord(Integer sirid, Integer drid, Integer userid,
			Double sirinmoney, String sirmethod, Date sirdate, String sirstate,
			Integer sirisfinish, Integer siiid) {
		super();
		this.sirid = sirid;
		this.drid = drid;
		this.userid = userid;
		this.sirinmoney = sirinmoney;
		this.sirmethod = sirmethod;
		this.sirdate = sirdate;
		this.sirstate = sirstate;
		this.sirisfinish = sirisfinish;
		this.siiid = siiid;
	}

	public Integer getSiiid() {
		return siiid;
	}

	public void setSiiid(Integer siiid) {
		this.siiid = siiid;
	}

	/** full constructor */
	

	// Property accessors

	public Integer getSirid() {
		return this.sirid;
	}

	public void setSirid(Integer sirid) {
		this.sirid = sirid;
	}

	public Integer getDrid() {
		return this.drid;
	}

	public void setDrid(Integer drid) {
		this.drid = drid;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}



	public Double getSirinmoney() {
		return this.sirinmoney;
	}

	public void setSirinmoney(Double sirinmoney) {
		this.sirinmoney = sirinmoney;
	}

	public String getSirmethod() {
		return this.sirmethod;
	}

	public void setSirmethod(String sirmethod) {
		this.sirmethod = sirmethod;
	}

	public Date getSirdate() {
		return this.sirdate;
	}

	public void setSirdate(Date sirdate) {
		this.sirdate = sirdate;
	}

	public String getSirstate() {
		return this.sirstate;
	}

	public void setSirstate(String sirstate) {
		this.sirstate = sirstate;
	}

	public Integer getSirisfinish() {
		return this.sirisfinish;
	}

	public void setSirisfinish(Integer sirisfinish) {
		this.sirisfinish = sirisfinish;
	}

}