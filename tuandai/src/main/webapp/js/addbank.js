var reg_code = new RegExp("^[0-9]{6}$");
var reg_cardno = new RegExp("^[0-9]{9,50}$");

var txt_code = "#txt_smsCodebank";
var dv_code = "#dvtxt_allMsg";

var txt_cardno = "#txt_account";
var dv_cardno = "#dvtxt_account";

var dv_submit = "div.reg-message1 div";

var card_type = "0";
var bank_code = "0";
var card_bound = "false";

function Submit() {
    $(dv_cardno).html("");
    $(dv_code).html("");

    var IsCardNo = true;
    var IsCode = true;
    IsCardNo = IsLegalCardNo(0);
    IsCode = CheckCode(0);

    if ($(dv_code).children("div").hasClass("info-mes")) {
        $(dv_code).children("div").removeClass("info-mes").addClass("reg_wrong");
    }

    if (IsCardNo == false || IsCode == false)
        return false;

    $.ajax({
        url: "/member/ajaxCross/ajax_money.ashx",
        type: "post",
        dataType: "json",
        data: {
            Cmd: "addsimplebankaccount",
            account: $("#txt_account").val(),
            bankType: bank_code, code: $("#txt_smsCodebank").val()
        },
        success: function (json) {
            var d = json.result;
            var msg = json.msg;      

            if (parseInt(d) == 1) {
                closeBankWindow();
                var $afterBindBank = $("#afterBindBank");
                if ($afterBindBank.length != 0) {
                    RegisterBindBankSubccess();
                }
                else {
                    //globalDialog("团贷网提醒您", "您好，银行卡添加成功", location.href, "1");
                    userbank.success(function() { location.reload(); });
                }
            }
            else if (parseInt(d) == -1) {
                $(dv_submit).addClass('font-red').html("添加失败：用户不存在");
                return false;
            } else if (parseInt(d) == -2) {
                ChangeClass(txt_code, "red-border-input");
                $(dv_code).html(GetP("reg_wrong", "验证码已过期或错误"));
                return false;
            } else if (parseInt(d) == -3) {
                $(dv_cardno).html(GetP("reg_wrong", "卡号已绑定另一用户"));
                ChangeClass(txt_cardno, "red-border-input");
                $(dv_cardno).children("div.reg_wrong").css("line-height", "35px");
                return false;
            }
            else if (parseInt(d) == -4) {
                $(dv_submit).addClass('font-red').html("添加失败：每个用户最多添加1张银行卡");
                return false;
            }
            else if (parseInt(d) == -5) {
                $(dv_cardno).html(GetP("reg_wrong", "无法识别卡号，请输入正确的银行卡卡号"));
                ChangeClass(txt_cardno, "red-border-input");
                $(dv_cardno).children("div").css("line-height", "16px");
                return false;
            }
            else if (parseInt(d) == -9 || parseInt(d) == -10) {
                $(dv_submit).addClass('font-red').html("添加失败：" + msg);
                return false;
            }
            else if (parseInt(d) == -6) {
                $(dv_submit).addClass('font-red').html("添加失败：" + msg);
                return false;
            }
        }
    });
}

function BlurCardNo() {
    ChangeClass(txt_cardno, "");
    $(txt_cardno).next("i").html("");
    $(dv_cardno).html("");

    var card_no = $(txt_cardno).val().trim();

    if (CheckCardNo(1)) {
        $(dv_cardno).html(GetP("info-mes", "正在检测卡号……"));
        $(dv_cardno).children("div").css("line-height", "35px");
        $.ajax({
            url: "/member/ajaxCross/ajax_userbank.ashx",
            type: "post",
            dataType: "json",
            async: false,   //同步
            data: { Cmd: "GetBankBin", CardNo: card_no },
            success: function (json) {
                $(dv_cardno).html("");
                $("#div_banktel").css("display", "none");
                $("#div_bankhang").css("margin-bottom", "14px");
                var result = json.status;
                if (result == "1") {
                    if (json.model.card_type == "3") {
                        $(dv_cardno).html(GetP("reg_wrong", "暂不支持信用卡，请重新输入"));
                        ChangeClass(txt_cardno, "red-border-input");
                        $(dv_cardno).children("div.reg_wrong").css("line-height", "16px");
                    }
                    card_type = json.model.card_type;
                    bank_code = json.model.bank_code;
                    card_bound = json.model.card_bound;

                    if (json.model.bank_tel != "") {
                        $("#div_banktel").css("display", "");
                        //tBankName=data.bank_name;
                        $("#bankTelNo").text(json.model.bank_tel);
                        $("#div_bankhang").css("margin-bottom", "0px");
                    }
                    else {
                        $("#div_banktel").css("display", "none");
                        $("#div_bankhang").css("margin-bottom", "14px");
                    }


                    if (json.model.card_bound == "true") {
                        $(dv_cardno).html(GetP("reg_wrong", "卡号已绑定另一用户"));
                        ChangeClass(txt_cardno, "red-border-input");
                        $(dv_cardno).children("div.reg_wrong").css("line-height", "35px");
                    }

                  // 已注释 var $img = "<img src=\"//js3.tuandai.com/images/member/Bank/banklogo/banklogo_mini_" + json.model.bank_code + ".gif\">"
                    $("#txt_account").next("i").html($img);
                }
                else {
                    card_type = "0";
                    bank_code = "0";
                    card_bound = "false";
                    $("#txt_account").next("i").html("");
                    $(dv_cardno).html(GetP("reg_wrong", "无法识别卡号，请输入正确的银行卡卡号"));
                    ChangeClass(txt_cardno, "red-border-input");
                    $(dv_cardno).children("div.reg_wrong").css("line-height", "16px");
                }
            }
        });
    }
}

