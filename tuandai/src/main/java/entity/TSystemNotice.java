package entity;

import java.util.Date;

/**
 * TSystemNoticeId entity. @author MyEclipse Persistence Tools
 */

public class TSystemNotice implements java.io.Serializable {

	// Fields

	private Integer userid;
	private Integer snid;
	private String sntype;
	private String sntitle;
	private String sncontent;
	private Date snpubdate;

	// Constructors

	/** default constructor */
	public TSystemNotice() {
	}

	/** full constructor */
	public TSystemNotice(Integer userid, Integer snid, String sntype,
			String sntitle, String sncontent, Date snpubdate) {
		this.userid = userid;
		this.snid = snid;
		this.sntype = sntype;
		this.sntitle = sntitle;
		this.sncontent = sncontent;
		this.snpubdate = snpubdate;
	}

	// Property accessors

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getSnid() {
		return this.snid;
	}

	public void setSnid(Integer snid) {
		this.snid = snid;
	}

	public String getSntype() {
		return this.sntype;
	}

	public void setSntype(String sntype) {
		this.sntype = sntype;
	}

	public String getSntitle() {
		return this.sntitle;
	}

	public void setSntitle(String sntitle) {
		this.sntitle = sntitle;
	}

	public String getSncontent() {
		return this.sncontent;
	}

	public void setSncontent(String sncontent) {
		this.sncontent = sncontent;
	}

	public Date getSnpubdate() {
		return this.snpubdate;
	}

	public void setSnpubdate(Date snpubdate) {
		this.snpubdate = snpubdate;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TSystemNotice))
			return false;
		TSystemNotice castOther = (TSystemNotice) other;

		return ((this.getUserid() == castOther.getUserid()) || (this
				.getUserid() != null && castOther.getUserid() != null && this
				.getUserid().equals(castOther.getUserid())))
				&& ((this.getSnid() == castOther.getSnid()) || (this.getSnid() != null
						&& castOther.getSnid() != null && this.getSnid()
						.equals(castOther.getSnid())))
				&& ((this.getSntype() == castOther.getSntype()) || (this
						.getSntype() != null && castOther.getSntype() != null && this
						.getSntype().equals(castOther.getSntype())))
				&& ((this.getSntitle() == castOther.getSntitle()) || (this
						.getSntitle() != null && castOther.getSntitle() != null && this
						.getSntitle().equals(castOther.getSntitle())))
				&& ((this.getSncontent() == castOther.getSncontent()) || (this
						.getSncontent() != null
						&& castOther.getSncontent() != null && this
						.getSncontent().equals(castOther.getSncontent())))
				&& ((this.getSnpubdate() == castOther.getSnpubdate()) || (this
						.getSnpubdate() != null
						&& castOther.getSnpubdate() != null && this
						.getSnpubdate().equals(castOther.getSnpubdate())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getUserid() == null ? 0 : this.getUserid().hashCode());
		result = 37 * result
				+ (getSnid() == null ? 0 : this.getSnid().hashCode());
		result = 37 * result
				+ (getSntype() == null ? 0 : this.getSntype().hashCode());
		result = 37 * result
				+ (getSntitle() == null ? 0 : this.getSntitle().hashCode());
		result = 37 * result
				+ (getSncontent() == null ? 0 : this.getSncontent().hashCode());
		result = 37 * result
				+ (getSnpubdate() == null ? 0 : this.getSnpubdate().hashCode());
		return result;
	}

}