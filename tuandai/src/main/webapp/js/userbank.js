var userbank = {
    //银行卡校验
    account_check: function() {
        $("#dvtxt_account").html('');
        $("#txt_account").removeClass("red-border-input").removeClass("yellow-border-input");
        var bankNo = $("#txt_account").val();
        if (bankNo == '') {
            $("#bank_iconbox").html('');
            return;
        }

        var nunreg = new RegExp("^[0-9]*$");
        if (!nunreg.test(bankNo) || bankNo.length < 16) {
            $("#txt_account").addClass("red-border-input");
            userbank.add_error('dvtxt_account', '请准确输入银行卡号');
            return;
        }

       /*  $.ajax({
            type: 'GET',
            url: '/member/ajaxCross/ajax_userbank.ashx',
            data: { cmd: "CompleteAccountCheck", CardNo: bankNo },
            dataType: 'json',
            success: function (data) {
                $("#div_banktel").css("display", "none");
                $("#div_bankhang").css("margin-bottom", "14px");
                $("#divBankType").hide();
                $('#divBankName').hide();
                if (data != null && $("#div_banktel").length > 0) {
                    if (data.bank_tel != "") {
                        $("#div_banktel").css("display", "");
                        //tBankName=data.bank_name;
                        $("#bankTelNo").text(data.bank_tel);
                        $("#div_bankhang").css("margin-bottom","0px");
                    }
                    else {
                        $("#div_banktel").css("display", "none");
                        $("#div_bankhang").css("margin-bottom", "14px");
                    }


                }
                if (data != null && data.bank_name != "")
                {
                    $("#txt_bankname").val(data.bank_name);
                }
                if (data == "-1") {
                    $("#txt_account").addClass("red-border-input");
                    userbank.add_error('dvtxt_account', '卡号已绑定另一用户');
                    return;
                }
                if (data && data.ret_code == "0000") {
                    if (data.card_type == "信用卡") {
                        $("#txt_account").addClass("red-border-input");
                        userbank.add_error('dvtxt_account', '暂不支持信用卡，请重新输入');
                        return;
                    }

                    $("#bank_iconbox").html('<img src="//js3.tuandai.com/images/member/Bank/banklogo/banklogo_mini_' + data.bank_type + '.gif"/>');
                } else {
                    //$("#bank_iconbox").html('');
                    //$("#txt_account").addClass("red-border-input");
                    $("#divBankType").show();
                    //userbank.add_error('dvtxt_account', '无法识别卡号，请输入正确的银行卡卡号');
                }
            }
        }); */
    },
    province_change: function() {
        var prov = $("input[name='sel_city1']").val().split(",");
        var provinceId = prov[0];
        var html = '<select id="sel_city2"><option selected="selected" value=0>市</option>';
        if (provinceId != 0) {
/*             $.ajax({
                type: 'GET',
                url:'/member/ajaxCross/ajax_userbank.ashx',
                data: { cmd: "GetCityByProvince", provinceId: provinceId },
                success: function(data) {
                    $.each(data, function(i, j) {
                        html += '<option value="' + j.CityID + '" ' + (i == 0 && prov[1] == "直辖市" ? "selected=\"selected\"" : "") + '>' + j.CityName + '</option>';
                    });
                    userbank.init_city(html + "</select>");
                },
                dataType: 'json'
            }); */
        } else {
            userbank.init_city(html + "</select>");
        }
    },
    init_city: function(html) {
        $("#sel_city2").replaceWith(html);
        $("#sel_city2").selectlist({
            zIndex: 5,
            width: 138,
            height: 34,
            onChange: function() {
                if ($("input[name='sel_city2']").val() != 0)
                    $("#dvtxtCity").html("");
            }
        });
        if ($("input[name='sel_city2']").val() != 0)
            $("#dvtxtCity").html("");
    },
    timer: null,
    timer_second: 120,
    timer_clear: function() {
        clearInterval(userbank.timer);
        $("#btnSendVoiceMsgBank").show();
        $("#btnSendMsgBank").show();
        $("#btnSendMsgBank").attr("onclick", userbank.send_onclick);
        $("#btnSendMsgBank").css("cursor", "pointer").css("width", "106px").html('获取短信验证码').removeClass('reset_get_code');
    },
    send_smscheck: function(vtype) {
        var m = {
            BankNo: $("#txt_account").val(),
            ProvinceID: $("input[name='sel_city1']").val().split(",")[0],
            CityID: $("input[name='sel_city2']").val(),
            BankProvince: $("#sel_city1 input.select-button").val(),
            BankCity: $("#sel_city2 input.select-button").val(),
            OpenBankName: $.trim($("#txtOpenBankName").val())
        }
        var cResult = userbank.check(m);
        if (cResult) {
            userbank.send_smscode(vtype);
        }
    },
    send_onclick: null,
    //发送验证码，vtype：0短信，1语音
    send_smscode: function(vtype) {
        $("#btnSendVoiceMsgBank").hide();
        //$("#btnSendMsgBank").hide();
        userbank.send_onclick = $("#btnSendMsgBank").attr("onclick");
        $("#btnSendMsgBank").attr("onclick", "");
        $("#btnSendMsgBank").css("cursor", "default");
        $("#btnSendMsgBank").css("text-decoration", "none");
        $('#btnSendMsgBank').removeClass('reset_get_code').css("width", "163px").html(vtype == 0 ? "发送中..." : "拨打中...");
        $("div.reg-message1 div").removeClass('font-red').html("");

       /*  $.ajax({
            url: "/member/ajaxCross/ajax_validate.ashx",
            type: "post",
            dataType: "json",
            data: { Cmd: "getUsersMSCodeEditBank", vtype: vtype },
            success: function(json) {
                var result = json.result;
                if (result == 1) {
                    $("#txt_smsCodebank").focus();
                    $("div.reg-message1 div").removeClass('font-red').html(vtype == 0 ? "验证码已发送，请查收您的短信" : "语音拨打中，请注意来电");
                } else {
                    $("div.reg-message1 div").addClass('font-red').html("发送验证码失败，请稍后再试");
                }

                userbank.timer_second = 120;
                userbank.timer = setInterval(function() {
                    if (userbank.timer_second < 1) {
                        userbank.timer_clear();
                        $("div.reg-message1 div").removeClass('font-red').html("获取不到短信验证码？试试语音验证吧！");
                        return;
                    } else {
                        $('#btnSendMsgBank').addClass('reset_get_code').html("<b>" + userbank.timer_second + "</b>S重新获取");
                    }
                    userbank.timer_second--;
                }, 1000);
            }
        }); */
    },
    check: function(m) {
        $("#dvtxtOpenBankName,#dvtxtCity,#dvtxtOpenBankName,#dvtxt_allMsg").html("");
        $("#txtOpenBankName,#txt_smsCodebank,#txt_account").removeClass("red-border-input").removeClass("yellow-border-input");
        var cResult = true;
        //银行卡号
        if (m.BankNo == "") {
            $("#txt_account").addClass("red-border-input");
            userbank.add_error('dvtxt_account', '请输入银行卡卡号');
            cResult = false;
        }
        var nunreg = new RegExp("^[0-9]*$");
        if (m.BankNo != "" && !IsComplete && (!nunreg.test(m.BankNo) || m.BankNo.length < 16)) {
            $("#txt_account").addClass("red-border-input");
            userbank.add_error('dvtxt_account', '无法识别卡号，请输入正确的银行卡卡号');
            cResult = false;
        }

        //开户行地区
        if (m.ProvinceID == 0 || m.CityID == 0) {
            userbank.add_error('dvtxtCity', '请选择开户行地区');
            cResult = false;
        }
        if (m.OpenBankName == "") {
            $("#txtOpenBankName").addClass("red-border-input");
            userbank.add_error('dvtxtOpenBankName', '请输入开户行网点');
            cResult = false;
        }
        var reg = /[\u4E00-\u9FA5]/;
        if (m.OpenBankName != "" && !reg.test(m.OpenBankName)) {
            $("#txtOpenBankName").addClass("red-border-input");
            userbank.add_error('dvtxtOpenBankName', '请准确填写开户行网点');
            cResult = false;
        }
        if ($.trim($("#dvtxt_account").text()).length > 0) {
            cResult = false;
        }
        return cResult;
    },
    complete_submit: function() {
        var isLogin = isCookieLogin();
        if (!isLogin) {
            art.dialog({
                width: 300,
                title: newTitle,
                content: '您好，请先登录后再进行操作。',
                okVal: '马上登录',
                zIndex: 9999999,
                ok: function() {
                    window.location.href ="/u/login?ReturnUrl=" + window.location.href;
                }
            });
            return;
        }
        var vtype = 0;
        try {
            vtype = ismodify;

        } catch (e) {

        }
        var m = {
            Cmd: "CompleteBankNo",
            BankNo: $("#txt_account").val(),
            ProvinceID: $("input[name='sel_city1']").val().split(",")[0],
            CityID: $("input[name='sel_city2']").val(),
            BankProvince: $("#sel_city1 input.select-button").val(),
            BankCity: $("#sel_city2 input.select-button").val(),
            OpenBankName: $.trim($("#txtOpenBankName").val()),
            Code: $.trim($("#txt_smsCodebank").val()),
            BankType: $("#selBankType").val(),
            BankName: $("#txtBankName").val(),
            IsComplete: IsComplete ? "1" : "0"
        }
        if (vtype == 1)
        {
            m = {
            Cmd: "CompleteBankNo",
            BankNo: $("#txt_account").val(),
            ProvinceID: $("input[name='sel_city1']").val().split(",")[0],
            CityID: $("input[name='sel_city2']").val(),
            BankProvince: $("#sel_city1 input.select-button").val(),
            BankCity: $("#sel_city2 input.select-button").val(),
            OpenBankName: $.trim($("#txtOpenBankName").val()),
            Code: $.trim($("#txt_smsCodebank").val()),
            IsComplete: IsComplete ? "1" : "0",
            opertype:"1"
        }
        }
        var cResult = userbank.check(m);

        if (m.Code == "") {
            $("#txt_smsCodebank").addClass("red-border-input");
            userbank.add_error('dvtxt_allMsg', '请输入验证码');
            cResult = false;
        }
        if (m.Code != "" && m.Code.length < 6) {
            $("#txt_smsCodebank").addClass("red-border-input");
            userbank.add_error('dvtxt_allMsg', '验证码错误');
            cResult = false;
        }

        if (!cResult)
            return;

        $("#keepcard_btn").attr("onclick", "");
/*         $.ajax({
            url: "/member/ajaxCross/ajax_userbank.ashx",
            type: "post",
            dataType: "json",
            data: m,
            success: function(json) {
                var result = json.result;

                $("#keepcard_btn").attr("onclick", "userbank.complete_submit()");
                if (result == 1) {
                    $("#bindBankWindows, #diallayer").remove();
                    userbank.success(function () {
                        if (ReturnUrl) {
                            location.href = ReturnUrl;
                        } else {
                            location.reload();
                        }
                    });
                } else {
                    userbank.timer_clear();
                    if (result == -1) {
                        $("div.reg-message1 div").addClass('font-red').html("用户不存在");
                    } else if (result == -2) {
                        var v = json.msg.split(",");
                        userbank.tips(v[0], v[1]);
                        userbank.validate(json.msg);
                    } else if (result == -3) {
                        $("#txt_account").addClass("red-border-input");
                        userbank.add_error('dvtxt_account', json.msg);
                    } else if (result == -4) {
                        $("#txtOpenBankName").addClass("red-border-input");
                        userbank.add_error('dvtxtOpenBankName', '请准确填写开户行网点');
                    } else if (result == -5) {
                        $("div.reg-message1 div").addClass('font-red').html("先绑定银行卡后才能完善信息");
                    } else if (result == -6) {
                        $("#txt_smsCodebank").addClass("red-border-input");
                        userbank.add_error('dvtxt_allMsg', '验证码已过期或错误');
                    } else if (result == -7) {
                        $("div.reg-message1 div").addClass('font-red').html(json.msg);
                    } else {
                        $("div.reg-message1 div").addClass('font-red').html("保存信息失败，请刷新后重试");
                    }
                }
            }
        }); */
    },
    add_error: function(id, msg) {
        $("#" + id).html("<div class='reg_wrong' " + (msg.length > 11 ? "style='line-height:16px'" : "") + ">" + msg + "</div>");
    },
    focus: function(t) {
        switch (t) {
        case 1:
            $("#txt_account").removeClass("red-border-input").addClass("yellow-border-input");
            $("#dvtxt_account").html("<div class='info-mes'>请输入银行卡号</div>");
            break;
        case 2:
            $("#txtOpenBankName").removeClass("red-border-input").addClass("yellow-border-input");
            $("#dvtxtOpenBankName").html("<div class='info-mes'>请准确填写开户行网点</div>");
            break;
        case 3:
            $("#txt_smsCodebank").removeClass("red-border-input").addClass("yellow-border-input");
            $("#dvtxt_allMsg").html("<div class='info-mes'>请输入验证码</div>");
            break;
        default:
            break;
        }
    },
    blur: function(t) {
        switch (t) {
        case 1:
            //$("#dvtxt_account").html("");
            break;
        case 2:
            $("#txtOpenBankName").removeClass("red-border-input").removeClass("yellow-border-input");
            $("#dvtxtOpenBankName").html("");
            break;
        case 3:
            $("#txt_smsCodebank").removeClass("red-border-input").removeClass("yellow-border-input");
            $("#dvtxt_allMsg").html("");
            break;
        default:
            break;
        }
    },
    tips_show: function(content, btnOkTxt, btnCancelTxt, param, _url) {
        param = param || "";
        _url = _url || "/member/Validate/index";
        if (param) _url += "?" + param;

        var closeBtn = "", cancelBtn = "";
        if (btnCancelTxt) {
            closeBtn = '<i class="close-x icon db abs" onclick="userbank.tips_close()"></i>';
            cancelBtn = '<span class="fl-l td-btn-1 td-btn-1-gar btnReg3  handCursor" onclick="userbank.tips_close();">' + btnCancelTxt + '</span>';
        }

        var center = btnOkTxt == "去安全设置" || btnOkTxt == "去昵称设置";
        var html = '<div id="bingSecuritySettingWindow" style="display: block;" class="dial-window dial-window-w3 z103">'
            + '<div class="title rel">团贷网提醒您' + closeBtn + '</div>'
            + '<div class="body" ' + (center ? "" : " style='padding-left:50px'") + '>'
            + '<div class="prompt-box" style="width: 358px;">'
            + '<p ' + (btnOkTxt == "去设置交易密码" ? ' class="pl60"' : "") + ' ' + (center ? " style='text-align:center'" : "") + '>'
            + content
            + '</p>'
            + '</div>'
            + '</div>'
            + '<div style="text-align: center;">'
            + '<div class="btn-group mt10" style="display: inline-block; *display: inline; *zoom: 1; margin: 5px auto 0">'
            + '<span id="btnOpenIdenttifyOrBank" class="fl-l td-btn-1 td-btn-1-or btnReg2 ' + (btnCancelTxt ? "mr10" : "") + ' handCursor" onclick="userbank.tips_open(\'' + _url + '\');">' + btnOkTxt + '</span>'
            + cancelBtn
            + '</div>'
            + '</div>'
            + '</div>';
        html += "<div id='diallayer' style='display: block;'></div>";
        if ($("#diallayer").length > 0)
            $("#diallayer").remove();
        if ($("#bingSecuritySettingWindow").length > 0)
            $("#bingSecuritySettingWindow").remove();
        //userbank.tips_ok = ok;
        //userbank.tips_cancel = cancel;
        $("body").append(html);
    },
    /**
     * @param {} 是否通过了手机验证 
     * @param {} 是否通过实名验证 
     * @param {} 是否设置了交易密码 
     * @param {} 提示，指示是提现还是充值，其他为空 
     * @param {} 点击确定后执行的补充方法 
     * @param {} 点击取消后执行的补充方法
     * @returns {} 
     */
    tips: function(isValidateMobile, isValidateIdentity, isSetPayPwd, tip,url) {
        isSetPayPwd = isSetPayPwd || "True";
        if (isValidateMobile == "True" && isValidateIdentity == "True" && isSetPayPwd == "True") return;

        var content;
        var aContent = [];
        if (isValidateMobile != 'True') {
            aContent.push('<span class="fc-orange">手机认证</span>');
        }
        if (isValidateIdentity != 'True') {
            aContent.push('<span class="fc-orange">实名认证</span>');
        }
        if (isSetPayPwd != 'True') {
            aContent.push('<span class="fc-orange">交易密码设置</span>');
        }
        if (aContent.length == 3) content = aContent[0] + "、" + aContent[1] + "<br>和" + aContent[2];
        else content = aContent.join("和");

        var btnOkTxt, btnCancelTxt, param;
        if (isValidateMobile != "True" || isValidateIdentity != "True") {
            btnOkTxt = "去认证";
            btnCancelTxt = "下次再认证";
            content = '您尚未绑定银行卡' + (tip ? ("，绑定后才能进行" + tip) : "") + '！<br /><b>绑定银行卡前，请先进行' + content + '！</b>'; //，绑定后才能进行快捷充值
            param = isValidateMobile != "True" ? "method=phone#s_phone" : "method=identity#s_identity";
        } else {
            btnOkTxt = "去设置交易密码";
            btnCancelTxt = "下次再设";
            content = '为了保证您的资金交易安全，<br/><b>提现前请先进行' + content + '！</b>';
            param = "method=paypwd#s_paypwd";
        }

        userbank.tips_show(content, btnOkTxt, btnCancelTxt, param, url);
    },
    //tips_ok: null,
    //tips_cancel: null,
    tips_open: function(url) {
        $("#bingSecuritySettingWindow,#diallayer").remove();
        if (url)
            window.location = url;
    },
    tips_close: function() {
        $("#bingSecuritySettingWindow,#diallayer").remove();
        //if ($.isFunction(userbank.tips_cancel))
        //    userbank.tips_cancel();
    },
    success: function (fun) {
        var html = '<div style="display: block;" id="bindBankSuccessWindow" class="dial-window dial-window-w6 z103">'
            + '<div class="body">'
            + '<div class="reg-rz-box" id="" style="text-align: center">'
            + '<div class="sm-icon-box fz-16 g6 lh30" style="display: inline-block; *display: inline; *zoom: 1; margin: 5px auto 0">'
            + '<span class="fl-l reg-icons reg-succeed-icon-mm mr15" style="background-position:-61px 0"></span>'
            + '<span class="db fl-l">操作成功</span>'
            + '</div>'
            + '</div>'
            + '</div>'
            + '</div>';
        html += '<div id="diallayer" style="display: block;"></div>';

        if ($("#diallayer").length > 0)
            $("#diallayer").remove();
        if ($("#bindBankSuccessWindow").length > 0)
            $("#bindBankSuccessWindow").remove();
        $("body").append(html);

        setTimeout(function() {
            fun();
        }, 1500);
    },
    bankTypeCheck: function () {
        var bankType=$('#sel_city3').val();
        alert(bankType)
        if (bankType == '9999')
        {
            $('#divBankName').show();
        }
    }
};