package serviceimpl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;



import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import query.TSiItemQuery;

import dao.TSiItemMapper;
import entity.Page;
import entity.TSiItem;


import service.TSiItemService;


@Service("tsiItemService")
public class TSiItemServiceImpl implements TSiItemService{

	@Resource
	@Qualifier("TSiItemMapper")
	private TSiItemMapper tm;
	@Override
	public TSiItem getTSiItemById(Integer siiid){
		// TODO Auto-generated method stub
		return tm.getTSiItemById(siiid);
	}
	@Override
	public List<TSiItem> getTSiItemList(TSiItemQuery tsiItemQuery) {
		// TODO Auto-generated method stub
		return tm.getTSiItemList(tsiItemQuery);
	}
	public Page getPage(TSiItemQuery tsiItemQuery) {
		Page page = new Page();
		Integer totalCount = tm.getCounts(tsiItemQuery);
		List<TSiItem> list = tm.getTSiItemList(tsiItemQuery);
		page.setPageNo(tsiItemQuery.getPageNo());
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}
	public Integer getCounts(TSiItemQuery tsiItemQuery) {
		// TODO Auto-generated method stub
		return tm.getCounts(tsiItemQuery);
	}
	@Override
	public void updateSiirmoney(TSiItemQuery tsiItemQuery) {
		tm.updateSiirmoney(tsiItemQuery);
		
	}
	@Override
	public void updateSiifinishtime(TSiItemQuery tsiItemQuery) {
		tm.updateSiifinishtime(tsiItemQuery);
		
	}
	@Override
	public void updateTSiItem() {
		List<TSiItem> list=getTSiItem();
		Date date=new Date();
		 SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss"); 
		Long date1=null;
		TSiItemQuery tsiItemQuery=new TSiItemQuery();
		date1 = Long.parseLong(sdf.format(date));
		for(TSiItem tsi:list){
			Long date2=Long.parseLong(sdf.format(tsi.getSiiresidue()));
			Long time=date1-date2;
			System.out.println("date1:++"+date1+"date2:++"+date2);
			System.out.println("TIMESS:"+time);
			tsiItemQuery.setSiiid(tsi.getSiiid());
			if(tsi.getSiirmoney()==0){
				tsiItemQuery.setSiistate("已满标");
				updateSiistate(tsiItemQuery);
			}
			if(time>0&&tsi.getSiirmoney()>0){
				tsiItemQuery.setSiistate("已完成");
				updateSiistate(tsiItemQuery);
			}
		}
		
		Integer siirmoney=tsiItemQuery.getQtmoney();
		
	}
	@Override
	public void updateSiistate(TSiItemQuery tsiItemQuery) {
		tm.updateSiistate(tsiItemQuery);
	}
	@Override
	public List<TSiItem> getTSiItem() {
		// TODO Auto-generated method stub
		return tm.getTSiItem();
	}
	@Override
	public void updateSirstate(TSiItemQuery tsiItemQuery) {
		tm.updateSirstate(tsiItemQuery);
		
	}

}
