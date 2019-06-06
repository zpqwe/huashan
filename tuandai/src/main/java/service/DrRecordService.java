package service;

import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;

import query.DrQuery;
import entity.Page;
import entity.TDealRecord;
import entity.TUcAccount;
import entity.TUserData;

public interface DrRecordService {

	public List<TDealRecord> getDrList(DrQuery query);
	
	public Page getPage(DrQuery query);
	
	public Integer getTotalCount(DrQuery query);
	
	public void addDrReco();
	
	
}
