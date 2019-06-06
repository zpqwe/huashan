package dao;

import java.text.DecimalFormat;
import java.util.List;

import query.RechWithQuery;
import entity.Page;
import entity.TBankcardtable;
import entity.TDealRecord;
import entity.TRecharge;
import entity.TUcAccount;
import entity.TUserData;
import entity.TWithdrawCash;
//充值提现
public interface RechWithMapper {
	//查询客户名称--根据用户名查询
	public TUserData tuser(String username);
	//添加记录
	public void addreco(TDealRecord tdeal);
	//查询资金表 -根据用户id查询
	public TUcAccount seleauca(RechWithQuery query);
	
	//添加充值记录
	public void addRech(TRecharge trech);
	//查询充值记录
	public List<TRecharge> selechar(RechWithQuery query);
	//充值成功修改金额
	public void updamaney(TUcAccount tucac);
	//查询充值总记录
	public Integer TRecharCount(RechWithQuery query);
	//计算充值成功的金额
	public Double manySuccess(TRecharge trech);
	//计算充值失败的金额
	//public Double maneyfail(String restate);
	
	//添加提现记录
	public void addWith(TWithdrawCash twith);
	//提现成功修改记录
	public void updatwith(TUcAccount tucac);
	//查看提现记录
	public List<TWithdrawCash> twith(RechWithQuery query);
	//查询提现总记录
	public Integer twithCount(RechWithQuery query);
	
	//修改交易密码，查询判断
	public TBankcardtable ifuser(TBankcardtable tbank);
	
	//修改交易密码
	public void updaPwd(TBankcardtable tbank);
	
	//查询银行卡表
	public TBankcardtable selectTB(TUserData tuser);

}
