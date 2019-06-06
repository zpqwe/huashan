package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import service.UserInfoService;
//import service.PicService;
//import entity.TPic;
import entity.TUserData;

@Controller
public class UserInfoController {
	
	@Resource
	private UserInfoService uis;
	
	//@Resource
	//private PicService picService;
	
	TUserData tuser;
	@RequestMapping("/userinfo")
	public String gojsp(){
		return "account_userdetailinfo";
	}
	
	@RequestMapping("/changename")
	public String changename(Model model,HttpSession session){
		 tuser=(TUserData) session.getAttribute("user");
		model.addAttribute("nickname", tuser.getUsername());
		return "changeusername";
	}
	
	/*@RequestMapping("/setimg")
	public String setimg(){
		return "userTouXiangSet";
	}*/
	
	/*@RequestMapping(value = "/imageUpLoad", method = RequestMethod.POST)
	public String saveImg(@RequestParam("fuImage") MultipartFile img, Model model, TUserData user, HttpServletRequest request)
			throws IOException {

		// 上传的图片
		TPic pic = new TPic();
		if (img.getSize() != 0) {
			// 获取图片上传的真实路径
			String realPath = request.getSession().getServletContext().getRealPath("/resource/upload");

			String imgFileName = img.getOriginalFilename();
			String suffix = imgFileName.substring(imgFileName.indexOf("."));// 后缀名
			String noRepeatName = UUID.randomUUID().toString() + suffix;// 通过UUID加后缀名，组成不会重复的文件名

			// 根据保存的图片路径构造File文件对象
			String srcPath = realPath + "/" + noRepeatName;
			File file = new File(srcPath);
			// 保存到数据库时的路径
			String saveToDBpath = "/resource/upload" + "/" + noRepeatName;
			// 写入文件
			img.transferTo(file);

			
			// 图片保存的路径
			pic.setUrl(saveToDBpath);
			
			if (img.getSize() != 0) {
				pic.setUserid(user.getUserid());
				// 把 pic 添加到数据库，pic依赖于user，pic对象有两个字段，一个是url，一个是 userid
				// userid 是通过先把 user 加入到数据库后再获取到的
				picService.addPic(pic);
			}
		}
		
		return "account_userdetailinfo";
	}*/

	

	/*@RequestMapping("/imageUpLoad")
	 public String filesUpload(@RequestParam("fuImage") MultipartFile file,
	            HttpServletRequest request) {
		//将request变成multipartRequest
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		//利用getFile来获得File
		CommonsMultipartFile oldfile = (CommonsMultipartFile)multipartRequest.getFile("fuImage");
	        //将文件保存到目标地址
		
			
	        
	        
	    }*/
	
	@RequestMapping("/member/updateUserInfo")
	public String SaveUserInfo(TUserData user,HttpServletRequest request,Model model){
		System.out.println("============================================");
		System.out.println("毕业学校："+user.getUserugf());
		uis.saveUserInfo(user);
		model.addAttribute("user", user);
		return "account_userdetailinfo";
		
	}
	
	@RequestMapping("/updateUserNickName")
	public String updateName(Model model,String nickname,TUserData user,HttpSession session){
		TUserData tuser=(TUserData) session.getAttribute("user");
		//Integer userId = (Integer)session.getAttribute("userid");
		//String username = req.getParameter("username");
		//logger.debug("昵称："+ txtNickName);
		System.out.println("========================");
		user.setUcid(tuser.getUcid());
		user.setUsername(nickname);
		uis.updateNickName(user);
		/*session.setAttribute("nickname", nickname);*/
		return "redirect:changeusername";
	}
}
