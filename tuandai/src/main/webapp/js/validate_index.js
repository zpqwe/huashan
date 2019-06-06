var isEnterAutoInvestSetPage = getCookie("45410e0a" + "isEnterAutoInvestSetPage"); //是否进入自动投标设置
var isClosedYellowTip2 = getCookie("45410e0a" + "isClosedYellowTip"); //手动点击关闭黄标签
var isDefaultShowed = getCookie("45410e0a" + "_account_default"); //是否首页显示
var tuandaiw = getCookie("tuandaiw");
$(function() {
    $(".a_code").mouseover(function() {
        $(".codexe").show();
    }).mouseout(function() {
        $(".codexe").hide();
    });

    try {
        getRandomValue();
    } catch (e) {}
    $('#menu_autoTender').hover(function() {
            $('#YellowTips').fadeIn(150);
        },
        function() {
            $('#YellowTips').stop().fadeOut();
        }
    );
    $('#menu_myWePlan').hover(function() {
            $('#YellowTips2').fadeIn(150);
        },
        function() {
            $('#YellowTips2').stop().fadeOut();
        }
    );
    $("#menu_withdraw,#menu_recharge").click(function() {
        try {
            getRandomValue();
            if (!checkIsOpen("chongzhi"))
                return false;
        } catch (e) {}
    });

    $("#menu_borrowMiniEdit").click(function() {
        try {
            if (!checkIsOpen("noshouquan"))
                return false;
        } catch (e) {}
    });
    $("#menu_userservice").click(function() {
        try {
            if (!checkIsOpen())
                return false;
        } catch (e) {}
    });
    $("#menu_autoTender").click(function() {
        try {
            if (!checkIsOpen("touzi"))
                return false;
        } catch (e) {}
    });

    if (isEnterAutoInvestSetPage != null && isEnterAutoInvestSetPage != "") {
        isEnterAutoInvestSetPage = "1";
    }
    if (isClosedYellowTip2 != null && isClosedYellowTip2 != "") {
        isClosedYellowTip2 = "1";
    }
    if (isDefaultShowed != null && isDefaultShowed != "") {
        isDefaultShowed = "1";
    }

    if (isEnterAutoInvestSetPage != "1") {

        $('#menu_autoTender').find('em').addClass("emClass");
    }

    if (window.location.href.indexOf("member/account_default") < 0) {
        //不是主页,自动提示
        if (isClosedYellowTip2 != "1" && isEnterAutoInvestSetPage != "1") {
            $('#YellowTips').fadeIn();
        }
    } else {
        //是主页,如果大黑不显示自动提示
        if (isClosedYellowTip2 != "1" && isEnterAutoInvestSetPage != "1" && isDefaultShowed != "1") {
            $('#YellowTips').fadeIn();
        }
    }

    $('#menu_autoTender').find('.close').click(function() {
        $('#YellowTips').fadeOut();
        setCloseYellowTips();
    });
});

function setCloseYellowTips() {
    setCookie("45410e0a" + "isClosedYellowTip", "1");
}

function left_CheckAllowDraw() {

    return true;
}

function left_CheckAllowBindBank() {
    if (left_IsValidateMobile != 'True' || left_IsValidateIdentity != 'True') {
        userbank.tips(left_IsValidateMobile, left_IsValidateIdentity);
        return false;
    }
    return true;
}


