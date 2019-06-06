package service;

import entity.TBankcardtable;
import entity.TBorrowerInfo;
import entity.TUserData;

public interface BankService {
	//绑定银行卡
	public void headbank(TBankcardtable tbank);
	//获取用户
	public TUserData getuser();
	//修改用户银行卡信息
	public void updabank(TUserData tuser);
	//查询银行卡
	public TBankcardtable tbank(TUserData tuser);

}
