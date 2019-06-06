
var isWePlanProject = false; //标记是否在We计划详情页
var IsOpenCGT = '1'; //是否开通存管通
var isOpenCgtSub = '1'; //是否开启存管通申购
var isOpenCgtSubWe = '1'; //是否开启存管通申购WE计划
var IsOpenCgtSubFtb = '1'; //是否开启存管通申购复投宝
var lowerunit = "100.39";
var rete = "10.95";
var deadline = 138;
var pId = "E702EB95-66F6-41C4-A350-E0FB0674F3EB";
var repaymentType = "\u6BCF\u6708\u4ED8\u606F";
var IsScribeTanfer = true; //是否债权转让
var isLogin = false;
var tdwUrl = "https:\/\/www.tdw.cn";
var userFund = "0"; //可用余额
var LowerUnit = "100.3917"; //起投金额
var residualAmount = "0"; //剩余金额
var subscribeAviAmount = "0.00" //我可申购
var amount = null; //标的剩余金额4位小数
var aviMoney = null; //用户可用金额4位小数

subscribeAviAmount = subscribeAviAmount.split(',').join('');
$(function() {
	//取消右键
	
	
	if($(".login-a").text()==null||$(".login-a").text()==''){
		isLogin = false;
	}else{
		isLogin = true;
	}
	
	initSubscribesPagin($("#divPagination").attr("totalcount"));
	//加载借款人基本信息
	SubscribeList();
	if(isLogin) {
		//已经登陆调用方法 获取转让人信息
		LoadUserInfo();
		//登陆成功时显示可投资选项
		LoginInfo();
	}else{
		//用户未登陆追加样式
		$("#a2").append('<div style="text-align: center; margin: 10px 0px 10px 0px">只有会员才有权限查看借款人信息，请<a style="color: #FF9600;" href="login.htm">&nbsp;登录&nbsp;</a>后再查看!</div>');
		//登陆未成功时追加样式
		$(".bid_inf_right").append('<div id="recharge-art" style="height: auto;">'+
				'<div class="right">'+
				'<p>'+
					'可用余额：'+
					'<span style="color: #a3a3a3">登录后可显示余额</span>'+
				'</p>'+
				'<a href="javascript:fnLogin();" class="charge">确认投资</a>'+
				'<p>'+
					'我可申购：<span class="font-000"></span>'+
				'</p>'+
				'<p>'+
					'申购金额：<span class="font-orange font-bold" id="payamount">0.00</span><span style="color: #ff7800 !important; font-weight: bold !important;">元</span>'+
				'</p>'+
				'<p>'+
					'预期收益：<span class="font-orange font-bold" id="profit">0.00</span><span style="color: #ff7800 !important; font-weight: bold !important;">元</span>'+
				'</p>'+
				'<div class="invent-form">'+
					'<div class="form-box">'+
						'<input id="jiek_Share" value="1" type="text" class="input-text" maxshares="0.00">元'+
					'</div>'+
					'<i class="top" id="jiek_plus"></i><i class="bottom" id="jiek_minus"></i>'+
					'<a id="MaxInvest" href="javascript:void(0);" onclick="MaxInvest()">全额</a>'+
				'</div>'+
				'<div class="money-errmes">'+
					'输入金额只能为起投金额的整数倍，已为您自动调整'+
				'</div>'+
				'<a href="javascript:void(0);" id="btnSubscribe" zqzrid="1" class="invent-btn invent-btn-1" attrid="E702EB95-66F6-41C4-A350-E0FB0674F3EB" istran="true">确认投资</a>'+
				'<div class="agreement">'+
					'<label><input id="ckbAgree" type="checkbox" checked="checked">我已阅读并同意</label>'+
					'<a class="text-yellow" href="https://contract.tuandai.com/P2P/Web/ContractZqzr.html" target="_blank">《债权转让协议》</a>'+
					'<a class="text-yellow" href="https://contract.tuandai.com/P2P/Web/RiskWarningContract.html" target="_blank">《风险揭示书》</a>'+
				'</div>'+
			'</div>'+
		'</div>');
		
	}
});
//定位scrollBox层始终在屏幕
function tools() {
	var tabbarH = $(".top-bar").height() + 160 + $(".detail_logo_bg").height() + $(".position").height() + $(".bid_invest_inf").height();
	var top = $(document).scrollTop();
	if(($.browser.msie == true) && ($.browser.version == 6.0)) {
		if(top > tabbarH) $(".bid_invest_nav").css({
			position: "absolute",
			top: top - tabbarH
		});
	} else {
		if(top > tabbarH) {
			$(".bid_invest_nav").css({
				position: "fixed",
				top: 0,
				left: 0
			});
			$('.bid_ensure_box.a1').css({
				'margin-top': '75px'
			});
		}

	}
	if(top <= tabbarH) {
		$(".bid_invest_nav").css({
			position: "static"
		});
		$('.bid_ensure_box.a1').css({
			'margin-top': '0'
		});
	}
}
$(function() {
	window.onscroll = tools;
	window.onresize = tools;
});

