package dao;

import java.util.List;

import entity.TDealRecord;
import entity.TReceRecord;
import entity.TUcAccount;

import query.DrQuery;

public interface DrRecordMapper {

	public List<TDealRecord> getDrList(DrQuery query);
	
	public Integer getTotalCount(DrQuery query);
	
	public List<TReceRecord> getDrReco(String date);
	
	public void addDrReco(TDealRecord record);
	
	public TUcAccount getuserac(Integer userid);
	
	public void updateisFinish(TReceRecord record);
	
	public List<TReceRecord> selectdate(String date);
}
