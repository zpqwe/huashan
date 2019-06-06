package dao;

import java.util.List;


import query.Rece2Query;
import query.ReceQuery;
import query.TSiItemQuery;
import sun.security.action.GetBooleanAction;

import entity.LatelyLoanReturn;
import entity.TReceRecord;

public interface ReceRecordMapper {
	public List<TReceRecord> getTReceRecords(ReceQuery query);
	
	public Integer getTotalCount(ReceQuery query);
	
	public List<LatelyLoanReturn> latelyReturn(ReceQuery query);
	
	public List<TReceRecord> getTotalRece(ReceQuery query);
	
	public void addRececord(TReceRecord tReceRecord);
	
	public String getLastDate(Integer sirid);
	
	public List<TReceRecord> getLastMoney(Integer sirid);
	
	public TReceRecord getOneTReceRecord(Integer rrid);

	public List<TReceRecord> getRRtime(TSiItemQuery tsiItemQuery);
	public void updateRRtimes(Rece2Query query);
	public List<LatelyLoanReturn> latelyReturn();
	public List<TReceRecord> getReceRecord(TSiItemQuery tsiItemQuery);
	public Integer getRRCounts(TSiItemQuery tsiItemQuery);
	
}
