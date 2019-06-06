$(function() {
    $('#txtPhone').click(function() { ClickBox("#txtPhone"); });
    $('#txtPhoneCode').click(function() { ClickBox("#txtPhoneCode") });
    $('#txtPhone').blur(function() { BlurPhone(2); });
    $('#txtPhoneCode').blur(function() { BlurPhoneCode(2); });
    $("#btnSendMobileCode").click(function() { sendMobileValidSMSCode(); });
    $('#btn_mobile_ok').click(function() { MoblieOk(); });
});




function MoblieOk()
{
	 var url2 = location.protocol + "\\\\" + location.hostname + ":" + (location.port == "" ? 80 : location.port) +"\\tuandaiw"
    BlurPhone(2);
    var mobile = $.trim($("#txtPhone").val());
    var code = $.trim($("#txtPhoneCode").val());
    alert("dfsdfsdfsdfs")
    $.ajax({
    	url:url2+"\\checkResetMobileCode",
		type:"post",
		data:{"mobile":mobile,"code":code},
		dataType:"text",
        success: function (result) {
        	if(result=="false"){
                ChangeClass("#txtPhoneCode", "red-border-input");
                $("#dvCode").html(GetP("reg_wrong", "手机验证码错误或过期")).show();
            }else{
            	window.location.href=url2+"\\changepwd?phone="+mobile+"";
            }
        },
        err:function(){
        	alert("gg")
        }
    });
}

function sendMobileValidSMSCode()
{
    $("#dvCode").html("");     //验证码发送失败后再次发送先隐藏提示框
    $("#btnSendMobileCode").unbind("click");
    var mobile = $.trim($("#txtPhone").val());
    if (mobile == "") {
        ChangeClass("#txtPhone", "red-border-input");
        $("#dvPhone").html(GetP("reg_wrong", "请输入手机号码"));
        $("#btnSendMobileCode").click(function () { sendMobileValidSMSCode(); });
        return;
    }
    else if (!patTel.test(mobile)) {
        ChangeClass("#txtPhone", "red-border-input");
        $("#dvPhone").html(GetP("reg_wrong", "手机号格式错误"));
        $("#btnSendMobileCode").click(function () { sendMobileValidSMSCode(); });
        return;
    }



    $("#dvPhone").html("");
    $("#btnSendMobileCode").html("短信发送中...");
    var url = location.protocol + "\\\\" + location.hostname + ":" + (location.port == "" ? 80 : location.port) +"\\tuandaiw"
    $.ajax({
    	url:url+"\\restSendsms",
		type:"post",
		data:{"phone":mobile},
		dataType:"text",
        success: function (result) {
        	if(result=="true"){
				leftsecond = 60;
				clearInterval(timer);
				timer = setInterval(setLeftTime, 1000, "1");
				$("#dvCode").html("");
        	}else{
        		$("#btnSendMobileCode").html("获取短信验证码");
        		$("#dvCode").html(GetP("reg_wrong", "您的手机号没有注册"));
        		$("#btnSendMobileCode").click(function () { sendMobileValidSMSCode(); });
        	}
        }
    });
}



var timer = null;
//倒计时
var leftsecond = 60;
function setLeftTime() {
	var second = Math.floor(leftsecond);
    $("#btnSendMobileCode").html("重新获取(" + second + ")");
    leftsecond--;
    if (leftsecond < 1) {
        $("#btnSendMobileCode").html("短信验证码");
        clearInterval(timer);
        $("#btnSendMobileCode").click(function () { sendMobileValidSMSCode(); });
        return;
    }
}

function ClickBox(id1) {
    if ($(id1).hasClass("red-border-input")) {
        $(id1).removeClass("red-border-input");
    }
    if (!$(id1).hasClass("green-border-input")) {
        $(id1).addClass("green-border-input");
    }
}

function ChangeClass(id, classname) {
    if (classname == "") {
        if ($(id).hasClass("red-border-input")) {
            $(id).removeClass("red-border-input");
        }
        if ($(id).hasClass("green-border-input")) {
            $(id).removeClass("green-border-input");
        }
    } else if (classname == "red-border-input") {
        if (!$(id).hasClass("red-border-input")) {
            $(id).addClass("red-border-input");
        }
        if ($(id).hasClass("green-border-input")) {
            $(id).removeClass("green-border-input");
        }
    } else {
        if (!$(id).hasClass("green-border-input")) {
            $(id).addClass("green-border-input");
        }
        if ($(id).hasClass("red-border-input")) {
            $(id).removeClass("red-border-input");
        }
    }
}

// var patTel = new RegExp("^(13|14|15|17|18|19)[0-9]{9}$", "i");
var patTel = RegExp("^1[0-9]{10}$", "i");

function BlurPhone(type) {
    var txt = "#txtPhone";
    var td = "#dvPhone";
    var str = $.trim($(txt).val());
    if (type == 1 && str == "") {
        ChangeClass(txt, "");
        $(td).html("");
        return;
    }
    $(td).css("line-height", "40px");
    if (str == "") {
        ChangeClass(txt, "red-border-input");
        $(td).html(GetP("reg_wrong", "请输入手机号码"));
        return;
    }

    if (patTel.test(str)) {
        ChangeClass(txt, "");
        $(td).html("");
    }
    else {
        ChangeClass(txt, "red-border-input");
        $(td).html(GetP("reg_wrong", "手机号格式错误"));
        return;
    }
}


function BlurPhoneCode(type) {
    var pat = new RegExp("^[0-9]{6}$", "i");
    var str = $.trim($("#txtPhoneCode").val());
    if (type == 1 && str == "") {
        ChangeClass("#txtPhoneCode", "");
        $("#dvCode").html("");
        return;
    }
    if (str == "") {
        ChangeClass("#txtPhoneCode", "red-border-input");
        $("#dvCode").html(GetP("reg_wrong", "请输入手机验证码"));
        return;
    }
    if (!pat.test(str)) {   //格式不正确
        $("#dvCode").html(GetP("reg_wrong", "手机验证码错误"));
        ChangeClass("#txtPhoneCode", "red-border-input");
        return;
    } else {
        $("#dvCode").html("");
        ChangeClass("#txtPhoneCode", "");
    }
}

function GetP(clsName, c) { return "<div class='" + clsName + "' style='width:200px !important;'>" + c + "</div>"; }

function getbyid(id) {
    return document.getElementById(id);
}