function BlurCode() {
    $(dv_code).html("");
    ChangeClass(txt_code, "");
    CheckCode(1);
}

//卡号格式验证
function CheckCardNo(type) {
    var card_no = $(txt_cardno).val().trim();
    if (type == 1 && card_no == "") {
        $(dv_cardno).html("");
        ChangeClass(txt_cardno, "");
        return false;
    }
    if (!card_no) {        
        $(dv_cardno).html(GetP("reg_wrong", "请输入银行卡号"));
        ChangeClass(txt_cardno, "red-border-input");
        $(dv_cardno).children("div").css("line-height", "35px");
        return false;
    }

    if (reg_cardno.test(card_no)) {
        return true;
    } else {       
        //$(dv_cardno).html(GetP("reg_wrong", "银行卡卡号格式错误，必须由9个以上的数字组成"));
        $(dv_cardno).html(GetP("reg_wrong", "无法识别卡号，请输入正确的银行卡卡号"));
        ChangeClass(txt_cardno, "red-border-input");
        $(dv_cardno).children("div").css("line-height", "16px");
        return false;
    }
}

function CheckCode(type) {
    var code = $(txt_code).val().trim();
    if (type == 1 && code == "") {
        ChangeClass(txt_code, "");
        $(dv_code).html("");
        return false;
    }
    if (!code) {
        ChangeClass(txt_code, "red-border-input");
        $(dv_code).html(GetP("reg_wrong", "请输入验证码"));
        return false;
    }

    if (reg_code.test(code)) {
        return true;
    } else {
        ChangeClass(txt_code, "red-border-input");
        $(dv_code).html(GetP("reg_wrong", "手机验证码错误"));
        return false;
    }
}

//验证卡号是否可用
function IsLegalCardNo(type) {
    var IsCardNo = true;
    IsCardNo = CheckCardNo(type);

    if (IsCardNo) {
        if (card_type == "3") {
            $(dv_cardno).html(GetP("reg_wrong", "暂不支持信用卡，请重新输入"));
            ChangeClass(txt_cardno, "red-border-input");
            $(dv_cardno).children("div").css("line-height", "16px");
            return false;
        } else if (bank_code == "0") {
            $(dv_cardno).html(GetP("reg_wrong", "无法识别卡号，请输入正确的银行卡卡号"));
            ChangeClass(txt_cardno, "red-border-input");
            $(dv_cardno).children("div").css("line-height", "16px");
            return false;
        }
        if (card_bound == "true") {
            $(dv_cardno).html(GetP("reg_wrong", "卡号已绑定另一用户"));
            ChangeClass(txt_cardno, "red-border-input");
            $(dv_cardno).children("div.reg_wrong").css("line-height", "35px");
            return false;
        }
        return true;
    }
    else {
        return false;
    }
   
}

function SendCode() {
    $("#txt_smsCodebank").val("");
    $("#dvtxt_allMsg").html("");
    $(dv_submit).addClass('font-red').html("");
    ChangeClass("#txt_smsCodebank", "");
    if (IsLegalCardNo(0)) {
        userbank.send_smscode(0);
    }
}

function SendVoiceCode() {
    $("#txt_smsCodebank").val("");
    $("#dvtxt_allMsg").html("");
    $(dv_submit).addClass('font-red').html("");
    ChangeClass("#txt_smsCodebank", "");
    if (IsLegalCardNo(0)) {
        userbank.send_smscode(1);
    }
}

function ClickBox(id1) {
    if ($(id1).hasClass("red-border-input")) {
        $(id1).removeClass("red-border-input");
    }
    if (!$(id1).hasClass("yellow-border-input")) {
        $(id1).addClass("yellow-border-input");
    }
}

function ChangeClass(id, classname) {
    if (classname == "") {
        if ($(id).hasClass("red-border-input")) {
            $(id).removeClass("red-border-input");
        }
        if ($(id).hasClass("yellow-border-input")) {
            $(id).removeClass("yellow-border-input");
        }
    } else if (classname == "red-border-input") {
        if (!$(id).hasClass("red-border-input")) {
            $(id).addClass("red-border-input");
        }
        if ($(id).hasClass("yellow-border-input")) {
            $(id).removeClass("yellow-border-input");
        }
    } else {
        if (!$(id).hasClass("yellow-border-input")) {
            $(id).addClass("yellow-border-input");
        }
        if ($(id).hasClass("red-border-input")) {
            $(id).removeClass("red-border-input");
        }
    }
}

function GetP(clsName, c) { return "<div class='" + clsName + "'>" + c + "</div>"; }

function redirectToDefault() {
    window.location.href = "/member/account_default";
}

function closeBankWindow() {
    if ($("#bindBankWindows").length > 0) {
        $("#bindBankWindows").prev("#diallayer").remove();
        $("#bindBankWindows").remove();
    }
}

function RegisterBindBankSubccess() {
    $("#diallayer").show();
    $("#afterBindBank").show();
    $("#btnAddBank").html("已认证");
    var second = $("#secondBindBank").html();
    var interval = setInterval(function () {
        if (second == 0) {
            clearInterval(interval);
            //window.location.href = "Register_succeed.aspx";
            redirectToDefault();
        }
        else {
            second--;
            $("#secondBindBank").html(second);
        }

    }, 1000)
}

