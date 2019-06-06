package entity;

import java.util.Date;

/**
 * TUserData entity. @author MyEclipse Persistence Tools
 */

public class TUserData implements java.io.Serializable {

	// Fields

	private Integer userid;
	private Integer tiid;
	private Integer ucid;
	private Integer siiid;
	private String username;
	private String password;
	private Integer usergrade;
	private String phone;
	private String truename;
	private String maxeducation;
	private String userugf;
	private String marriage;
	private String address;
	private String company;
	private String companysize;
	private String position;
	private String moincome;
	private String ishouse;
	private String isvehicle;
	private String udname;
	private String udphone;
	private String udnexus;
	private Date pubdate;
	private String tranpassword;
	private String backnumber;
	private String nickname;
	private String headimg;
	private TUcAccount tucacount;
	private char sex;
	private Integer state;
	
	// Constructors

	
	
	public char getSex() {
		return sex;
	}

	public void setSex(char sex) {
		this.sex = sex;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public TUcAccount getTucacount() {
		return tucacount;
	}

	public String getCompanysize() {
		return companysize;
	}

	public void setCompanysize(String companysize) {
		this.companysize = companysize;
	}

	public String getHeadimg() {
		return headimg;
	}

	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}

	public void setTucacount(TUcAccount tucacount) {
		this.tucacount = tucacount;
	}

	/** default constructor */
	public TUserData() {
	}

	/** minimal constructor */
	public TUserData(Integer userid) {
		this.userid = userid;
	}

	/** full constructor */
	public TUserData(Integer userid, Integer tiid, Integer ucid, Integer siiid,
			String username, String password, Integer usergrade, String phone,
			String truename, String maxeducation, String userugf,
			String marriage, String address, String company,
			String companySize, String position, String moincome,
			String ishouse, String isvehicle, String udname, String udphone,
			String udnexus, Date pubdate, String tranpassword, String backnumber,char sex,Integer state) {
		this.userid = userid;
		this.tiid = tiid;
		this.ucid = ucid;
		this.siiid = siiid;
		this.username = username;
		this.password = password;
		this.usergrade = usergrade;
		this.phone = phone;
		this.truename = truename;
		this.maxeducation = maxeducation;
		this.userugf = userugf;
		this.marriage = marriage;
		this.address = address;
		this.company = company;
		this.companysize = companysize;
		this.position = position;
		this.moincome = moincome;
		this.ishouse = ishouse;
		this.isvehicle = isvehicle;
		this.udname = udname;
		this.udphone = udphone;
		this.udnexus = udnexus;
		this.pubdate = pubdate;
		this.tranpassword = tranpassword;
		this.backnumber = backnumber;
		this.sex=sex;
		this.state=state;
	}

	// Property accessors

	
	

	public Integer getUserid() {
		return this.userid;
	}

	public TUserData(String username, String password, Integer usergrade,
			String phone, String nickname) {
		super();
		this.username = username;
		this.password = password;
		this.usergrade = usergrade;
		this.phone = phone;
		this.nickname = nickname;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getTiid() {
		return this.tiid;
	}

	public void setTiid(Integer tiid) {
		this.tiid = tiid;
	}

	public Integer getUcid() {
		return this.ucid;
	}

	public void setUcid(Integer ucid) {
		this.ucid = ucid;
	}

	public Integer getSiiid() {
		return this.siiid;
	}

	public void setSiiid(Integer siiid) {
		this.siiid = siiid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getUsergrade() {
		return this.usergrade;
	}

	public void setUsergrade(Integer usergrade) {
		this.usergrade = usergrade;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTruename() {
		return this.truename;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}

	public String getMaxeducation() {
		return this.maxeducation;
	}

	public void setMaxeducation(String maxeducation) {
		this.maxeducation = maxeducation;
	}

	public String getUserugf() {
		return this.userugf;
	}

	public void setUserugf(String userugf) {
		this.userugf = userugf;
	}

	public String getMarriage() {
		return this.marriage;
	}

	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCompanySize() {
		return this.companysize;
	}

	public void setCompanySize(String companysize) {
		this.companysize = companysize;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getMoincome() {
		return this.moincome;
	}

	public void setMoincome(String moincome) {
		this.moincome = moincome;
	}

	public String getIshouse() {
		return this.ishouse;
	}

	public void setIshouse(String ishouse) {
		this.ishouse = ishouse;
	}

	public String getIsvehicle() {
		return this.isvehicle;
	}

	public void setIsvehicle(String isvehicle) {
		this.isvehicle = isvehicle;
	}

	public String getUdname() {
		return this.udname;
	}

	public void setUdname(String udname) {
		this.udname = udname;
	}

	public String getUdphone() {
		return this.udphone;
	}

	public void setUdphone(String udphone) {
		this.udphone = udphone;
	}

	public String getUdnexus() {
		return this.udnexus;
	}

	public void setUdnexus(String udnexus) {
		this.udnexus = udnexus;
	}

	public Date getPubdate() {
		return this.pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public String getTranpassword() {
		return this.tranpassword;
	}

	public void setTranpassword(String tranpassword) {
		this.tranpassword = tranpassword;
	}

	public String getBacknumber() {
		return this.backnumber;
	}

	public void setBacknumber(String backnumber) {
		this.backnumber = backnumber;
	}

}