function SetTenderNeedPayPwd(boolSign) {
   /*  $.ajax({
        url: "/member/security/setTenderNeedPayPwd",
        type: "post",
        dataType: "json",
        async: false,
        data: {
            setvalue: boolSign
        },
        success: function(data) {
            switch (parseInt(data.code)) {
                case -100:
                    {
                        window.location.href = "/View/NoticeMessage?status=2";
                        break;
                    }
                case -99:
                    {
                        window.location.href = "/u/login?ReturnUrl=" + window.location.href;
                        break;
                    }
                case 0:
                    {
                        //console.log(data.respdata)
                        // window.open("/view/redirect.aspx?url="+encodeURIComponent(data.data));
                        OpenURL.blank("/view/redirect?url="+encodeURIComponent(data.data));

                        //$('#IsTenderNeedPayPassword2').attr("href", unescape(data.respdata));

                        //if (boolSign) {
                        //    $('#IsTenderNeedPayPassword2').removeClass('enter-password-n');
                        //    $('#IsTenderNeedPayPassword2').addClass('enter-password-y');
                        //}
                        //else {
                        //    $('#IsTenderNeedPayPassword2').removeClass('enter-password-y');
                        //    $('#IsTenderNeedPayPassword2').addClass('enter-password-n');
                        //}
                        break;
                    }
                default:
                    {
                        //art.dialog({
                        //    time: 5,
                        //    zIndex: 9999999,
                        //    content: data.msg
                        //});
                        showDialWindows("团贷网提醒您", data.msg, "确认", closeLoadingWindows);
                        break;
                    }
            }
        },
        error: function(XMLRequest, textStatus, errorThrown) {
            showDialWindows("团贷网提醒您", "系统繁忙，请稍后再试。", "确认", closeLoadingWindows);
        }
    }); */
}
var OpenURL=(function () {
    function getId() {
        var id = "open_url_btn_" + new Date().getTime();
        if($(id).length == 0){
            return id;
        }
        return getId();
    }
    return {
        blank:function(url) {
            var id = getId();
            $("<a style='position: fixed;top:-1000px;left: -1000px;' target='_blank' href='" + url + "'><span id='" + id + "'>open</span></a>").appendTo("body");
            document.getElementById(id).click();
        }
    }
})();
$(function() {
    $(".modify_code").mouseover(function() {
        $(".codeda").show();
    }).mouseout(function() {
        $(".codeda").hide();
    })
    $('#IsTenderNeedPayPassword2').click(function() {
        if (!checkIsOpen("")){
            return;
        }

        $(this).removeAttr('herf');
        var state = $('#IsTenderNeedPayPassword2').attr("class").toString();
        if (state.indexOf("enter-password-y") > -1) {
            SetTenderNeedPayPwd(false);
        } else {
            SetTenderNeedPayPwd(true);
        }

    });

    $('#IsTenderNeedPayPassword').click(function() {
        var state = $('#IsTenderNeedPayPassword').attr("class").toString();
        if (state.indexOf("enter-password-y") > -1) {
            UpdateTenderNeedPayPwd(false);
        } else {
            UpdateTenderNeedPayPwd(true);
        }

    });


    $('.phone-verification-btn').click(function() {
        Update_TelNo();
    });
    $('.email-verification-btn').click(function() {
        Update_Email();
    });

    $('.answer-verification-btn').click(function() {
        Update_SafeQuestion();
    });

    $('#UpdatePayPwd_Cgt').click(function() {

        if (!checkIsOpen("")){
            return;
        }

        $(this).removeAttr('herf');
        ChangePWD();
    });

    $('#UpdateBankTelNo_Cgt').click(function() {

        if (!checkIsOpen("")){
            return;
        }


        $(this).removeAttr('herf');
        var mobile = $(this).attr("value");
        ModifyPhone1(mobile);
    });



    $('.transaction-password-verification-btn').click(function() {
        Update_PayPwd();
    });

    if (ResetEmail_Method == 'checkoriginemail' || ResetEmail_Method == 'emailbindnewemail' || ResetEmail_Method == 'phonebindnewemail' || ResetEmail_Method == 'questionbindnewemail') {
        Update_Email();
    }

    switch (requestMothod) {
        case "pwd":
            Update_Pwd();
            break;
        case "paypwd":
            Update_PayPwd();
            break;
        case "safe":
            Update_SafeQuestion();
            break;
        case "phone":
            Update_TelNo();
            break;
        case "email":
            Update_Email();
            break;
        case "identity":
            Update_IdentityCard();
            break;
        default:
            break;
    }
});

function Update_IdentityCard() {

}

function Update_TelNo() {
    if (!$("#verification-box-2").is(":visible")) {
        $('.li-height-auto').hide();
        $('#verification-box-2').show();
        $("#verification-box-2").load("iframe/ValidateMobile.html?v=" + Math.random()); //手机验证
    } else {
        $('#verification-box-2').hide();
    }
}

