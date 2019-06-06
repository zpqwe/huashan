package dao;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.TTitem;
import entity.TUndertake;
import entity.TUserData;


public interface LjjTransferDao {

	//转让列表查询
	public List<TTitem> getTTitems();
	
	//转让列表条件筛选列表
	public List<TTitem>  filterQurey(@Param("Min") String tireperiodMin,@Param("Max") String tireperiodMax, @Param("terest") String tiinterest, @Param("money") String tisurmoney, @Param("method") String tiremethod,@Param("def") String deforder,@Param("rest") String restorder,@Param("roid") String roidorder, @Param("ceid") String ceidorder,@Param("time")String timeorder);
	
	//转让订单查询
	public TTitem infoQuery(String title);
	
	//获取转让订单记录列表
	public List<TUndertake> getSubscribePageList(String Untititle);
	
	//获取转让订单记录列表根据订阅用户Id
	public List<TUndertake> getSubscribePageListById(String Untititle,String subscriberTranferId);
	
	//获取转让人信息
	public TUserData getTUserDataInfo(String transferid);
	
	//获取转让人信息
	public BigDecimal getUserFund(String Userid);
}
