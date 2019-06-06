var type = 1;
var status = 2; //标状态: 1->投资中  2->已完成
var pagesize = 5;
var pageindex1 = 1; //小微企业
var pageindex2 = 1; //微团贷
var pageindex3 = 1; //分期宝
var pageindex4 = 1; //供应链
var pageindex5 = 1; //项目宝
var pageindex6 = 1; //资产标区
var pageindex7 = 1; //债权转让
/*净股专区搜索参数*/
var beginDeadLine = 0;
var endDeadLine = 0;
var rate = 0;
var beginRate = 0;
var endRate = 0;
var RepaymentTypeId = 0;
var strkey = "";
var searchType = 0;
var orderby = 0;
var projectList;

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
		suspension();
	}

	$('.invest-tag').delegate("dd", "click", function() {
		var thisTagId, tabindex;
		var isfirst = 1;
		thisTagId = $(this).attr('id');
		isfirst = parseInt($(this).attr('attrisfirst'));
		tabindex = thisTagId.split('-')[2];

		if(tabindex == 3 || tabindex == 6) {
			$(".state-change").hide();
		} else {
			$(".state-change").show();
		}
		if(tabindex <= 7) {
			if(tabindex == 7) {
				pageindex7 = 1;
			}
			if(tabindex == 6) {
				pageindex6 = 1;
			} else if(tabindex == 5) {
				pageindex5 = 1;
			} else if(tabindex == 4) {
				pageindex4 = 1;
			} else if(tabindex == 3) {
				pageindex3 = 1;
			} else if(tabindex == 2) {
				pageindex2 = 1;
			} else {
				pageindex1 = 1;
			}
			type = tabindex.toString();
			InitOrder();
			initSearch(type);
			//当为第一次切换页签时不加载数据，只做页签切换
			if(isfirst == 1) {
				$(this).attr("attrisfirst", "0");
				var bFirstStatus = parseInt($(this).attr('attrstatus'));
				setStatusVal(bFirstStatus);
			} else {
				//切换页签
				getInvestList(type, true);
			}
		}
	});

	//利率
	$(".condition-list dd[attrtype='1']").click(function() {
		if(!$(this).hasClass("on")) {
			rate = $(this).attr("attrval");
			beginRate = 0;
			endRate = 0;
			$(".condition-list dd[attrtype='1']").removeClass("on");
			$(this).addClass("on");
			InitPageIndex();
			getInvestList(type, true);
		}
	});

	//还款方式
	$(".condition-list dd[attrtype='2']").click(function() {
		if($(this).hasClass("gar"))
			return;
		if(!$(this).hasClass("on")) {
			RepaymentTypeId = $(this).attr("attrval");
			$(".condition-list dd[attrtype='2']").removeClass("on");
			$(this).addClass("on");
			InitPageIndex();
			getInvestList(type, true);
		}
	});
	//期限
	$(".condition-list dd[attrtype='3']").click(function() {
		if($(this).hasClass("gar"))
			return;
		if(!$(this).hasClass("on")) {
			beginDeadLine = $(this).attr("attrmin");
			endDeadLine = $(this).attr("attrmax");
			$(".condition-list dd[attrtype='3']").removeClass("on");
			$(this).addClass("on");
			InitPageIndex();
			getInvestList(type, true);
		}
	});
	//完成与进行时状态 切换
	// 导航slide
	$('.sort-condition').hover(function(e) {

		},
		function(e) {
			$("#dvPopSort").stop().slideUp(200);
			$(".sort-condition").find('span').show();
			$(".sort-condition").find("dl").removeClass('add-border').find('.icon').show();
		}
	);
	$('.sort-condition').find('.val').click(function() {
		$(this).parent().find('ul').show();
	});

	if($(".sort-condition").length > 0) {
		$('.sort-condition').find('li').bind({
			click: function() {
				var val, name;
				var sortCondition = $('.sort-condition');
				val = $(this).attr("attrval");
				name = $(this).attr("attrname");
				$(this).parent().hide();
				sortCondition.find('.val').show();
				$("#dvCurStatus").attr({
					'attrval': val,
					"attrname": name
				}).html(name + "<i class=\"icon arrow\"></i>");

				status = val;
				if(val == 1) {
					$(".sort-condition").find(".v1").attr({
						'attrval': "1",
						"attrname": "进行中的"
					}).text("进行中的");
					$(".sort-condition").find(".v2").attr({
						'attrval': "2",
						"attrname": "已满标的"
					}).text("已满标的");
				} else {
					$(".sort-condition").find(".v1").attr({
						'attrval': "2",
						"attrname": "已满标的"
					}).text("已满标的");
					$(".sort-condition").find(".v2").attr({
						'attrval': "1",
						"attrname": "进行中的"
					}).text("进行中的");
				}
				InitPageIndex();
				getInvestList(type, true);
				return false;
			}
		});
	}

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

