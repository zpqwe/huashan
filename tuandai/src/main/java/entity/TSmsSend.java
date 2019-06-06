package entity;

/**
 * TSmsSend entity. @author MyEclipse Persistence Tools
 */

public class TSmsSend implements java.io.Serializable {

	// Fields

	private Integer smsid;
	private Integer userid;
	private String smscontent;
	private Integer smstype;
	private Integer smsnumber;
	private String smssendtime;
	private String smsdistime;

	// Constructors

	/** default constructor */
	public TSmsSend() {
	}

	/** full constructor */
	public TSmsSend(Integer userid, String smscontent, Integer smstype,
			Integer smsnumber, String smssendtime, String smsdistime) {
		this.userid = userid;
		this.smscontent = smscontent;
		this.smstype = smstype;
		this.smsnumber = smsnumber;
		this.smssendtime = smssendtime;
		this.smsdistime = smsdistime;
	}

	// Property accessors

	public Integer getSmsid() {
		return this.smsid;
	}

	public void setSmsid(Integer smsid) {
		this.smsid = smsid;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getSmscontent() {
		return this.smscontent;
	}

	public void setSmscontent(String smscontent) {
		this.smscontent = smscontent;
	}

	public Integer getSmstype() {
		return this.smstype;
	}

	public void setSmstype(Integer smstype) {
		this.smstype = smstype;
	}

	public Integer getSmsnumber() {
		return this.smsnumber;
	}

	public void setSmsnumber(Integer smsnumber) {
		this.smsnumber = smsnumber;
	}

	public String getSmssendtime() {
		return this.smssendtime;
	}

	public void setSmssendtime(String smssendtime) {
		this.smssendtime = smssendtime;
	}

	public String getSmsdistime() {
		return this.smsdistime;
	}

	public void setSmsdistime(String smsdistime) {
		this.smsdistime = smsdistime;
	}

}