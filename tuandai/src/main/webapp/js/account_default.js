﻿$(window).ready(function() {
	$("#changeTip").click(function() {
		if(tip.length > 1) {
			tindex++;
			if(tip.length < tindex) {
				tindex = 1;
			}
			$("#p1").html(tip[tindex - 1]);
			$("#p2").html(tip[tindex - 1]);
		}
	});

	$("#tip").mouseenter(function(e) {
		$(".tip").css({
			"top": (e.pageY + y) + "px",
			"left": (e.pageX - 100) + "px"
		}).show();
	}).mouseleave(function() {
		$(".tip").hide();
	});

	$("#tip1").mouseenter(function(e) {
		$(".tip1").css({
			"top": (e.pageY + y) + "px",
			"left": (e.pageX - 100) + "px"
		}).show();
	}).mouseleave(function() {
		$(".tip1").hide();
	});
});

$(window).ready(function() {
	if(tip.length > 0) {
		$("#p1").html(tip[0]);
		//$("#p2").html(tip[0]);
		if(tip.length == 1) {
			$("#changeTip").hide();
		}
		if(firstLogin == "1") {
			//$("#dahei").show();
		} else {
			$("#clocktip").attr("src", "../images/clock.png");
			$(".guanbi").hide();
			$("#dahei").hide();
		}
	} else {
		$("#p1").html("暂无消息提醒");
		$("#clocktip").attr("src", "../images/clock.png");
		$("#dahei").hide();
		$(".guanbi").hide();
	}
});
$(window).ready(function() {
	$(".jxbox").mouseover(function() {
		$(".jxtipbox").css("display", "block");
	}).mouseout(function() {
		$(".jxtipbox").css("display", "none");
	});
});

$(function() {
	$('#amout_left').find('li').hover(function() {},
		function() {
			$(this).find('dl').hide();
		})
});

function openYellowTips() {
	$('#YellowTips').fadeIn();
}

jQuery("#ganbeng").slide({
	mainCell: ".tupian ul",
	effect: "leftLoop",
	autoPlay: true,
	interTime: 3000,
	trigger: "click"
});

$(document).ready(function() {
	var isShow = false;
	var delay_time = 1500;
	var myDelay;

	delayDo(delay_time);
	$(".wz_rebate").mouseover(function() {
		clearTimeout(myDelay);
		$(".rebate").show();
	});
	$(".wz_rebate").mouseout(function() {
		delayDo(500);
	});
	$(".rebate").hover(function() {
		clearTimeout(myDelay);
		$(".rebate").show();
	}, function() {

		$(".rebate").fadeOut();
	});

	function delayDo(time) {
		myDelay = setTimeout(function() {
			isShow = false;
			$(".rebate").fadeOut();
		}, time)
	}
});

$(".closed").click(function() {
	$(".members_beijing").hide();
	$(".members").hide();
	$(".members_welfare").hide();
});
////消息设置提示弹窗
//$("#setMes-alert").find(".closes").click(function () {
//    $(this).parent("#setMes-alert").hide();
//    $("#setmask").hide();
//});
//冒泡提示信息
$(".we_notice_icon").hover(function() {
	$(this).children("p").toggle();
});

//邀请有礼定向活动弹窗
$(".exclusive_tu").click(function() {
	$(".invitation_activities").show();
	$(".beijing").show();
})
$(".shut").click(function() {
	$(".invitation_activities").hide();
	$(".beijing").hide();
})
//518红包理团金弹窗
$(".shut").click(function() {
	$(".financial_bj").hide();
	$(".financial").hide();
})

function guandiao() {
	$("#dahei").hide();
	$(".guanbi").hide();
	$("#clocktip").attr("src", "../images/clock.png");

	if(isClosedYellowTips != "1" && isEnterAutoInvestSetPage2 != "1") {
		setTimeout("openYellowTips()", 500);
	}
}

function fn_slidechange() {
	$("#biaoti").html("<a href='" + $(".hd ul li.on").attr("ref") + "' target='_blank' style='color:#fff;'>" + $(".hd ul li.on").attr("val") + "</a>");
}

