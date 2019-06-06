package controller;

import javax.annotation.Resource;


import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.TSiItem;

import service.TSiItemService;



@Controller
public class Test {
	@Resource
	@Qualifier("tsiItemService")
	private TSiItemService ts;
	
	
	@RequestMapping("/zqzr_detail")
	public String test2(Model model,Integer siiid){
		ApplicationContext act =new ClassPathXmlApplicationContext("applicationContext.xml");
		TSiItemService ts= (TSiItemService) act.getBean("tsiItemService");
		TSiItem ti=ts.getTSiItemById(siiid);
		model.addAttribute("ti", ti);
		return "/zqzr_detail";
		
	}
}
