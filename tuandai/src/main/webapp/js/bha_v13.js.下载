//表单校验
var BHAFrom = {
    form: null,
    data: {cache:{}},//用来存放临时数据,各种状态
    config: {
        btnSubmit: "#nextButton",
        tiptype: 3,
        beforeCheck: function (curform) {
            BHAFrom.before(curform)
            $("#form").find('.inpPrompt').remove();
            $("#form").find('span.inpTips').remove();
            $("#form").find('.inpPrompt1').remove();
        },
        beforeSubmit: function (form) { // 校验表单前的动作
        	loading();
                 
        },
    },
     before: function (form) { // 校验表单前的动作
    },
    ready: function (form) { // 初始化表单后的动作
    },
    init: function () {
        BHAFrom.form = $("#form").Validform(BHAFrom.config);
        BHAFrom.ready(BHAFrom.form);
    }
};
function loading(){
	
	 $("#nextButton").css("background","#CCCCCC");
     $("#nextButton").attr("disabled",true);  
     $("#nextButton").css("border",'none');
     $("#nextButton").css("color",'#fff');
	
	
}
var timer = {
    btn: '',
    v: null,
    c: 60,
    enable: true,
    init: function (btn) {  //验证码计时初始化
        timer.btn = btn;
        return this;
    },
    start: function () {    //验证码计时开始
        if (timer.enable) {
            timer.enable = false;
            timer.v = setInterval(function () {
                timer.c--;
                 if (timer.c < 0) {
                    timer.reset();
                    return;
                }
                $(timer.btn).removeClass("codeBtn").addClass('codeAgainBtn');
                $(timer.btn).val('重新发送 ' + timer.c + 's');
            }, 1000);
        }
    },
    reset: function () {    //验证码计时重置
        timer.c = 60;
        $(timer.btn).val('点击获取');
        $(timer.btn).removeClass("codeAgainBtn").addClass('codeBtn');
        clearInterval(timer.v);
        timer.enable = true;
    }
};
/**
 * 发送短信验证码
 * @param btn   绑定的按钮
 * @param smsChannel  发送短信通道
 * @param authBizType   业务类型 注册|绑卡
 * @param isFirstTime   是否第一次进入页面 yes 是的
 */
var sms = {
    url: '${pageContext.request.contextPath}/ajaxsmsCode',
    data: {},
    config: {
        smsChannel: '',
        authBizType: '',
        isFirstTime: '',
        phone: ''
    },
    init: function (btn, config) {    //短信模块初始化
        sms.data.requestKey = config.requestKey;
        if (config && config.smsChannel) {
            timer.init(btn).start();
            // 若四要素 ,发起申请接口已发短信 这里只给提示
            if (config.smsChannel == 'AUTH_CHANNEL') {
                sms.url = '${pageContext.request.contextPath}/ajaxsmsCode';
                sms.data.authId = config.authId;
                
                if (config.isFirstTime || config.isFirstTime == 'yes') {
                    // 第一次进入页面上isFirstTime=yes ,不重发短信
                	resizeContainer();
                    if ($('.phone').length > 0) {
                        alert('验证码已发送到' + $('.phone').text() + '手机，请您查收。');
                    } else if (config.phone) {
                        window.alert('验证码已发送到' + config.phone + '手机，请您查收。');
                    }
                }
            } else {
                if (config.isFirstTime || config.isFirstTime == 'yes') {
                	
                    timer.init(btn).start();
                    sendSmsCode(sms.url, sms.data);
                }
            }
        }
        $(btn).click(function () {
            if (!timer.enable) {
                return;
            }
            timer.init(btn).start();
            sendSmsCode(sms.url, sms.data);
        });

    }
};
/**
 * 对填写的手机号发送短信验证码
 * @param btn   绑定的按钮
 * @param smsChannel  发送短信通道
 * @param authBizType   业务类型 注册|绑卡
 * @param isFirstTime   是否第一次进入页面 yes 是的
 */
var smsForNewPhone = {
    url: '../../sms/smsForEnterprise',
    data: {},
    config: {
        phoneDom: '',
        smsCount:'',
    },
    init: function (btn, config) {    //短信模块初始化
    	 
        smsForNewPhone.data.requestKey = config.requestKey;
        if (config.smsCount!='' && config.smsCount > 0) {
        	timer.init(btn).start();
        }
        $(btn).click(function () {
            if (!timer.enable) {
                return;
            }
            if(timer.c<=0){
            	timer.reset();
            }
            timer.init(btn).start();
            smsForNewPhone.data.mobile = $(config.phoneDom).val();
            sendSmsCode(smsForNewPhone.url, smsForNewPhone.data);
        });

    }
};

