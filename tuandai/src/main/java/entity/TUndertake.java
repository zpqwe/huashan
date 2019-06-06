package entity;

import java.sql.Timestamp;

public class TUndertake {
	
	private Integer unid;			//承接Id
	private String untititle;		//转让表转让标题
	private String unuserphone;		//承接人
	private Double minundertake;	//最低承接
	private Double unmoney;			//承接总额
	private Double uninterest;		//承接时年化率
	private Integer unmode;			//投标方式
	private Timestamp untime;		//投标时间
	
	public TUndertake() {
	}

	public TUndertake(Integer unid, String untititle, String unuserphone, Double minundertake, Double unmoney,
			Double uninterest, Integer unmode, Timestamp untime) {
		this.unid = unid;
		this.untititle = untititle;
		this.unuserphone = unuserphone;
		this.minundertake = minundertake;
		this.unmoney = unmoney;
		this.uninterest = uninterest;
		this.unmode = unmode;
		this.untime = untime;
	}

	public Integer getUnid() {
		return unid;
	}

	public void setUnid(Integer unid) {
		this.unid = unid;
	}

	public String getUntititle() {
		return untititle;
	}

	public void setUntititle(String untititle) {
		this.untititle = untititle;
	}

	public String getUnuserphone() {
		return unuserphone;
	}

	public void setUnuserphone(String unuserphone) {
		this.unuserphone = unuserphone;
	}

	public Double getMinundertake() {
		return minundertake;
	}

	public void setMinundertake(Double minundertake) {
		this.minundertake = minundertake;
	}

	public Double getUnmoney() {
		return unmoney;
	}

	public void setUnmoney(Double unmoney) {
		this.unmoney = unmoney;
	}

	public Double getUninterest() {
		return uninterest;
	}

	public void setUninterest(Double uninterest) {
		this.uninterest = uninterest;
	}

	public Integer getUnmode() {
		return unmode;
	}

	public void setUnmode(Integer unmode) {
		this.unmode = unmode;
	}

	public Timestamp getUntime() {
		return untime;
	}

	public void setUntime(Timestamp untime) {
		this.untime = untime;
	}

	@Override
	public String toString() {
		return "TUndertake [unid=" + unid + ", untititle=" + untititle + ", unuserphone=" + unuserphone
				+ ", minundertake=" + minundertake + ", unmoney=" + unmoney + ", uninterest=" + uninterest + ", unmode="
				+ unmode + ", untime=" + untime + "]";
	}
	
	
	
}
