package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import query.TSiItemQuery;
import query.TSiRecordQuery;

import entity.Page;
import entity.TSiItem;
import entity.TSiRecord;
import entity.TUserData;

import service.TSiRecordService;

@Controller
public class TSiRecordController {
	@Resource
	@Qualifier("tsiRecordService")
	private TSiRecordService trs;
	//未完成投资
	@RequestMapping("/account_loaninbid")
public String test3(Model model,@ModelAttribute TSiRecordQuery tSiRecordQuery,HttpSession session2){
		Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
		TUserData tUserData=(TUserData) session.getAttribute("user");
		Integer userid=null;
		if(tUserData!=null){
			userid=tUserData.getUserid();
		}
		tSiRecordQuery.setUserid(userid);
		BigDecimal sirreinst=trs.getReinstByUserid(tSiRecordQuery);
		BigDecimal sirinst=trs.getInstByUserid(tSiRecordQuery);
		BigDecimal inmoney=trs.getInmoneyByUserid(tSiRecordQuery);
		BigDecimal remoney=trs.getRemoneyByUserid(tSiRecordQuery);
		System.out.println("sadjklsadjsdalksadjsdkl");
		tSiRecordQuery.setPageSize(8);
		tSiRecordQuery.setSirisfinish(1);
		Page page=trs.getPage(tSiRecordQuery);
		model.addAttribute("page", page);
		model.addAttribute("tsi", tSiRecordQuery);
		model.addAttribute("sirreinst", sirreinst);
		model.addAttribute("sirinst", sirinst);
		model.addAttribute("inmoney", inmoney);
		model.addAttribute("remoney", remoney);
		return "/account_loaninbid";
		
	}
	@RequestMapping("/update_tsiRecord")
	public String test10(){
		TSiRecordQuery tSiRecordQuery=new TSiRecordQuery();
		trs.updateTSiRecord(tSiRecordQuery);
		return "/account_loaninbid";	
	}
	//已完成投资
	@RequestMapping("/account_loanincomplete")
	public String test5(Model model,@ModelAttribute TSiRecordQuery tSiRecordQuery,HttpSession session2){
		Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();	
		TUserData tUserData=(TUserData) session.getAttribute("user");
			Integer userid=null;
			if(tUserData!=null){
				userid=tUserData.getUserid();
			}
			tSiRecordQuery.setUserid(userid);
			BigDecimal sirreinst=trs.getReinstByUserid(tSiRecordQuery);
			BigDecimal sirinst=trs.getInstByUserid(tSiRecordQuery);
			BigDecimal inmoney=trs.getInmoneyByUserid(tSiRecordQuery);
			BigDecimal remoney=trs.getRemoneyByUserid(tSiRecordQuery);
			tSiRecordQuery.setPageSize(8);
			tSiRecordQuery.setSirisfinish(2);
			Page page=trs.getPage(tSiRecordQuery);
			model.addAttribute("tsi", tSiRecordQuery);
			model.addAttribute("sirreinst", sirreinst);
			model.addAttribute("sirinst", sirinst);
			model.addAttribute("inmoney", inmoney);
			model.addAttribute("remoney", remoney);
			return "/account_loanincomplete";
			
		}
	//未完成投资Ajax
	@RequestMapping("/tsiRecordAjax")
	@ResponseBody
	public void test4(HttpServletRequest request,HttpServletResponse response,TSiRecordQuery tSiRecordQuery,@RequestParam("userid") Integer userid){
		try {

			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			tSiRecordQuery.setUserid(userid);
			tSiRecordQuery.setPageSize(8);		
			tSiRecordQuery.setSirisfinish(1);
			Page page=trs.getPage(tSiRecordQuery);
			JSONObject jsb = JSONObject.fromObject(page);
			PrintWriter pw = response.getWriter();
			System.out.println("4444"+tSiRecordQuery.getSirstate());
			pw.print(jsb.toString());
			pw.flush();
			pw.close();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	//已完成投资Ajax
	@RequestMapping("/tsifnRecordAjax")
	@ResponseBody
	public void test6(HttpServletRequest request,HttpServletResponse response,TSiRecordQuery tSiRecordQuery,@RequestParam("userid") Integer userid){
		try {

			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			tSiRecordQuery.setPageSize(8);	
			tSiRecordQuery.setSirisfinish(2);
			Page page=trs.getPage(tSiRecordQuery);
			JSONObject jsb = JSONObject.fromObject(page);
			PrintWriter pw = response.getWriter();
			System.out.println("4444"+tSiRecordQuery.getSirstate());
			pw.print(jsb.toString());
			pw.flush();
			pw.close();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
