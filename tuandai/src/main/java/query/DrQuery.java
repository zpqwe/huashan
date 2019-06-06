package query;

import java.util.Date;

public class DrQuery {
	private Integer pageNo=1;
	private Integer pageSize=5;
	private Integer pageNow;
	private String drtype;
	private String drdtype;
	private String startTime;
	private String endTime;
	private Integer userId;

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
	public Integer getPageNow() {
		return (pageNo-1)*pageSize;
	}
	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getDrtype() {
		return drtype;
	}
	public void setDrtype(String drtype) {
		this.drtype = drtype;
	}
	public String getDrdtype() {
		return drdtype;
	}
	public void setDrdtype(String drdtype) {
		this.drdtype = drdtype;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	
}