function setStatusVal(val) {
	if(val == 1) {
		$("#dvCurStatus").attr({
			'attrval': val,
			"attrname": "进行中的"
		});
		$("#dvCurStatus").html("进行中的<i class=\"icon arrow\"></i>");
	} else {
		$("#dvCurStatus").attr({
			'attrval': val,
			"attrname": "已满标的"
		});
		$("#dvCurStatus").html("已满标的<i class=\"icon arrow\"></i>");
	}
	status = val;
}

/*======================*/
/*初始化搜索参数*/
function initSearch(listType) {
	status = 1;
	beginDeadLine = 0;
	endDeadLine = 0;
	rate = 0;
	beginRate = 0;
	endRate = 0;
	RepaymentTypeId = 0;
	strkey = "";
	searchType = 0;
	orderby = 0;

	//初始化选择样式
	$(".condition-list").find("dd[attrtype='1']").removeClass("on");
	$(".condition-list").find("dd[attrtype='2']").removeClass("on");
	$(".condition-list").find("dd[attrtype='3']").removeClass("on");

	$(".condition-list").find("dd[attrval='0']").addClass("on");
	$(".condition-list").find("dd[attrtype='2']").removeClass("gar");
	$(".condition-list").find("dd[attrtype='3']").removeClass("gar");

	if(listType == 6) {
		$(".condition-list").find("dl[type='term']").find("dt").html("周转期限：");
		$(".condition-list").find("dl[type='payback-type']").find("dt").html("结清方式：");
	} else {
		$(".condition-list").find("dl[type='term']").find("dt").html("还款期限：");
		$(".condition-list").find("dl[type='payback-type']").find("dt").html("还款方式：");
	}

	if(listType == 5 || listType == 6 || listType == 7) {
		//$(".condition-list").find("dd[attrtype='2'][attrval='3']").addClass("gar");
		$(".condition-list").find("dd[attrtype='2'][attrval='5']").addClass("gar");
	} else if(listType == 1 || listType == 2) {
		//$(".condition-list").find("dd[attrtype='2'][attrval='3']").addClass("gar");
	} else if(listType == 3) {
		//$(".condition-list").find("dd[attrtype='2'][attrval='2']").addClass("gar");
		//$(".condition-list").find("dd[attrtype='2'][attrval='1']").addClass("gar");
	} else if(listType == 4) {
		//$(".condition-list").find("dd[attrtype='2'][attrval='3']").addClass("gar");
		//$(".condition-list").find("dd[attrtype='2'][attrval='2']").addClass("gar");
	} else if(listType == 8) {
		$(".condition-list").find("dd[attrtype='2'][attrval='2']").addClass("gar");
		//$(".condition-list").find("dd[attrtype='2'][attrval='3']").addClass("gar");
		$(".condition-list").find("dd[attrtype='2'][attrval='5']").addClass("gar");
	}
	// if (listType == 4) {
	// 	$(".condition-list").find("dd[attrtype='3'][attrmax='60']").addClass("gar");
	// }
	//投标中个数为0时，默认显示已完成
	if((CanInvestObj.invest_count <= 0 && listType == 1) ||
		(CanInvestObj.micro_count <= 0 && listType == 2) ||
		(CanInvestObj.fqb_count <= 0 && listType == 3) ||
		(CanInvestObj.gyl_count <= 0 && listType == 4) ||
		(CanInvestObj.xmb_count <= 0 && listType == 5) ||
		(CanInvestObj.jing_count <= 0 && listType == 6) ||
		(CanInvestObj.zqzr_count <= 0 && listType == 7)) {
		status = 2;
	} else {
		status = 1;
	}
	setStatusVal(status);
}

