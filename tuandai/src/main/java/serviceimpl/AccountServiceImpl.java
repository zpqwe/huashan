package serviceimpl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import query.Account_moneyQuery;

import dao.Account;

import entity.TDealRecord;
import entity.TReceRecord;
import entity.TSiRecord;
import entity.TUcAccount;
import entity.TUserData;
import service.AccountService;
@Service("accountService")
public class AccountServiceImpl implements AccountService{
	@Resource
	@Qualifier("account")
	private Account tccount;
	//查询资金信息
	@Override
	public TUcAccount Tucselect(TUserData tuser) {
		return tccount.Tucselect(tuser);
	}
	
	//回款
	@Override
	public TReceRecord trecesele(String isfinish) {
		return tccount.trecesele(isfinish);
	}
	
	//收益统计
	@Override
	public TSiRecord tsiiresele(Account_moneyQuery moneyQuery) {
		return tccount.tsiiresele(moneyQuery);
	}
	
	//累计支付流量
	@Override
	public TDealRecord tdealsele(Account_moneyQuery moneyQuery) {
		return tccount.tdealsele(moneyQuery);
	}

}
