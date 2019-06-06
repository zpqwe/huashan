package query;

public class TSiItemQuery extends MyQuery{
	private String siitype;
	private Integer siireturn;
	private Double siiairate;
	private String siirepayment;
	private Integer order;
	private Integer qtmoney;
	private Integer siiid;
	private Integer rmoney;
	private String siistate;
	

	public String getSiistate() {
		return siistate;
	}
	public void setSiistate(String siistate) {
		this.siistate = siistate;
	}
	public Integer getRmoney() {
		return rmoney;
	}
	public void setRmoney(Integer rmoney) {
		this.rmoney = rmoney;
	}
	public Integer getQtmoney() {
		return qtmoney;
	}
	public void setQtmoney(Integer qtmoney) {
		this.qtmoney = qtmoney;
	}
	public Integer getSiiid() {
		return siiid;
	}
	public void setSiiid(Integer siiid) {
		this.siiid = siiid;
	}
	public TSiItemQuery(){}
	public TSiItemQuery(Integer pageNo, Integer pageSize,String siitype, Integer siireturn, Double siiairate,
			String siirepayment,Integer order,Integer qtmoney,Integer siiid) {
		super.setPageNo(pageNo);
		super.setPageSize(pageSize);
		this.siitype = siitype;
		this.siireturn = siireturn;
		this.siiairate = siiairate;
		this.siirepayment = siirepayment;
		this.order = order;
		this.qtmoney = qtmoney;
		this.siiid = siiid;
	}
	public Integer getOrder() {
		return order;
	}
	public void setOrder(Integer order) {
		this.order = order;
	}
	public String getSiitype() {
		return siitype;
	}
	public void setSiitype(String siitype) {
		this.siitype = siitype;
	}
	public Integer getSiireturn() {
		return siireturn;
	}
	public void setSiireturn(Integer siireturn) {
		this.siireturn = siireturn;
	}
	public Double getSiiairate() {
		return siiairate;
	}
	public void setSiiairate(Double siiairate) {
		this.siiairate = siiairate;
	}
	public String getSiirepayment() {
		return siirepayment;
	}
	public void setSiirepayment(String siirepayment) {
		this.siirepayment = siirepayment;
	}
	
}
