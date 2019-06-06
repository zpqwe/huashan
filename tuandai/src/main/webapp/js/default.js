/**=======================金额数字滚动============Start**/
$.fn.countTo = function (options) {
	options = options || {};

	return $(this).each(function () {
		// set options for current element
		var settings = $.extend({}, $.fn.countTo.defaults, {
			from: $(this).data('from'),
			to: $(this).data('to'),
			speed: $(this).data('speed'),
			refreshInterval: $(this).data('refresh-interval'),
			decimals: $(this).data('decimals')
		}, options);

		// how many times to update the value, and how much to increment the value on each update
		var loops = Math.ceil(settings.speed / settings.refreshInterval),
			increment = (settings.to - settings.from) / loops;

		// references & variables that will change with each update
		var self = this,
			$self = $(this),
			loopCount = 0,
			value = settings.from,
			data = $self.data('countTo') || {};

		$self.data('countTo', data);

		// if an existing interval can be found, clear it first
		if (data.interval) {
			clearInterval(data.interval);
		}
		data.interval = setInterval(updateTimer, settings.refreshInterval);

		// initialize the element with the starting value
		render(value);

		function updateTimer() {
			value += increment;
			loopCount++;

			render(value);

			if (typeof (settings.onUpdate) == 'function') {
				settings.onUpdate.call(self, value);
			}

			if (loopCount >= loops) {
				// remove the interval
				$self.removeData('countTo');
				clearInterval(data.interval);
				value = settings.to;

				if (typeof (settings.onComplete) == 'function') {
					settings.onComplete.call(self, value);
				}
			}
		}

		function render(value) {
			var formattedValue = settings.formatter.call(self, value, settings);
			$self.html(formattedValue);
		}
	});
};


//数字滚动初始化
$.fn.countTo.defaults = {
	from: 0, // the number the element should start at
	to: 0, // the number the element should end at
	speed: 1000, // how long it should take to count between the target numbers
	refreshInterval: 100, // how often the element should be updated
	decimals: 0, // the number of decimal places to show
	formatter: formatter, // handler for formatting the value before rendering
	onUpdate: null, // callback method for every time the element is updated
	onComplete: null // callback method for when the element finishes updating
};

function formatter(value, settings) {
	return value.toFixed(settings.decimals);
}


function count(options) {
	var $this = $(this);
	options = $.extend({}, options || {}, $this.data('countToOptions') || {});
	$this.countTo(options);
}
/**=======================金额数字滚动============End**/




$(function () {

	// 金额数字滚动实例
	$('.count-title').data('countToOptions', {
		formatter: function (value, options) {
			return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
		}
	});

	$('.count-title1').data('countToOptions', {
		formatter: function (value, options) {
			return value.toFixed(options.decimals);
		}
	});

	$('.count-title').each(count);
	$('.count-title1').each(count);


	// 京东E卡
	defaultModel.jdFn();
	//浮动导航
	defaultModel.suspensionNav();

	//tab切换函数调用 
	defaultModel.tabChange('#huiYuanTab', '#huiYuanTabCon');
	defaultModel.tabChange('#rankTab', '#rankTabCon');

	//底部通用活动调用 
	defaultModel.getGeneral();

	//重置窗口大小调用
	defaultModel.resizeWin();


	//关闭左侧banner
	defaultModel.closeLeftBanner();

	//倒计时
	defaultModel.fnTimeCountDown();

	//显示风险提示
	defaultModel.showRisk();

	//新手限额浮框自适应
	if ($('.general-small-ad').length > 0 || $('.general-big-ad').length > 0) {
		$('.newhand-pop').css({
			'bottom': '193px'
		});
	} else {
		$('.newhand-pop').css({
			'bottom': '33px'
		});
	}

	//新手限额关闭弹窗
	$('.newhand-pop').on('click', '.newhand-close', function () {
		$(this).parents('.newhand-pop').hide();
	});
	var popOnFlag = true;
	$('.newhand-default').on('mouseenter', function () {
		if (popOnFlag) {
			popOnFlag = false;
			$.ajax({
				async: false,
				url: "/home/getNewHandInfo",
				dataType: "json",
				type: 'post',
				success: function (json) {
					if (json.code == 0) {
						var html = json.data.maxAmount + "<span>元</span>";
						$(".newhand-quota").html(html);
						$(".newhand-num").text(json.data.buyNewHandNum + '次');
					} else {
						popOnFlag = true;
					}
				}
			});
		}
	});
	$('.newhand-default').on('mouseleave', function () {
		popOnFlag = true;
	});

    // //开启自动投资
    // defaultModel.openAutomation();

});



