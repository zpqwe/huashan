package service;

import java.math.BigDecimal;
import java.util.List;

import query.TSiItemQuery;
import query.TSiRecordQuery;
import entity.Page;
import entity.TSiRecord;

public interface TSiRecordService {
	public List<TSiRecord> getTSiRecordList(TSiRecordQuery tSiRecordQuery);
	public List<TSiRecord> getTSiRecord();
	public Integer getCounts(TSiRecordQuery tSiRecordQuery);
	public Page getPage(TSiRecordQuery tSiRecordQuery);
	public Integer getCountsByState(TSiRecordQuery tSiRecordQuery);
	public void addSirecord(TSiRecord tSiRecord);
	public List<TSiRecord> getTSiRecordListBySiiid(TSiItemQuery tSiItemQuery);
	public Integer getCountsBySiiid(TSiItemQuery tSiItemQuery);
	public Page getPageBySiiid(TSiItemQuery tsiItemQuery);
	
	public void updateSirreinst(TSiRecordQuery tSiRecordQuery);
	public void updateSirinst(TSiRecordQuery tSiRecordQuery);
	public void updateTSiRecord(TSiRecordQuery tSiRecordQuery);
	public BigDecimal getInstByUserid(TSiRecordQuery tSiRecordQuery);
	public BigDecimal getReinstByUserid(TSiRecordQuery tSiRecordQuery);
	public BigDecimal getInmoneyByUserid(TSiRecordQuery tSiRecordQuery);
	public BigDecimal getRemoneyByUserid(TSiRecordQuery tSiRecordQuery);
	public void updateisfinish(TSiItemQuery tSiItemQuery);
}
