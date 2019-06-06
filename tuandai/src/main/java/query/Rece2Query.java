package query;

import java.util.Date;

public class Rece2Query {
	private String[] rrtotal;
	private String[] rrinterest;
	private String[] rrmoney; 
	private Integer rrnownum;
	private Date rrdate;
	private Integer sirid;
	private Integer rrid;
	
	public Integer getRrid() {
		return rrid;
	}

	public void setRrid(Integer rrid) {
		this.rrid = rrid;
	}

	public Rece2Query() {}
	
	public Rece2Query(String[] rrtotal, String[] rrinterest, String[] rrmoney,
			Integer rrnownum, Date rrdate, Integer sirid) {
		super();
		this.rrtotal = rrtotal;
		this.rrinterest = rrinterest;
		this.rrmoney = rrmoney;
		this.rrnownum = rrnownum;
		this.rrdate = rrdate;
		this.sirid = sirid;
	}

	public String[] getRrtotal() {
		return rrtotal;
	}
	public void setRrtotal(String[] rrtotal) {
		this.rrtotal = rrtotal;
	}
	public String[] getRrinterest() {
		return rrinterest;
	}
	public void setRrinterest(String[] rrinterest) {
		this.rrinterest = rrinterest;
	}
	public String[] getRrmoney() {
		return rrmoney;
	}
	public void setRrmoney(String[] rrmoney) {
		this.rrmoney = rrmoney;
	}
	public Integer getRrnownum() {
		return rrnownum;
	}
	public void setRrnownum(Integer rrnownum) {
		this.rrnownum = rrnownum;
	}
	public Date getRrdate() {
		return rrdate;
	}
	public void setRrdate(Date rrdate) {
		this.rrdate = rrdate;
	}
	public Integer getSirid() {
		return sirid;
	}
	public void setSirid(Integer sirid) {
		this.sirid = sirid;
	}
}
