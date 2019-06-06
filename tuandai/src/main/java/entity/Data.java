package entity;

public class Data {
	private Page page;
	private String totalAmount="0.00";
	private String totalMoney;
	private String totalInterest;
	private String result="0";
	private Integer dueComeNum=0;
	private LatelyLoanReturn loanReturn;
	
	
	
	public LatelyLoanReturn getLoanReturn() {
		return loanReturn;
	}
	public void setLoanReturn(LatelyLoanReturn loanReturn) {
		this.loanReturn = loanReturn;
	}
	public Integer getDueComeNum() {
		return dueComeNum;
	}
	public void setDueComeNum(Integer dueComeNum) {
		this.dueComeNum = dueComeNum;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(String totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getTotalInterest() {
		return totalInterest;
	}
	public void setTotalInterest(String totalInterest) {
		this.totalInterest = totalInterest;
	}
	
	
}
