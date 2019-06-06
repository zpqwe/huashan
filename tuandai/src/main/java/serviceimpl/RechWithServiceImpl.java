package serviceimpl;

import java.text.DecimalFormat;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import query.RechWithQuery;
import service.RechWithService;
import util.RedisTemplateUtil;
import dao.RechWithMapper;
import entity.Page;
import entity.TBankcardtable;
import entity.TDealRecord;
import entity.TRecharge;
import entity.TUcAccount;
import entity.TUserData;
import entity.TWithdrawCash;
@Service("rechWithService")
public class RechWithServiceImpl implements RechWithService{
	@Resource
	@Qualifier("rechWithMapper")
	private RechWithMapper rechwi;
	/*@Resource
	@Qualifier("redisTemplateUtil")
	private RedisTemplateUtil redisTemplateUtil;*/
	//查询客户名称--根据用户名查询
	@Override
	public TUserData tuser(String username) {
			return rechwi.tuser(username);
	}
	//充值
	@Override
	public void addRech(TRecharge trech) {
		rechwi.addRech(trech);
	}
	//添加记录
	@Override
	public void addreco(TDealRecord tdeal) {
		rechwi.addreco(tdeal);
	}
	//提现
	@Override
	public void addWith(TWithdrawCash twith) {
		rechwi.addWith(twith);
	}
	//查询资金表
	@Override
	public TUcAccount seleauca(RechWithQuery query) {
			return rechwi.seleauca(query);
	}
	//充值成功，修改金额
	@Override
	public void updamaney(TUcAccount tucac) {
		rechwi.updamaney(tucac);
	}
	//查询充值记录
	@Override
	public List<TRecharge> selechar(RechWithQuery query) {
		return rechwi.selechar(query);
	}
	//提现成功，修改金额
	@Override
	public void updatwith(TUcAccount tucac) {
		rechwi.updatwith(tucac);
	}
	//查看提现记录
	@Override
	public List<TWithdrawCash> twith(RechWithQuery query) {
			return rechwi.twith(query);
	}
	//分页充值查询
	public Page getpage(RechWithQuery query){
		Page page=new Page();
		page.setPageNo(query.getPageNo());
		page.setPageSize(query.getPageSize());
		page.setTotalCount(rechwi.TRecharCount(query));
		page.setList(rechwi.selechar(query));
		return page;
	}
	//分页提现查询
		public Page Withpage(RechWithQuery query){
			Page page=new Page();
			page.setPageNo(query.getPageNo());
			page.setTotalCount(rechwi.twithCount(query));
			page.setList(rechwi.twith(query));
			return page;
		}
	//查询提现总记录
	@Override
	public Integer twithCount(RechWithQuery query) {
		return rechwi.twithCount(query);
	}
	//查询充值总记录
	@Override
	public Integer TRecharCount(RechWithQuery query) {
		return rechwi.TRecharCount(query);
	}
	//计算充值成功的金额
	@Override
	public Double manySuccess(TRecharge trech) {
		return rechwi.manySuccess(trech);
	}
	
	//修改交易密码，查询判断
	@Override
	public TBankcardtable ifuser(TBankcardtable tbank) {
		return rechwi.ifuser(tbank);
	}
	
	//保存交易密码
	@Override
	public void updaPwd(TBankcardtable tbank) {
		rechwi.updaPwd(tbank);
	}
	
	//查询银行卡表
	@Override
	public TBankcardtable selectTB(TUserData tuser) {
		return rechwi.selectTB(tuser);
	}
	//分隔手机号
	public String phone(String phone){
		 String phoneNumber = phone.substring(0, 3) + "****" + phone.substring(7, phone.length());
		 return phoneNumber;
	}
	//银行卡后四位
	public String outbank(String bank,String bankwei){
		if(null!=bank&&bank.length()>4){
			for (int i =bank.length()-4; i >= bank.length()-4;i--) {
				 bankwei=bank.substring(i);
				System.out.print(bankwei+"\0");
				break;
			}
		}
		return bankwei;
		
	}
	//证件号
		public String outCard(String Card,String Cardkwei){
			return "";
		}
}
