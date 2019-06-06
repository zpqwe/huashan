package entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * TSiItem entity. @author MyEclipse Persistence Tools
 */

public class TSiItem implements java.io.Serializable {

	// Fields
	private TBorrowerInfo tBorrowerInfo;
	public TBorrowerInfo gettBorrowerInfo() {
		return tBorrowerInfo;
	}

	public void settBorrowerInfo(TBorrowerInfo tBorrowerInfo) {
		this.tBorrowerInfo = tBorrowerInfo;
	}
	private Integer siiid;
	private Integer tiid;
	private Integer biid;
	private String siitype;
	private Double siitmoney;
	private Double siismoney;
	private Double siirmoney;
	private Integer siireturn;
	private Double siiairate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date siipubdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date siiresidue;
	private String siirepayment;
	private String siiicondition;
	private String siistate;
	private String siititle;
	private Date siifinishtime;
	// Constructors

	/** default constructor */
	public TSiItem() {
	}
	public Date getSiifinishtime() {
		return siifinishtime;
	}

	public void setSiifinishtime(Date siifinishtime) {
		this.siifinishtime = siifinishtime;
	}
	/** full constructor */
	public TSiItem(Integer tiid, Integer biid, String siitype,
			Double siitmoney, Double siismoney, Double siirmoney,
			Integer siireturn, Double siiairate, Date siipubdate,
			Date siiresidue, String siirepayment, String siiicondition,
			String siistate, String siititle) {
		this.tiid = tiid;
		this.biid = biid;
		this.siitype = siitype;
		this.siitmoney = siitmoney;
		this.siismoney = siismoney;
		this.siirmoney = siirmoney;
		this.siireturn = siireturn;
		this.siiairate = siiairate;
		this.siipubdate = siipubdate;
		this.siiresidue = siiresidue;
		this.siirepayment = siirepayment;
		this.siiicondition = siiicondition;
		this.siistate = siistate;
		this.siititle = siititle;
	}

	public Integer getSiiid() {
		return siiid;
	}

	public void setSiiid(Integer siiid) {
		this.siiid = siiid;
	}

	public Integer getTiid() {
		return tiid;
	}

	public void setTiid(Integer tiid) {
		this.tiid = tiid;
	}

	public Integer getBiid() {
		return biid;
	}

	public void setBiid(Integer biid) {
		this.biid = biid;
	}

	public String getSiitype() {
		return siitype;
	}

	public void setSiitype(String siitype) {
		this.siitype = siitype;
	}

	public Double getSiitmoney() {
		return siitmoney;
	}

	public void setSiitmoney(Double siitmoney) {
		this.siitmoney = siitmoney;
	}

	public Double getSiismoney() {
		return siismoney;
	}

	public void setSiismoney(Double siismoney) {
		this.siismoney = siismoney;
	}

	public Double getSiirmoney() {
		return siirmoney;
	}

	public void setSiirmoney(Double siirmoney) {
		this.siirmoney = siirmoney;
	}

	public Integer getSiireturn() {
		return siireturn;
	}

	public void setSiireturn(Integer siireturn) {
		this.siireturn = siireturn;
	}

	public Double getSiiairate() {
		return siiairate;
	}

	public void setSiiairate(Double siiairate) {
		this.siiairate = siiairate;
	}

	public Date getSiipubdate() {
		return siipubdate;
	}

	public void setSiipubdate(Date siipubdate) {
		this.siipubdate = siipubdate;
	}

	public Date getSiiresidue() {
		return siiresidue;
	}

	public void setSiiresidue(Date siiresidue) {
		this.siiresidue = siiresidue;
	}

	public String getSiirepayment() {
		return siirepayment;
	}

	public void setSiirepayment(String siirepayment) {
		this.siirepayment = siirepayment;
	}

	public String getSiiicondition() {
		return siiicondition;
	}

	public void setSiiicondition(String siiicondition) {
		this.siiicondition = siiicondition;
	}

	public String getSiistate() {
		return siistate;
	}

	public void setSiistate(String siistate) {
		this.siistate = siistate;
	}

	public String getSiititle() {
		return siititle;
	}

	public void setSiititle(String siititle) {
		this.siititle = siititle;
	}

	// Property accessors



}