package query;

public class MyQuery {
	private Integer pageNo=1;
	private Integer pageSize=5;
	private Integer from;
	public MyQuery(){}
	public MyQuery(Integer pageNo, Integer pageSize, Integer from) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.from = from;
	}
	public Integer getFrom() {
		return (pageNo-1)*pageSize;
	}
	public void setFrom(Integer from) {
		this.from = from;
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
