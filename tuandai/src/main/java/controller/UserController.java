package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aliyuncs.exceptions.ClientException;

import entity.TUcAccount;
import entity.TUserData;

import service.DrRecordService;
import service.UserService;
import util.SmsUtil;
import util.VerifyCodeUtils;




@Controller
public class UserController {

	@Resource
	@Qualifier("userService")
	private UserService us;
	
	@Resource
	@Qualifier("drRecordService")
	private DrRecordService ds;
	
	//进入登陆页面
	@RequestMapping("/login")
	public String openLogin(){
		return "login";
	}
	
	//进入注册页面
	@RequestMapping("/openregister")
	public String openRegister(){
		return "register";
	}
	
	@RequestMapping("/tologin")
	public String tologin(){
		
		return "login";
	}
	
	//进入个信息页面
	@RequestMapping("/account_userdetailinfo")
	public String openuserdetailinfo(){
		return "account_userdetailinfo";
	}
	
	//进入修改昵称
	@RequestMapping("/account_changenickname")
	public String openchangenickname(){
		return "account_changenickname";
	}
	
	//进入上传头像
	@RequestMapping("/account_useravatar")
	public String openaccount_useravatar(){
		return "account_useravatar";
	}
	
	//注册
	@RequestMapping("/register")
	public String addUser(HttpServletRequest request,TUserData user,HttpSession session,Model model,TUcAccount account) throws ClientException{
		String phone= request.getParameter("txtPhone");
		String pwd=request.getParameter("txtPwd");
		/*user.setUsername(userName);
		user.setNickname(userName);
		user.setPassword(pwd);
		user.setUsergrade(1);
		user.setPhone(phone);*/
		us.addUser(phone,pwd);
		/*account.setUserid(user.getUserid());
		account.setUcavail(0d);
		us.addUserId(account);*/
		return "successful";
	}
	
	//登录
	@RequestMapping("/check")
	public String loginUser(HttpServletRequest request, HttpServletResponse response,HttpSession session,Model model){
		String userName=request.getParameter("username");
		String password=request.getParameter("password");
		String verification=request.getParameter("verification");
		String ver=(String) session.getAttribute("verCode");
		String bigVer = ver.toUpperCase();
		String isRemember=(request.getParameter("isRemember")!=null) ? request.getParameter("isRemember"): "off";
		SavedRequest savedRequest= WebUtils.getSavedRequest(request);
		String url ="index";
		if(null!=savedRequest){
			url="redirect:"+savedRequest.getRequestURI().substring(savedRequest.getRequestURI().lastIndexOf("/"));
		}
		//Boolean flag=us.checkUser(userName,password);
		if(!verification.equals(bigVer) && !verification.equals(ver)){
			model.addAttribute("err", "验证码错误");
			model.addAttribute("un", userName);
			return "/login";
		}
		//创建subject实例
		Subject currentUser = SecurityUtils.getSubject();
		// 将用户名及密码封装到UsernamePasswordToken
		UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
		try {
			//登陆认证
			currentUser.login(token);
		} catch (UnknownAccountException e) {
			model.addAttribute("err", "用户名或密码错误");
		}catch (IncorrectCredentialsException e) {
			model.addAttribute("err", "用户名或密码错误");
		}
		if(currentUser.isAuthenticated()){
			if(isRemember.equals("on")){
				Cookie cookie=new Cookie("username",userName);
				response.addCookie(cookie);
			}
			return url;
		}
		/*if(flag){
			TUserData user= us.getUser(userName);
			session.setAttribute("user", user);
			ds.addDrReco((TUserData)session.getAttribute("user"));
			if(isRemember.equals("on")){
				Cookie cookie=new Cookie("username",userName);
				response.addCookie(cookie);
			}
			return "index";
		}
		model.addAttribute("err", "用户名或密码错误");
		model.addAttribute("un", userName);*/
		return "/login";
	}
	
