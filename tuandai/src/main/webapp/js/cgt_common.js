//－－－－－－－－－－－－－－－存管通验证－－－－－－－－－－－
var newTitle = newTitle || '团贷网提醒您';
$(function () {
    //关闭免密功能弹窗
    function CloseBox() {
        $('.cgt-close-x').on('click', function() {
            $(this).parents(".dial-window").hide();
            $('#diallayer').hide();
            $(".xm-mask").hide();
            try {
                if (backUrlClose != "")
                    location.href = backUrlClose;
            } catch (e) {
            }
        });
        $('.alert-btn').on('click', function() {
            $(this).parent().parent().parent().hide();
            $('#diallayer').hide();
        });
        $('#hkBtn').on('click', function() {
            $(this).parent().parent().parent().parent().hide();
            $('#diallayer').hide();
            $(".xm-mask").hide();
            try {
                if (backUrlClose != "")
                    location.href = backUrlClose;
            } catch (e) {
            }
        });
        $('#aeBtn').on('click', function() {
            $(this).parent().parent().parent().hide();
            $('#diallayer').hide();
            $(".xm-mask").hide();
            try {
                if (backUrlClose != "")
                    location.href = backUrlClose;
            } catch (e) {
            }
        });
        $("#qiyeBtn").on('click', function() {
            $(this).parent().parent().parent().hide();
            $('#diallayer').hide();
            $(".xm-mask").hide();
        });
    }

    CloseBox();

    //厦门银行弹窗
    function closePop(obj1, obj2) {
        $(obj1).click(function() {
            $(this).parent().hide();
            $(obj2).hide();
            try {
                if (backUrlClose != "")
                    location.href = backUrlClose;
            } catch (e) {
            }
            if(window.isOpenDialWindows === true) {
                $("#dial-window,#diallayer").show();
            }
        });
    }

    closePop(".xiamen-pop .close", ".xm-mask");

    //弹窗宽度自适应
    var bankBindAlertWidth = $('.bankBindAlert').width();
    $('.bankBindAlert').css({ 'margin-left': -(bankBindAlertWidth / 2) });


    $("#aActived").click(function() {
        $(this).removeAttr('herf');
        /**$.ajax({
            url: "",
            type: "get",
            dataType: "jsonp",
            async: false,
            data: { Cmd: "ACTIVATE_IMPORT_USER" },
            success: function (json) {
                var obj = json;
                if (obj.result == "1") {
                    var url = unescape(obj.msg);
                    //window.open(url);
                    //$("#aActived").attr("href", url);
                    var blankA = $("#blank_a");
                    if (blankA.length == 0) {
                        $("body").append("<a id='blank_a' style='display:none' target='_blank'><span></span></a>");
                    }
                    $("#blank_a").attr("href", url).find("span")[0].click();

                    $(".xm-mask").hide();
                    $(".xiamen-pop").hide();

                }
                else if (obj.result == "-1") {
                    alert(obj.msg);
                }
                else {
                    alert("系统繁忙,请刷新再试！");
                }
            }
        });
    }); */

    $("#btn_showquan").click(function () {
        $(this).removeAttr('href');

        var setlist = [];       
        if ($("#mm_toubiao").css("display") == "block")
            setlist.push("TENDER");
        if ($("#mm_zhaiquan").css("display") == "block")
            setlist.push("CREDIT_ASSIGNMENT");
        if ($("#mm_huankuan").css("display") == "block")
            setlist.push("REPAYMENT");
        if ($("#mm_tixian").css("display") == "block")
            setlist.push("WITHDRAW");
        if (setlist.length < 1)
        {
            alert("授权设置失败，请联系客服！");
            return false;
        }

       /* $.ajax({
            url: "",
            type: "get",
            dataType: "jsonp",
            async: false,
            data: { Cmd: "USER_AUTHORIZATION", setlist: setlist.join(",") },
            success: function (json) {

            }
        });*/
    });

});
var Arr = ["2880323191", "2880323207", "2880761023"];

function getRandomValue() {
    
    var n = Math.floor(Math.random() * Arr.length + 1) - 1;
    $("#a_qq").attr("href", "");
    $("#a_qq").text("2880761023");
    $("#span_qq").html("2880761023");
}

function AsyncAuthor(data) {
    var obj = data;
    if (obj.result == "1") {
        var url = unescape(obj.msg);
        //$("#btn_showquan").attr("href", url);
        var blankA = $("#blank_a");
        if (blankA.length == 0) {
            $("body").append("<a id='blank_a' style='display:none' target='_blank'><span></span></a>");
        }
        $("#blank_a").attr("href", url).find("span")[0].click();
    }
    else {
        alert("程序异常！");
    } 
}

function SetWenXinRemind(type)
{    
    var sptitle = "";   
    var aatitle = "";
    var url = "";
    $(".question").removeAttr("href");
    switch (type)
    {
        case "bangka":
            sptitle = "绑卡";
            aatitle = "绑卡成功，马上充值";
            url = portalWebsiteUrl + "Recharge.html";
            $("#remind_aa").attr("href", url);
            $(".question").attr("href", "");
            break;
        case "jiaoyimima":
            sptitle = "密码修改";
            aatitle = "密码修改成功";
            url = portalWebsiteUrl + "account_default.html";
            $("#remind_aa").attr("href", url);
            break;
        case "phone":
            sptitle = "预留手机号更换";
            aatitle = "预留手机号更换成功";
            url = portalWebsiteUrl + "account_default.html";
            $("#remind_aa").attr("href", url);
            $(".question").attr("href", "");
            break;
        case "chongzhi":
            sptitle = "充值";
            aatitle = "充值成功，马上投资";
            url = portalWebsiteUrl + "welist.html";
            $("#remind_aa").attr("href", url);
            $(".question").attr("href", "");
            break;
        case "tixian":
            sptitle = "提现";
            aatitle = "提现成功";
            url = portalWebsiteUrl + "account_default.html";
            $("#remind_aa").attr("href", url);
            break;
        case "touzi":
            sptitle = "投资";
            aatitle = "投资成功";
            url = portalWebsiteUrl + "welist.html";
            $(".question").attr("href", "");
            $(".question").click(function () {
                $("#layer").show();
                $("#td-art").show();
                $("#dial-window").hide();
                $("#td-atr-layer").hide();
                $("#diallayer").hide();
                $("#bankBindAlert").hide();
            });
            $("#remind_aa").click(function () {
                $("#diallayer").hide();
                $("#bankBindAlert").hide();
            });
            break;
    }
    

    $("#sp_title").html(sptitle);
    $("#aa_title").html(aatitle);
    if (type != "phone") {
        $("#sp_title2").html(sptitle);
        $("#sp_title3").html(sptitle);
    }
    else {
        $("#sp_title2").html("更换");
        $("#sp_title3").html("更换");
    }
}
function checkToPlatformPermit() {
    var isOk = false;
    /**$.ajax({
        url: "/member/Bank/checkToPlatformPermit",
        type: "get",
        dataType: "json",
        async: false,
        success: function (json) {
            if(json.code == 0 || json.code =="0") {
                isOk = true;
            }
        }
    });*/
    if(!isOk) {
        $(".xm-mask").show();
        $("#showToPlatformPermit").show();
    }
    return isOk;
}
function checkIsOpen(sign) {
	var isopen = true;
	var _sign = "tixian";
	if (undefined == sign || null == sign)
		_sign = "";
	else
		_sign = sign;
	/**$.ajax({
		url: "/member/Bank/getShowQuanStatus",
		type: "get",
		dataType: "json",
		async: false,
		data: {opertype: _sign },
		success: function (json) {

			$("#aOpen").hide();
			$("#aActived").hide();
			$("#aBankBind").hide();
			$("#sp_open").hide();
			$("#sp_active").hide();

			$("#mm_toubiao").hide();
			$("#mm_zhaiquan").hide();
			$("#mm_huankuan").hide();
			$("#mm_tixian").hide();


			var rtn = json && json.data ? json.data.result : "";
			var url = json && json.data ? json.data.url : "";
			if(rtn == "-999"){
                isopen = false;
                showDialWindows(newTitle, "网络错误，请稍后重试", "确认",function () {
                    $("#dial-window").hide();
                    $("#diallayer").hide();
                });
                
            }*/
            //账户异常
            if(rtn == "10000"){
                $(".xm-mask").show();
                $("#accountError").show();
                isopen = false;
            }
            //进行一账通开通
            if(rtn == "10100"){
                $(".xm-mask").show();
                $("#bankBlock").show();
                $("#aOpen").show();
                isopen = false;
            }
            //进行开户并关联
            if(rtn == "10101"){
                $(".xm-mask").show();
                $("#bankBlock").show();
                $("#aOpen").attr("href", url);
                $("#aOpen").show();
                isopen = false;
            }
            //激活并开通一账通
            if(rtn == "10200"){
                $(".xm-mask").show();
                $("#bankBlock").show();
                $("#aOpen").attr("href", url);
                $("#aOpen").show();
                isopen = false;
            }
            //激活并关联一账通
            if(rtn == "10201"){
                $(".xm-mask").show();
                $("#bankBlock").show();
                $("#aOpen").attr("href", url);
                $("#aOpen").show();
                isopen = false;
            }
            //0要素
            if(rtn == "10301"){
                $(".xm-mask").show();
                $("#0pass").show();
                isopen = false;
            }
            //快捷充值判断只通过了三要素
            // if (rtn == "10302"){
            //     if (_sign == "chongzhiother") {
            //         $(".xm-mask").show();
            //         $("#chongzhiotherbtn").attr("href", url);
            //         $("#chongzhiother").show();
            //         isopen = false;
            //     }
            //     else {
            //         isopen = true;
            //     }
            // }
            //审核失败
            if (rtn == "2" || rtn == "3" || rtn == "4"){
                cardType = '外国人护照';
                switch (rtn){
                    case '2':
                        cardType = '港澳台通行证';
                        break;
                    case '3':
                        cardType = '外国人永久居留证';
                        break;
                    case '4':
                        cardType = '外国人护照';
                        break;
                    default:
                        cardType = '外国人护照';
                }
                $(".xm-mask").show();
                $("#bankCheckFaile-tip").text('由于您升级存管时使用的证件为' + cardType + '，您还需完成以下操作才能进行资金操作：');
                $(".bankCheckFaile-tip2").text(cardType);
                $("#bankCheckFaile").show();
                isopen = false;
            }
            //授权判断
            if(rtn == "103002" || rtn == "103004"){
                if (_sign == "touzi"){
                    $(".xm-mask").show();
                    $("#touzi-btn").attr("href", url);
                    $("#touzi").show();
                    isopen = false;
                }
                if (_sign == "huankuan"){
                    $(".xm-mask").show();
                    $("#zhixiang-btn").attr("href", url);
                    $("#zhixiang").show();
                    isopen = false;
                }
            }
            if(rtn == "103005"){
                $(".xm-mask").show();
                $("#bindingBank").show();
                $("#aOpen").show();
                isopen = false;
            }
             if(isopen){
                 if(_sign == "touzi"){
                     //风险评测
                     $.ajax({
                         url: "/member/security/riskAssessment",
                         type: "get",
                         dataType: "json",
                         async: false,
                       cache: false,
                       success: function (data) {
                             if(data.data.result=="1"){
                                isopen = false;
                                 showDialWindows(newTitle,"<div class='lh24 tl g3 mt10 pl30'>您尚未进行风险承受能力评测，请先完成评测后<br/>再进行投资</div>","立即测评",
                                 function() {
                                    window.location.href = "http://hd.tuandai.com/web/20170309test/index.aspx";
                                 },null,null);
                            }
                         }, error: function () {
            
                         }
                     });
                 }
             }
	}
	});
	$(".XMCGQQ_code").mouseover(function () {
		$(".codexe").show();
	}).mouseout(function () {
		$(".codexe").hide();
	})
	return isopen;

