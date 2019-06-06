package query;

import java.math.BigDecimal;
import java.util.List;

public class TSiRecordQuery extends MyQuery{
	private Integer sirisfinish;
	private String sirstate;
	private Integer userid;
	private Integer sirid;
	private BigDecimal sirreinst;
	private BigDecimal sirinst;
	public BigDecimal getSirreinst() {
		return sirreinst;
	}

	public void setSirreinst(BigDecimal sirreinst) {
		this.sirreinst = sirreinst;
	}

	public BigDecimal getSirinst() {
		return sirinst;
	}

	public void setSirinst(BigDecimal sirinst) {
		this.sirinst = sirinst;
	}
	public Integer getSirid() {
		return sirid;
	}
	public void setSirid(Integer sirid) {
		this.sirid = sirid;
	}
	private List lists;
	
	public List getLists() {
		return lists;
	}
	public void setLists(List lists) {
		this.lists = lists;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public TSiRecordQuery(){}
	public TSiRecordQuery(Integer pageNo, Integer pageSize,Integer sirisfinish, 
			String sirstate,Integer userid,List lists) {
		super.setPageNo(pageNo);
		super.setPageSize(pageSize);
		this.sirisfinish = sirisfinish;
		this.sirstate = sirstate;
		this.userid = userid;
		this.lists = lists;
	}
	public Integer getSirisfinish() {
		return sirisfinish;
	}
	public void setSirisfinish(Integer sirisfinish) {
		this.sirisfinish = sirisfinish;
	}
	public String getSirstate() {
		return sirstate;
	}
	public void setSirstate(String sirstate) {
		this.sirstate = sirstate;
	}
	
}
