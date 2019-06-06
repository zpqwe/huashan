package controller;

import java.math.BigDecimal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageInfo;
import entity.TTitem;
import entity.TUndertake;
import entity.TUserData;
import service.LjjTransferService;

@Controller
@RequestMapping("/Transfer")
public class LjjController {
	//自动装置LjjTransferService接口
	@Autowired
	private LjjTransferService ljjTransferService;
	private TUserData tUserData;
	//转让列表显示
	@RequestMapping("/list")
	public String  TransferList(@RequestParam(value="num",required=false,defaultValue="1") int num,Model model,HttpSession session){
		//调用ljjTransferService获取转让列表方法
		List<TTitem> tTitems = ljjTransferService.getTTitems(num);
		//获取动态封装page对象
		PageInfo<TTitem> info = ljjTransferService.getPageInfo(tTitems);
		 tUserData=(TUserData) session.getAttribute("user");
		model.addAttribute("tuser", tUserData);
		//设置当前页码
		int page=num;
		//存入作用域
		model.addAttribute("tTitems",tTitems);
		model.addAttribute("page", page);
		model.addAttribute("info", info);
		//转发
		return "zqzr_list";
	}
	
	//使用 Ajax 实现分页无刷新效果 
	@RequestMapping("/filterqureyAjax")
	//使用@ResponseBody 将 封装 对象以json 数据返回前台 
	public @ResponseBody PageInfo<TTitem> tTitemShow(HttpServletRequest request, HttpServletRequest response){
		String PageCurrent= request.getParameter("PageCurrent"); //接收跳转页面
		String tireperiodMin = request.getParameter("tireperiodMin"); //周转期限最小值
		String tireperiodMax = request.getParameter("tireperiodMax"); //周转期限最大值
		String tiinterest = request.getParameter("tiinterest");//年化利率
		String tisurmoney = request.getParameter("tisurmoney");//剩余金额
		String tiremethod = request.getParameter("tiremethod");//结清方式
		int Pagecurrent = Integer.parseInt(PageCurrent); //数据格式转换
		String deforder= request.getParameter("deforder");//默认排序
		String restorder= request.getParameter("restorder");//年化利率排序
		String roidorder= request.getParameter("roidorder");//周转期限
		String ceidorder= request.getParameter("ceidorder");//投标进度  方式？
		String timeorder= request.getParameter("timeorder");//发标时间
		
		//调用 service 层的 filterQurey 获取到查询的结果
		List<TTitem> list = ljjTransferService.filterQurey(Pagecurrent,tireperiodMin, tireperiodMax, tiinterest, tisurmoney, tiremethod,deforder,restorder,roidorder,ceidorder,timeorder);
		//将结果封装 info 对象中
		PageInfo<TTitem> info = ljjTransferService.getPageInfo(list);
		return info;
	}
	//查看转让详情 我要承接
	@RequestMapping("/detail")
	public String transferInfo(String title,Model model){
		System.err.println("title"+title);
		TTitem Titem = ljjTransferService.infoQuery(title);
		model.addAttribute("Titem", Titem);
		model.addAttribute("tuser", tUserData);
		return "zqzr_detail";
	}
	
	
	//getSubscribePageListAjax  subscriberTranferId
	@RequestMapping("/getSubscribePageListAjax")
	public @ResponseBody PageInfo<TUndertake> getSubscribePageList(String subscribeId ,@RequestParam(value="subscriberTranferId",required=false) String subscriberTranferId,Integer pageIndex){
		System.out.println("subscribeId"+subscribeId);  			//获取订单id
		System.out.println("subscriberTranferId"+subscriberTranferId);	//获取订阅用户
		System.out.println("pageIndex"+pageIndex);				//获取页码
		List<TUndertake> TundertakeList = ljjTransferService.getSubscribePageList(subscribeId, subscriberTranferId, pageIndex);
		PageInfo<TUndertake> info = ljjTransferService.getPageInfo(TundertakeList);
		return info;
	}
	
	//获取转让人的信息
	@RequestMapping("/getTransferUserInfoAjax")
	public @ResponseBody TUserData getTransferUserInfoAjax(String transferUserid){
		TUserData userDataInfo = ljjTransferService.getTUserDataInfo(transferUserid);
		return userDataInfo;
	}
	
	
	//获取用户账户资金的信息
	@RequestMapping("/getUseraccountAjax")
	public @ResponseBody String getUseraccountAjax(String userid){
		System.err.println("------------Userid-----------"+userid);
		BigDecimal userFund = ljjTransferService.getUserFund(userid);
		System.err.println("userFund----------------+++++++++++"+userFund);
		String userfund = userFund.toString();
		return userfund;
	}
}
