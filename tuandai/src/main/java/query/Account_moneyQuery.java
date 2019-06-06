package query;
//曾平
public class Account_moneyQuery {
	private String userid;
	private String sirstate;
	private String drexplain;
	
	public String getDrexplain() {
		return drexplain;
	}

	public void setDrexplain(String drexplain) {
		this.drexplain = drexplain;
	}

	public String getUserid() {
		return userid;
	}
	
	public String getSirstate() {
		return sirstate;
	}

	public void setSirstate(String sirstate) {
		this.sirstate = sirstate;
	}

	public Account_moneyQuery() {
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Account_moneyQuery(String userid, String sirstate, String drexplain) {
		super();
		this.userid = userid;
		this.sirstate = sirstate;
		this.drexplain = drexplain;
	}
	

}