var defaultModel = (function () {
	//浮动导航
	var suspensionNav = function () {

		$(window).bind('scroll', function () {
			var scrollTop = $(window).scrollTop();
			if (scrollTop > 525) {
				$('.tdw-nav').addClass('tdw-nav-suspension');
				setTimeout(function () {
					$('.tdw-nav').addClass('tdw-nav-suspension-down');
				}, 100)
			} else if (scrollTop < 525) {
				$('.tdw-nav').removeClass('tdw-nav-suspension');
				setTimeout(function () {
					$('.tdw-nav').removeClass('tdw-nav-suspension-down');
				}, 100)
			}


		});
	};

	/*会员交易  Tab切换
	  @param tit  切换标题
	  @param conbox  切换内容
	*/
	var tabChange = function (tit, conbox) {
		var index = 0;
		var atrId = null;
		//查看更多初始化
		$(tit).find('li').each(function (i) {
			if ($(tit).find('li').eq(i).hasClass('active') && $(tit).find('li').eq(i).attr('data-id') == 'wtd') {
				$('.tdw-page6 .tdw-page-title').find('a').attr('href', 'http://www.tuandai.com/pages/invest/invest_list?index=2');
			} else if ($(tit).find('li').eq(i).hasClass('active') && $(tit).find('li').eq(i).attr('data-id') == 'zq') {
				$('.tdw-page6 .tdw-page-title').find('a').attr('href', 'http://www.tuandai.com/pages/invest/zqzr_list');
			}
		});

		$(tit).find('li').on('mouseover', function () {
			index = $(this).index();
			atrId = $(this).attr('data-id');
			$(tit).find('li').removeClass('active');
			$(this).addClass('active');
			$(tit).find('li').find('span').addClass('opacity-60');
			$(this).find('span').removeClass('opacity-60');
			$(conbox).find('ul').hide();
			$(conbox).find('ul').eq(index).show();
			if (atrId == 'zx') {
				$('.tdw-page6 .tdw-page-title').find('a').attr('href', 'http://www.tuandai.com/pages/zSharePlan/zx_invest_list');
			} else if (atrId == 'zq') {
				$('.tdw-page6 .tdw-page-title').find('a').attr('href', 'http://www.tuandai.com/pages/invest/zqzr_list');
			} else if (atrId == 'xw') {
				$('.tdw-page6 .tdw-page-title').find('a').attr('href', 'http://www.tuandai.com/pages/invest/invest_list?index=1');
			} else if (atrId == 'wtd') {
				$('.tdw-page6 .tdw-page-title').find('a').attr('href', 'http://www.tuandai.com/pages/invest/invest_list?index=2');
			} else if (atrId == 'fqb') {
				$('.tdw-page6 .tdw-page-title').find('a').attr('href', 'http://www.tuandai.com/pages/invest/invest_list?index=3');
			} else if (atrId == 'gyl') {
				$('.tdw-page6 .tdw-page-title').find('a').attr('href', 'http://www.tuandai.com/pages/invest/invest_list?index=4');
			}
		});
	};

	//底部通用活动展示
	　　
	var getGeneral = function () {
		$(".general-small-ad").animate({
			right: "10px"
		}, 500);
		$("#gen-arrow-l").click(function () {
			$(this).parent(".general-small-ad").animate({
				right: "-100%"
			}, 500);
			setTimeout(function () {
				$(".general-big-ad").animate({
					width: "100%",
					right: "0px"
				}, 500);
			}, 500);
		});
		$("#general-close").click(function () {
			$(this).parent(".general-big-ad").animate({
				right: "-100%"
			}, 500);
			setTimeout(function () {
				$(".general-small-ad").animate({
					right: "10px"
				}, 500);
			}, 500);
		});　　
	};

	//关闭左侧banner
	var closeLeftBanner = function () {
		var LeftBanner = '.left-banner';
		$(LeftBanner).find('.close').click(function () {
			$(LeftBanner + '.pic').removeAttr("onclick");
			$(this).parentsUntil(LeftBanner).animate({
				left: -145
			});
		});
	}



	//窗口大小重置
	var resizeWin = function () {
		$(window).resize(function () {
			var $leftBanner = $(".left-banner");
			if ($("body").outerWidth() >= 1510) {
				$leftBanner.fadeIn();
			} else {
				$leftBanner.fadeOut(300);
			}
			$('#slideBox,#slideBox li').css({
				"width": "100%"
			});
		});
	};

	//当分、秒小于10 自动补0
	var addZero = function (n) {
		var n = parseInt(n, 10);
		if (n > 0) {
			if (n <= 9) {
				n = "0" + n;
			}
			return String(n);
		} else {
			return "00";
		}
	};
	/* 时间格式化
	   @param  tcount  单位：S
	*/
	var dateForMate = function (tcount) {
		var sec = addZero(tcount % 60);
		var mini = Math.floor((tcount / 60)) > 0 ? addZero(Math.floor((tcount / 60)) % 60) : "00";
		var hour = Math.floor((tcount / 3600)) > 0 ? parseInt(tcount / 3600) : "00";
		// var day = Math.floor((tcount / 86400)) > 0 ? parseInt(Math.floor((tcount / 86400))) : "0";
		return "<span>" + hour + "</span>时<span >" + mini + "</span>分<span >" + sec + "</span>秒";
	};

	/*WE计划开放 倒计时
		 @param  timecount  服务器传回倒计时时间 单位：S
	*/
	var fnTimeCountDown = function () {
		$(".timeSet").each(function () {
			var timecount = parseInt($(this).attr("data-count"));
			if (timecount >= 0) {
				$(this).html(dateForMate(timecount));
				if (timecount == 0) {
					$(this).parent().html('<span class="btn-text">授权出借</span>');
				}
				timecount--;
				$(this).attr("data-count", timecount);
			}
		});
		setTimeout(fnTimeCountDown, 1000);
	}

	//左侧工具栏默认显示风险提示
	var showRisk = function () {
		$('.risk-tips').show();
		//$('#toolRisk').off('hover');
		setTimeout(function () {
			$('.risk-tips').hide();
		}, 3000);

		$('#toolRisk').mouseout(function () {
			$(this).parent().find('.risk-tips').hide();
		});
		$('#toolRisk').mouseover(function () {
			$(this).parent().find('.risk-tips').show();
		});

	};

	//京东首页交互
	var jdFn = function () {
		var browserV = Math.floor($.browser.version);
		//关闭右边图片
		$('.left-banner-jd').find('.close').click(function () {
			$(".left-banner .pic").removeAttr("onclick");
			$(this).parents('.left-banner-jd').hide();
		});
		var mgB = -$('.jd-win').height() / 2;
		//打开，关闭窗口
		$('.left-banner-jd').find('a').click(function () {
			if ($.browser.msie && browserV < 10) {
				$(".jd-win").css({
					"margin-left": "-324px",
					"margin-bottom": mgB,
					"bottom": "50%",
					"left": "50%"
				})
			} else {
				$('.jd-win').removeClass('jd-win2');
				$('.jd-win').addClass('jd-win1');
			}

			$('.jd-win').show();
			$('#diallayer').show();
			return false;
		});
		$('.jd-win-close, .jd-btn').click(function () {
			$('.jd-win').removeClass('jd-win1');
			$('.jd-win').addClass('jd-win2');
			if ($.browser.msie && browserV < 10) {
				$('.jd-win').hide();

			} else {
				setTimeout(function () {
					$('.jd-win').hide();
				}, 600);
			}
			$('#diallayer').hide();
		})

	};



	return {
		suspensionNav: suspensionNav, //悬浮导航
		tabChange: tabChange, //tab切换
		getGeneral: getGeneral, //通用广告
		resizeWin: resizeWin, //窗口重置
		closeLeftBanner: closeLeftBanner, //关闭左侧banner
		dateForMate: dateForMate, //时间格式化 
		addZero: addZero, //时间小于10 在前面补0
		fnTimeCountDown: fnTimeCountDown, //倒计时
		showRisk: showRisk, //显示风险提示
		jdFn: jdFn //京东E卡弹窗
	};

})(window, jQuery);