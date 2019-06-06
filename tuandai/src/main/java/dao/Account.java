package dao;

import query.Account_moneyQuery;
import entity.TDealRecord;
import entity.TReceRecord;
import entity.TSiRecord;
import entity.TUcAccount;
import entity.TUserData;

public interface Account {
	//查询资金信息
	public TUcAccount Tucselect(TUserData tuser);
	//回款
	public TReceRecord trecesele(String isfinish);
	//收益统计
	public TSiRecord tsiiresele(Account_moneyQuery moneyQuery);
	//累计支付流量
	public TDealRecord tdealsele(Account_moneyQuery moneyQuery);

}
