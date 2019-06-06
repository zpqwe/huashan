﻿/**
 * TuanDai
 * @version v3.00
 * @author  allen
 * @time 2015-12-23 20:10
 */
/*
上线时使用如下:
var portalWebsiteUrl = "//www.tuandai.com";
var imageWebsiteUrl = "//image.tuandai.com";
var niwoWebsiteUrl = "http://www.niiwoo.com";
var ActivityWebsiteUrl = "//hd.tuandai.com";
var portalWebsiteUrl = "//www.td.com";
var imageWebsiteUrl = "//image.td.com";
var niwoWebsiteUrl = "http://www.niwo.com";
var ActivityWebsiteUrl = "//hd.td.com";

*/
var portalWebsiteUrl = "#";
var imageWebsiteUrl = "#";
var niwoWebsiteUrl = "#";
var ActivityWebsiteUrl = "#";
var DQWebsiteUrl = "#";
var PassportWebUrl = "#";
var contractViewUrl = "#";

var tdObj = new Object();
tdObj.key = '#@zstuandaijjmzfc!#';

//标的详情页充值按钮
function checkRecharge(){
    if(checkIsOpen("")){
        $(".recharge-flag").attr("href", "#");
        $(".recharge-flag")[0].click();
    }
}

function checkPartner(){
    if(checkIsOpen("")){
        $(".partner-flag").attr("href", "#");
        $(".partner-flag")[0].click();
    }
}

//登录
function login() {
    var returnUrl = jQuery.getUrlParam("ReturnUrl");
    if (returnUrl == null || returnUrl == "") {
        returnUrl = document.URL;
        if (returnUrl.toLowerCase().indexOf("/user/") > -1 || returnUrl.toLowerCase().indexOf("/user/ResetPwd_Telno.aspx") > -1) {
            return location.href = portalWebsiteUrl + "/u/login", !1
        }
    }

    return location.href =  PassportWebUrl + "/2login?ret=" + encodeURIComponent(returnUrl),
    !1
}
//跳到注册
function register() {
    return location.href = PassportWebUrl + "/2register",
        !1
}

//退出
function logout() {
    var url = portalWebsiteUrl + "/home/clearUserCookie";
    if ("https:" == document.location.protocol)
        url = url.replace("", "");
   /*  $.ajax({
        dataType: "jsonp",
        url: url,
        success: function() {
            var returnUrl = jQuery.getUrlParam("ReturnUrl");
            if (returnUrl == null || returnUrl == "") {
                returnUrl = document.URL;
                if (returnUrl.toLowerCase().indexOf("/user/") > -1 || returnUrl.toLowerCase().indexOf("/user/ResetPwd_Telno.aspx") > -1) {
                    return location.href = portalWebsiteUrl + "/u/logout";
                }
            }
            return location.href = portalWebsiteUrl + "/u/logout?ReturnUrl=" + returnUrl;
        },
        cache: false
    }); */
}



(function (jQuery) {
    jQuery.getUrlParam = function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
})(jQuery);


//验证整数（非负）
function checkInteger(obj)  //是非负整数返回：true,不是返回：false
{
    var reg = RegExp("^\\d+$");
    return reg.test(obj);
}

//验证浮点数(非负)
function checkFloat(obj) {//是非负浮点数返回：true,不是返回：false
    var reg = RegExp("^\\d+(\\.\\d+)?$");
    return reg.test(obj);
}

//金额格式化并保留指定的小数位(四舍五入)
function fmoney(s, n) {
    n = n > 0 && n <= 20 ? n : 2;
    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    var l = s.split(".")[0].split("").reverse(),
            r = s.split(".")[1];
    t = "";
    for (i = 0; i < l.length; i++) {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    return t.split("").reverse().join("") + "." + r;
}

/*js加密*/
function fnStringJM2(s) {
    return des(tdObj.key, HexTostring(s), 0, 0);
}
function fnStringJM(s) {
    return stringToHex(des(tdObj.key, s, 1, 0));
}

//限制只能输入数字(不可以含有小数)
function limitInt(fn) {
    jQuery(fn).keydown(function (e) {
        // 注意此处不要用keypress方法，否则不能禁用　Ctrl+V 与　Ctrl+V,具体原因请自行查找keyPress与keyDown区分，十分重要，请细查
        if (((e.keyCode > 47) && (e.keyCode < 58)) || (e.keyCode == 9) || (e.keyCode == 8) || ((e.keyCode >= 96) && (e.keyCode <= 105)) || (e.keyCode == 110)) {// 判断键值
            return true;
        } else {
            return false;
        }

    }).focus(function () {
        this.style.imeMode = 'disabled';   // 禁用输入法,禁止输入中文字符
    });

}

//写cookies
function setCookie(name, value) {
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}
//读取cookies
function getCookie(name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");

    if (arr = document.cookie.match(reg))

        return unescape(arr[2]);
    else
        return null;
}

//删除cookies
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null)
        document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

