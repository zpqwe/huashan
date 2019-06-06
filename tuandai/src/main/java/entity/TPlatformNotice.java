package entity;

/**
 * TPlatformNotice entity. @author MyEclipse Persistence Tools
 */

public class TPlatformNotice implements java.io.Serializable {

	// Fields

	private Integer pnid;
	private String pntype;
	private String pncontent;

	// Constructors

	/** default constructor */
	public TPlatformNotice() {
	}

	/** full constructor */
	public TPlatformNotice(String pntype, String pncontent) {
		this.pntype = pntype;
		this.pncontent = pncontent;
	}

	// Property accessors

	public Integer getPnid() {
		return this.pnid;
	}

	public void setPnid(Integer pnid) {
		this.pnid = pnid;
	}

	public String getPntype() {
		return this.pntype;
	}

	public void setPntype(String pntype) {
		this.pntype = pntype;
	}

	public String getPncontent() {
		return this.pncontent;
	}

	public void setPncontent(String pncontent) {
		this.pncontent = pncontent;
	}

}