package entity;

import java.sql.Timestamp;

/**
 * TDealRecord entity. @author MyEclipse Persistence Tools
 */
public class TDealRecord implements java.io.Serializable {
	// Fields
	private Integer drid;
	private Integer userid;
	private String drdate;
	private String drdtype;
	private String drexpenditure;
	private String drincome;
	private String drbalance;
	private String drexplain;
	// Constructors
	/** default constructor */
	public TDealRecord() {
	}

	/** minimal constructor */
	public TDealRecord(Integer drid) {
		this.drid = drid;
	}

	/** full constructor */
	public TDealRecord(Integer drid, Integer userid, String drdate,
			String drdtype, String drexpenditure, String drincome,
			String drbalance, String drexplain) {
		this.drid = drid;
		this.userid = userid;
		this.drdate = drdate;
		this.drdtype = drdtype;
		this.drexpenditure = drexpenditure;
		this.drincome = drincome;
		this.drbalance = drbalance;
		this.drexplain = drexplain;
	}
	
	

	// Property accessors

	public TDealRecord(Integer userid, String drdtype, String drincome,
			String drbalance, String drexplain) {
		super();
		this.userid = userid;
		this.drdtype = drdtype;
		this.drincome = drincome;
		this.drbalance = drbalance;
		this.drexplain = drexplain;
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

	public String getDrdate() {
		return this.drdate;
	}

	public void setDrdate(String drdate) {
		this.drdate = drdate;
	}

	public String getDrdtype() {
		return this.drdtype;
	}

	public void setDrdtype(String drdtype) {
		this.drdtype = drdtype;
	}

	public String getDrexpenditure() {
		
		return this.drexpenditure;
	}

	public void setDrexpenditure(String drexpenditure) {
		this.drexpenditure = drexpenditure;
	}

	public String getDrincome() {
	
		return this.drincome;
	}

	public void setDrincome(String drincome) {
		this.drincome = drincome;
	}

	public String getDrbalance() {
		return this.drbalance;
	}

	public void setDrbalance(String drbalance) {
		this.drbalance = drbalance;
	}

	public String getDrexplain() {
		return this.drexplain;
	}

	public void setDrexplain(String drexplain) {
		this.drexplain = drexplain;
	}

}