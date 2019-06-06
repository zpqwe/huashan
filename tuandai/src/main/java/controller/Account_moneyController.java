package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import query.Account_moneyQuery;

import entity.TDealRecord;
import entity.TReceRecord;
import entity.TSiRecord;
import entity.TUcAccount;
import entity.TUserData;

import service.AccountService;
//曾平写
@Controller
public class Account_moneyController {
	@Resource
	@Qualifier("accountService")
	private AccountService accountService;
	
	private TUserData tuser;
	//进入资金统计
	@RequestMapping("/account_moneylist")
	public String account_moneylist(Model model,/*HttpSession session,*/Account_moneyQuery moneyQuery){
		Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
		tuser=(TUserData) session.getAttribute("user");
		 moneyQuery.setUserid(tuser.getUserid().toString());
		 moneyQuery.setDrexplain("充值");
		 TDealRecord tdealrecord=accountService.tdealsele(moneyQuery);
		 model.addAttribute("tdealrecord1", tdealrecord);
		 
		 moneyQuery.setDrexplain("投资");
		  tdealrecord=accountService.tdealsele(moneyQuery);
		 model.addAttribute("tdealrecord2", tdealrecord);
		 
		 moneyQuery.setDrexplain("周转");
		  tdealrecord=accountService.tdealsele(moneyQuery);
		 model.addAttribute("tdealrecord3", tdealrecord);
		 
		 moneyQuery.setDrexplain("提现");
		  tdealrecord=accountService.tdealsele(moneyQuery);
		 model.addAttribute("tdealrecord4", tdealrecord);
		 
		 moneyQuery.setDrexplain("支付佣金");
		  tdealrecord=accountService.tdealsele(moneyQuery);
		 model.addAttribute("tdealrecord5", tdealrecord);
		 return "account_moneylist";
	}
	//债权转让
	@RequestMapping("/account_moneylist_include")
	public String account_moneylist_include(){
		return "account_moneylist_include";
	}
	//资金统计ajax访问
	@RequestMapping("/ajaxStatistics")
	@ResponseBody
	public String ajaxStatistics(){
		TUcAccount tucaccount=accountService.Tucselect(tuser);
		JSONObject json=JSONObject.fromObject(tucaccount);
		System.out.println(json);
		return json.toString();
	}
	//资金统计中收益统计ajax访问
		@RequestMapping("/ajaxProfitStatistics")
		@ResponseBody
		public String ajaxProfitStatistics(/*HttpSession session*/){
			Subject currentUser = SecurityUtils.getSubject();
	        Session session = currentUser.getSession();
			TUserData tuser=(TUserData) session.getAttribute("user");
			Account_moneyQuery moneyQuery=new Account_moneyQuery();
			moneyQuery.setUserid(tuser.getUserid().toString());
			moneyQuery.setSirstate("正常回款");
			TSiRecord tsirecord=accountService.tsiiresele(moneyQuery);
			JSONObject json=JSONObject.fromObject(tsirecord);
			System.out.println(json);
			return json.toString();
		}
		//资金统计中收益统计ajax访问逾期
		@RequestMapping("/ajaxProfitStatisticsyq")
		@ResponseBody
		public String ajaxProfitStatisticsyq(/*HttpSession session*/){
			Subject currentUser = SecurityUtils.getSubject();
	        Session session = currentUser.getSession();
			TUserData tuser=(TUserData) session.getAttribute("user");
			Account_moneyQuery moneyQuery=new Account_moneyQuery();
			moneyQuery.setUserid(tuser.getUserid().toString());
			moneyQuery.setSirstate("逾期");
			TSiRecord tsirecord=accountService.tsiiresele(moneyQuery);
			JSONObject json=JSONObject.fromObject(tsirecord);
			System.out.println(json);
			return json.toString();
		}
		
		//资金流量
		@RequestMapping("/account_moneyflow")
		public TDealRecord account_moneyflow(Model model,HttpSession session){
			TDealRecord tdeal=new TDealRecord();
			return tdeal;
		}
		////债权转让
		@RequestMapping("/zxaccount_moneylist")
		public String zxaccount_moneylist(Model model,HttpSession session){
			return "zxaccount_moneylist";
		}
		
}