//*----滑动锚点
//tager 为元素
function getTager(tager) {
	$('html,body').animate({
		scrollTop: $(tager).offset().top - 60
	}, 250);
	return false;
}
//************************************************************************
$(window).bind("scroll", function() {
	var scrollTop = document.documentElement.scrollTop + document.body.scrollTop;
	if(scrollTop >= $(".a1").offset().top - 115 && scrollTop <= $(".a2").offset().top - 115) {
		$(".bid_nav").each(function(i) {
			var Nnav = "n" + (i + 1) + "-selected";
			$(".bid_nav").removeClass(Nnav);
		});
		$('.n1').addClass("n1-selected");
	} else if(scrollTop >= $(".a2").offset().top - 115 && scrollTop <= $(".a3").offset().top - 115) {
		$(".bid_nav").each(function(i) {
			var Nnav = "n" + (i + 1) + "-selected";
			$(".bid_nav").removeClass(Nnav);
		});
		$('.n2').addClass("n2-selected");
	} else if(scrollTop >= $(".a3").offset().top - 115 && scrollTop <= $(".a4").offset().top - 115) {
		$(".bid_nav").each(function(i) {
			var Nnav = "n" + (i + 1) + "-selected";
			$(".bid_nav").removeClass(Nnav);
		});
		$('.n3').addClass("n3-selected");
	} else if(scrollTop >= $(".a4").offset().top - 115) {
		$(".bid_nav").each(function(i) {
			var Nnav = "n" + (i + 1) + "-selected";
			$(".bid_nav").removeClass(Nnav);
		});
		$('.n4').addClass("n4-selected");
	}
});

var pagesize = "15";
var pageindex = "1";
//进入页面或刷新页面时 加载申购列表 TODO
function SubscribeList() {
	$("#Subscribelist").nextAll().remove();
	$("<tr><td colspan=\"6\" align=\"center\">数据加载中...</td></tr>").insertAfter('#Subscribelist');
	jQuery.ajax({
		async: true,
		type: "get",
		url: "getSubscribePageListAjax",/*路劲跳转 控制层  Transfer/getSubscribePageListAjax*/
		dataType: "json",
		data: {
			subscribeId:$("#SubscribeId").attr("title"),
			subscriberTranferId: $("#btnSubscribe").attr("attrid"),
			pageIndex: pageindex
		},
		success: function(json) {
			$("#Subscribelist").nextAll().remove();
			var html = new Array();
			if(json.total != 0) {
				var temp1 = pagesize * (pageindex - 1);
				if(json.list.length > 0) {
					for(var i = 0; i < json.list.length; i++) {
						var item = json.list[i];
						var udate=new Date(item.untime);//JSON格式转换
						var Yeardate=udate.getFullYear();//年份
						var Monthdate=udate.getMonth()+1;//月份
						var daydate=udate.getDate();//日份
						var str = "<tr>" +
							"<td>" + parseInt(parseInt(temp1) + parseInt(i + 1)) + "</td>" +  /*遍历循环序号*/
							"<td>" + item.unuserphone + "</td>" +							/*用户名 （电话）*/
							"<td>￥" + (item.minundertake == null ? "" : item.minundertake) + "</td>" +/*最低承接*/
							"<td><div style=\"color:#f60;\">￥" + item.unmoney + "</div></td>" +  /*承接总额*/
							"<td>" + item.uninterest + "%</td>" + 					/*承接时年化率*/
							/*投标方式 0 为 手动，1位 自动*/
							"<td><img style=\"width:48px; height:19px;\" alt=\"\" src=\"//js3.tuandai.com/images/investlist/invest_detail/auto_" + (item.unmode ? "1" : "0") + ".png\" /></td>" +
							"<td>" + Yeardate + "/"+Monthdate+"/"+daydate+"</td>" + /*投标时间*/
							"</tr>";
						html.push(str);
					}
					
				} else {
					html.push("<tr><td colspan=\"8\" align=\"center\">暂没有人投标...</td></tr>");
				}

				$(html.join("")).insertAfter('#Subscribelist');
				if(parseInt(json.data.totalCount) != parseInt($("#divPagination").attr("totalCount"))) {
					initSubscribesPagin(json.data.totalCount);
				}
			} else {
				$("<tr><td colspan=\"8\" align=\"center\">暂没有人投标...</td></tr>").insertAfter('#Subscribelist');
			}
		},
		
		error:function(){
			alert("错误1");}
	});
}

