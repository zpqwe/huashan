package dao;

import java.math.BigDecimal;
import java.util.List;

import query.TSiItemQuery;
import query.TSiRecordQuery;

import entity.TSiRecord;

public interface TSiRecordMapper {
	public List<TSiRecord> getTSiRecordList(TSiRecordQuery tSiRecordQuery);
	public Integer getCounts(TSiRecordQuery tSiRecordQuery);
	public Integer getCountsByState(TSiRecordQuery tSiRecordQuery);
	public void addSirecord(TSiRecord tSiRecord);
	public List<TSiRecord> getTSiRecordListBySiiid(TSiItemQuery tSiItemQuery);
	public Integer getCountsBySiiid(TSiItemQuery tSiItemQuery);
	public void updateSirreinst(TSiRecordQuery tSiRecordQuery);
	public void updateSirinst(TSiRecordQuery tSiRecordQuery);
	public List<TSiRecord> getTSiRecord();
	public BigDecimal getInstByUserid(TSiRecordQuery tSiRecordQuery);
	public BigDecimal getReinstByUserid(TSiRecordQuery tSiRecordQuery);
	public BigDecimal getInmoneyByUserid(TSiRecordQuery tSiRecordQuery);
	public BigDecimal getRemoneyByUserid(TSiRecordQuery tSiRecordQuery);
	public void updateisfinish(TSiItemQuery tSiItemQuery);
}