/*function Update_Email() {
    if (!$('#verification-box-3').is(":visible")) {
        $('.li-height-auto').hide();
        $('#verification-box-3').show();


        var loadUrl = "iframe/ValidateEmail.html?v=" + Math.random();
        switch (ResetEmail_Method) {
            case "checkoriginemail":
                loadUrl += "&method=" + ResetEmail_Method + "&token=" + '' + "&code=" + '';
                break;
            case "emailbindnewemail":
            case "phonebindnewemail":
            case "questionbindnewemail":
                loadUrl += "&method=" + ResetEmail_Method + "&token=" + '' + "&temp=" + '';
                break;
        }

        $("#verification-box-3").load(loadUrl); //邮箱验证


    } else {
        $('#verification-box-3').hide();
    }
}*/

function Update_SafeQuestion() {
    if (!$('#verification-box-4').is(":visible")) {
        $('.li-height-auto').hide();
        $('#verification-box-4').show();
        $("#verification-box-4").load("iframe/SafeQuestion.html?v=" + Math.random()); //安全问题
    } else {
        $('#verification-box-4').hide();
    }
}

function Update_Pwd() {
    if (!$('#verification-box-6').is(":visible")) {
        $('.li-height-auto').hide();
        $('#verification-box-6').show();
        $("#verification-box-6").load("iframe/Pwd.html?v=" + Math.random()); //交易密码
    } else {
        $('#verification-box-6').hide();
    }
}

function Update_PayPwd() {
    var IsValidateMobile = "True";
    if (IsValidateMobile == "False") {
        userbank.tips_show("设置交易密码需要先完成<span class=\"fc-orange\">手机认证</span>！", "去认证", null, "method=phone#s_phone");
        return;
    }
    if (!$('#verification-box-5').is(":visible")) {
        $('.li-height-auto').hide();
        $('#verification-box-5').show();
        $("#verification-box-5").load("iframe/PayPwd.html?v=" + Math.random()); //交易密码
    } else {
        $('#verification-box-5').hide();
    }
}




function UpdateTenderNeedPayPwd(IsTenderNeedPayPwd) {
    //删除其他弹出层
    //var list = art.dialog.list;
    //for (var i in list) {
    //    list[i].close();
    //};
    closeLoadingWindows();
    var strTable = '<table id="dialogtable">' +
        '<tr>' +
        '<td align="right"><span style="color:Red;">*</span>交易密码：' +
        '</td>' +
        '<td>' +
        '<input type="password" id="txtPay" name="txtPay" style="width:120px;" value="" class="text2"/>  <a href="javascript:index_ForgetPayPwd();">忘记交易密码</a>' +
        '</td>' +
        '</tr>' +
        '</table>';
    //dialog = art.dialog({
    //    width: 300,
    //    height: 80,
    //    title: "确认交易密码",
    //    content: strTable,
    //    lock: true,
    //    zIndex: 9999999,
    //    opacity: 0.4,
    //    okVal: "提交修改",
    //    ok: function () {
    //        submitIsTenderNeedPayPwd(IsTenderNeedPayPwd, jQuery.trim(jQuery("#txtPay").val()));
    //    },
    //    cancelVal: "取消修改",
    //    cancel: true
    //});
    showDialWindows("确认交易密码", strTable, "确认", function() {
        submitIsTenderNeedPayPwd(IsTenderNeedPayPwd, jQuery.trim(jQuery("#txtPay").val()));
    }, "取消修改", closeLoadingWindows);
    //enter提交
    $("#dialogtable input").keypress(function(e) {
        if (e.keyCode == "13") {
            submitIsTenderNeedPayPwd(IsTenderNeedPayPwd, jQuery.trim(jQuery("#txtPay").val()));
        }
    });
}