//分页申购列表
arrowChange(); //申购箭头层级
function arrowChange() {
	$('.invent-form').find('i').bind("mousemove", function() {
		$(this).parent().find('i').css({
			"z-index": "1"
		});
		$(this).css({
			"z-index": "2"
		});
	})
}

function initSubscribesPagin(recordCount) {
	var num_entries = recordCount;
	$("#divPagination").pagination(num_entries, {
		callback: getSubscribes,
		items_per_page: 15,
		num_display_entries: 5,
		current_page: parseInt(pageindex - 1),
		num_edge_entries: 1,
		link_to: "#Subscribelist",
		prev_text: "上一页",
		next_text: "下一页",
		ellipse_text: "...",
		prev_show_always: true,
		next_show_always: true,
		renderer: "defaultRenderer",
		show_if_single_page: false,
		load_first_page: true
	});
}
//获取投资人列表
function getSubscribes(page_index, jq) {
	if(parseInt(pageindex - 1) == page_index) {
		return false;
	}
	pageindex = (page_index + 1);
	SubscribeList();
	return false;
}

//加载个体用户基本信息 
function LoadUserInfo() {
	var transferid=$("div[name='userinfo']").text();
	jQuery.ajax({
		async: true,
		type: "get", //请求格式 get
		url: "getTransferUserInfoAjax",//获取转让人信息
		dataType: "json", //返回数据 JSON
		data: {
			transferUserid:transferid//转让用户id
		},
		success: function(json) {
			
			var udate=new Date(json.pubdate);//JSON格式转换
			var Yeardate=udate.getFullYear();//年份
			var Monthdate=udate.getMonth()+1;//月份
			var daydate=udate.getDate();//日份
			$("#a2").append(
					'<div class="staging_info_box clearfloat">'+
					'<h3>基本信息</h3>'+
					'<ul class="staging_blist clearfloat">'+
						'<li id="nickName">姓名：'+json.truename+'</li>'+
						'<li id="age">年<span style="padding-left: 28px;"></span>龄：'+json.ishouse+'</li>'+
						'<li id="telNo">手机号：'+json.phone+'</li>'+
						'<li id="sex">性别：'+(json.isvehicle==1 ? '男':'女')+'</li>'+
						'<li id="registerDate">注册时间：' + Yeardate + "-"+Monthdate+"-"+daydate+'</li>'+
						'<li id="bankCity">所在地：'+json.address+'</li>'+
					'</ul>'+
				'</div>'+
				'<div class="staging_info_box clearfloat">'+
				'<h3>审核信息</h3>'+
					'<div class="staging_certifia clearfloat">'+
						'<p class="staging_verify01"><span></span><i>身份认证</i></p>'+
						'<p class="staging_verify02"><span></span><i>手机认证</i></p>'+
						'<p class="staging_verify05"><span></span><i>实地认证</i></p>'+
						'<p class="staging_verify03"><span></span><i>邮箱认证</i></p>'+
					'</div>'+
				'</div>');
		}
	});
}