function getCookieValue(name) {
    var acookie = document.cookie.split("; ");
    for (var i = 0; i < acookie.length; i++) {
        if (acookie[i].indexOf('=') > -1) {
            var arr = acookie[i].split("=");
            if (name == arr[0]) {
                return decodeURI(arr[1]);
            }
        }
    }
    return "";
}
//判断cookie是否有登录凭证
function isCookieLogin() {
    var cookieValue = jaaulde.utils.cookies.get("tuandaiw");
    if (cookieValue != "" && cookieValue != null)
        return true;
    else
        return false;
}

/*登录方法*/
function initLogin() {
        var getVersion = $('.tdw-top').attr('version');
        if(!(getVersion === 'interface-data')){
            GetLocalLoginStatus();
        }

}
function GetLocalLoginStatus() {
    var url = portalWebsiteUrl + "/user/services/AccountNewHandler.ashx";
    if ("https:" == document.location.protocol)
        url = url.replace("", "");
  /*   $.ajax({
        url: url,
        dataType: "jsonp",
        scriptCharset: "gb2312",
        success: function (data) {
            $("#topinfo").html(data.topinfo);
            $("#myAccount").html(data.accountinfo);
            $("#myAccountDefault").html(data.accountinfo);
            $("#myTransfer").html(data.zxInfo);
            if (data && data.sso) {
                $.each(data.sso, function (i, val) {
                    $.ajax({
                        url: this,
                        type: "GET",
                        dataType: "text",
                        success: function (data) {
                            jQuery.ajax({
                                url: data,
                                dataType: "jsonp"
                            });
                        }
                    });
                });
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //  alert(textStatus);
        }
    }); */
}

/*---------------页面顶部事件---------Start*/


$(function () {
    //微信二维码显示
    showWeiXin();

    showServers('.mail', '.mail-int-box')  //客服 tip
    showServers('.qq', '.qq-int-box') //QQ tip

    /*右侧工具条*/
    $('.tool').find('.t-box').hover(function () {
        $(this).find('.dan-tip').stop().fadeIn(300);
    }, function () {
        $(this).find('.dan-tip').stop().fadeOut(200);
    });
    textChange(".t1", "");
    textChange(".t2", "");
    textChange(".t5", "");
    textChange('.t3', "", -176);
    showTChildren('.t4', "", -88);
    showTip();
    toTop('.to-top');//回顶部

    $(window).bind("scroll", function () {
        var scrollTop = document.documentElement.scrollTop + document.body.scrollTop;
        if (scrollTop >= 500) {
            $(".to-top").css({ "display": "block" });
        }
        else if (scrollTop < 500) {
            $(".to-top").css({ "display": "none" });
        }
    });

    var isShowAboutus = false;
    // 导航slide
    slidDown('.about-us')
    slidDown('.guarantee')
    function slidDown(ele) {
        $(ele).hover(function (e) {

                $(this).find('dd').stop().slideDown(200);
                isShowAboutus = true;
            },
            function (e) {
                $(this).find('dd').stop().slideUp(200);
                isShowAboutus = false;
            }
        );
    }

    //  $('.myaccount').hover(function (e)
    //  {
    //      $(this).find('dd').stop().slideDown(200);
    //      isShowAboutus = true;
    //  },
    //     function (e)
    //     {
    //         $(this).find('dd').stop().slideUp(200);
    //         isShowAboutus = false;
    //     }
    //  );

});
// 年化利率风险提示
$('.showtips-box').hover(function(){
    $(this).find('.lv-showtips-prom').show();
},function(){
    $(this).find('.lv-showtips-prom').hide();
});



