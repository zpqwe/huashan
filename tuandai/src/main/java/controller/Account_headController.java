package controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import query.TSiRecordQuery;

import dao.Account;

import service.AccountService;
import service.TSiRecordService;


import entity.TReceRecord;
import entity.TUcAccount;
import entity.TUserData;
//曾平写
@Controller
public class Account_headController {
	@Resource
	@Qualifier("account")
	private Account account;
	@Resource
	@Qualifier("tsiRecordService")
	private TSiRecordService trs;
	
	//账户首页
	DecimalFormat df = new DecimalFormat("#.00");
	@RequestMapping("/account_default")
	public String account_default(Model model,String windowUrl,@ModelAttribute TSiRecordQuery tSiRecordQuery){
		/*if(request.getSession().getAttribute("goUrl")!=null){
			String url = (String)request.getSession().getAttribute("goUrl");
			response.sendRedirect(url);
			}
			else{
			response.sendRedirect("/webshopping/index.jsp");
			}*/
		Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
		 TUserData user=(TUserData) session.getAttribute("user");
		System.out.println(windowUrl);
			model.addAttribute("tuser", user);
			model.addAttribute("user", user);
			TUcAccount tucnt=account.Tucselect(user);
			tSiRecordQuery.setUserid(user.getUserid());
			BigDecimal inmoney=trs.getInmoneyByUserid(tSiRecordQuery);
			BigDecimal sirreinst=trs.getReinstByUserid(tSiRecordQuery);
			model.addAttribute("ucount",df.format(tucnt.getUcavail()+tucnt.getUcinterest()));
			model.addAttribute("ucavail",df.format(tucnt.getUcavail()));
			model.addAttribute("ucinter",df.format(tucnt.getUcavail()+tucnt.getUcinterest()));
			model.addAttribute("tucnt",tucnt);
			model.addAttribute("inmoney", inmoney);
			model.addAttribute("sirreinst", sirreinst);
			return "account_default";
		}
		
	//收益统计
	@RequestMapping("/zp_account_default_profit")
	public String account_default_profit(){
		return "account_default_profit";
	}
	//ajax收益统计
	@RequestMapping("/account_default_profit")
	@ResponseBody
	public TReceRecord account_default_profit(Model model,HttpSession session){
		TUserData tuser=new TUserData();//整合时获取session，暂时new对象
		tuser.setUserid(1);
		String isfinish="1";
		TReceRecord trece=account.trecesele(isfinish);
		return trece;
	}
	
	
}