function sendSmsCode(url, _data) {
    $.ajax({
        type: "POST",
        url: url,
        dataType: "json",
        data: _data,
        success: function (returnedData) {
            if (returnedData.status == "FAILED") {
                alert(returnedData.message);
                timer.reset();
                return;
            } else {
                alert(returnedData.message);
                return;
            }
        },
        error: function (returnedData) {
           // alert("抱歉，验证码发送失败，请重试。");
            timer.reset();
            return;
        }
    });
}
function initBankInfo(platformId, serviceType) {
    $.ajax({
        type: "POST",
        url: '../../bankcard/bankInfo',
        dataType: "json",
        data: {platformId: platformId, serviceType: serviceType, requestKey: $('#requestKey').val()},
        success: function (result) {
            var contextPath = $('#contextPath').val();
            if (result.success) {
                var bankInfo = result.bankInfo;
                var bankInfoHtml = '';
                for (var i = 0; i < bankInfo.length; i++) {
                    var supportPay = '<span class="red">仅支持网银充值</span>';
                    if (bankInfo[i].swiftPay) {
                        supportPay = '支持快捷充值、网银充值';
                    }
                    bankInfoHtml += '<li><span class="bankLogo"><img src="' + contextPath + '/resource/images/bank-sm/' + bankInfo[i].bankCode + '.png"> ' + bankInfo[i].bankName + '</span>' + supportPay + '</li>';
                }
                $('.bankList ul').html(bankInfoHtml);
            } else {
                $('.bankList ul').html(result.message);
            }
        },
        error: function (result) {
            $('.bankList ul').html('获取支持银行列表信息失败');
        }
    });
}


//$(function () {
    //placeholder兼容问题
    //中间container部分自适应屏幕
//    function resizeContainer() {
//        var height_container = $(window).height() - 80 - 80 - 35;//分别是header高度，footer高度，container的padding-bottom
//        var height_div = height_container - 152;
//        $(".container").css('min-height', height_container);
//        $(".container>.div-m").css('min-height', height_div);
//    }

//    resizeContainer();
//    $(window).resize(function () {
//        resizeContainer();
//    });
//});

//中间container部分自适应屏幕
function resizeContainer() {
//    $('input, textarea').placeholder();
    var height_container = $(window).height() - 80 - 80 - 35;//分别是header高度，footer高度，container的padding-bottom
    var height_div = height_container - 152;    //除div-m外的高度
    $(".container").css('min-height', height_container);
    $(".container>.div-m").css('min-height', height_div);
}
function xy() {
    var x = ($(window).width() - $("#alertLayer").width()) / 2;
    var y = ($(window).height() - $("#alertLayer").height()) / 2;
    $("#mask").height($(window).height());
    $("#alertLayer").animate({"left": x, "top": y}, 0);
    x = ($(window).width() - $("#alertLayer-2").width()) / 2;
    y = ($(window).height() - $("#alertLayer-2").height()) / 2;
    $("#alertLayer-2").animate({"left": x, "top": y}, 0);
}
var showDialogBottom = function () {
    $("#mask").css("height", $(document).height());
    $("#mask").css("width", $(document).width());
    $("#mask").show();
};
//覆写系统alert方法
window.alert = function (msg) {
    showDialogBottom();
    $("#alertLayer-2 .layerCon").html(msg);
    $("#alertLayer-2").show();
};

$(function () {
    BHAFrom.init();

    xy();
    $(window).resize(function () {
        xy();
    });
    //弹出层
    $(".btnClick").click(function () {
        showDialogBottom();
        $("#alertLayer").show();
    });
    $(".btnClick-2").click(function () {
        showDialogBottom();
        $("#alertLayer-2").show();
    });
    $(".btnClick-3").click(function () {
        showDialogBottom();
        $(".alertLayer").show();
    });
    $(".btnClosed,.agree").click(function () {
        $("#alertLayer,.alertLayer").hide();
        $("#mask").hide();
    });
    $(".submitBtn-2").click(function () {
        $("#alertLayer-2,.alertLayer").hide();
        $("#mask").hide();
    });
    $('input, textarea').blur(function () {
        $(this).nextAll('.inpPrompt').remove();
        $(this).nextAll('span.inpTips').remove();
    });
    resizeContainer();
    $(window).resize(function () {
        resizeContainer();
    });

});

var areaopt_ajaxData = function(obj) {
    var region = obj.val();
    var bankCode = $("#bankCode").val();
    $.ajax({
        url: "../../bankInfo/getBankBranchList",
        async:false,
        type:"POST",
        data:{'region':region,'bankCode':bankCode,requestKey: $('#requestKey').val()},
        dataType:"json",
        success: function(data){
            if(data!=null&&data!='null'){
                BHAFrom.data.branchInfo = data;
                var branchInfoHtml = '';
                for (var i = 0; i < BHAFrom.data.branchInfo.length; i++) {
                    branchInfoHtml += '<li id="'+BHAFrom.data.branchInfo[i].cnaps+'" class="branch" >' + BHAFrom.data.branchInfo[i].bankName + '</li>';
                }
                $('.selectUl ul').html(branchInfoHtml);
                BHAFrom.form.unignore($('input[name="branchName"]'));
                BHAFrom.form.unignore($('input[name="branchNo"]'));
                $('.selectUl ul .branch').click(function () {
                    $("#branchName").val($(this).text());
                    $("#branchNo").val($(this).attr("id"));
                    $(".selectUl").hide();
                    $(".selectDiv i").removeClass("arrow-up");
                    BHAFrom.form.check(false, $('input[name="branchName"]'));
                })

                $('input[name="branchName"]').bind('input propertychange', function () {
                    var value = $(this).val();
                    if(value != '')  $('.branch').hide();
                    for (var i = 0; i < BHAFrom.data.branchInfo.length ; i++) {
                        if(BHAFrom.data.branchInfo[i].bankName.indexOf(value) > -1){
                            $('#'+BHAFrom.data.branchInfo[i].cnaps).show();
                        }
                    }
                });
            }
        }
    });
}