//友情链接下拉
var friendLink = friendLink();
function friendLink(argument) {
    var i = 0;
    $('.link').find('.hide-btn').click(function () {
        if (i == 0) {
            $(this).parent().find('.links').css({ 'height': 'auto', 'overflow': 'visible' });
            $(this).find('i').css({ 'background-position': ' -41px -48px' });
            $(this).find('.text').text('隐藏');
            i = 1;

        } else {
            $(this).parent().find('.links').css({ 'height': '30px', 'overflow': 'hidden' });
            $(this).find('i').css({ 'background-position': '-27px -48px' });
            $(this).find('.text').text('展开');
            i = 0;

        };
    });
}
//首页导航行下拉滚动
suspension();
function suspension() {
    $(window).bind("scroll", function () {
        var scrollTop = document.documentElement.scrollTop + document.body.scrollTop;
        if (scrollTop >= 400) {
            $('.suspension').removeClass('suspension-up');
            $('.suspension').addClass('suspension-down');
        }
        else if (scrollTop < 400) {
            $('.suspension').removeClass('suspension-down');
            $('.suspension').addClass('suspension-up');
        }
    });
}
function showTip() {
    $('.tool').find('.t-box').find('li').hover(function () {

        $(this).find('.tip-box').show();

    }, function () { $(this).find('.tip-box').hide(); })
}
function showTChildren(el, text, move) {
    $('.tool').find(el).hover(function () {
        $(this).find('ul').show();
        $(this).find('ul').stop().animate({
            left: move
        }, 200);
        $(this).find(".text-box").stop().show().text(text);
    }, function () {
        $(this).find('ul').stop().animate({
            left: 0
        }, 300, function () {
            $(this).parent().find('.text-box').fadeOut(300);
            $(this).hide();
        });
    })
}
function textChange(el, text) {
    $('.tool').find(el).mouseenter(function () {
        var oldText = $(this).html();
        //            alert(oldText)
        $(this).html(text);
        $(this).mouseleave(function () {
            $(this).html(oldText);
        });
    })
}
function toTop(el) {
    $(el).click(function () {
        $('html, body').animate({ scrollTop: 0 }, 'slow');
    });
}
function showWeiXin() {
    //$('.weixin').hover(function () {
    //    $(this).find('.ewm').removeClass('ewm-toBottom');
    //    $(this).find('.ewm').show().addClass('ewm-toTop');
    //},
    //function () {
    //    $(this).find('.ewm').removeClass('ewm-toTop').addClass('ewm-toBottom');

    //    setTimeout($(this).find('.ewm').hide(), 3000);
    //});
    $(".weixin").mouseenter(function () {
        $(this).find('.ewm').removeClass('ewm-toBottom');
        $(this).find('.ewm').show().addClass('ewm-toTop');
    });
    $(".weixin").mouseleave(function () {
        $(this).find('.ewm').removeClass('ewm-toTop').addClass('ewm-toBottom');
        $(this).find('.ewm').hide();
    });
}
//客服 QQ显示
function showServers(el1, el2) {
    $('.footer ' + el1 + ', .footer ' + el2).mouseenter(function () {

        $('.footer').find(el2).show();
        $('.footer').find(el2).stop().animate({
            'top': '-88px'
        }, 200);
    });
    $('.footer ' + el1 + ', .footer ' + el2).mouseleave(function () {
        $('.footer').find(el2).stop().animate({
            'top': '-100px'
        }, 100, function () { $(this).parent().find(el2).hide(); });
    });
}

$(function() {

    subMenuShow();

    //未登录 隐藏我的账户下拉菜单
    function subMenuShow(){
        if($('.tdw-nav .my-account').length==0){
            $('.my-account-default').next('.sonmenu').css({'display':'none'});
        }
    }

    //返回顶部
    $(window).bind('scroll',function(){
        var scrollTop = $(window).scrollTop();

        //显示返回顶部
        if(scrollTop>500){
            $('.tool-backtop').fadeIn(300);
        }else{
            $('.tool-backtop').fadeOut(300);
        }

    })
    $('#tool-backtop').on('click',function(){
        $('html,body').stop().animate({
            scrollTop:0
        },500);
    });

    $('#toolRisk').hover(function(){
        $(this).parent().find('.risk-tips').stop().fadeIn();
    },function () {
        $(this).parent().find('.risk-tips').stop().fadeOut();
    });

    //友情链接展开
    $('.tdw-footer-links .hide-btn').on('click',function(){
        var autoHeight = $(this).parents('.tdw-footer-links').find('ul').css('height', 'auto').height();
        if($(this).find('i').hasClass('i-arrow-up1')){
            $(this).html('隐藏<i class="tdw-icons i-arrow-down1"></i>');
            $(this).parents('.tdw-footer-links').animate({
                height: autoHeight
            });
        }else{
            $(this).html('展开<i class="tdw-icons i-arrow-up1"></i>');
            $(this).parents('.tdw-footer-links').animate({
                height:'20px'
            });;
        }
    });

    //清除IE浏览器下ajax缓存
    $.ajaxSetup({cache:false});

    postLoan(); //贷后追踪显示效果

    //这里给所有ajax请求添加一个complete函数
    $.ajaxSetup({
        complete : function(xhr, status) {
            //拦截器实现超时跳转到登录页面
            // 通过xhr取得响应头
            var REDIRECT = xhr.getResponseHeader("REDIRECT");
            //如果响应头中包含 REDIRECT 则说明是拦截器返回的
            if (REDIRECT == "REDIRECT")
            {
                var win = window;
                while (win != win.top)
                {
                    win = win.top;
                }
                //重新跳转到 login.html
                win.location.href = xhr.getResponseHeader("CONTEXTPATH");
            }
        }
    });

});

