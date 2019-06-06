package serviceimpl;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dao.BankMapper;

import entity.TBankcardtable;
import entity.TBorrowerInfo;
import entity.TUserData;
import service.BankService;
@Service("bankService")
public class BankServiceimpi implements BankService{
	@Resource
	@Qualifier("bankMapper")
	private BankMapper bankmapper;
	//添加银行卡
	@Override
	public void headbank(TBankcardtable tbank) {
		bankmapper.headbank(tbank);
	}
	//获取用户对象
	public TUserData getuser(){
		Subject currentUser = SecurityUtils.getSubject();
	    Session session = currentUser.getSession();
	    return (TUserData) session.getAttribute("user");
	}
	//修改用户银行卡信息
	public void updabank(TUserData tuser){
		bankmapper.updabank(tuser);
	}
	//查询银行卡
	public TBankcardtable tbank(TUserData tuser){
		return bankmapper.tbank(tuser);
	}
}
