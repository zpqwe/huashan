
var type = 1;
var status = 1; //标状态: 1->投资中  2->已完成
var pagesize = 5;
var CurrentPage =1;
var initPage = 10;
var pageindex1 = 1; //小微企业
var pageindex2 = 1; //微团贷
var pageindex3 = 1; //分期宝
var pageindex4 = 1; //供应链
var pageindex5 = 1; //项目宝
var pageindex6 = 1; //资产标区
var pageindex7 = 1; //债权转让
/*净股专区搜索参数*/
var beginDeadLine = 0;
var balance=0;
var endDeadLine = 0;
var rate = 0;
var beginRate = 0;
var endRate = 0;
var RepaymentTypeId = 0;
var strkey = "";
var searchType = 0;
var orderby = 0;

var browser = {
	versions: function() {
		var u = navigator.userAgent,
			app = navigator.appVersion;
		return {
			trident: u.indexOf('Trident') > -1, //IE内核
			presto: u.indexOf('Presto') > -1, //opera内核
			webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
			gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
			mobile: !!u.match(/AppleWebKit.*Mobile.*/) || !!u.match(/AppleWebKit/), //是否为移动终端
			ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
			android: u.indexOf('Android') > -1, //android终端或者uc浏览器
			iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
			iPad: u.indexOf('iPad') > -1, //是否iPad
			webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
		};
	}()
};

$(function() {
	invTag(); //列表切换标签
	if(!browser.versions.ios && !browser.versions.android) {
		$('.jing-tip-box').hide();
		$('.inv-list').mouseover(function() {
			$(this).find('.jing-tip-box').show();
		}).mouseout(function() {
			$(this).find('.jing-tip-box').hide();
		});
		//非手机上可下拉滚动导航条
	}




	//周转期限
	$(".condition-list dd[attrtype='3']").click(function() {
		if($(this).hasClass("gar"))
			return;
		if(!$(this).hasClass("on")) {
			beginDeadLine = $(this).attr("attrmin");
			endDeadLine = $(this).attr("attrmax");
			$(".condition-list dd[attrtype='3']").removeClass("on");
			$(this).addClass("on");
			getInvestLists(CurrentPage);
		}
	});
	
	//年化利率
	$(".condition-list dd[attrtype='1']").click(function() {
		if(!$(this).hasClass("on")) {
			rate = $(this).attr("attrval");
			$(".condition-list dd[attrtype='1']").removeClass("on");
			$(this).addClass("on");
			getInvestLists(CurrentPage);
		}
	});
	
	//剩余金额
	$(".condition-list dd[attrtype='5']").click(function() {
		if($(this).hasClass("gar"))
			return;
		if(!$(this).hasClass("on")) {
			balance = $(this).attr("attrval");
			$(".condition-list dd[attrtype='5']").removeClass("on");
			$(this).addClass("on");
			getInvestLists(CurrentPage);
		}
	});
	
	//结清方式
	$(".condition-list dd[attrtype='2']").click(function() {
		if($(this).hasClass("gar"))
			return;
		if(!$(this).hasClass("on")) {
			RepaymentTypeId = $(this).attr("attrval");
			$(".condition-list dd[attrtype='2']").removeClass("on");
			$(this).addClass("on");
			getInvestLists(CurrentPage);
		}
	});

});

function invTag() { //列表切换标签
	$('.invest-tag').find('dd').bind('click', function(el) {
		var thisTagId, idNum, invListId;
		thisTagId = $(this).attr('id');
		idNum = thisTagId.split('-')[2];
		$(this).parent().find('dd').removeClass('on');
		$(this).addClass("on");

		$('.financial-list').hide();
		$('.inv-list-detail').find('#inv-list-' + idNum).show();
	})
}


/*======================*/
/*初始化搜索参数*/

/*********排序处理*******/
//排序

