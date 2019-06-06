package entity;

/**
 * TBankcardtable entity. @author MyEclipse Persistence Tools
 */

public class TBankcardtable implements java.io.Serializable {

	// Fields

	private Long bankid;
	private Long userid;
	private String realName;
	private Long documenttype;
	private String idCardNo;
	private String bindingbankImage;
	private String cardNo;
	private String reservePhone;
	private String Transactionpassword;
	
	// Constructors

	public String getTransactionpassword() {
		return Transactionpassword;
	}

	public void setTransactionpassword(String transactionpassword) {
		Transactionpassword = transactionpassword;
	}

	/** default constructor */
	public TBankcardtable() {
	}

	/** full constructor */
	public TBankcardtable(Long userid, String realName, Long documenttype,
			String idCardNo, String bindingbankImage, String cardNo,
			String reservePhone,String Transactionpassword) {
		this.userid = userid;
		this.realName = realName;
		this.documenttype = documenttype;
		this.idCardNo = idCardNo;
		this.bindingbankImage = bindingbankImage;
		this.cardNo = cardNo;
		this.reservePhone = reservePhone;
		this.Transactionpassword=Transactionpassword;
	}

	// Property accessors

	public Long getBankid() {
		return this.bankid;
	}

	public void setBankid(Long bankid) {
		this.bankid = bankid;
	}

	public Long getUserid() {
		return this.userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Long getDocumenttype() {
		return this.documenttype;
	}

	public void setDocumenttype(Long documenttype) {
		this.documenttype = documenttype;
	}

	public String getIdCardNo() {
		return this.idCardNo;
	}

	public void setIdCardNo(String idCardNo) {
		this.idCardNo = idCardNo;
	}

	public String getBindingbankImage() {
		return this.bindingbankImage;
	}

	public void setBindingbankImage(String bindingbankImage) {
		this.bindingbankImage = bindingbankImage;
	}

	public String getCardNo() {
		return this.cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getReservePhone() {
		return this.reservePhone;
	}

	public void setReservePhone(String reservePhone) {
		this.reservePhone = reservePhone;
	}

}