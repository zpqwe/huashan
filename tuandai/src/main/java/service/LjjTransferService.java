package service;

import java.math.BigDecimal;
import java.util.List;


import com.github.pagehelper.PageInfo;

import entity.TTitem;
import entity.TUndertake;
import entity.TUserData;

//定义债权转让service接口
public interface LjjTransferService<T> {
	
	//定义获取转让列表
	public List<TTitem> getTTitems(int PageCurrent);
	
	//定义动态Page类型对象分页
	public  PageInfo<T> getPageInfo(List<T> list);
	
	//定义获取转让条件筛选列表
	public List<TTitem>  filterQurey(int PageCurrent,String tireperiodMin, String tireperiodMax,  String tiinterest,  String tisurmoney, String tiremethod,String deforder,String restorder,String roidorder,String ceidorder,String timeorder);

	//定义转让订单查询
	public TTitem infoQuery(String title);	
	
	//定义获取转让订单记录列表
	public List<TUndertake> getSubscribePageList(String subscribeId,String subscriberTranferId, int pageIndex);
	
	//定义获取转让人信息
	public TUserData getTUserDataInfo(String transferid);
	
	//定义获取转让人信息
	public BigDecimal getUserFund(String Userid);
}
