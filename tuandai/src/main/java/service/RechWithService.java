package service;

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

public interface RechWithService {
	//查询客户名称--根据用户名查询
	public TUserData tuser(String username);
	//充值
	public void addRech(TRecharge trech);
	//查询充值记录
	public List<TRecharge> selechar(RechWithQuery query);
	//计算充值成功的金额
	public Double manySuccess(TRecharge trech);
	//提现
	public void addWith(TWithdrawCash twith);
	//添加记录
	public void addreco(TDealRecord tdeal);
	//查询资金表
	public TUcAccount seleauca(RechWithQuery query);
	//充值成功修改金额
	public void updamaney(TUcAccount tucac);
	//提现成功修改记录
	public void updatwith(TUcAccount tucac);
	//查看提现记录
	public List<TWithdrawCash> twith(RechWithQuery query);
	//查询提现总记录
	public Integer twithCount(RechWithQuery query);
	//查询充值总记录
	public Integer TRecharCount(RechWithQuery query);
	//充值分页
	public Page getpage(RechWithQuery query);
	//提现分页
	public Page Withpage(RechWithQuery query);
	
	//修改交易密码，查询判断
	public TBankcardtable ifuser(TBankcardtable tbank);
	
	//保存交易密码
	public void updaPwd(TBankcardtable tbank);
	
	//查询银行卡表
	public TBankcardtable selectTB(TUserData tuser);
	//分隔手机号
	public String phone(String phone);
	//银行卡号后四位
	public String outbank(String bank,String bankwei);
	//证件号
	public String outCard(String Card,String Cardkwei);
}
