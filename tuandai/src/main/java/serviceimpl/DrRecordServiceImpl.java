package serviceimpl;

import java.security.interfaces.DSAKey;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import dao.DrRecordMapper;

import query.DrQuery;
import entity.Page;
import entity.TDealRecord;
import entity.TReceRecord;
import entity.TUcAccount;
import entity.TUserData;
import service.DrRecordService;
import service.RechWithService;
import sun.security.action.GetBooleanAction;

@Service("drRecordService")
public class DrRecordServiceImpl implements DrRecordService {

	@Resource
	@Qualifier("drRecordMapper")
	private DrRecordMapper dm;
	
	@Resource
	@Qualifier("rechWithService")
	private RechWithService rs;
	
	public List<TDealRecord> getDrList(DrQuery query) {
		List<TDealRecord> records= dm.getDrList(query);
		for (TDealRecord record : records) {
			String time= record.getDrdate().substring(0, record.getDrdate().length()-2);
			record.setDrdate(time);
			if(record.getDrdtype().equals("1")){
				record.setDrdtype("充值");
			}
			if(record.getDrdtype().equals("2")){
				record.setDrdtype("提现");
			}
			if(record.getDrdtype().equals("3")){
				record.setDrdtype("投资收款相关");
			}
			if(record.getDrdtype().equals("4")){
				record.setDrdtype("周转收款相关");
			}
			if(record.getDrdtype().equals("5")){
				record.setDrdtype("提现手续费");
			}
			if(record.getDrdtype().equals("6")){
				record.setDrdtype("账户内转账");
			}
			if(record.getDrdtype().equals("7")){
				record.setDrdtype("其他");
			}
			
			if(record.getDrincome() ==null){
				record.setDrincome("0.00");
			}
			if(record.getDrexpenditure()==null){
				record.setDrexpenditure("0.00");
			}
		}
		return records;
		
	}

	@Override
	public Page getPage(DrQuery query) {
		Page page=new Page();
		page.setList(getDrList(query));
		page.setTotalCount(getTotalCount(query));
		page.setPageNo(query.getPageNo());
		page.setPageSize(query.getPageSize());
		return page;
	}

	@Override
	public Integer getTotalCount(DrQuery query) {
		return dm.getTotalCount(query);
	}

	@Override
	public void addDrReco() {
			Date time=new Date();
			DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
			String date= format.format(time);
			List<TReceRecord> lists= dm.selectdate(date);
			TDealRecord dealRecord=null;
			for (TReceRecord list : lists) {
				list.setIsfinish(2);
				dm.updateisFinish(list);
				TUcAccount account= dm.getuserac(list.getUserid());
				Double total=list.getRrtotal()+account.getUcavail();
				account.setUcavail(total);
				if(list.getSirid()!=null){
					dealRecord =new TDealRecord(list.getUserid(), "3",list.getRrtotal().toString() , total.toString(), "散标投资回款");
				}else{
					dealRecord =new TDealRecord(list.getUserid(), "4",list.getRrtotal().toString() , total.toString(), "承接周转回款");
				}
				rs.updatwith(account);
				dm.addDrReco(dealRecord);
			}
					
					
					
					
					
	}


	
	


}
