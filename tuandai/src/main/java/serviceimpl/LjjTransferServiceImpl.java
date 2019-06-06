package serviceimpl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import dao.LjjTransferDao;
import entity.TTitem;
import entity.TUndertake;
import entity.TUserData;
import service.LjjTransferService;

//定义债权转让service接口的实现
@Component
public class LjjTransferServiceImpl implements LjjTransferService<Object> {
	@Resource
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//实现获取转让列表
	public List<TTitem> getTTitems(int PageCurrent){
		//使用PageHelper 插件设置每页显示几行
		PageHelper.startPage(PageCurrent, 5);
		List<TTitem> tTitems = sqlSessionTemplate.getMapper(LjjTransferDao.class).getTTitems();
		return tTitems;
	}
	
	//实现获取动态类型Page对象分页
	public PageInfo getPageInfo(List list) {
		PageInfo info=new PageInfo<Object>(list, 3);
		return info;
	}
	
	//实现获取转让条件筛选列表
	public List<TTitem>  filterQurey(int PageCurrent,String tireperiodMin, String tireperiodMax,  String tiinterest,  String tisurmoney, String tiremethod,String deforder,String restorder,String roidorder,String ceidorder,String timeorder){
		//接收 当前页面 设置 每页显示
		PageHelper.startPage(PageCurrent, 5);
		List<TTitem> tTitems = sqlSessionTemplate.getMapper(LjjTransferDao.class).filterQurey(tireperiodMin, tireperiodMax, tiinterest, tisurmoney, tiremethod,deforder,restorder,roidorder,ceidorder,timeorder);
		return tTitems;
	}
	
	//转让订单查询
	public TTitem infoQuery(String title){
		TTitem titem = sqlSessionTemplate.getMapper(LjjTransferDao.class).infoQuery(title);
		return titem;
	}
	
		
	//获取转让订单记录列表
	public List<TUndertake> getSubscribePageList(String subscribeId,String subscriberTranferId, int pageIndex){
		//创建Tundertake 对象
		List<TUndertake> TUndertakeList =null;
		//subscribeId 订单 id 不为空时 调用  dao 层 getSubscribePageList 方法获得订单列表
		if(null!=subscribeId){
			PageHelper.startPage(pageIndex, 1);
			TUndertakeList = sqlSessionTemplate.getMapper(LjjTransferDao.class).getSubscribePageList(subscribeId);
		}
		//返回 Tundertake 对象
		return TUndertakeList;
	}
	
	//获取转让人信息
	public TUserData getTUserDataInfo(String transferid){
		TUserData userData = sqlSessionTemplate.getMapper(LjjTransferDao.class).getTUserDataInfo(transferid);
		return userData;
	}
	
	//获取用户人账户资金信息
	public BigDecimal getUserFund(String Userid){
		BigDecimal userFund = sqlSessionTemplate.getMapper(LjjTransferDao.class).getUserFund(Userid);
		return userFund;
	}

}
