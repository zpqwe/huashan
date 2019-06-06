package entity;

import java.sql.Timestamp;

/**
 * TTitem entity. @author MyEclipse Persistence Tools
 */

public class TTitem implements java.io.Serializable {

	// Fields
	private Integer tiid;//周转Id
	private Integer userid;//会员Id
	private String tititle;//周转编号
	private Integer siiid;//散标Id
	private Double timoney;//转让总额
	private Double tistmoney;//起投金额
	private Double tisurmoney;//剩余金额
	private String tireperiod;//剩余（天数）期限
	private Double tiinterest;//周转利率
	private Timestamp tiretime;//发布时间
	private Integer tiremethod;//还款方式
	private Integer tiincondition;//投资人条件
	private String titype;//周转项目状态
	private Integer tiintroduceid;//介绍表Id
	
	private TIntroduce tintroduce; // TIntroduce表属性
	
	
	
	
	public TTitem() {
	}

	public TTitem(Integer tiid, Integer userid, String tititle, Integer siiid,
			Double timoney, Double tistmoney, Double tisurmoney,
			String tireperiod, Double tiinterest, Timestamp tiretime,
			Integer tiremethod, Integer tiincondition, String titype,
			Integer tiintroduceid, TIntroduce tintroduce) {
		this.tiid = tiid;
		this.userid = userid;
		this.tititle = tititle;
		this.siiid = siiid;
		this.timoney = timoney;
		this.tistmoney = tistmoney;
		this.tisurmoney = tisurmoney;
		this.tireperiod = tireperiod;
		this.tiinterest = tiinterest;
		this.tiretime = tiretime;
		this.tiremethod = tiremethod;
		this.tiincondition = tiincondition;
		this.titype = titype;
		this.tiintroduceid = tiintroduceid;
		this.tintroduce = tintroduce;
	}



	public TTitem(Integer tiid, Integer userid, String tititle, Integer siiid, Double timoney, Double tistmoney,
			Double tisurmoney, String tireperiod, Double tiinterest, Timestamp tiretime, Integer tiremethod,
			Integer tiincondition, String titype, Integer tiintroduceid) {
		this.tiid = tiid;
		this.userid = userid;
		this.tititle = tititle;
		this.siiid = siiid;
		this.timoney = timoney;
		this.tistmoney = tistmoney;
		this.tisurmoney = tisurmoney;
		this.tireperiod = tireperiod;
		this.tiinterest = tiinterest;
		this.tiretime = tiretime;
		this.tiremethod = tiremethod;
		this.tiincondition = tiincondition;
		this.titype = titype;
		this.tiintroduceid = tiintroduceid;
	}
	
	
	


	

	


	public TIntroduce getTintroduce() {
		return tintroduce;
	}



	

	public void setTintroduce(TIntroduce tintroduce) {
		this.tintroduce = tintroduce;
	}



	public Integer getTiid() {
		return tiid;
	}
	public void setTiid(Integer tiid) {
		this.tiid = tiid;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getTititle() {
		return tititle;
	}
	public void setTititle(String tititle) {
		this.tititle = tititle;
	}
	public Integer getSiiid() {
		return siiid;
	}
	public void setSiiid(Integer siiid) {
		this.siiid = siiid;
	}
	public Double getTimoney() {
		return timoney;
	}
	public void setTimoney(Double timoney) {
		this.timoney = timoney;
	}
	public Double getTistmoney() {
		return tistmoney;
	}
	public void setTistmoney(Double tistmoney) {
		this.tistmoney = tistmoney;
	}
	public Double getTisurmoney() {
		return tisurmoney;
	}
	public void setTisurmoney(Double tisurmoney) {
		this.tisurmoney = tisurmoney;
	}
	public String getTireperiod() {
		return tireperiod;
	}
	public void setTireperiod(String tireperiod) {
		this.tireperiod = tireperiod;
	}
	public Double getTiinterest() {
		return tiinterest;
	}
	public void setTiinterest(Double tiinterest) {
		this.tiinterest = tiinterest;
	}
	public Timestamp getTiretime() {
		return tiretime;
	}
	public void setTiretime(Timestamp tiretime) {
		this.tiretime = tiretime;
	}
	public Integer getTiremethod() {
		return tiremethod;
	}
	public void setTiremethod(Integer tiremethod) {
		this.tiremethod = tiremethod;
	}
	public Integer getTiincondition() {
		return tiincondition;
	}
	public void setTiincondition(Integer tiincondition) {
		this.tiincondition = tiincondition;
	}
	public String getTitype() {
		return titype;
	}
	public void setTitype(String titype) {
		this.titype = titype;
	}
	public Integer getTiintroduceid() {
		return tiintroduceid;
	}
	public void setTiintroduceid(Integer tiintroduceid) {
		this.tiintroduceid = tiintroduceid;
	}

	@Override
	public String toString() {
		return "TTitem [tiid=" + tiid + ", userid=" + userid + ", tititle=" + tititle + ", siiid=" + siiid
				+ ", timoney=" + timoney + ", tistmoney=" + tistmoney + ", tisurmoney=" + tisurmoney + ", tireperiod="
				+ tireperiod + ", tiinterest=" + tiinterest + ", tiretime=" + tiretime + ", tiremethod=" + tiremethod
				+ ", tiincondition=" + tiincondition + ", titype=" + titype + ", tiintroduceid=" + tiintroduceid + "]";
	}
	
	
}