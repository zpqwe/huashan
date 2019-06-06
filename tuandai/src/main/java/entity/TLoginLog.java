package entity;

import java.util.Date;

/**
 * TLoginLogId entity. @author MyEclipse Persistence Tools
 */

public class TLoginLog implements java.io.Serializable {

	// Fields

	private Integer userid;
	private Integer logid;
	private Date logindate;
	private String loginip;

	// Constructors

	/** default constructor */
	public TLoginLog() {
	}

	/** full constructor */
	public TLoginLog(Integer userid, Integer logid, Date logindate,
			String loginip) {
		this.userid = userid;
		this.logid = logid;
		this.logindate = logindate;
		this.loginip = loginip;
	}

	// Property accessors

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getLogid() {
		return this.logid;
	}

	public void setLogid(Integer logid) {
		this.logid = logid;
	}

	public Date getLogindate() {
		return this.logindate;
	}

	public void setLogindate(Date logindate) {
		this.logindate = logindate;
	}

	public String getLoginip() {
		return this.loginip;
	}

	public void setLoginip(String loginip) {
		this.loginip = loginip;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TLoginLog))
			return false;
		TLoginLog castOther = (TLoginLog) other;

		return ((this.getUserid() == castOther.getUserid()) || (this
				.getUserid() != null && castOther.getUserid() != null && this
				.getUserid().equals(castOther.getUserid())))
				&& ((this.getLogid() == castOther.getLogid()) || (this
						.getLogid() != null && castOther.getLogid() != null && this
						.getLogid().equals(castOther.getLogid())))
				&& ((this.getLogindate() == castOther.getLogindate()) || (this
						.getLogindate() != null
						&& castOther.getLogindate() != null && this
						.getLogindate().equals(castOther.getLogindate())))
				&& ((this.getLoginip() == castOther.getLoginip()) || (this
						.getLoginip() != null && castOther.getLoginip() != null && this
						.getLoginip().equals(castOther.getLoginip())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getUserid() == null ? 0 : this.getUserid().hashCode());
		result = 37 * result
				+ (getLogid() == null ? 0 : this.getLogid().hashCode());
		result = 37 * result
				+ (getLogindate() == null ? 0 : this.getLogindate().hashCode());
		result = 37 * result
				+ (getLoginip() == null ? 0 : this.getLoginip().hashCode());
		return result;
	}

}