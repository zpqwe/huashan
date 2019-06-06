package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import query.ReceQuery;

import entity.Data;
import entity.LatelyLoanReturn;
import entity.Page;
import entity.TReceRecord;
import entity.TUserData;

import service.ReceRecordService;

@Controller
public class ReceRecordController {
	@Resource
	@Qualifier("receRecordService")
	private ReceRecordService rs;
	
	@RequestMapping("/account_loanReturnPlanDetail")
	public String getList(HttpServletRequest request,Model model){
		Integer rrid =  Integer.parseInt(request.getParameter("rrid"));
		Integer sirid = Integer.parseInt(request.getParameter("sirid"));
		String lastDate= rs.getLastDate(sirid);
		TReceRecord lastMoney= rs.getLastMoney(sirid);
		TReceRecord record=rs.getOneTReceRecord(rrid);
		String number= rs.getnumber(record);
		record.getItem().setSiititle(number);
		model.addAttribute("lastDate", lastDate);
		model.addAttribute("lastMoney", lastMoney);
		model.addAttribute("record", record);
		return "account_loanReturnPlanDetail";
	}
	
	@RequestMapping("/account_loanReturnPlanList")
	public String open(ReceQuery query,Model model){
		Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
		TUserData userData =(TUserData) session.getAttribute("user");
		query.setUserid(userData.getUserid());
		Data data=null;
		query.setMonth(1);
		data=rs.getData(query);
		model.addAttribute("one", data.getTotalAmount()); 
		System.out.println(data.getTotalAmount());
		query.setMonth(3);
		data=rs.getData(query);
		model.addAttribute("three", data.getTotalAmount()); 
		query.setMonth(6);
		data=rs.getData(query);
		model.addAttribute("six", data.getTotalAmount());
		query.setMonth(null);
		data=rs.getData(query);
		model.addAttribute("all", data.getTotalAmount());
		return "account_loanReturnPlanList";
	}
	
	@RequestMapping("/selectRece")
	@ResponseBody
	public Data getReceList(HttpServletRequest request,ReceQuery query){
		Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
		TUserData userData =(TUserData) session.getAttribute("user");
		query.setUserid(userData.getUserid());
		Integer pageNo= Integer.parseInt(request.getParameter("pageindex"));
		String startDate= request.getParameter("startDate");
		String endDate =request.getParameter("endDate");
		Integer months=rs.getMonth(request.getParameter("Months"));
		if(startDate=="" && endDate==""){
			query.setMonth(months);
		}
		query.setStartTime(startDate);
		query.setEndTime(endDate);
		query.setPageNo(pageNo);
		query.setPageSize(8);
		Data data = rs.getData(query);
		data.setLoanReturn(rs.latelyReturn(query));
		return data;		
	}
}
