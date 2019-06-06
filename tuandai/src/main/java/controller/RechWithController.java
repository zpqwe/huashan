package controller;
//曾平写
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import query.RechWithQuery;
import service.BankService;
import service.RechWithService;

import com.aliyuncs.exceptions.ClientException;

import util.RandomNumber;
import util.SmsUtil;
import dao.RechWithMapper;
import entity.Page;
import entity.TBankcardtable;
import entity.TDealRecord;
import entity.TRecharge;
import entity.TUcAccount;
import entity.TUserData;
import entity.TWithdrawCash;
@Controller
//提现充值
public class RechWithController {
	@Resource
	@Qualifier("rechWithService")
	private RechWithService rech;
	@Resource
	@Qualifier("bankService")
	private BankService bankService;
	private TUserData tuser;
	
	//进入快捷充值页面
	@RequestMapping("/Recharge")
	public String Recharge(Model model,HttpSession session){
	/*	tuser=helduser(model, "", session);
		TBankcardtable tbank=rech.selectTB(tuser);
		if(tbank==null){
			
		}*/
		return "/Recharge";
	}
	//进入网银充值页面
	@RequestMapping("/normalRecharge")
	public String normalRecharge(Model model){
		return "/normalRecharge";
	}
	//进入转账充值页面
	@RequestMapping("/transfer")
	public String transfer(Model model){
		return "/transfer";
	}
	//获取银行卡号后四位
	private String bankwei="";
	
	//提取得到用户方法
	public TUserData helduser(Model model,String t_money, HttpSession session2){
	//生成订单号
	model.addAttribute("random", RandomNumber.getGuid());
	model.addAttribute("t_money", t_money);
	Subject currentUser = SecurityUtils.getSubject();
    Session session = currentUser.getSession();
	tuser=(TUserData) session.getAttribute("user");
	tuser=rech.tuser(tuser.getUsername());//获取保存登录的用户名
	//得到银行卡后四位
	bankwei=rech.outbank(tuser.getBacknumber(), bankwei);
	model.addAttribute("bankwei", bankwei);
	//保存客户姓名
	model.addAttribute("tuser", tuser);
	return tuser;
	}
	//private ;//查询条件
	private RechWithQuery query=new RechWithQuery();
	//进入充值页面
	@RequestMapping("/ChongZhi")
	public String ChongZhi(Model model,String t_money,String kuai,HttpSession session2) throws ClientException{
		Subject currentUser = SecurityUtils.getSubject();
	    Session session = currentUser.getSession();
		tuser=(TUserData) session.getAttribute("user");
			//生成订单号
			query.setDindanh(RandomNumber.getGuid());;
			model.addAttribute("random", query.getDindanh());
			model.addAttribute("t_money", t_money);
			System.out.println("银行卡号"+tuser.getBacknumber());
			if(""!=tuser.getBacknumber()||null!=tuser.getBacknumber()){//判断是否绑定银行卡
				return "account_bankinfo";
			}else{
				tuser=rech.tuser(tuser.getUsername());//获取保存登录的用户名
				tuser.setBacknumber(rech.outbank(tuser.getBacknumber(), tuser.getBacknumber()));
			}
			
			model.addAttribute("bankwei", bankwei);
			//保存客户姓名
			model.addAttribute("tuser", tuser);
			Integer yanzm=SmsUtil.getVerCode();//得到手机验证码
			System.out.println("验证码"+yanzm);
			//SmsUtil.sendSms(tuser.getPhone(),yanzm);//发送验证码
			session.setAttribute("yanzm", yanzm);//信息保存session作用域
			model.addAttribute("kuai", kuai);
			tuser.setPhone(rech.phone(tuser.getPhone()));//处理手机号分割
			return "ChongZhi";
		
	}

