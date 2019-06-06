package service;

import java.util.List;

import query.Rece2Query;
import query.ReceQuery;
import query.TSiItemQuery;
import sun.security.action.GetBooleanAction;

import entity.Data;
import entity.LatelyLoanReturn;
import entity.Page;
import entity.TReceRecord;

public interface ReceRecordService {
	public List<TReceRecord> getTReceRecords(ReceQuery query);
	
	public Page getPage(ReceQuery query);
	
	public Integer getTotalCount(ReceQuery query);
	
	public Data getData(ReceQuery query);
	
	public Integer getMonth(String month);
	
	public LatelyLoanReturn latelyReturn(ReceQuery query);
	
	public List<TReceRecord> getTotalRece(ReceQuery query);

	
	public void addRececord(TReceRecord tReceRecord);
	
	public void addRececords(Rece2Query rece2query);
	
	public TReceRecord getLastMoney(Integer sirid);
	
	public TReceRecord getOneTReceRecord(Integer rrid);
	
	public String getLastDate(Integer sirid);
	
	public String getnumber(TReceRecord record);
	
	public Page getRRPage(TSiItemQuery tsiItemQuery);
	
	public List<TReceRecord> getReceRecord(TSiItemQuery tsiItemQuery);
	public Integer getRRCounts(TSiItemQuery tsiItemQuery);
	public List<TReceRecord> getRRtime(TSiItemQuery tsiItemQuery);
	public void updateRRtimes(Rece2Query query);

}
