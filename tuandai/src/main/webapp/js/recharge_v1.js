
//相关变量初始化----------------------------------------------
//连续支付锁定，当大于0时提示“点击支付过于频繁”
var rechareWealthlock = 0;
var rechareLianLianlock = 0;
var rechareTenpaylock = 0;
var rechareWXfulock = 0;
var sltTab = 0;//选中的支付渠道  =0网银充值，=8快捷，=4财付通，=9微信


//支付金额验证不通过时信息提示
var arrBox = new Array();
arrBox["d_money"] = "<img style='margin:2px;' src='//js3.tuandai.com/images/users/regad/zhuce1.gif'/>&nbsp;请输入正确的金额，最小充值金额50元。";
var arrWrong = new Array();
arrWrong["d_money"] = "<img style='margin:2px;' src='//js3.tuandai.com/images/users/regad/zhuce2.gif'/>&nbsp请输入正确的金额，小数点后最多2位数。";
var arrWrong1 = new Array();
arrWrong1["d_money"] = "<img style='margin:2px;' src='//js3.tuandai.com/images/users/regad/zhuce2.gif'/>&nbsp;输入的金额不能为空！";
var arrWrong2 = new Array();
arrWrong2["d_money"] = "<img style='margin:2px;' src='//js3.tuandai.com/images/users/regad/zhuce2.gif'/>&nbsp;最低充值金额为100元！";
var arrWrong3 = new Array();
arrWrong3["d_money"] = "<img style='margin:2px;' src='//js3.tuandai.com/images/users/regad/zhuce2.gif'/>&nbsp;最低充值金额为100元！";
var arrWrong4 = new Array();
arrWrong4["d_money"] = "<img style='margin:2px;' src='//js3.tuandai.com/images/users/regad/zhuce2.gif'/>&nbsp;充值金额不能超过500000！";
var arrWrong5 = new Array();
arrWrong5["d_money"] = "<img style='margin:2px;' src='//js3.tuandai.com/images/users/regad/zhuce2.gif'/>&nbsp;单笔限额¥"+cgtRechargeAmountStr+"元！";
var arrOk = new Array();
arrOk["d_money"] = "<img style='margin:2px;' src='//js3.tuandai.com/images/users/regad/zhuce3.gif'/>";

//---------------------------------------------------------


$(function () {
    //页面初始化
    Init();
    //页面相关事件绑定
    view_event_bind();

    $('#t_money').focus().focus(function () {
        $('#tip').html('');
    });
});

//页面初始化
function Init() {
    //给左边“充值”菜单添加样式
    setTimeout("$('#t_money').focus()", 800);
    $("#menu_recharge").addClass("currentMenu");

    secBank();
}

//页面相关事件绑定
function view_event_bind() {
    //快捷充值
    $("#shortcutRecharge").click(function () {

        if(!checkStopService("gatewayRecharge")) {
            return false;
        }
        if (!checkIsOpen("chongzhiother")) {
            return false;
        }
        $(this).removeAttr('href');
        return paylianlian();
    });
    //网银充值
    $('#confirmRecharge').click(function () {

        if(!checkStopService("gatewayRecharge")) {
            return false;
        }

        try {
            if (!checkIsOpen("chongzhi")) {
                return false;
            }
        } catch (e) { }

        $(this).removeAttr('href');
        //银行卡充值
        return wealthrecharge();
    });

    //网银充值
    $('#wealthrecharge').click(function () {
        $('#rechargeBankCode').hide();
        $('.in-tabox').hide();
        changeChannelOp();
        var onepay = $("#onepay");
        onepay.find(".sec").removeClass("sec").end().find(".current").removeClass("current");
        onepay.find("li").first().addClass("sec").end().find("em").first().addClass("current");

        onepay.find(".sec").click();

        sltTab = 0;
        rechareLianLianlock = 0;
        rechareTenpaylock = 0;
        rechareWXfulock = 0;
    });


    //金额输入框属性改变事件
    $('#t_money').bind('input propertychange', function () {
        var money = $('#t_money').val();
        $("#spnRechargeAmountBig").text(Arabia_to_Chinese(money));
    });
}