//贷后追踪显示效果
function postLoan() {
    var _isShow = true;
    $('.daihou-list-new').find('li:eq(7)').addClass('last-li');
    $('.daihou-list-new').on('click','.dh-morebtn', function(){
        if(_isShow){
            $('.daihou-list-new').find('li').removeClass('last-li');
            $('.daihou-list-new').find('li:last').addClass('last-li');
            $('.daihou-list-new').find('li.dh-hide').show();
            $(this).hide();
        }

    });

}

function colosenewWindow() {
    $("#dial-window").hide();
    $("#diallayer").hide();
    //点关闭时刷新当前页面 allen 2016-03-16
    var isRefresh = $("#dial-window").find(".close").attr("isrefresh");
    if (isRefresh == "1") {
        window.location.reload();
    }
}
//弹出弹框
function showDialWindowsWithoutBtn(title, content) {
    showDialWindows(title + "<i class=\"close icons close-x icon abs\" onclick=\"colosenewWindow()\"></i>", content, null, null, null, null);
}
///弹框,title:弹框标题
///content：弹框内容
/// okString ok按钮内容, okbtnEvent ok按钮触发事件, cancleString取消按钮内容, cancleEvent取消按钮触发事件
function showDialWindows(title, content, okString, okbtnEvent, cancleString, cancleEvent) {
    if ($("#divTiQian").length > 0)
        $("#divTiQian").html('').hide();
    if (title.indexOf("close icons") < 0)
        title += "<i class=\"close icons close-x icon abs\" onclick=\"colosenewWindow()\"></i>";
    $("#dial-window .title").html(title);
    $("#dial-window .body").html(content);
    if (okString != "null" && okString != null && okString.length > 0) {
        $("#dial-window-okbtn").html(okString);
        $("#dial-window-okbtn").show();
    }
    else {
        $("#dial-window-okbtn").hide();
    }

    $("#dial-window-okbtn").unbind("click").bind("click", function (e) {
        e.preventDefault();
        if (okbtnEvent)
        { okbtnEvent(); }
    });

    if (cancleString != "null" && cancleString != null && cancleString.length > 0) {
        $("#dial-window-canclebtn").html(cancleString);
        $("#dial-window-canclebtn").show();
    }
    else {
        $("#dial-window-canclebtn").hide();
    }
    $("#dial-window-canclebtn").unbind("click").bind("click", function (e) {
        e.preventDefault();
        if (cancleEvent)
        { cancleEvent(); }
    });
    $("#diallayer").show();
    $("#dial-window-btns").show();
    $("#dial-window").show();
}
///关闭弹框
function closeLoadingWindows() {
    $("#dial-window .title").html("");
    $("#dial-window .body").html("");
    $("#dial-window-btns").hide();
    $("#layer").hide();
    $("#diallayer").hide();
    $("#dial-window").hide();
    if ($("#divTiQian").length > 0) {
        $("#divTiQian").hide();
    }
}
$(document).ready(function () {
    initLogin();
});

