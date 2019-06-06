package query;

public class TUcAccountQuery {
	private Integer userid;
	private Integer qtmoney;
	private Integer upmoney;
	
	public Integer getUpmoney() {
		return upmoney;
	}
	public void setUpmoney(Integer upmoney) {
		this.upmoney = upmoney;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getQtmoney() {
		return qtmoney;
	}
	public void setQtmoney(Integer qtmoney) {
		this.qtmoney = qtmoney;
	}
	public TUcAccountQuery (){}
	public TUcAccountQuery(Integer userid, Integer qtmoney) {
		super();
		this.userid = userid;
		this.qtmoney = qtmoney;
	}
	
}