//网银支付
function wealthrecharge() {
    $("#confirmRecharge").removeAttr("href");
    if (parseInt(rechareWealthlock) > 0) {
        showDialWindows(newTitle,'您好,提交过于频繁.连续提交需要超过10秒,请稍后重试!', "确定",closeLoadingWindows);
        return false;
    }
    if (BlurMoney1(1) && parseInt(rechareWealthlock) == 0) {
        var amount = $.trim($("#t_money").val());
        if (isEmpty(routeId) || isEmpty(OutCode) || isEmpty(Sel)) {
            showDialWindows(newTitle,'页面失效请刷新后重试', "确定",closeLoadingWindows);
            return false;
        }
        var fileurl = $("#" + fileId).val();
        var href = apiUrl + "/member/account_pay_route.aspx?Amount=" + amount + "&RouteId=" + routeId + "&InsiderCode=" + InsiderCode + "&OutCode=" + OutCode + "&Sel=" + Sel + "&fileurl=" + fileurl + "&PayType=1&CgtPayCompany=" + cgtPayCompany;
        rechareWealthlock = 1;
        setTimeout("frecharelock(" + rechareWealthlock + ");", 10000);
        try {
            SetWenXinRemind("chongzhi");
            $('#bankBindAlert').show();
            $('#diallayer').show();
        } catch (e) { }
        href = "/view/redirect?url=" + encodeURIComponent(href);
        $("#confirmRecharge").attr("href", href);
        return true;
    }
    rechareWealthlock = 0;
    return false;
}

//连连支付
function paylianlian() {
    $("#shortcutRecharge").removeAttr("href");
    if (identity($("#KJsel").val()) == false) {
        return false;
    }

    if (parseInt(rechareLianLianlock) > 0) {
        showDialWindows(newTitle,'您好,提交过于频繁.连续提交需要超过10秒,请稍后重试!', "确定",closeLoadingWindows);
        return false;
    }
    if (BlurMoney1(0) && parseInt(rechareLianLianlock) == 0) {

        var amount = $("#t_money").val();

        if (isEmpty(kjpaychannel)) {
            showDialWindows(newTitle,'页面失效请刷新后重试', "确定",closeLoadingWindows);
            return false;
        }
        var fileurl = $("#" + fileId).val();
        var InsiderCode = $("#hd_bankcode").val();

        var href = apiUrl + "/member/account_kuaijie_pay.aspx?Amount=" + amount + "&RouteId=" + kjrouteid + "&Sel=" + kjpaychannel + "&OutCode=" + InsiderCode + "&fileurl=" + fileurl + "&PayType=1&CgtPayCompany=" + kjcgtpaycompany;
        setTimeout("frecharelock(" + rechareLianLianlock + ");", 10000);
        try {
            SetWenXinRemind("chongzhi");
            $('#bankBindAlert').show();
            $('#diallayer').show();
        } catch (e) { }

        href = "/view/redirect?url=" + encodeURIComponent(href);

        $("#shortcutRecharge").attr("href",href);
        return true;
    }
    rechareLianLianlock = 0;
    return false;
}

function isEmpty(obj) {
    if (obj == null || obj == undefined || obj == "") {
        return true;
    } else {
        return false;
    }
}

//解除因连续点击支付确认而锁定的支付渠道
function frecharelock(obj) {
    rechareWealthlock = 0;
    rechareLianLianlock = 0;
    rechareTenpaylock = 0;
    rechareWXfulock = 0;
}

//连连支付相关的实名认证
function LianLianInit() {
    if (identity(8) == false) {
        return;
    }

    //$("#t_money").val('');
}

//实名信息认证
function identity(sel) {
    if (hasBankNo == "No") {
        var IsLogin = isCookieLogin();
        if (IsLogin == false) {
            showDialWindows(newTitle,'您好，请先登录后再进行操作。', "马上登录",closeLoadingWindows);
            return false;
        }
        if (sel == $("#KJsel").val()) {

           /*  $.ajax({
                async: false,
                type: "get",
                url: '/member/Bank/AddBank.aspx',
                success: function (data) {
                    if ($("#bindBankWindows").length > 0) {
                        $("#bindBankWindows,#diallayer").remove();
                    }
                    $("body").append(data);

                },
                cache: false
            }); */

            return false;
        } else {
            return true;
        }
    }

}

