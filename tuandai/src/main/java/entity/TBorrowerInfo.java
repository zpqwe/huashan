package entity;

/**
 * TBorrowerInfo entity. @author MyEclipse Persistence Tools
 */

public class TBorrowerInfo implements java.io.Serializable {

	// Fields

	private Integer biid;
	private String biname;
	private String bitype;
	private Integer biage;
	private String biphone;
	private Integer bisex;
	private String biindustry;
	private Double biliab;
	private String biincome;
	private String bihousing;
	private String biloan;
	private String bioverdue;
	private String bicity;
	private String bimarriage;
	public String getBimarriage() {
		return bimarriage;
	}

	public void setBimarriage(String bimarriage) {
		this.bimarriage = bimarriage;
	}

	// Constructors

	public String getBicity() {
		return bicity;
	}

	public void setBicity(String bicity) {
		this.bicity = bicity;
	}

	/** default constructor */
	public TBorrowerInfo() {
	}

	/** full constructor */
	public TBorrowerInfo(String biname, String bitype, Integer biage,
			String biphone, Integer bisex, String biindustry, Double biliab,
			String biincome, String bihousing, String biloan, String bioverdue,String bicity,String bimarriage) {
		this.biname = biname;
		this.bitype = bitype;
		this.biage = biage;
		this.biphone = biphone;
		this.bisex = bisex;
		this.biindustry = biindustry;
		this.biliab = biliab;
		this.biincome = biincome;
		this.bihousing = bihousing;
		this.biloan = biloan;
		this.bioverdue = bioverdue;
		this.bicity = bicity;
		this.bimarriage =bimarriage;
	}

	// Property accessors

	public Integer getBiid() {
		return this.biid;
	}

	public void setBiid(Integer biid) {
		this.biid = biid;
	}

	public String getBiname() {
		return this.biname;
	}

	public void setBiname(String biname) {
		this.biname = biname;
	}

	public String getBitype() {
		return this.bitype;
	}

	public void setBitype(String bitype) {
		this.bitype = bitype;
	}

	public Integer getBiage() {
		return this.biage;
	}

	public void setBiage(Integer biage) {
		this.biage = biage;
	}

	public String getBiphone() {
		return this.biphone;
	}

	public void setBiphone(String biphone) {
		this.biphone = biphone;
	}

	public Integer getBisex() {
		return this.bisex;
	}

	public void setBisex(Integer bisex) {
		this.bisex = bisex;
	}

	public String getBiindustry() {
		return this.biindustry;
	}

	public void setBiindustry(String biindustry) {
		this.biindustry = biindustry;
	}

	public Double getBiliab() {
		return this.biliab;
	}

	public void setBiliab(Double biliab) {
		this.biliab = biliab;
	}

	public String getBiincome() {
		return this.biincome;
	}

	public void setBiincome(String biincome) {
		this.biincome = biincome;
	}

	public String getBihousing() {
		return this.bihousing;
	}

	public void setBihousing(String bihousing) {
		this.bihousing = bihousing;
	}

	public String getBiloan() {
		return this.biloan;
	}

	public void setBiloan(String biloan) {
		this.biloan = biloan;
	}

	public String getBioverdue() {
		return this.bioverdue;
	}

	public void setBioverdue(String bioverdue) {
		this.bioverdue = bioverdue;
	}

}