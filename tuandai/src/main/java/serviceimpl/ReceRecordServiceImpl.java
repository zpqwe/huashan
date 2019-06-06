package serviceimpl;

import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import query.Rece2Query;
import query.ReceQuery;
import query.TSiItemQuery;

import dao.ReceRecordMapper;

import entity.Data;
import entity.LatelyLoanReturn;
import entity.Page;
import entity.TReceRecord;
import service.ReceRecordService;
import sun.security.action.GetBooleanAction;

@Service("receRecordService")
public class ReceRecordServiceImpl implements ReceRecordService {

	@Resource
	@Qualifier("receRecordMapper")
	private ReceRecordMapper rm;
	
	@Override
	public List<TReceRecord> getTReceRecords(ReceQuery query) {
		return rm.getTReceRecords(query);
	}

	@Override
	public Page getPage(ReceQuery query) {
		Page page=new Page();
		page.setList(getTReceRecords(query));
		page.setPageNo(query.getPageNo()); 
		page.setPageSize(query.getPageSize());
		page.setTotalCount(getTotalCount(query));
		return page;
	}

	@Override
	public Integer getTotalCount(ReceQuery query) {
		return rm.getTotalCount(query);
	}
	
	public Data getData(ReceQuery query){
		Data data=new Data();
		Page page=getPage(query);
		data.setPage(page);
		//List<TReceRecord> list= page.getList();
		List<TReceRecord> list=getTotalRece(query);
		Double totalMoney=0d;
		Double totalAmount=0d;
		Double totalInterest=0d;
		for (TReceRecord tReceRecord : list) {
			totalMoney=totalMoney+tReceRecord.getRrmoney();
			totalAmount=totalAmount+tReceRecord.getRrtotal();
			totalInterest=totalInterest+tReceRecord.getRrinterest();
		}
		data.setTotalAmount(totalAmount.toString());
		data.setTotalInterest(totalInterest.toString());
		data.setTotalMoney(totalMoney.toString());
		if(getTotalCount(query)!=0){
			data.setResult("1");
			data.setDueComeNum(getTotalCount(query));
		};
		return data;
		
	}

	@Override
	public Integer getMonth(String month) {
		Integer months=null;
		if(month.equals("all")){
			return months;
		}
		return Integer.parseInt(month);
	}

	

	@Override
	public List<TReceRecord> getTotalRece(ReceQuery query) {
		return rm.getTotalRece(query);
	}

	@Override
	public void addRececord(TReceRecord tReceRecord) {
		rm.addRececord(tReceRecord);
		
	}



	@Override
	public TReceRecord getLastMoney(Integer sirid) {
		List<TReceRecord> list=rm.getLastMoney(sirid);
		Double rrmoney=0d;
		Double rrtotal=0d;
		Double rrinterest=0d;
		for (TReceRecord tReceRecord : list) {
			rrmoney=rrmoney+tReceRecord.getRrmoney();
			rrtotal=rrtotal+tReceRecord.getRrtotal();
			rrinterest=rrinterest+tReceRecord.getRrinterest();
		}
		TReceRecord record=new TReceRecord(rrmoney, rrtotal, rrinterest);
		return record;
	}

	@Override
	public TReceRecord getOneTReceRecord(Integer rrid) {
		return rm.getOneTReceRecord(rrid);
	}

	@Override
	public String getLastDate(Integer sirid) {
		return rm.getLastDate(sirid);
	}

	@Override
	public String getnumber(TReceRecord record) {
		String title= record.getItem().getSiititle();
		String reg="[^0-9]";
		Pattern p = Pattern.compile(reg);  
		Matcher m = p.matcher(title);  
		return m.replaceAll("").trim();
	}

	@Override
	public LatelyLoanReturn latelyReturn(ReceQuery query) {
		List<LatelyLoanReturn> lists= rm.latelyReturn(query);
		LatelyLoanReturn loanReturn=new LatelyLoanReturn();
		loanReturn.setCount(lists.size());
		Double totalMoney=0d;
		for (int i = 0; i < lists.size(); i++) {
			if(i==0){
				loanReturn.setTime(lists.get(i).getTime());
			}
			totalMoney=totalMoney+lists.get(i).getTotalmoney();
		}
		loanReturn.setTotalmoney(totalMoney);
		return loanReturn;
	}

	//添加回款记录
		@Override
		public void addRececords(Rece2Query rece2query) {
			String[] rrmoney=rece2query.getRrmoney();
			String[] rrinterest=rece2query.getRrinterest();
			String[] rrtotal=rece2query.getRrtotal();
			Integer rrnownum=rece2query.getRrnownum();
			Calendar cale = null;
		    cale = Calendar.getInstance();
		    int year = cale.get(Calendar.YEAR);
		    int month = cale.get(Calendar.MONTH) + 1;
		    int day = cale.get(Calendar.DATE);
		    int hour = cale.get(Calendar.HOUR_OF_DAY);
		    int minute = cale.get(Calendar.MINUTE);
		    int second = cale.get(Calendar.SECOND);
		    Integer min=minute;
			String dates=null;
			Integer sirid=rece2query.getSirid();
			TReceRecord trr=null;
			System.out.println("rrmoney.length:"+rrmoney.length);
			for(int i=0;i<rrmoney.length;i++){
				if(rrmoney.length==1){
					month=rrnownum+month;
				}else{
					month++;
				}
				if(month>12){
					year++;
					month=month-12;
				}
			
				dates=year+"-"+month+"-"+day+" "+hour+":"+min+":"+second;
				if(day==31){
					if(month==4||month==6||month==9||month==11){
						System.out.println("dates::++"+dates);
						dates=year+"-"+month+"-"+30+" "+hour+":"+min+":"+second;
					}
				}
				if(year%4>0&&month==2&&day>28){
					dates=year+"-"+month+"-"+28+" "+hour+":"+min+":"+second;
				}else if(year%4==0&&month==2&&day>29){
					dates=year+"-"+month+"-"+29+" "+hour+":"+min+":"+second;
				}
				trr=new TReceRecord(dates,Double.valueOf(rrmoney[i]),(i+1),Double.valueOf(rrinterest[i]),sirid,Double.valueOf(rrtotal[i]));
				addRececord(trr);
				System.out.println("rrtotal:"+rrtotal[i]+"sirid:"+sirid+"dates:"+dates+"Double.valueOf(rrmoney[i]):"+Double.valueOf(rrmoney[i])+"Double.valueOf(rrinterest[i])"+Double.valueOf(rrinterest[i]));
			}
		}

		@Override
		public List<TReceRecord> getReceRecord(TSiItemQuery tsiItemQuery) {
			// TODO Auto-generated method stub
			return rm.getReceRecord(tsiItemQuery);
		}

		@Override
		public Integer getRRCounts(TSiItemQuery tsiItemQuery) {
			// TODO Auto-generated method stub
			return rm.getRRCounts(tsiItemQuery);
		}

		@Override
		public Page getRRPage(TSiItemQuery tsiItemQuery) {
			Page page = new Page();
			page.setPageSize(10);
			Integer totalCount = rm.getRRCounts(tsiItemQuery);
			List<TReceRecord> list = rm.getReceRecord(tsiItemQuery);
			page.setPageNo(tsiItemQuery.getPageNo());
			page.setTotalCount(totalCount);
			page.setList(list);
			return page;
		}

		@Override
		public List<TReceRecord> getRRtime(TSiItemQuery tsiItemQuery) {
			
			return rm.getRRtime(tsiItemQuery);
		}

		@Override
		public void updateRRtimes(Rece2Query query) {
			rm.updateRRtimes(query);
			
		}
	
	

	


}
