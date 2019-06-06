package controller;

import java.io.IOException;


import java.io.UnsupportedEncodingException;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import query.MyQuery;
import query.Rece2Query;
import query.TSiItemQuery;
import query.TUcAccountQuery;

import entity.Page;
import entity.TDealRecord;
import entity.TReceRecord;
import entity.TSiRecord;
import entity.TUcAccount;
import entity.TUserData;

import entity.TSiItem;


import service.ReceRecordService;
import service.RechWithService;
import service.TSiItemService;
import service.TSiRecordService;
import service.TUcAccountService;



@Controller
public class TSiItemController {
	@Resource
	@Qualifier("tsiItemService")
	private TSiItemService ts;
	@Resource
	@Qualifier("tUcAccountService")
	private TUcAccountService tus;
	@Resource
	@Qualifier("rechWithService")
	private RechWithService rws; 
	@Resource
	@Qualifier("tsiRecordService")
	private TSiRecordService trs;
	
	@Resource
	@Qualifier("receRecordService")
	private ReceRecordService rrs;
	//投资项目详细查询
	@RequestMapping("/mini_detail")
	public String test2(Model model,Integer siiid,HttpSession session2,TSiItemQuery tSiItemQuery){
		
		TUcAccount ta=null;
		Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
		TUserData tUserData=(TUserData) session.getAttribute("user");
		
		if(tUserData!=null){
		ta=tus.getTUcAccount(tUserData);
		}
		TSiItem ti=ts.getTSiItemById(siiid);
		Page page=trs.getPageBySiiid(tSiItemQuery);
		model.addAttribute("ti", ti);
		model.addAttribute("ta", ta);
		model.addAttribute("page",page);
		return "/mini_detail";
		
	}
	@RequestMapping("/update_list")
	public String test9(){
		ts.updateTSiItem();
		return "/invest_list";	
	}
	@RequestMapping("/updatelists")
	@ResponseBody
	public void test19(HttpServletRequest request,HttpServletResponse response,
			TSiItemQuery tSiItemQuery){
		try {
			request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Rece2Query query=new Rece2Query();
		ts.updateSirstate(tSiItemQuery);
		trs.updateisfinish(tSiItemQuery);
		List<TReceRecord> lists=rrs.getRRtime(tSiItemQuery);
		Calendar cale = null;
	    cale = Calendar.getInstance();
	    int year = cale.get(Calendar.YEAR);
	    int month = cale.get(Calendar.MONTH) + 1;
	    int day = cale.get(Calendar.DATE);
	    int hour = cale.get(Calendar.HOUR_OF_DAY);
	    int minute = cale.get(Calendar.MINUTE);
	    int second = cale.get(Calendar.SECOND);
	    Integer min=minute;
	    Integer months=month;
	    Integer years=year;
		String dates=null;
		Integer sirid=0;
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(TReceRecord trr:lists){
			if(!sirid.equals(trr.getSirid())){
				System.out.println("sirid:"+sirid+"getSirid:"+trr.getSirid());
				sirid=trr.getSirid();
				month=months;
				year=years;
				
			}
			month++;
			if(month>12){
				year++;
				month=1;
			}
		
			dates=year+"-"+month+"-"+day+" "+hour+":"+min+":"+second;
			if(day==31){
				if(month==4||month==6||month==9||month==11){
					dates=year+"-"+month+"-"+30+" "+hour+":"+min+":"+second;
				}
			}
			if(year%4>0&&month==2&&day>28){
				dates=year+"-"+month+"-"+28+" "+hour+":"+min+":"+second;
			}else if(year%4==0&&month==2&&day>29){
				dates=year+"-"+month+"-"+29+" "+hour+":"+min+":"+second;
			}
			query.setRrid(trr.getRrid());
			query.setRrdate(sdf.parse(dates));
			rrs.updateRRtimes(query);
		}
		JSONObject jsb = JSONObject.fromObject(tSiItemQuery);
		PrintWriter pw = response.getWriter();
		pw.print(jsb.toString());
		pw.flush();
		pw.close();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
	
	
	//投资项目-投资记录列表
		@RequestMapping("/TSiRecordAjaxBySiiid")
		@ResponseBody
		public void test7(HttpServletRequest request,HttpServletResponse response,TSiItemQuery tsiItemQuery){
			try {

				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				tsiItemQuery.setPageSize(10);
				Page page=trs.getPageBySiiid(tsiItemQuery);
				
				JSONObject jsb = JSONObject.fromObject(page);
				PrintWriter pw = response.getWriter();
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
		//投资项目-回款记录列表
				@RequestMapping("/TReceRecordAjax")
				@ResponseBody
				public void test10(HttpServletRequest request,HttpServletResponse response,TSiItemQuery tsiItemQuery){
					try {

						request.setCharacterEncoding("UTF-8");
						response.setCharacterEncoding("UTF-8");
						tsiItemQuery.setPageSize(10);
						Page page=rrs.getRRPage(tsiItemQuery);
						System.out.println("page.getTotalCount()"+page.getTotalCount());
						JSONObject jsb = JSONObject.fromObject(page);
						PrintWriter pw = response.getWriter();
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
	//添加投资
		@RequestMapping("/AddTSiReCord")
		public void test6(HttpServletRequest request,HttpServletResponse response,
				TDealRecord tDeal,HttpSession session,TSiItemQuery tSiItemQuery,
				TUcAccountQuery tUcAccountQuery,TSiRecord tSiRecord,String[] rrtotal,
				String[] rrinterest,String[] rrmoney,Integer rrnownum,Date rrdate) throws ParseException{
			try {
				
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				
				//添加交易记录
				rws.addreco(tDeal);
				//修改投资项目剩余金额
				ts.updateSiirmoney(tSiItemQuery);
				//修改投资项目完成时间
				ts.updateSiifinishtime(tSiItemQuery);
				//修改账户余额
				tus.updatermoney(tUcAccountQuery);
				//添加投资记录
				trs.addSirecord(tSiRecord);
				Integer sirid=tSiRecord.getSirid();
				Rece2Query rece2Query=new Rece2Query(rrtotal,rrinterest,rrmoney,
						rrnownum, rrdate,sirid);
				rece2Query.setSirid(sirid);
				//添加回款记录
				rrs.addRececords(rece2Query);
				//修改投资项目状态
				if(tSiItemQuery.getQtmoney()==0){
					tSiItemQuery.setSiistate("已满标");
					ts.updateSiistate(tSiItemQuery);
				}
				JSONObject jsb = JSONObject.fromObject(tSiItemQuery);
				PrintWriter pw = response.getWriter();
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
			
		
	//投资项目列表
	@RequestMapping("/invest_list")
	public String test3(Model model,@ModelAttribute TSiItemQuery tsiItemQuery){
		
		System.out.println("44444"+tsiItemQuery.getSiitype());
		System.out.println("6666"+tsiItemQuery.getPageNo());
		System.out.println("666666"+tsiItemQuery.getPageSize());
	//	TSiItemQuery tsiItemQuery=new TSiItemQuery(siitype,siireturn,siiairate,siirepayment);
		Page page=ts.getPage(tsiItemQuery);
		System.out.println("hahahaha"+page.getTotalCount());
		List<TSiItem> lists=page.getList();
		model.addAttribute("page", page);
		model.addAttribute("tsi", tsiItemQuery);
		return "/invest_list";
		
	}
	//投资项目Ajax
	@RequestMapping("/tsiItemAjax")
	@ResponseBody
	public void test4(HttpServletRequest request,HttpServletResponse response,TSiItemQuery tsiItemQuery){
		try {

			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			List<TSiItem> list=ts.getTSiItemList(tsiItemQuery);
			Page page=ts.getPage(tsiItemQuery);
			List<TSiItem> lists=page.getList();
			JSONObject jsb = JSONObject.fromObject(page);
			PrintWriter pw = response.getWriter();
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