	//生成登陆验证码
	@RequestMapping("/ver")
	public void verification(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException{
		response.setHeader("Pragma", "No-cache"); 
        response.setHeader("Cache-Control", "no-cache"); 
        response.setDateHeader("Expires", 0); 
        response.setContentType("image/jpeg"); 
        //生成随机字串 
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4); 
        //存入会话session  
        session = request.getSession(true); 
        //删除以前的
        session.removeAttribute("verCode");
        session.setAttribute("verCode", verifyCode.toLowerCase()); 
        //生成图片 
        int w = 100, h = 40; 
        VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode); 
		
	}
	
	//验证用户名是否注册
	@RequestMapping("/checkPhone")
	public void checkPhone(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out=response.getWriter();
		String phone = request.getParameter("phone");
		TUserData user= us.getUser(phone);
		String flag="false";
		 if(user!=null){
			 flag="true";
		 }
		out.write(flag);
		out.flush();
		out.close();
	}
	
	//发送短信
	@RequestMapping("/sendsms")
	@ResponseBody
	public String sendSms(HttpServletRequest request,HttpSession session) throws ClientException{
		String phone =request.getParameter("phone");
		//方法一：将短信验证码存入seesion
		/*
		Integer verCode=SmsUtil.getVerCode();
		SmsUtil.sendSms(phone, verCode);
		session.setAttribute("verCode", verCode);
		session.setMaxInactiveInterval(300);*/
		//方法二：存入redis
		us.saveVerCode(phone);
		return "true";
	}
	
	//验证短信验证码
	@RequestMapping("/checkVerCode")
	public void checkVerCode(HttpServletRequest request,HttpSession session,HttpServletResponse response,Model model) throws IOException{
		PrintWriter out= response.getWriter();
		Integer inputCode = Integer.parseInt(request.getParameter("input"));
		String key=request.getParameter("keyPhone");
		//方法一：通过取出session验证码验证
		Object code= session.getAttribute("verCode");
		String verCode=null;
		if(code!=null){
			verCode =code.toString();
		}
		if(verCode==null || !(verCode.equals(inputCode))){
			out.write("true");
		}else {
			out.write("false");
		}
		
		//方法二：获取redis验证码进行验证
		/*
		Boolean flag= us.getSMS(key, inputCode);
		if(flag){
			out.write("false");
		}else {
			out.write("true");
		}
		*/
		out.flush();
		out.close();
	}
	
	@RequestMapping("/resetpwd")
	public String openRestpwd(){
		return"resetpwd";
	}
	
	//忘记密码发送短信
	@RequestMapping("/restSendsms")
	@ResponseBody
	public String restSendsms(HttpServletRequest request,HttpSession session) throws ClientException{
		String phone =request.getParameter("phone");
		TUserData data= us.getUser(phone);
		if(data==null){
			return"false";
		}
		us.saveVerCode(phone);
		return "true";
	}
	
	//忘记密码点击发送短信时查看手机号是否登录
	@RequestMapping("/checkResetMobileCode")
	@ResponseBody
	public String checkResetMobileCode(HttpServletRequest request,HttpServletResponse response) {
		String key=request.getParameter("mobile");
		Integer inputCode=Integer.parseInt(request.getParameter("code"));
		Boolean flag= us.getSMS(key,inputCode);
		if(flag){
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping("/changepwd")
	public String openchangepwd(HttpServletRequest request,Model model){
		String phone=request.getParameter("phone");
		model.addAttribute("phone", phone);
		return "changepwd";
	}
	
	//修改密码
	@RequestMapping("/updatepwd")
	@ResponseBody
	public String updatepwd(HttpServletRequest request,TUserData user){
		String newpwd=request.getParameter("newPassword");
		String phone=request.getParameter("phone");
		user.setPassword(newpwd);
		user.setPhone(phone);
		return us.updatepwd(user);
	}
	
	@RequestMapping("/updatenickname")
	@ResponseBody
	public String updatenickname(HttpSession session2,HttpServletRequest request){
		Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
		String nickName= request.getParameter("nickName");
		TUserData user =(TUserData) session.getAttribute("user");
		user.setNickname(nickName);
		us.updatenickname(user);
		return "true";
	}
	
	@RequestMapping("/updateinfo")
	@ResponseBody
	public String updateinfo(HttpSession session2,HttpServletRequest request,TUserData user){
		Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
		TUserData data= (TUserData) session.getAttribute("user");
		user.setUserid(data.getUserid());
		String companysize=request.getParameter("companysize");
		user.setCompanySize(companysize);
		us.updateinfo(user);
		session.setAttribute("user",us.getUser(data.getPhone()));
		return "true";
	}
	
	@RequestMapping("/uploadHeadImage")
	@ResponseBody
	public String updateImg(@RequestParam(value="sysImg")String img,HttpServletRequest request) throws IOException{
		String imgPath=img.substring(img.indexOf("images"));
		String suffix=img.substring(img.lastIndexOf("."));
		String fileName = UUID.randomUUID().toString();
		String contexPath= request.getSession().getServletContext().getRealPath("/");
		System.out.println(contexPath);
		File file=new File(contexPath+imgPath);
		FileInputStream fs =new FileInputStream(file);
		byte[] bytes = new byte[fs.available()];
		//fs.read(bytes);
		fs.close();
		//将读取的字节发送到服务端
		//String result = HttpUtil.getHttpResult("http://192.168.175.131:8080/httpImgSpringBoot/server/receive?fileName="+(fileName+suffix), bytes);
		//System.out.println("result=" + result);
		return "dsdsd";
	}
	
	@RequestMapping("/logout")
	public void logout(){
		System.out.println("退出");
	} 
}