function checkStopService(type,uri) {
    var url = "/member/getStopServiceStatus?type=";
    if(uri) {
        url = uri;
    }
    var flag = true;
   /** $.ajax({
        url: url+type,
        type: "get",
        dataType: "json",
        data: {
        },
        async: false,
        success: function (json) {
            flag = showStopServiceWin(json);
        },
        error: function(json) {
        }
    });
    return flag;*/
}


		
function completeBankBox() {
    var IsLogin = isCookieLogin();
    if (IsLogin == false) {
        showDialWindows(newTitle, "您好，请先登录后再进行操作。", "确认",function () {
            window.location.href = portalWebsiteUrl+"/u/login?ReturnUrl=" + window.location.href;
        });
        return;
    } else {
       /** $.ajax({
            async: false,
            type: "get",
            url: portalWebsiteUrl+'/member/Bank/CompleteBank?modify=1&r=' + Math.random(),
            success: function (data) {
                if ($("#bindBankWindows").length > 0) {
                    $("#bindBankWindows,#diallayer").remove();
                }
                $("body").append(data);
            },
            cache: false
        });*/
    }
}
//－－－－－－－－－－－－－－－存管通验证结束－－－－－－－－－－－


function showStopServiceWin(result) {
    if (result) {
        if(result.code == 444) {
            if(result.data && result.data.pcDetail && result.data.pcDetail != "") {
                closeLoadingWindows();
                $("#diallayer").show();
                $(".stop-title").html(result.data.title);
                $("#funcStopCentent").html(result.data.pcDetail);
                $("#funcStopService").show().css({
                    'margin-top':(-($('.stop-taking').outerHeight()/2)+'px')
                });
                //20180607停服弹窗关闭
                $("#guan,.stop-taking .knob").click(function(){
                    $("#diallayer").hide();
                    $(".stop-taking").hide()
                });
                $('.stop-dialog .stop-text').slimscroll({
                    height:'450px',
                    width: '500px'
                });

                return false;
            }
        }
    }
    return true;
}