/*********排序处理*******/
function InitOrder() {
	orderby = 0;
	$('.mysort').removeClass("up-o").removeClass("down-o").addClass("down-g");
	$(".mysort").attr("orderby", "");
	$(".sort dl").find("dd").find("a").removeClass("on");
	$("#DefaultOrderBy").addClass("on");
}
//排序
var OrderByFun = function(id, iid) {
	$('.mysort').removeClass("up-o").removeClass("down-o").addClass("down-g");
	$(".sort dl").find("dd").find("a").removeClass("on");
	$("#DefaultOrderBy").removeClass("on");
	$(".mysort").each(function(i, e) {
		if($(e).attr("id") != id) {
			$(e).attr("orderby", "");
		}
	});

	if(id != "DefaultOrderBy") {
		var _iid = parseInt(iid);
		var value1 = $('#' + id).attr("orderby");
		if(value1 == "" || value1 == undefined) {
			orderby = _iid;
			$('#' + id).attr("orderby", _iid);
			$('#' + id).removeClass("down-g").addClass("down-o");
			$('#' + id).parent().parent().find("a").addClass("on");
		} else {
			if(value1 == _iid) {
				orderby = _iid + 1;
				$('#' + id).attr("orderby", orderby);
				$('#' + id).removeClass("down-g").addClass("up-o");
				$('#' + id).parent().parent().find("a").addClass("on");
			} else {
				orderby = _iid;
				$('#' + id).attr("orderby", orderby);
				$('#' + id).removeClass("down-g").addClass("down-o");
				$('#' + id).parent().parent().find("a").addClass("on");
			}
		}
	} else {
		orderby = 0;
		$("#DefaultOrderBy").addClass("on");
	}
	getInvestList(type, false);
}