//提示信息showtips
function ShowTips() {
	$("#ny-tip").mouseenter(function() {
		$(this).parent().find("#ny-showtips").show();
	}).mouseleave(function() {
		$(this).parent().find("#ny-showtips").hide();
	});
};
ShowTips();

//1218加息弹窗
$(document).ready(function() {
	var isShow = false;
	var delay_time = 2500;
	var myDelay;

	delayDo(delay_time);
	$(".wz_rebate1218").mouseover(function() {
		clearTimeout(myDelay);
		$(".rebate1218").show();
	});
	$(".wz_rebate1218").mouseout(function() {
		delayDo(500);
	});
	$(".rebate1218").hover(function() {
		clearTimeout(myDelay);
		$(".rebate1218").show();
	}, function() {

		$(".rebate1218").fadeOut();
	});

	function delayDo(time) {
		myDelay = setTimeout(function() {
			isShow = false;
			$(".rebate1218").fadeOut();
		}, time)
	}
});
var newTitle = '团贷网提醒您：';
var IsValidateMobile = 'True';
var IsValidateIdentity = 'True';
var IsSetPayPwd = "True";
var isClosedYellowTips = "0";
var isEnterAutoInvestSetPage2 = "0"; //是否进入自动投标设置
var tip = new Array();
var firstLogin = "1"; // "1";
var cgtStatus = '1';

if("True" != "True") {
	tip.push("您尚未进行实名认证，会影响您的投资，请<a href='index.html' style='color:orange;'>立即设置</a>！");
}
if("True" != "True") {
	tip.push("您尚未进行邮件认证，会影响您的投资，请<a href='/index.html' style='color:orange;'>立即设置</a>！");
}
if("True" != "True") {
	tip.push("您尚未进行安全问题设置，会影响您的投资，请<a href='/index.html' style='color:orange;'>立即设置</a>！");
}
if("1" == "0") {
	tip.push("您尚未进行银行卡绑定，会影响您的投资，请<a href='/index.html' style='color:orange;'>立即设置</a>！");
}
if("" != "") {
	tip.push("");
}
if("" != "") {
	tip.push("");
}

$(window).ready(function() {
	$("#ymziframe").attr("height", "100%");

	$("#profitframe").attr("height", "510px");
	setTimeout(function() {
		$('#ymziloading').remove();
		$("#profitloading").remove();
	}, 2500);

	if(cgtStatus == "0") {
		$("#aOpen").show()
		$("#aActived").hide();
		$("#aBankBind").hide();
	} else if(cgtStatus == "2") {
		$("#aOpen").hide()
		$("#aActived").show();
		$("#aBankBind").hide();
	}

});

//显示隐藏特权过期弹窗
var intimer = null;
var leftTime;

$(function() {
	//计算累计加息
	calRest();

	//加息类型切换
	inerestSlider();

	//倒计时
	countTime();

	//悬浮
	var offset = $('.interest-entrance').offset();
	var epX = (offset ? offset.left : 0) - 100;
	var epY = (offset ? offset.top : 0) - 20;
	var exPos = ($(window).width() - $('.add-interest-alert').width()) / 2;
	var eyPos = ($(window).height() - $('.add-interest-alert').height()) / 2 - 40;

	$('.add-interest-alert').css({
		'left': epX,
		'top': epY
	}).addClass('transMin');

	$(window).bind('scroll', function() {
		var scrollTop = $(window).scrollTop();
		if(scrollTop >= epY) {
			$('.interest-entrance').addClass('fixed');
		} else {
			$('.interest-entrance').removeClass('fixed');
		}
		if(!($('.add-interest-alert').hasClass('add-interest-trans'))) {
			$('.add-interest-alert').css({
				'left': epX,
				'top': epY - scrollTop > 0 ? epY - scrollTop : -20
			});
		}

	});
	// if (showInterest) {   1218加息弹窗
	//     $('.add-interest-alert').addClass('add-interest-trans').css({'left':exPos,'top':eyPos});
	//     $('.add-in-mask').show();
	// }
	$(window).resize(function() {
		var exPos = ($(window).width() - $('.add-interest-alert').width()) / 2;
		var eyPos = ($(window).height() - $('.add-interest-alert').height()) / 2 - 50;
		if($('.add-interest-alert').hasClass('add-interest-trans')) {

			$('.add-interest-alert').css({
				'left': exPos,
				'top': eyPos
			});
		}
	});
	$('.show-inerest-btn').on('click', function() {
		//弹出特权弹窗
		if(leftTime > 0) {
			$('.add-interest-alert').addClass('add-interest-trans').css({
				'left': exPos,
				'top': eyPos
			});
			$('.add-in-mask').show();
		} else if(leftTime <= 0) {
			//查看特权情况可能已经跨越00:00，活动已结束，此时弹出提示“特权已过期”
			showToast();
			clearInterval(intimer);
		}
	});
	$('.interest-close').on('click', function() {
		var scrTop = $(window).scrollTop();
		$('.add-interest-alert').removeClass('add-interest-trans').css({
			'left': epX,
			'top': epY - scrTop > 0 ? epY - scrTop : -20
		});
		$('.add-in-mask').hide();
	});

});