		//支付
		@RequestMapping("/paymentO")
		public String payment(Model model,TRecharge trech,HttpSession session,String tranpasswordy,String remoney,String kuai,String smsCode) throws ParseException{
			
			//tuser=helduser(model, "", session);//获取登录用户
			 tuser=(TUserData) session.getAttribute("user");
			TDealRecord tdeal=new TDealRecord();//记录表
			
			query.setUserid(tuser.getUserid());
			//获取当前时间
			 Date date=new Date();
			 DateFormat  sid=new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
			String shji = sid.format(date);
			Timestamp ts = new Timestamp(sid.parse(shji).getTime());
			//获取充值的金额  获取资金表
			TUcAccount tucac=rech.seleauca(query);
			//添加交易记录
			tdeal.setDrdate(ts.toString());//当前时间
			tdeal.setDrdtype("1");//交易类型1表示充值
			tdeal.setUserid(tuser.getUcid());//资金id
			tdeal.setDrexplain(kuai);//记录表充值方式
			Double emoney=new Double(remoney);//springmvc接收的数据都是字符串，所以需要转换
			tdeal.setDrexpenditure(emoney.toString());//充值金额
			Double drbalance=tucac.getUcavail()+emoney;//计算金额
			tdeal.setDrbalance(drbalance.toString());//剩余金额
			rech.addreco(tdeal);//添加消息记录
			trech.setRetime(ts);//充值时间
			trech.setDrid(tdeal.getDrid());//记录id
			trech.setRemethod(kuai);//充值方式
			trech.setUcid(tuser.getUcid());//用户资金id
			
			String yanz=String.valueOf(session.getAttribute("yanzm"));
			if(smsCode.equals(yanz)){
				System.out.println("短信正确"+session.getAttribute("yanzm"));
				//tuser.getTranpassword())
				TBankcardtable tbank=bankService.tbank(tuser);
				if(tranpasswordy.equals(tbank.getTransactionpassword())){
					System.out.println("交易密码正确");
					tucac.setUcavail(drbalance);//资金表增加金额
					trech.setUcid(tuser.getUcid());//获取资金id
					trech.setRestate("充值成功");//充值状态
					rech.addRech(trech);//调用添加方法
					rech.updamaney(tucac);//充值成功，修改金额
				}else{
					trech.setRestate("充值失败");
					rech.addRech(trech);//调用添加方法
					model.addAttribute("random", query.getDindanh());
					model.addAttribute("error","充值失败");
					model.addAttribute("jiaoyi", "密码不正确，若密码输错次数超过5次，账户将被冻结");
					model.addAttribute("t_money", remoney);//金额回显
					
					return "ChongZhi";
				}
			}else{
				trech.setRestate("充值失败");
				rech.addRech(trech);//调用添加方法
				model.addAttribute("t_money", remoney);//金额回显
				model.addAttribute("error","充值失败");
				model.addAttribute("yanerror", "验证码错误");
				return "ChongZhi";
			}
			return "redirect:/account_default";
		}
		//进入充值记录
		@RequestMapping("/rechagehistory")
		public String RechargeRecord(Model model,HttpSession session,RechWithQuery query){
			TRecharge trech=new TRecharge();
			trech.setRestate("充值成功");
			TRecharge fial=new TRecharge();
			fial.setRestate("充值失败");
			//给double转换为两位小数
			DecimalFormat df = new DecimalFormat("#.00");
			Double manySuccess=rech.manySuccess(trech);
			Double manyfail=rech.manySuccess(fial);
			model.addAttribute("manySuccess", df.format(manySuccess));
			model.addAttribute("tuser", tuser);
			model.addAttribute("manyfail", df.format(manyfail));
			return "account_rechagehistory";//页面跳转
		}
		@RequestMapping("/ajaxsele")//ajax查询充值记录
		@ResponseBody
		public void ajaxrecord(Model model,HttpServletRequest request,HttpServletResponse response,RechWithQuery query) throws UnsupportedEncodingException{
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			//tuser=helduser(model, "", session);
			Subject currentUser = SecurityUtils.getSubject();
		    Session session = currentUser.getSession();
			tuser=(TUserData) session.getAttribute("user");
			query.setUserid(tuser.getUserid());
			System.out.println("开始"+query.getTxtBegin());
			System.out.println("结束"+query.getTxtEnd());
			if(null !=query.getRestate()){
				if(query.getRestate().equals("全部")){
					query.setRestate("");
				}
			}
			Page page=rech.getpage(query);
			System.out.println("长度"+page.getList().size());
			PrintWriter out;
			try {
				out = response.getWriter();
				JSONObject jsb = JSONObject.fromObject(page);
				out.print(jsb.toString());
				System.out.println(jsb.toString());
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//进入提现
		@RequestMapping("drawmoney")
		public String drawmoney(Model model){
			Subject currentUser = SecurityUtils.getSubject();
		    Session session = currentUser.getSession();
			tuser=(TUserData) session.getAttribute("user");
			RechWithQuery query=new RechWithQuery();//查询条件
			query.setUserid(tuser.getUserid());
			TUcAccount tucac=rech.seleauca(query);
			TBankcardtable tbank=bankService.tbank(tuser);
			tbank.setCardNo(rech.outbank(tbank.getCardNo(), tbank.getCardNo()));
			model.addAttribute("tuser", tuser);
			model.addAttribute("tbank", tbank);
			model.addAttribute("tucac", tucac);
			return "drawmoney";
		}

		//提现
		@RequestMapping("/cash")
		public String cash(Model model,TWithdrawCash twith,String drexplain) throws ParseException{
			//获取用户
			//tuser=helduser(model, "", session);
			Subject currentUser = SecurityUtils.getSubject();
		    Session session = currentUser.getSession();
			tuser=(TUserData) session.getAttribute("user");
			query.setUserid(tuser.getUserid());
			//获取申请时间
			 Date date=new Date();
			 DateFormat  sid=new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
			String shji = sid.format(date);
			Timestamp ts = new Timestamp(sid.parse(shji).getTime());
			//添加交易记录
			TDealRecord tdeal=new TDealRecord();//交易表
			tdeal.setUserid(tuser.getUserid());//用户id等于资金id
			tdeal.setDrdate(ts.toString());//当前时间
			tdeal.setDrdtype("2");//类型类型2代表提现
			tdeal.setDrexpenditure(twith.getWcmoney().toString());//支出金额
			tdeal.setDrexplain(drexplain);//充值类型
			TUcAccount tucac=rech.seleauca(query);//根据用户获取资金
			 Double drbalance=tucac.getUcavail()-twith.getWcmoney();//剩余金额
			 tucac.setUcavail(drbalance);//用户可用余额
			tdeal.setDrbalance(drbalance.toString());//用户可用余额
			rech.updamaney(tucac);//修改金额
			rech.addreco(tdeal);//添加记录
			//用户中资金id
			twith.setUcid(tuser.getUcid());
			twith.setDrid(tdeal.getDrid());//记录id
			//提现流水号
			twith.setWcnumber(RandomNumber.getGuid());
			twith.setWctime(ts);//提现时间
			twith.setWcstate("待审核");//审核状态
			twith.setWcmode(drexplain);//提现方式
			
			rech.addWith(twith);//添加提现记录
			rech.updatwith(tucac);
			return "redirect:/account_default";
		}
		//进入提现记录
		@RequestMapping("/account_drawhistory")
		public String account_drawhistory(Model model,HttpSession session){
			return "/account_drawhistory";
		}
		@RequestMapping("/ajaxseledraw")//ajax查询提现记录
		@ResponseBody
		public void ajaxdrawh(Model model,HttpSession session,HttpServletRequest request,HttpServletResponse response,RechWithQuery query) throws UnsupportedEncodingException{
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			query.setUserid(tuser.getUcid());
			query.setPageSize(5);
			System.out.println(query.getPageNo());
			System.out.println(query.getIndex());
			Page page=rech.Withpage(query);
			System.out.println("每页数据量"+page.getList().size());
			PrintWriter out;
			try {
				out = response.getWriter();
				JSONObject jsb = JSONObject.fromObject(page);
				out.print(jsb.toString());
				System.out.println(jsb.toString());
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		private TBankcardtable tbank;
		//忘记交易密码页面
		@RequestMapping("/Transaction_password")
		public String Transaction_password(Model model){
			 tbank=rech.selectTB(tuser);
			tbank.setReservePhone(rech.phone(tuser.getPhone()));//用户手机号和预留手机号
			model.addAttribute("tbank", tbank);
			model.addAttribute("bankwei", bankwei);
			return "/Transaction_password";
		}
		
		//点击发送验证码触发
		@RequestMapping("/ajaxsmsCode")
		@ResponseBody
		public String smsCode(Model model){
			Subject currentUser = SecurityUtils.getSubject();
		    Session session = currentUser.getSession();
			tuser=(TUserData) session.getAttribute("user");
			//得到随机验证码给用户发送
			Integer yanzm=SmsUtil.getVerCode();//得到手机验证码
			try {
				//发送验证码
				SmsUtil.sendSms("13590486378",yanzm);
			} catch (ClientException e) {
				e.printStackTrace();
			}
			return yanzm.toString();
		}
		//修改交易密码
		//@ResponseBody
		@RequestMapping("/news_password")
		public String news_password(Model model,TBankcardtable tbank,String smsCode,String yanzm,HttpSession session){
			//判断验证码是否正确
			if(yanzm.equals(smsCode)){
				tbank=rech.ifuser(tbank);
				if(null!=tbank){//判断用户输入的信息是否正确
					model.addAttribute("yes", "yes");
					return "news_password";
					//return "Transaction_password";
				}else{
					model.addAttribute("error", "<div class='inpPrompt'><i class='icon-error'></i>用户姓名或者证件号码不正确</div>");
				}
			}else{
				model.addAttribute("error", "<div class='inpPrompt'><i class='icon-error'></i>验证码不正确</div>");
			}
			model.addAttribute("bankwei", bankwei);
			model.addAttribute("tbank", this.tbank);
			return "Transaction_password";
		}
		//提交交易密码
		@RequestMapping("/password_information")
		public String password_information(Model model,TBankcardtable tbank){
			tbank.setUserid(tuser.getUserid().longValue());
			rech.updaPwd(tbank);
			return "password_information";
		}
}