//登陆显示承接框
function LoginInfo(){
	var Userid=$(".login-b").text();   //用户id编号
	residualAmount = $("#residualAmount").attr("attrjin");   //我可承接
	$.ajax({
		async: true,
		url:"getUseraccountAjax",
		type:"POST",
		data:{
			userid:Userid//发送回控制层
		},
		datatype:"json",
		success:function(json){
			userFund=json;
			$(".bid_inf_right").append('<div id="recharge-art" style="height: auto;">'+
			'<div class="right">'+
				'<a href="javascript:;" onclick="checkRecharge();" class="charge recharge-flag">去充值</a>'+
				'<p>'+
					'可用余额：<span class="font-000">'+json+'</span>'+
				'</p>'+
				'<p>'+
					'我可承接：<span class="font-000">'+residualAmount+'</span>'+
				'</p>'+
				'<p>'+
					'承接金额：<span class="font-orange font-bold" id="payamount">0.00</span><span style="color: #ff7800 !important; font-weight: bold !important;">元</span>'+
				'</p>'+
				'<p>'+
					'预期收益：<span class="font-orange font-bold" id="profit">0.00</span><span style="color: #ff7800 !important; font-weight: bold !important;">元</span>'+
				'</p>'+
				'<div class="invent-form">'+
					'<div class="form-box">'+
						'<input id="jiek_Share" value="0" type="text" class="input-text" maxshares="0.00">元'+
					'</div>'+
					'<i class="top" id="jiek_plus"></i><i class="bottom" id="jiek_minus"></i>'+
					'<a id="MaxInvest" href="javascript:void(0);" onclick="MaxInvest()">全额</a>'+
				'</div>'+
				'<div class="money-errmes">'+
					'输入金额只能为最低承接的整数倍，已为您自动调整'+
				'</div>'+
				'<a href="javascript:void(0);" id="btnSubscribe" zqzrid="1" class="invent-btn invent-btn-1" attrid="E711BFC4-923D-4320-98E9-F9019E297064" istran="true" onclick="Confirm()">确认承接</a>'+
				'<div class="agreement">'+
					'<label><input id="ckbAgree" type="checkbox" checked="checked">我已阅读并同意</label>'+
					'<a class="text-yellow" href="//contract.tuandai.com/P2P/Web/ContractZqzr.html" target="_blank">《债权转让协议》</a>'+
					'<a class="text-yellow" href="//contract.tuandai.com/P2P/Web/RiskWarningContract.html" target="_blank">《风险揭示书》</a>'+
				'</div>'+
			'</div>'+
		'</div>')
		},
		error:function(){
			alert("错误2");
		}
	});
};
//点击确认承接按钮事件
function Confirm(){
	$("#confirm").attr("style","display: block;");		//弹框显示
	$("#diallayer").attr("style","display:block;");		//遮挡层打开
};

function colosenewWindow(){		//关闭余额不足窗口 
	$("#dial-window").attr("style","display:none;");						//余额不足弹框隐藏
	$("#td-art").attr({"style":"margin-left: -309px", "class":"z101"});		//确认投资显示
	$("#diallayer").attr("style","display:block;");							//遮挡层显示
};

$(function(){
	//取消投资
	$(".close-x").click(function(){
		
		$("#confirm").attr("style","display: none;");	//弹框隐藏
		$("#td-art").attr("style","display:none");		//确认投资隐藏
		$("#diallayer").attr("style","display:none;");	//遮挡层隐藏
	});	
	
	//放弃承接
	$("#investorCancel").click(function(){
		$("#confirm").attr("style","display: none;");	//弹框隐藏
		$("#diallayer").attr("style","display:none;");	//遮挡层隐藏
	});
	
	//点击继续承接
	$("#investorGo").click(function(){
		var art_UserName=$(".login-a").text();//回显承接人信息
		var art_ProjectAmount=$(".c_ff7506:first").text();//回显转让总额
		var art_ReTime=$(".c_484848:last").text();//回显计划期限
		var art_Rate=$(".c_ff7506:eq(1)").text();//回显年利率
		var txtLowerUnit=$(".g9 span:eq(2)").text();//回显最低承接
		var art_ReType=$(".g9 span:eq(3)").text();//回显还款方式
		
		var art_UserFund=$(".bid_inf_right .font-000:first").text();//可用余额
		var txtMaxUnit=$("#residualAmount").attr("attrjin");   //我可承接
		
		//追加到页面中
		if($("#art_UserName").text()==''){//当第一次加载时候 加载数据
			$("#art_UserName").append("承接人："+art_UserName);
			$("#art_ProjectAmount").append("转让总额："+art_ProjectAmount+"元");
			$("#art_ReTime").append("计划期限："+art_ReTime);
			$("#art_Rate").append("预期年化利率："+art_Rate+"%");
			$("#txtLowerUnit").append("最低承接："+txtLowerUnit);
			$("#art_ReType").append("还款方式："+art_ReType);
			
			$("#art_UserFund").append(art_UserFund+"元");	//追加显示可用余额
			//追加显示我可承接可用余额低于承接金额 使用可用余额否则使用承接金额
			$("#txtMaxUnit").append(art_UserFund>txtMaxUnit?txtMaxUnit:art_UserFund);	
		}
		
		
		$("#confirm").attr("style","display: none;");		//弹框隐藏
		$("#diallayer").attr("style","display:block;");		//遮挡层显示
		$("#td-art").attr("style","margin-left: -309px");	//确认投资显示
	});

	$("#PostData").click(function(){
		var art_UserFund=$("#art_UserFund").text();//可用余额
		var txtLowerUnit=$(".g9 span:eq(2)").text();//回显最低承接
		if(art_UserFund<txtLowerUnit){
			$("#dial-window").attr("style","display:block;");	//余额不足弹框显示
			$("#td-art").attr("class","z102");					//设置继续投资页面 Z 的遮挡样式 高度
		}
		else{
			alert($("#txtUnit").val());
			
		}
	});
});