//加载借款项目列表
/*function getInvestList(currentType, flashData) {
	var pageindex = 1;
	if(currentType == "1") {
		$(".bdlow").show();
		$("#projectlist").html("").append(" <div attrid='loading'><div class=\"loadingWord1\"><img alt=\"\" src=\"//js3.tuandai.com/images/investlist/waiting.gif\" /></div></div>");
		pageindex = pageindex1;
	} else if(currentType == "2") {
		$(".bdlow").show();
		$("#weilist").html("").append(" <div attrid='loading'><div class=\"loadingWord1\"><img alt=\"\" src=\"//js3.tuandai.com/images/investlist/waiting.gif\" /></div></div>");
		pageindex = pageindex2;
	} else if(currentType == "3") { //分期宝
		$(".bdlow").show();
		$("#fqbaolist").html("").append(" <div  attrid='loading'><div class=\"loadingWord1\"><img alt=\"\" src=\"//js3.tuandai.com/images/investlist/waiting.gif\" /></div></div>");

		pageindex = pageindex3;
	} else if(currentType == "4") { //供应链
		$(".bdlow").show();
		$("#gyllist").html("").append(" <div attrid='loading'><div class=\"loadingWord1\"><img alt=\"\" src=\"//js3.tuandai.com/images/investlist/waiting.gif\" /></div></div>");
		pageindex = pageindex4;
	} else if(currentType == "5") { //项目宝
		$(".bdlow").show();
		$("#Xmblist").html("").append(" <div attrid='loading'><div class=\"loadingWord1\"><img alt=\"\" src=\"//js3.tuandai.com/images/investlist/waiting.gif\" /></div></div>");
		pageindex = pageindex5;
	} else if(currentType == "6") { //资产标
		$(".bdlow").show();
		$("#jinglist").html("").append(" <div attrid='loading'><div class=\"loadingWord1\"><img alt=\"\" src=\"//js3.tuandai.com/images/investlist/waiting.gif\" /></div></div>");
		pageindex = pageindex6;
	} else if(currentType == "7") { //债权转让
		$(".bdlow").show();
		$("#ZqZrlist").html("").html("").append(" <div attrid='loading'><div class=\"loadingWord1\"><img alt=\"\" src=\"//js3.tuandai.com/images/investlist/waiting.gif\" /></div></div>");
		pageindex = pageindex7;
	}
	var orderList;
	if(flashData == true) {
		orderList = ""; //重新从底层取数据
	} else {
		orderList = JSON.stringify(projectList); //不需要重新从底层取数据
	}

	//TODO 修改JS部分
	$.ajax({
		async: false,
		cache: false,
		type: "post",
		url: "/pages/invest/getInvestList",
		dataType: "json",
		data: {
			repaymentTypeId: RepaymentTypeId,
			pagesize: pagesize,
			pageindex: pageindex,
			type: currentType,
			status: status,
			startDeadLine: beginDeadLine,
			endDeadLine: endDeadLine,
			rate: rate,
			beginRate: 0,
			endRate: 0,
			strkey: '',
			orderby: orderby,
			projectList: orderList
		},
		success: function(json) {
			$("div[attrid='loading']").remove();
			alert(json.code)
			if(json.code != 0) {
				$("div[attrid='loading']").html("").html("<div style=\"color: red;\" class=\"box_line\">数据加载超时,请刷新重试。</div>");
				return;
			}
			if(currentType == "1") {
				$('#projectlist').html("").append(json.data.projectListHtml);
			} else if(currentType == "2") {
				$('#weilist').html("").append(json.data.projectListHtml);
			} else if(currentType == "3") {
				$('#fqbaolist').html("").append(json.data.projectListHtml);
			} else if(currentType == "4") {
				$('#gyllist').html("").append(json.data.projectListHtml);
			} else if(currentType == "5") {
				$('#Xmblist').html("").append(json.data.projectListHtml);
			} else if(currentType == "6") {
				$('#jinglist').html("").append(json.data.projectListHtml);
			} else if(currentType == "7") {
				$('#ZqZrlist').html("").append(json.data.projectListHtml);
			}

			if(!browser.versions.ios && !browser.versions.android) {
				$('.jing-tip-box').hide();
				$('.inv-list').mouseover(function() {
					$(this).find('.jing-tip-box').show();
				}).mouseout(function() {
					$(this).find('.jing-tip-box').hide();
				});
			}
			investInitActive();
			initSubscribesPagin(json.data.total, currentType);
			$("div[attrid='loading']").remove();

			projectList = json.data.projectList;
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			$("div[attrid='loading']").html("").html("<div style=\"color: red;\" class=\"box_line\">数据加载超时,请刷新重试！</div>");
			WriteError(XMLHttpRequest, textStatus, errorThrown);
		}
	});
}*/
//分页项目借款列表
function initSubscribesPagin(recordCount, currentType) {
	var type = currentType;
	var num_entries = recordCount;
	var pagestr = ""
	var pageCurrent = 1;
	if(currentType == "1") {
		pagestr = "divPagination";
		pageCurrent = pageindex1;
	} else if(currentType == "2") {
		pagestr = "divPaginationWei";
		pageCurrent = pageindex2;
	} else if(currentType == "3") {
		pagestr = "divfqbaolist";
		pageCurrent = pageindex3;
	} else if(currentType == "4") {
		pagestr = "divPaginationGyl";
		pageCurrent = pageindex4;
	} else if(currentType == "5") {
		pagestr = "divPaginationXmb";
		pageCurrent = pageindex5;
	} else if(currentType == "6") {
		pagestr = "divPaginationJing";
		pageCurrent = pageindex6;
	} else if(currentType == "7") {
		pagestr = "divPaginationZqZr";
		pageCurrent = pageindex7;
	}

	$("#" + pagestr).pagination(num_entries, {
		callback: getSubscribes,
		items_per_page: 5,
		num_display_entries: 5,
		current_page: parseInt(pageCurrent - 1),
		num_edge_entries: 2,
		link_to: "#" + type,
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
	if(type == "1") {
		if(parseInt(pageindex1 - 1) == page_index) {
			return false;
		}
		pageindex1 = (page_index + 1);
	} else if(type == "2") {
		if(parseInt(pageindex2 - 1) == page_index) {
			return false;
		}
		pageindex2 = (page_index + 1);
	} else if(type == "3") {
		if(parseInt(pageindex3 - 1) == page_index) {
			return false;
		}
		pageindex3 = (page_index + 1);
	} else if(type == "4") {
		if(parseInt(pageindex4 - 1) == page_index) {
			return false;
		}
		pageindex4 = (page_index + 1);
	} else if(type == "5") {
		if(parseInt(pageindex5 - 1) == page_index) {
			return false;
		}
		pageindex5 = (page_index + 1);
	} else if(type == "6") {
		if(parseInt(pageindex6 - 1) == page_index) {
			return false;
		}
		pageindex6 = (page_index + 1);
	} else if(type == "7") {
		if(parseInt(pageindex7 - 1) == page_index) {
			return false;
		}
		pageindex7 = (page_index + 1);
	}
	//点击分页
	getInvestList(type, false);
	return false;
}

function InitPageIndex() {
	pageindex1 = 1;
	pageindex2 = 1;
	pageindex3 = 1;
	pageindex4 = 1;
	pageindex5 = 1;
	pageindex6 = 1;
	pageindex7 = 1;
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

function WriteError(a, b, c) {
	//$.ajax({
		//type: "post",
		//async: false,
		//url: "/pages/ajax/newinvest_list.ashx",
		//data: {
			//Cmd: "WriteError",
			//XMLHttpRequest: a,
			//textStatus: b,
			//errorThrown: c
		//},
		//dataType: "json",
		//timeout: 3000,
		//success: function(jsondata) {

		//}
	//});
//}