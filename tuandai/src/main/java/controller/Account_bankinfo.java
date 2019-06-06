package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.BankService;
import service.RechWithService;
import util.SmsUtil;
import entity.TBankcardtable;
import entity.TUserData;

@Controller
public class Account_bankinfo {
	@Resource
	@Qualifier("bankService")
	private BankService bankService;
	
	@Resource
	@Qualifier("rechWithService")
	private RechWithService rech;
	
	@RequestMapping("/account_bankinfo")
	public String bankinfo(){
		return "account_bankinfo";
	}
	private TUserData tuser;
	//添加银行卡
	@RequestMapping("/insertBank")
	public String insertBank(Model model,TBankcardtable tbank){
	     tuser=bankService.getuser();
	    tbank.setUserid(tuser.getUserid().longValue());
	  //格式手机号和银行卡
		String isphone=rech.phone(tbank.getReservePhone());
		String iscarno=rech.outbank(tbank.getCardNo(), tbank.getCardNo());
		System.out.println(tbank.getCardNo());
		model.addAttribute("isphone", isphone);
		model.addAttribute("iscarno", iscarno);
		model.addAttribute("tbank", tbank);
		return "RegisteredBankCard";
	}
		//保存银行卡信息  
		@RequestMapping("/headBank")
		public String headBank(Model model,TBankcardtable tbank){
			tbank.setUserid(tuser.getUserid().longValue());
			bankService.headbank(tbank);
			tuser.setBacknumber(tbank.getCardNo());
			bankService.updabank(tuser);
			return "redirect: account_default";
		}
}