//获取输入的值，计算出收益
function check(value){
	var txtLowerUnit=$(".g9 span:eq(2)").text();//回显最低承接
	var art_ProjectAmount=$(".c_ff7506:first").text();//回显转让总额
	var art_ReTime=$(".c_ff7506:last").text();//回显计划期限(天数)
	var art_Rate=$(".c_ff7506:eq(1)").text();//回显年利率
	var inverst="";//封装结果集
		for(var i=0;i<value.length;i++){ //循环
			var input=value.charAt(i,1);
			if(isNaN(input)==false&&input!=" "){//键盘输入为 数字并且不是空格
				inverst=inverst+input;
			}
		}
		//判断输入数字大于 最低承接 并且小于最大承接
		if(Number(inverst)<txtLowerUnit || Number(inverst)>art_ProjectAmount){
			$("#txtInvestAmount").html("0.00");		//键盘按下改变承接金额
			$("#txtExpected").html("0.00");			//键盘按下改变预期收益
			return;
		}else{
		countBtn(inverst,art_ReTime,art_Rate);
		}
}

//计算预期收益
function countBtn(inverst,art_ReTime,art_Rate){
	var Profit=formatfloat(inverst*(art_Rate/100)*art_ReTime/365,2);//计算收益
	$("#txtInvestAmount").html(inverst);	//键盘按下改变承接金额
	$("#txtExpected").html(Profit);			//键盘按下改变预期收益
}


//预期收益最后保留俩位小数
var formatfloat = function(f, digit) {
	var num = new Number(f);
    return num.toFixed(digit); //预期收益四舍五入 和投资列表里面 值相同
}; 



(function() { //红包下拉
	try {
		getRandomValue();
	} catch(e) {}
	$('.red-package-list').css({
		'margin-bottom': '-5px'
	});
	$('.red-package-list').find('dt').click(function(event) {
		$(this).parent().find('dd').slideDown(300);
		event.stopPropagation();
	});
	$('.red-package-list').find('li').click(function() {
		var thisVal = $(this).attr('data');
		$(this).parents('.red-package-list').find('.data').text(thisVal);
		$(this).find('dd').slideUp(300);
	});
	$(window).click(function(event) {
		$('.red-package-list').find('dd').slideUp(300);
	});
})();
(function() {
	$(".a_code").mouseover(function() {
		$(".codexe").show();
	}).mouseout(function() {
		$(".codexe").hide();
	});
	$('.member-list').hover(function() {
		$(this).find('ul').addClass('ul-type').end().find('.mission').show();
		$(this).find('.arrow').removeClass('down-arrow').addClass('up-arrow');
	}, function() {
		$(this).find('ul').removeClass('ul-type').end().find('.mission').hide();
		$(this).find('.arrow').removeClass('up-arrow').addClass('down-arrow');
	})
})();

function stringToHex(s) {
	var r = '';
	var hexes = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'];
	for(var i = 0; i < (s.length); i++) {
		r += hexes[s.charCodeAt(i) >> 4] + hexes[s.charCodeAt(i) & 0xf]
	}
	return r
}

function HexTostring(s) {
	var r = '';
	for(var i = 0; i < s.length; i += 2) {
		var sxx = parseInt(s.substring(i, i + 2), 16);
		r += String.fromCharCode(sxx)
	}
	return r
}

var nwbi_userName = "";
var nwbi_sysNo = "TDW";
var IsLogin = isCookieLogin();
if(IsLogin) {
	var nickname = jaaulde.utils.cookies.get("TDWUserName");
	nwbi_userName = nickname;
}
(function() {
	var ta = document.createElement('script');
	ta.type = 'text/javascript';
	ta.async = true;
	ta.src = ((("https:") == document.location.protocol) ? "https://" : "http://") + 'bilog.niiwoo.com/js/webaccess.js';
	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(ta, s);
})();

var _hmt = _hmt || [];
(function() {
	var hm = document.createElement("script");
	hm.src = "//hm.baidu.com/hm.js?6dff67da4e4ef03cccffced8222419de";
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(hm, s);
})();