function submitIsTenderNeedPayPwd(IsTenderNeedPayPwd, payPwd) {
    if (payPwd == "") {
        //art.dialog({
        //    time: 5,
        //    zIndex: 9999999,
        //    content: '请填写交易密码。'
        //});
        showDialWindows("团贷网提醒您", "请填写交易密码", "确认", closeLoadingWindows);
        return;
    }
   /*  jQuery.ajax({
        url: "/member/ajaxCross/Ajax_UserSecurity.ashx",
        type: "post",
        dataType: "json",
        data: {
            Cmd: "EditIsTenderNeedPayPwd",
            IsTenderNeedPayPwd: IsTenderNeedPayPwd,
            payPwd: payPwd
        },
        success: function(data) {
            //删除其他弹出层
            //var list = art.dialog.list;
            //for (var i in list) {
            //    list[i].close();
            //};
            closeLoadingWindows();
            switch (parseInt(data.result)) {
                case -100:
                    {
                        window.location.href = "/View/NoticeMessage?status=2";
                        break;
                    }
                case -99:
                    {
                        window.location.href = "/u/login?ReturnUrl=" + window.location.href;
                        break;
                    }
                case 1:
                    {
                        if (IsTenderNeedPayPwd) {
                            $('#IsTenderNeedPayPassword').removeClass('enter-password-n');
                            $('#IsTenderNeedPayPassword').addClass('enter-password-y');
                        } else {
                            $('#IsTenderNeedPayPassword').removeClass('enter-password-y');
                            $('#IsTenderNeedPayPassword').addClass('enter-password-n');
                        }
                        break;
                    }
                default:
                    {
                        //art.dialog({
                        //    time: 5,
                        //    zIndex: 9999999,
                        //    content: data.msg
                        //});
                        showDialWindows("团贷网提醒您", data.msg, "确认", closeLoadingWindows);
                        break;
                    }
            }
        },
        error: function(XMLRequest, textStatus, errorThrown) {
            //删除其他弹出层
            //var list = art.dialog.list;
            //for (var i in list) {
            //    list[i].close();
            //};
            //art.dialog({
            //    width: 300,
            //    zIndex: 9999999,
            //    time: 5,
            //    content: '系统繁忙，请稍后再试。'
            //});
            closeLoadingWindows();
            showDialWindows("团贷网提醒您", "系统繁忙，请稍后再试。", "确认", closeLoadingWindows);
        }
    }); */
}

function index_ForgetPayPwd() {
    //删除其他弹出层
    //var list = art.dialog.list;
    //for (var i in list) {
    //    list[i].close();
    //};
    closeLoadingWindows();
    Update_PayPwd();
}

// function ValidateBank() {
//     var IsValidateMobile = 'True';
//     var IsValidateIdentity = 'True';

//     if (IsValidateMobile != 'True' || IsValidateIdentity != 'True') {
//         userbank.tips(IsValidateMobile, IsValidateIdentity);
//     } else {
//         window.location.href = "/member/Bank/bankaccount.aspx";
//     }
// }

// function sendMobileValidateCode(current, other, tips, error, sendType, eventType) {

//     $(tips).show();
//     $(error).show();
//     $(current).hide();
//     $(other).hide();

//     $.ajax({
//         url: "/member/ajaxCross/Ajax_UserSecurity.ashx",
//         type: "post",
//         dataType: "json",
//         data: {
//             Cmd: "SendMobileValidateCode",
//             sendType: sendType,
//             eventType: eventType
//         },
//         success: function(json) {
//             var statusCode = json.result;

//             if (statusCode == -100) {
//                 window.location.href = "/View/NoticeMessage.aspx?status=2";
//             }
//             if (statusCode == -99) {
//                 window.location.href = "/View/login.aspx?ReturnUrl=" + window.location.href;
//             }

//             if (statusCode == -180) {
//                 var seconds = json.msg.split("_")[1];
//                 TimeLabel(current, other, tips, seconds, "校验码发送失败，", error);
//                 $(error).text("发送验证码间隔需180秒");
//                 return;
//             }

//             if (statusCode == -190) {
//                 $(current).hide();
//                 $(other).hide();
//                 $(tips).text(json.msg);
//                 $(tips).show();
//                 $(error).text("验证码一天最多发送5次！");
//                 return;
//             }

//             TimeLabel(current, other, tips, 180, json.msg + "，", error);
//         }
//     });
// }

var hander;

function StopTime() {
    clearInterval(hander);
}

