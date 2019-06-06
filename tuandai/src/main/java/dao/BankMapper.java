package dao;

import entity.TBankcardtable;
import entity.TUserData;

public interface BankMapper {
	//绑定银行卡
	public void headbank(TBankcardtable tbank);
	//修改用户银行卡信息
	public void updabank(TUserData tuser);
	//查询银行卡
	public TBankcardtable tbank(TUserData tuser);

}