//保留1位小数
function toDecimal2(x) {
	var f = parseFloat(x);
	if(isNaN(f)) {
		return false;
	}
	var f = Math.round(x * 100) / 100;
	var s = f.toString();
	var rs = s.indexOf('.');
	if(rs < 0) {
		rs = s.length;
		s += '.';
	}
	while(s.length <= rs + 1) {
		s += '0';
	}
	return s;
}

function calRest() {
	//计算获得累计加息
	var inerestCount = 0;
	$('.inerest-rate span').each(function() {
		var rateNum = parseFloat($(this).html());
		inerestCount += rateNum;
	});
	$('.add-inerest-tit span').html(toDecimal2(inerestCount));
}

//加息特权弹窗滚动实例化
function inerestSlider() {

	var liLen = $('.add-inerest-box li').length;

	if(liLen >= 3) {
		$('.add-interest-alert').css({
			'width': '820px'
		});
		$('.add-cenbg').css({
			'width': '780px'
		});
		$('.all-inerest-bt .b-cen-bg').css({
			'width': '700px'
		});
	}
	if(liLen == 2) {
		$('.add-interest-alert').css({
			'width': '560px'
		});
		$('.add-cenbg').css({
			'width': '520px'
		});
		$('.all-inerest-bt .b-cen-bg').css({
			'width': '440px'
		});
	}
	if(liLen == 1) {
		$('.add-interest-alert').css({
			'width': '300px'
		});
		$('.add-cenbg').css({
			'width': '260px'
		});
		$('.all-inerest-bt .b-cen-bg').css({
			'width': '180px'
		});
	}
	//加息特权弹窗滚动箭头显示
	if(liLen > 3) {
		$('.add-inerest-box .hd').show();
		jQuery(".add-inerest-box").slide({
			titCell: ".hd ul",
			mainCell: ".bd ul",
			autoPage: true,
			effect: "left",
			vis: 3,
			pnLoop: false,
			trigger: "click"
		});
	} else {
		$('.add-inerest-box .hd').hide();
	}

	$('.add-inerest-btn a').on('hover', function() {
		$(this).parent().find('.add-inerest-tips').toggle();
	});
}

function countTime() {
	var nowTime = new Date($('.interest-entrance').attr('data-time'));
	var endTime = new Date("2018/07/18 23:59:59");
	if(nowTime.getTime() < endTime.getTime()) {
		intimer = setInterval(function() {
			nowTime = new Date(nowTime.getTime() + 1000);
			leftTime = Math.floor(endTime.getTime() - nowTime.getTime()) / 1000;
			if(leftTime <= 0) {
				clearInterval(intimer);
			}
		}, 1000);
	}
}

//特权过期弹窗
function showToast() {
	$('.add-inerest-toast').show();
	$('.add-in-mask').show();
	setTimeout(function() {
		$('.add-inerest-toast').hide();
		$('.add-in-mask').hide();
	}, 3000)
}