//加载借款项目列表
function getInvestLists(CurrentPage) {
	//TODO 修改JS部分
	$.ajax({
		type: "post",
		url: "filterqureyAjax",
		dataType: "json",
		data: {
			"PageCurrent":CurrentPage,
			"tiremethod": RepaymentTypeId,  //结清方式
			"tisurmoney": balance,           //剩余金额
			"tireperiodMin": beginDeadLine,  //周转期限 小
			"tireperiodMax": endDeadLine,    //周转期限  大
			"tiinterest": rate, 	//年化利率
		},
		success: function(json) {
			//接收到的数据为空时 删除 指定的子元素
			if(json.total==0){
				$("#projectlist").empty();
				$("#pagination").empty();
				$("#projectlist").append('<div style="text-align:center;"><img width="880px;" alt="厦门银行" src="../images/1516161723557.jpg"><img width="880px;" alt="第三方担保" src="../images/1516161749857.jpg"><img width="880px;" alt="大数据风控" src="../images/1523525146176.jpg"></div>');
			
			}
			//接收到的数据不为空时  删除指定的子元素 添加数据
			if(json.total!=0){
				$("#projectlist").empty();
				$("#pagination").empty();
				for(var i=0; i< json.list.length;i++){
					var tititle=json.list[i].tititle;
					var timoney=json.list[i].timoney;
					var tistmoney=json.list[i].tistmoney;
					var tisurmoney=json.list[i].tisurmoney;
					var tiinterest=json.list[i].tiinterest;
					var tireperiod=json.list[i].tireperiod;
					var tiremethod=json.list[i].tiremethod;
					$("#projectlist").append('<dl class="inv-list cl fix pb20  vm"><dt class="l"><a href="" >     <img alt="" src="../images/default.jpg" onerror=""></a></dt><dd class="l ml20 detail"><div class="inv-title pt5"><a href="zqzr_detail.htm" class="ell i-b-d " title="'+tititle+'">'+tititle+'</a></div><div class="inv-data"><ul><li>转让总额'+timoney/10000+'万元</li><li>起投金额'+tistmoney+'元 </li><li class="surplus">剩余'+tisurmoney/10000+'万元</li><li class="percent"><span class="f30 g-orange2 fa">'+tiinterest+'</span><span class="g-orange2">%</span> 利率 </li><li class="ml1"><span class="f28 g303030 fa">'+tireperiod+'</span><span class="g303030">天</span>/'+tiremethod+'</li></ul></div></dd><dd class="l inv-progress"></dd><dd class="l inv-progress"><a class="join td-btn-1  mt20 td-btn-1-or" href="zqzr_detail.htm" attrid="B437C68E-2AE2-4C57-A5EC-CE3CF3B4AE3F" protitle="P2P转让_101419383088">我要承接</a></dd></dl>')
				}
				
				$("#pagination").append('<a href="javascript:void(0);" id="Upper" onclick="openUpper()">上一页</a>');
				//获取总页码数
				pages=json.navigatepageNums[json.navigatepageNums.length-1];
				//获取封装好的数组 页面显示行数 遍历
				for(var i=0; i< json.navigatepageNums.length;i++) {
					//取出每页数组的值 作为分页显示
					 page=json.navigatepageNums[i];
					$("#pagination").append('<a href="javascript:void(0);" onclick="openOwn('+page+')">'+page+'</a>');
				}
				$("#pagination").append('<a href="javascript:void(0);" id="Next" onclick="openNext()">下一页</a>');
				if(pageIndex==pages){
					$("#Next").addClass("current prev");
				}
			}
		},
		error: function() {
			$("#projectlist").empty();
			$("#pagination").empty();
			$("#projectlist").append('<div style="text-align:center;"><img width="880px;" alt="厦门银行" src="../images/1516161723557.jpg"><img width="880px;" alt="第三方担保" src="../images/1516161749857.jpg"><img width="880px;" alt="大数据风控" src="../images/1523525146176.jpg"></div>');
		}
	});
}
//下一页点击函数 
function openNext(){
	//当前页码大于 总页码，初始化
	if(CurrentPage+1>pages){
		CurrentPage=pages;
	}else{
		CurrentPage=CurrentPage+1;
	}
	getInvestLists(CurrentPage);
}

//上一页点击函数 
function openUpper(){
	//当前页码小于 0页码，初始化
	if(CurrentPage-1>0){
	CurrentPage=CurrentPage-1;
	}else{
	CurrentPage	= 1;
	}
	getInvestLists(CurrentPage);
}
//当前页面点击函数 
function openOwn(page){
	getInvestLists(page);
}
function Order(param){
	getInvestLists(CurrentPage);
}

//初始化所有分页控件
function InitAllPagePagin() {
	initSubscribesPagin(parseInt(invest_count), 1);
	initSubscribesPagin(parseInt(micro_count), 2);
	initSubscribesPagin(parseInt(fqb_count), 3);
	initSubscribesPagin(parseInt(gyl_count), 4);
	initSubscribesPagin(parseInt(xmb_count), 5);
	initSubscribesPagin(parseInt(jing_count), 6);
	initSubscribesPagin(parseInt(zqzr_count), 7);
}