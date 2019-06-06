package entity;

import java.util.Date;

/**
 * TReceRecord entity. @author MyEclipse Persistence Tools
 */

public class TReceRecord implements java.io.Serializable {

	// Fields

	private Integer rrid;
	private String rrdate;
	private Double rrmoney;
	private Integer rrnumber;
	private Integer rrnownum;
	private Double rrinterest;
	private Double sirinmoney;
	private Integer drid;
	private Integer trid;
	private Integer sirid;
	private Double rrtotal;
	private Integer isfinish;
	private TSiItem item;
private TSiRecord tSiRecord;
	private Integer userid;
	
	
	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public TSiRecord gettSiRecord() {
		return tSiRecord;
	}

	public void settSiRecord(TSiRecord tSiRecord) {
		this.tSiRecord = tSiRecord;
	}
	public TReceRecord(){};

	// Constructors

	/** default constructor 
	 * @param double3 
	 * @param sirid2 
	 * @param double2 
	 * @param rrnownum2 
	 * @param double1 
	 * @param date */
	

	public TReceRecord(String rrdate, Double rrmoney, Integer rrnownum,
			Double rrinterest, Integer sirid, Double rrtotal) {
		super();
		this.rrdate = rrdate;
		this.rrmoney = rrmoney;
		this.rrnownum = rrnownum;
		this.rrinterest = rrinterest;
		this.sirid = sirid;
		this.rrtotal = rrtotal;
	}

	/** full constructor */
	public TReceRecord(String rrdate, Double rrmoney, Integer rrnumber,
			Integer drid, Integer trid, Integer sirid) {
		this.rrdate = rrdate;
		this.rrmoney = rrmoney;
		this.rrnumber = rrnumber;
		this.drid = drid;
		this.trid = trid;
		this.sirid = sirid;
	}

	// Property accessors

	public TReceRecord(Double rrmoney, Double rrtotal, Double rrinterest) {
		super();
		this.rrmoney = rrmoney;
		this.rrtotal = rrtotal;
		this.rrinterest = rrinterest;
	}
	
	
	
	public Integer getIsfinish() {
		return isfinish;
	}

	public void setIsfinish(Integer isfinish) {
		this.isfinish = isfinish;
	}

	public Integer getRrid() {
		return this.rrid;
	}

	

	public TSiItem getItem() {
		return item;
	}

	public void setItem(TSiItem item) {
		this.item = item;
	}

	public void setRrnownum(Integer rrnownum) {
		this.rrnownum = rrnownum;
	}

	public Double getRrtotal() {
		return rrtotal;
	}

	public void setRrtotal(Double rrtotal) {
		this.rrtotal = rrtotal;
	}

	public Integer getRrnownum() {
		return rrnownum;
	}

	public void setRrnownumber(Integer rrnownum) {
		this.rrnownum = rrnownum;
	}

	public Double getRrinterest() {
		return rrinterest;
	}

	public void setRrinterest(Double rrinterest) {
		this.rrinterest = rrinterest;
	}

	public Double getSirinmoney() {
		return sirinmoney;
	}

	public void setSirinmoney(Double sirinmoney) {
		this.sirinmoney = sirinmoney;
	}

	public void setRrid(Integer rrid) {
		this.rrid = rrid;
	}

	public String getRrdate() {
		return this.rrdate;
	}

	public void setRrdate(String rrdate) {
		this.rrdate = rrdate;
	}

	public Double getRrmoney() {
		return this.rrmoney;
	}

	public void setRrmoney(Double rrmoney) {
		this.rrmoney = rrmoney;
	}

	public Integer getRrnumber() {
		return this.rrnumber;
	}

	public void setRrnumber(Integer rrnumber) {
		this.rrnumber = rrnumber;
	}

	public Integer getDrid() {
		return this.drid;
	}

	public void setDrid(Integer drid) {
		this.drid = drid;
	}

	public Integer getTrid() {
		return this.trid;
	}

	public void setTrid(Integer trid) {
		this.trid = trid;
	}

	public Integer getSirid() {
		return this.sirid;
	}

	public void setSirid(Integer sirid) {
		this.sirid = sirid;
	}

}