function TimeLabel(current, other, tips, time, msg, error) {
    $(error).show();
    var btn = $(tips);
    btn.fadeIn(1000);
    btn.text(time <= 0 ? "" : (msg + "请"+(time) + "s后再获取"));
    hander = setInterval(function() {
        if (time <= 0) {
            clearInterval(hander);
            $(current).show();
            $(other).show();
            $(error).html('');
            btn.hide();
            btn.text("正在发送");
        } else {
            btn.text(msg + "请"+(time--) + "s后再获取");
        }
    }, 1000);
};

function Refresh() {
    window.location.href = window.location.href;
}

function RefreshLater() {
    setTimeout("Refresh()", 2500);
}

function RefreshIndex() {
    window.location.href = "/member/validate/index";
}

function RefreshIndexLater() {
    setTimeout("RefreshIndex()", 2500);
}

//弹出
function showpop() {
    $(".popbox").show();
    $(".mask").show();
}
//关闭
function closepop() {
    $(".popbox").hide();
    $(".mask").hide();
}
//修改银行卡示例
$(function() {
    $('.modify_describe').find('.orange').hover(function() {
        $(this).parents('.modify_describe').find('.exp').toggle();
    });
    $('.modify_qq').click(function() {
        window.open("://wpa.qq.com/msgrd?v=3&uin=2880761023&site=qq&menu=yes", "_blank");
    });
    $(".question").click(function() {
        location.href = location.href;
    });


    //获取银行卡信息
    /*var bankno = '6228480608215373077';

    $.ajax({
        type: 'GET',
        url: '/member/ajaxCross/ajax_CGT.ashx',
        data: {
            cmd: "GetBankInfo",
            CardNo: bankno
        },
        dataType: 'json',
        success: function(data) {
            var obj = data;
            if (obj != null && obj != undefined) {
                $("#dv_bankinfo").html(obj.bank_name + " 尾号" + bankno.substring(bankno.length - 4, bankno.length));
            }
        }
    });*/

});

function ChangePWD() {

    //SetWenXinRemind("jiaoyimima");
    //$('#bankBindAlert').show();
    //$('#diallayer').show();

   /*  $.ajax({
        url: "/member/security/resetPassword",
        type: "post",
        dataType: "json",
        async: false,
        data: {
            Cmd: "ModifyCGTPwd"
        },
        success: function(json) {
            var obj = json;
            if (obj) {
                if (obj.code == "0") {
                    OpenURL.blank("/view/redirect?url="+encodeURIComponent(obj.data));
                    // window.open("/view/redirect.aspx?url="+encodeURIComponent(obj.data));
                    //$('#UpdatePayPwd_Cgt').attr("href", url);
                }else if(obj.code == 444){
                    return showStopServiceWin(obj);
                } else {
                    alert("程序异常！");
                }
            }
        },
        error: function(err) {
            var i = 0;
        }
    }); */
}

function ModifyPhone(mobile) {
    SetWenXinRemind("phone");
    $('#bankBindAlert').show();
    $('#diallayer').show();
 /*    $.ajax({
        url: "/member/security/modifyPhone",
        type: "post",
        dataType: "json",
        async: false,
        data: {
            mobile: mobile
        },
        success: function(json) {
            var obj = json;
            if (obj.code == "0") {
                OpenURL.blank("/view/redirect?url="+encodeURIComponent(obj.data));
                // window.open("/view/redirect.aspx?url="+encodeURIComponent(obj.data));
                //$('#UpdateBankTelNo_Cgt').attr("href", url);
            } else {
                alert("程序异常！");
            }
        },
        error: function(err) {
            var i = 0;
        }
    }); */

}
/*一账通修改预留手机*/
function ModifyPhone1(mobile) {
    SetWenXinRemind("phone");
  /*   $.ajax({
        url: "/member/security/modifyPhone",
        type: "post",
        dataType: "json",
        async: false,
        data: {
            mobile: mobile
        },
        success: function(json) {
            var obj = json;
            if (obj) {
                if (obj.code == "0") {
                    $('#bankBindAlert').show();
                    $('#diallayer').show();
                    window.open(obj.data);
                    // OpenURL.blank(obj.data);
                }else if(obj.code == 444){
                    return showStopServiceWin(obj);
                }else {
                    alert("程序异常！");
                }
            }
        },
        error: function(err) {
            var i = 0;
        }
    }); */

}
