package controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aliyuncs.utils.StringUtils;

import entity.Page;
import entity.TDealRecord;
import entity.TUserData;

import query.DrQuery;
import query.ReceQuery;

import service.DrRecordService;
import service.ReceRecordService;


@Controller
public class DrRecordController {
	
	@Resource
	@Qualifier("drRecordService")
	private DrRecordService ds;
	
	
	
	@RequestMapping("/account_moneyhistory")
	public String openDr(){
		return "account_moneyhistory";
		
	}
	
	@RequestMapping("/selectDr")
	@ResponseBody
	public Page selectDrList(HttpServletRequest request,HttpServletResponse response,DrQuery query){
		String type1=request.getParameter("type1");
		String type2=request.getParameter("type2");
		String txtBegin=request.getParameter("txtBegin");
		String txtEnd=request.getParameter("txtEnd");
		String pageNo=request.getParameter("pageNo");
		Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
		TUserData user= (TUserData) session.getAttribute("user");
		if(pageNo!=null){
			query.setPageNo(Integer.parseInt(pageNo));
		}
		query.setPageSize(10);
		query.setUserId(user.getUserid());
		query.setDrtype(type1);
		query.setDrdtype(type2);
		query.setStartTime(txtBegin);
		query.setEndTime(txtEnd);
		Page page= ds.getPage(query);
		return page;
	}
	
}