//兼容toFixed方法
Number.prototype.toFixed = function(n) {
    if (n > 20 || n < 0) {
        throw new RangeError('toFixed() digits argument must be between 0 and 20');
    }
    var number = this;
    if (isNaN(number) || number >= Math.pow(10, 21)) {
        return number.toString();
    }
    if (typeof(n) == 'undefined' || n == 0) {
        return (Math.round(number)).toString();
    }
    var result = number.toString();
    var arr = result.split('.');
    if (arr.length < 2) {
        result += '.';
        for (var i = 0; i < n; i += 1) {
            result += '0';
        }
        return result;
    }
    var integer = arr[0];
    var decimal = arr[1];
    if (decimal.length == n) {
        return result;
    }
    if (decimal.length < n) {
        for (var i$__0 = 0; i$__0 < n - decimal.length; i$__0 += 1) {
            result += '0';
        }
        return result;
    }
    result = integer + '.' + decimal.substr(0, n);
    var last = decimal.substr(n, 1);
    if (parseInt(last, 10) >= 5) {
        var x = Math.pow(10, n);
        result = (Math.round((parseFloat(result) * x)) + 1) / x;
        result = result.toFixed(n);
    }
    return result;
};

function converNumUtil(number) {
    var t = number ? (typeof number === 'number' ? number : parseFloat(number)).toFixed(3) : '';
    return t ? t.substr(0, t.length - 1) : '0';
}

appEwmShow()
//头部手机APP二维码
function appEwmShow() {
    $(".app-ewm-box").mouseenter(function () {
        $(this).find('.app-ewm').removeClass('ewm-toBottom');
        $(this).find('.app-ewm').show().addClass('ewm-toTop');
    });
    $(".app-ewm-box").mouseleave(function () {
        $(this).find('.app-ewm').removeClass('ewm-toTop').addClass('ewm-toBottom');
        $(this).find('.app-ewm').hide();
    });
}

//为IE7插入伪元素

//$beforeAfter(document.getElementById("vertical-center"));
//var $beforeAfter = function(dom) {
//  if (document.querySelector || !dom && dom.nodeType !== 1) return;
// 
//  var content = dom.getAttribute("data-content") || '';     
////  var before = document.createElement("before")
//     var  after = document.createElement("after");
//    
//  // 内部content
////  before.innerHTML = content;
//  after.innerHTML = content;
//  // 前后分别插入节点
////  dom.insertBefore(before, dom.firstChild);
//  dom.appendChild(after);
//};


/**
 * 弹窗自写插件
 * @param   opt  弹窗参数配置
 * 调用方法
 * publicUi.tdPopAlert({
        id:'popAlert1',
        type:'dialog',
        title:'团贷网提醒您：',
        contents:'<p>文本</p>',
        TextAlign:'center',
        width:450,
        height:190,
        zindex:9999,
        btnWidth:160,
        btnHeight:40,
        okBtn:'确定',
        okCallback: function(){
            window.open('http://www.tuandai.com');
        },
        cancelBtn: '取消'
    });
 * */
