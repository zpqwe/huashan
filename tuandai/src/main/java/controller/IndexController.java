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

import service.SanBService;
import util.RedisTemplateUtil;

import dao.RechWithMapper;
import dao.SanBMapper;
import entity.TSiItem;
import entity.TTitem;
import entity.TUserData;
//曾平写
@Controller
//@RequestMapping("/list")
public class IndexController {
	@Resource
	@Qualifier("sanBService")
	private SanBService sanb;
	/*@Qualifier("rechWithMapper")
	private RechWithMapper rechWith;*/
	@Resource
	@Qualifier("redisTemplateUtil")//加载缓存
	private RedisTemplateUtil redisTemplateUtil;
	
	
	@RequestMapping("/testc")
	public String getRedisValue(){
		redisTemplateUtil.set("testc", "123");
		System.out.println(redisTemplateUtil.get("testc"));
		return redisTemplateUtil.get("testc").toString();
	}
	//返回散标列表
		@RequestMapping("/ajaxindex")
		@ResponseBody
		public TUserData sanlist(){
			Subject currentUser = SecurityUtils.getSubject();
            Session session = currentUser.getSession();
			return (TUserData) session.getAttribute("user");
		}
	//返回散标列表
	@RequestMapping("/index")
	public String sanlist(Model model,HttpSession session,HttpServletRequest request){
		Long userCont=sanb.userCount();
		List<TSiItem> tsitem=sanb.TIlist();//散标
		List<TSiItem> tsitemwtd=sanb.TIlistwtd();//微团贷
		List<TSiItem> tsitemfqb=sanb.TIlistfqb();//分期宝
		List<TSiItem> tsitemgyl=sanb.TIlistgyl();//供应链
		List<TTitem> ttitem=sanb.ttlist();//债权转让
		Integer countSanb=sanb.countSanb();//散标数量
		Integer countZh=sanb.countZh();//转让数量
		Integer countfqb=sanb.countType("分期宝");//其他数量
		Integer countgyl=sanb.countType("供应链");
		Integer countwtd=sanb.countType("微团贷");
		model.addAttribute("countSanb", countSanb);
		model.addAttribute("countZh", countZh);
		model.addAttribute("countfqb", countfqb);
		model.addAttribute("countgyl", countgyl);
		model.addAttribute("countwtd", countwtd);
		//保存作用域
		model.addAttribute("ttitem", ttitem);
		model.addAttribute("tsitem", tsitem);//转让
		model.addAttribute("userCont", userCont);
		model.addAttribute("tsitemwtd", tsitemwtd);
		model.addAttribute("tsitemfqb", tsitemfqb);
		model.addAttribute("tsitemgyl", tsitemgyl);
		/*if(session.getAttribute("user")!=null){
			model.addAttribute("tuser",session.getAttribute("user"));
		}*/
		
		System.out.println("用户名====================="+session.getAttribute("user"));
		return "/index";
	}
	@RequestMapping("/error")
	public String testError() throws Exception{
	   throw new Exception();
	}
}
