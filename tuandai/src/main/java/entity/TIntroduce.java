package entity;

public class TIntroduce {
	
	private Integer inid; //介绍Id
	private Integer intype; //介绍表类型
	private String indescribe; //介绍表描述
	private String tistmoney;  //介绍表用途
	private String tisurmoney; //介绍表评估
	private String tireperiod; //介绍表保障
	private String tiinterest; //介绍表报告
	
	
	public TIntroduce() {
	}


	public TIntroduce(Integer inid, Integer intype, String indescribe,
			String tistmoney, String tisurmoney, String tireperiod,
			String tiinterest) {
		this.inid = inid;
		this.intype = intype;
		this.indescribe = indescribe;
		this.tistmoney = tistmoney;
		this.tisurmoney = tisurmoney;
		this.tireperiod = tireperiod;
		this.tiinterest = tiinterest;
	}


	public Integer getInid() {
		return inid;
	}


	public void setInid(Integer inid) {
		this.inid = inid;
	}


	public Integer getIntype() {
		return intype;
	}


	public void setIntype(Integer intype) {
		this.intype = intype;
	}


	public String getIndescribe() {
		return indescribe;
	}


	public void setIndescribe(String indescribe) {
		this.indescribe = indescribe;
	}


	public String getTistmoney() {
		return tistmoney;
	}


	public void setTistmoney(String tistmoney) {
		this.tistmoney = tistmoney;
	}


	public String getTisurmoney() {
		return tisurmoney;
	}


	public void setTisurmoney(String tisurmoney) {
		this.tisurmoney = tisurmoney;
	}


	public String getTireperiod() {
		return tireperiod;
	}


	public void setTireperiod(String tireperiod) {
		this.tireperiod = tireperiod;
	}


	public String getTiinterest() {
		return tiinterest;
	}


	public void setTiinterest(String tiinterest) {
		this.tiinterest = tiinterest;
	}


	@Override
	public String toString() {
		return "TIntroduce [inid=" + inid + ", intype=" + intype
				+ ", indescribe=" + indescribe + ", tistmoney=" + tistmoney
				+ ", tisurmoney=" + tisurmoney + ", tireperiod=" + tireperiod
				+ ", tiinterest=" + tiinterest + "]";
	}

}
