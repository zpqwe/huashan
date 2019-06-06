package serviceimpl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dao.TSiRecordMapper;

import query.TSiItemQuery;
import query.TSiRecordQuery;
import entity.Page;
import entity.TSiItem;
import entity.TSiRecord;
import service.TSiRecordService;
@Service("tsiRecordService")
public class TSiRecordServiceImpl implements TSiRecordService{
	@Resource
	@Qualifier("TSiRecordMapper")
	private TSiRecordMapper trm;
	@Override
	public List<TSiRecord> getTSiRecordList(TSiRecordQuery tSiRecordQuery) {
		return trm.getTSiRecordList(tSiRecordQuery);
	}
	public Page getPage(TSiRecordQuery tSiRecordQuery) {
		Page page = new Page();
		page.setPageSize(8);
		Integer totalCount = trm.getCounts(tSiRecordQuery);
		List<TSiRecord> list = trm.getTSiRecordList(tSiRecordQuery);
		System.out.println("getSirisfinish"+tSiRecordQuery.getSirisfinish());
		List states = new ArrayList();
		String[] lists={"正常回款","逾期","投标中","流标"};
		for(int i=0;i<4;i++){
			tSiRecordQuery.setSirstate(lists[i]);
			Integer num=trm.getCountsByState(tSiRecordQuery);
			System.out.println("num="+num+"i="+i);
			states.add(num);
		}
		tSiRecordQuery.setLists(states);
		page.setPageNo(tSiRecordQuery.getPageNo());
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}
	@Override
	public Integer getCounts(TSiRecordQuery tSiRecordQuery) {
		return trm.getCounts(tSiRecordQuery);
	}
	@Override
	public Integer getCountsByState(TSiRecordQuery tSiRecordQuery) {
		return trm.getCountsByState(tSiRecordQuery);
	}
	@Override
	public void addSirecord(TSiRecord tSiRecord) {
		trm.addSirecord(tSiRecord);
		
	}
	@Override
	public List<TSiRecord> getTSiRecordListBySiiid(TSiItemQuery tSiItemQuery) {
		
		return trm.getTSiRecordListBySiiid(tSiItemQuery);
	}
	@Override
	public Integer getCountsBySiiid(TSiItemQuery tSiItemQuery) {
		return trm.getCountsBySiiid(tSiItemQuery);
	}
	@Override
	public Page getPageBySiiid(TSiItemQuery tsiItemQuery) {
		Page page = new Page();
		page.setPageSize(10);
		System.out.println("siiid=："+tsiItemQuery.getSiiid()+"pageNo=："+tsiItemQuery.getPageNo());
		Integer totalCount = trm.getCountsBySiiid(tsiItemQuery);
		List<TSiRecord> list = trm.getTSiRecordListBySiiid(tsiItemQuery);
		page.setPageNo(tsiItemQuery.getPageNo());
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	
	}
	@Override
	public void updateSirreinst(TSiRecordQuery tSiRecordQuery) {
		trm.updateSirreinst(tSiRecordQuery);
		
	}
	@Override
	public void updateSirinst(TSiRecordQuery tSiRecordQuery) {
		trm.updateSirinst(tSiRecordQuery);
		
	}
	@Override
	public void updateTSiRecord(TSiRecordQuery tSiRecordQuery) {
		List<TSiRecord> list=getTSiRecord();
		for(TSiRecord tSiRecord:list){
			tSiRecordQuery.setSirid(tSiRecord.getSirid());
			trm.updateSirreinst(tSiRecordQuery);
			trm.updateSirreinst(tSiRecordQuery);
		}
		
	}
	@Override
	public List<TSiRecord> getTSiRecord() {
		
		return trm.getTSiRecord();
	}
	@Override
	public BigDecimal getInstByUserid(TSiRecordQuery tSiRecordQuery) {
		
		return trm.getInstByUserid(tSiRecordQuery);
	}
	@Override
	public BigDecimal getReinstByUserid(TSiRecordQuery tSiRecordQuery) {
		return trm.getReinstByUserid(tSiRecordQuery);
	}
	@Override
	public BigDecimal getInmoneyByUserid(TSiRecordQuery tSiRecordQuery) {
		// TODO Auto-generated method stub
		return trm.getInmoneyByUserid(tSiRecordQuery);
	}
	@Override
	public BigDecimal getRemoneyByUserid(TSiRecordQuery tSiRecordQuery) {
		// TODO Auto-generated method stub
		return trm.getRemoneyByUserid(tSiRecordQuery);
	}
	@Override
	public void updateisfinish(TSiItemQuery tSiItemQuery) {
		trm.updateisfinish(tSiItemQuery);
		
	}

}
