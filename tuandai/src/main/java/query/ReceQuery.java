package query;

import java.util.List;

import entity.TReceRecord;

public class ReceQuery {
	private Integer pageNo=1;
	private Integer pageSize=10;
	private Integer pageNow;
	private String startTime;
	private String endTime;
	private Integer month;
	private Integer week;
	private List<TReceRecord>record;
	private Integer userid;
	
	
	
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public List<TReceRecord> getRecord() {
		return record;
	}
	public void setRecord(List<TReceRecord> record) {
		this.record = record;
	}
	public Integer getWeek() {
		return week;
	}
	public void setWeek(Integer week) {
		this.week = week;
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
	public Integer getPageNow() {
		return (pageNo-1)*pageSize;
	}
	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
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
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	
	
}