//当点击确定支付时进行充值金额合法验证
function BlurMoney1(type) {
    var txt = "#t_money";
    var td = "#tip";
    var pat = /^[0-9]*(\.[0-9]{1,2})?$/;

    var str = $(txt).val();
    if (str == "") {
        $(td).html(GetP("reg_wrong", arrWrong1["d_money"]));
        return false;
    }
    var m = parseFloat(str);
    if (m <= 0) {
        $(td).html(GetP("reg_wrong", arrWrong3["d_money"]));
        return false;
    }
    if(type == 0){
        if(m > parseFloat(cgtRechargeAmount)){
            $(td).html(GetP("reg_wrong", arrWrong5["d_money"]));
            return false;
        }
    }

    //限制50最小金额
    var m = parseInt(str);
    //alert(m);
	//取消网银充值最高500万元限制
//    if (m > 5000000) {
//        $(td).html(GetP("reg_wrong", arrWrong4["d_money"]));
//        return false;
//    }
    if (m < 100) {
        $(td).html(GetP("reg_wrong", arrWrong2["d_money"]));
        return false;
    }
    if (pat.test(str)) {
        $(td).html(GetP("reg_ok", arrOk["d_money"]));
        return true;
    }
    else {
        $(td).html(GetP("reg_wrong", arrWrong["d_money"]));
        return false;
    }


}

function ClickBox(id) {
    var ele = '#' + id;
    $(ele).html(GetP("reg_info", arrBox[id]));
}

//获取提示信息
function GetP(clsName, c) {
    return "<div class='" + clsName + "'>" + c + "</div>";
}

//弹出
function showTC() {
    $(".recharge_popup").removeClass("hidden");
    $(".mask").removeClass("hidden");
}

//关闭
function closeTC() {
    $(".recharge_popup").addClass("hidden");
    $(".mask").addClass("hidden");
}

//充值类型tab切换
function tabBox(oLis, oTab) {
    var oLis = $(oLis), oTab = $(oTab);
    for (var i = 0, len = oLis.length; i < len; i++) {
        oLis[i].index = i;
        oLis[i].onclick = function () {
            for (var n = 0; n < len; n++) {
                $(oTab[n]).addClass('hide');
                $('#t_money').focus();
            }
            $(this).addClass('on').siblings(oLis[i]).removeClass('on');
            $(oTab[this.index]).removeClass('hide');

        }
    }
}

//选择银行充值
function secBank() {
    $('#onepay .blanklist').click(function () {
        $(this).addClass('sec').siblings('.blanklist').removeClass('sec');
        $('#onepay .blanklist').find('em').removeClass('current');
        $(this).find('em').addClass('current');
    });

    $('#onepay .more').click(function () {
        $(this).parent().css({ 'height': 'auto' });
        $('#onepay .up').show();
        $(this).hide();
    });
    $('#onepay .up').click(function () {
        $(this).parent().css({ 'height': '155px' });
        $('#onepay .more').show();
        $(this).hide();
    });
}

//微信、财付通
$('#threepay li').click(function () {
    $(this).addClass('on').siblings('li').removeClass('on');
    $('#threepay li').find('em').removeClass('current');
    $(this).find('em').addClass('current');
    var index = $(this).index();
    number = index;
    $('.in-tabox .wechat').hide();
    $('.in-tabox .wechat:eq(' + index + ')').show();
    $('#t_money').focus();
});

//只能输入金额
function KeyPressNum(obj, evt) {

    if ($("#" + signId).val() == "1")
        return false;

    var key = window.event ? evt.keyCode : evt.which;
    if (key < 27 || key > 128) return true; //如果输入的是功能按键，则不限制
    else if (key >= 48 && key <= 57) return true;
    else if (key == 46) return true
    else
        return false;
    //var item = $(obj).val();

    //if (/^(?!(0[0-9]{0,}$))[0-9]{1,}[.]{0,}[0-9]{0,}$/.test(item)) {
    //    return true;
    //}
    //else {
    //    return false;
    //}
}