;(function(window,$){
   return  publicUi = {
       tdPopAlert : function(opt){

           //默认参数配置
           var defaults = {
               className:'',                         //弹窗样式名（可自定义样式）
               id: 'popAlert',                       //弹窗Id
               title: '温馨提示：',                   //标题
               type:'dialog',                        //弹窗类型  *dialog 带关闭按钮弹窗  *toast 提示弹窗3S后自动消失
               contents: '',                         //内容
               TextAlign:'center',                   //文字对齐方式
               width:500,                            //弹窗宽度
               height:'',                            //弹窗高度
               zindex:9999,                          //显示层级
               btnWidth:118,                          //按钮宽度
               btnHeight:38,                         //按钮高度
               okBtn: '',                            //确定按钮
               okCallback: '',                       //确定按钮回调函数
               cancelBtn: '',                        //取消按钮
               cancelCallback: '',                   //取消按钮回调函数
               closeCallback:'',                     //关闭按钮回调函数
               textBtn:''                            //确定（支持一个确定按钮）

           };

           //参数合并
           var option = $.extend({},defaults,opt);

           var dialog = {};

           var aHtml = [], mesHtml = [];
           aHtml.push('<div class="td-mask"></div>'
               +'<div class="tdPopAlert '+ option.className +'" id="'+ option.id +'" style="width: '+ option.width +'px; height: '+ option.height +'px;">'
               +'<i class="closed"></i>'+'<div class="title">'+ option.title +'</div>'
               +'<div class="contents">'+ option.contents +'</div><div class="btn-group">'
               +'</div></div>');
           mesHtml.push('<div class="td-maskMes"></div>'
               +'<div class="tdPopMessage" id="'+ option.id +'" style="width: '+ option.width +'px; height: '+ option.height +'px;">'
               +'<div class="contents">'+ option.contents
               +'</div></div>');
           if(option.type==='dialog'){
               $('body').append(aHtml.join(''));
           }else if(option.type==='toast'){
               $('body').append(mesHtml.join(''));
           }

           var $container = $('.tdPopAlert'),
               $containerMes = $('.tdPopMessage'),
               $mask = $('.td-mask'),
               $maskmes = $('.td-maskMes'),
               $contents = $('.contents'),
               $btngroup = $('.tdPopAlert .btn-group'),
               $closeBtn = $('.tdPopAlert .closed');

           dialog.init = function(){
               dialog.framework();
               dialog.closeSetTimeOut();

           };

           dialog.framework = function(){
               var styleVal = '';

               if(option.btnWidth){
                   styleVal += 'width:'+option.btnWidth+'px; ';
               }else{
                   styleVal += '';
               }
               if(option.btnHeight){
                   styleVal += 'height:'+option.btnHeight+'px; '+'line-height:'+option.btnHeight+'px';
               }else{
                   styleVal +='';
               }
               if(option.okBtn){
                   $btngroup.append('<a class="ok-btn" style="'+styleVal+'" href="javascript:;">'+ option.okBtn +'</a>');
                   $btngroup.delegate('.ok-btn','click',function(){
                       if(option.okCallback){
                           option.okCallback();
                       }else{
                           dialog.closeAlert();
                       }
                   });

               }
               if(option.cancelBtn){
                   $btngroup.append('<a class="cancel-btn" style="'+styleVal+'" href="javascript:;">'+ option.cancelBtn +'</a>');
                   $btngroup.delegate('.cancel-btn','click',function(){
                       if(option.cancelCallback){
                           option.cancelCallback();
                       }else{
                           dialog.closeAlert();
                       }
                   });

               }
               if(option.textBtn){
                   $btngroup.append('<a class="text-btn" style="'+styleVal+'" href="javascript:;">'+ option.textBtn +'</a>');
                   $btngroup.delegate('.text-btn','click',function(){
                       dialog.closeAlert();
                   });
               }
               $mask.css({'z-index':option.zindex-1});
               $maskmes.css({'z-index':option.zindex-1});
               $container.css({'z-index':option.zindex,'left':'50%','top':'50%','margin-left':-($container.width())/2+'px', 'margin-top': -($container.height())/2+'px'});
               $containerMes.css({'z-index':option.zindex,'left':'50%','top':'50%','margin-left':-($containerMes.width())/2+'px', 'margin-top': -($containerMes.height())/2+'px'});
               $contents.css({'text-align':option.TextAlign});

           };

           //隐藏弹窗
           dialog.alertHide = function(){
               if(option.closeCallback){
                   option.closeCallback();
               }
               $container.hide().remove();
               $mask.hide().remove();

           };

           //关闭弹窗
           dialog.closeAlert = function(){
               dialog.alertHide();
           };

           dialog.closeSetTimeOut = function(){
               setTimeout(function(){
                   $containerMes.stop().fadeOut(function(){
                       $containerMes.remove();
                   });
                   $maskmes.stop().fadeOut(function(){
                       $maskmes.remove();
                   });
               },3000);
           };

           //绑定点击事件
           $closeBtn.on('click',dialog.closeAlert);

           dialog.init();

           return dialog;
       },
       //开启自动投资弹窗
       openAutoInvestAlt :function(){
           var autoHtml='';
           autoHtml += '<div class=""><p class="text-333 fz16">扫描下载团贷网APP，开启自动投标可获得更高加息哦！</p>';
           autoHtml += '<p style="margin-top: 40px;"><img src="//js3.tuandai.com/images/v2/open-zx-code.png" alt=""></p>';
           autoHtml += '<p class="tdw-icons zx-bg-line">开启方式</p>';
           autoHtml += '<div class="text-333">打开团贷网APP<span class="tdw-icons i-arrow-zx"></span>“我”的页面<span class="tdw-icons i-arrow-zx"></span>自动投标<span class="tdw-icons i-arrow-zx"></span>添加策略 </div></div>';
           publicUi.tdPopAlert({
               className:'open-zx-alert',
               id:'openZxPopAlert',
               type:'dialog',
               title:'开启自动投标',
               contents:autoHtml,
               TextAlign:'center',
               width:480,
               height:400,
               zindex:9999
           });
       }
   }

})(window,jQuery);

