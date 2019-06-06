package query;

public class RechWithQuery {
	public Integer pageNo=1;
	public Integer pageSize=10;
	public Integer index;
	public Integer userid;//用户id
	public String txtBegin;//开始时间
	public String txtEnd;//结束时间
	public String restate;//条件
	public String dindanh;//订单号
	
	public String getDindanh() {
		return dindanh;
	}
	public void setDindanh(String dindanh) {
		this.dindanh = dindanh;
	}
	public String getTxtBegin() {
		return txtBegin;
	}
	public void setTxtBegin(String txtBegin) {
		this.txtBegin = txtBegin;
	}
	public String getTxtEnd() {
		return txtEnd;
	}
	public void setTxtEnd(String txtEnd) {
		this.txtEnd = txtEnd;
	}
	public String getRestate() {
		return restate;
	}
	public void setRestate(String restate) {
		this.restate = restate;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getIndex() {
		return (pageNo-1)*pageSize;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public RechWithQuery(){
		
	}
	public RechWithQuery(Integer pageNo, Integer pageSize,String dindanh) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.dindanh=dindanh;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	

}
