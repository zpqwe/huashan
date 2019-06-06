$(function(){
    /*
    if(formList!=undefined && formList.length>0){
        formList.forEach(function (element, index) {
            var frameId = "formFrame_"+index;
            $("<iframe/>",{id:frameId,frameborder:"0",scrolling:"no",sandbox:"allow-scripts",style:"width: 1px;height: 1px"}).appendTo('#myCode')
            $('<form />', {action : element, method:"post", style:"display:none;",target:frameId}).appendTo('#'+frameId).submit();
        })
    }
    */
    //如果是IE浏览器就执行提示语兼容代码
    iePlay();
    $('#loginBtnImage').hide();
    $('#afterLoginBtnImage').hide();


    $("input").click(function(){
        $(this).css({"border-color":"#d5d5d5"});
        $(this).parent().find(".input-tip").css({"visibility":"hidden"});
    });

    $('#username').focus(function () {
        $('#password').css({"border-color":"#d5d5d5"});
        $('.login-box .input-tip').css({"visibility":"hidden"});
    });

    $(".login-box").keypress(function (e) {
        if (e.keyCode == "13") {
            document.getElementById('loginBtn').click();
        }
    });

    var cookieValue = jaaulde.utils.cookies.get("TDUserName");

    if ( cookieValue != null && cookieValue !='' ) {
        $("#username").val(cookieValue);
        $("#isRemember").attr("checked", true);
    }

    var Login = function(){
        this.color = {
            red: '#FF0000',
            green: '#48D6A2',
            notEnpty:"#d5d5d5"
        };
        this.status = null;
    };

    Login.prototype.checkForm = function(){
        var username = document.getElementById('username'),
            password = document.getElementById('password');
        verification = document.getElementById('verification');
        if(username.value == ''){
            this.showMsg('username', '<i></i>请输入用户名', 'error');
            return false;
        }
        /*           if(username.value != ""){
         this.showMsg('username', '', 'notEnpty');
         return false;
         } */
        if(password.value == ''){
            $('.input-tip2').show();
            this.showMsg('password', '<i></i>请输入密码', 'error');
            return false;
        }
        if(password.value.indexOf(' ')>-1){
            $('.input-tip2').show();
            this.showMsg('password', '<i></i>密码不能包含空格', 'error');
            return false;
        }
        if(verification.value == ''){
            $('.input-tip3').show();
            this.showMsg('verification', '<i></i>请输入验证码', 'error');
            return false;
        }
        return true;
    };

    Login.prototype.showMsg = function(ele, text, status){
        var obj = document.getElementById(ele),
            tipObj = document.getElementById(ele).nextSibling.nextSibling;

        tipObj.innerHTML = text;

        switch(status){
            case 'error':
                obj.style.borderColor = this.color.red;
                break;
            case 'right':
                obj.style.borderColor = this.color.green;
                break;
            case 'notEnpty':
                obj.style.borderColor = this.color.green;
                break;
        }

        tipObj.style.visibility = 'visible';
    };

    /*Login.prototype.changeLoginBtn = function(doLogin){
        if(!doLogin){
            document.getElementById("loginBtn").text='<img id="loginBtnImage" src="../images/tuandai_login_loading.png" class="loading-icon"/>登录';
        }else{
            document.getElementById("loginBtn").text="登录中...";
        }
    };*/


    var login = new Login();
    var postLoginData = function (rsaKey,isRemember) {
        var t = new Date().getTime();
        var reqData = {
            "un":$("#username").val(),
            "pd": $("#password").val(),
            "isRemember" : isRemember,
            "loadType":$("#loadType").val(),
            "encrypt":"0",
            "t":t,
            "geetestChallenge":$("#geetestChallenge").val(),
            "geetestValidate":$("#geetestValidate").val(),
            "geetestSeccode":$("#geetestSeccode").val()
        };
        $("#geetestChallenge").val("");
        $("#geetestValidate").val("");
        $("#geetestSeccode").val("");
        if(rsaKey == ''){
            //获取加密公钥
          /*  $.ajax({
                type: "GET",
                url: "/generatorKey",
                async: false,
                error:function () {
                    rsaKey = "";
                },
                success: function(data){
                    if (data.code == "SUCCESS"){
                        rsaKey = $.cookies.get("rsaKey");
                    }else {
                        rsaKey = "";
                    }
                }
            });*/
        }

        if(rsaKey != ''){
            var encrypt = new JSEncrypt();
            encrypt.setPublicKey(rsaKey);
            reqData.un = encrypt.encrypt(reqData.un);
            reqData.pd = encrypt.encrypt(reqData.pd);
            reqData.encrypt = "1";
        }

     /*   $.ajax({
            type: "POST",
            url: "/2login",
            async: false,
            data: reqData,
            error:function () {
                // login.changeLoginBtn(false);
            },
            success: function(data, txt_status, jqxhr){
                if(jqxhr.status == 299){
                    alert("请求太频繁，请稍后再试");
                    // login.changeLoginBtn(false);
                    return;
                }
                //初始化验证码块
                if(data.gt!=null) {
                    initslider(data);
                }else {
                    $('#loginBtnImage').hide();
                    $('#afterLoginBtnImage').hide();
                    isChecked = false;
                }
                if (data.isSuccess){
                    isChecked2 = true;
                }
                if (data.errorCode == '002') {
                    if(data.errorMsg.length>0)
                    {
                        $('.input-tip1').show();
                    }

                    login.showMsg('username', '<i></i>' + data.errorMsg, 'error');
                    // login.changeLoginBtn(false);
                } else if (data.errorMsg != '' && data.errorMsg != null) {
                    if (data.errorCode != '005') {
                        $('.input-tip2').show();
                        login.showMsg('password', '<i></i>' + data.errorMsg, 'error');
                    }
                    // login.changeLoginBtn(false);
                } else {
                    loginSuccssStat();
                    var returnUrl = $("#returnUrl").val();
                    window.location.href = "/broadcast/index?returnUrl=" + encodeURIComponent(returnUrl);
                }
            }
        });*/
    };

    $("#loginBtn").click(function(){
        if(isIE())
        {
            if($('#username').val()=='')
            {

                $('#password').css('border-color','#d5d5d5');
                $('.input-tip2').hide();
                $('.input-tip1').show();
            }else
            {
                if($('#password').val()=='')
                {
                    $('#username').css('border-color','#d5d5d5');
                    $('.input-tip1').hide();
                    $('.input-tip2').show();
                }
            }
        }
        // console.log(isChecked);
        if (!isChecked){
            loginSubmit();
        }
    });
    function loginSubmit() {
        if (login.checkForm()) {
            $('#loginBtnImage').show();
            $('#afterLoginBtnImage').show();
            isChecked = true;
            var isRemember = 0;
            if ($("#isRemember").attr("checked") == "checked") {
                isRemember = 1;
            }
            //改为从cookies获取
            var rsaKey = $.cookies.get("rsaKey");
            if (rsaKey == null || rsaKey == "") {
                // login.changeLoginBtn(false);
                postLoginData("", isRemember);
            } else {
                postLoginData(rsaKey, isRemember);
            }
        } else {
            // login.changeLoginBtn(false);
        }
        $("#login").submit();
    }
    //动态显示版权结束时间
    var now = new Date();
    document.getElementById('copyRightEnd').innerHTML= now.getFullYear();

});
var isChecked =false;
var isChecked2 =false;
function initslider(data) {
    initGeetest({
        // 以下配置参数来自服务端 SDK
        product: 'bind',
        gt: data.gt,
        challenge: data.challenge,
        offline: !data.success,
        new_captcha: data.newCaptcha,
        protocol: 'https://',
        timeout:3000
    }, function (captchaObj) {
        captchaObj.onReady(function () {
            captchaObj.verify();
            $('#loginBtnImage').hide();
            $('#afterLoginBtnImage').hide();
        });
        captchaObj.onSuccess(function () {
            var result = captchaObj.getValidate();
            captchaObj.reset();
            $("#TCaptcha").html("");
            $("#geetestChallenge").val(result.geetest_challenge);
            $("#geetestValidate").val(result.geetest_validate);
            $("#geetestSeccode").val(result.geetest_seccode);
            isChecked =false;
            $('#loginBtn').click();
        });
        captchaObj.onError(function () {
            // 出错啦，可以提醒用户稍后进行重试
            isChecked =false;
        });
        captchaObj.onClose(function () {
            // 用户把验证关闭了，这时你可以提示用户需要把验证通过后才能进行后续流程
            isChecked =false;
        });
    })
}

function isIE() {
    if (!!window.ActiveXObject || "ActiveXObject" in window)
    {
        return true;
    }
}
function iePlay() {
    if (isIE())
    {
        $('.ie-num,.ie-pass').show();

        $('.ie-num').click(function()
        {
            $('.input-tip1').hide();
            $(this).hide();
            $('#username').focus();
        });
        $('#username').focus(function () {
            $(this).css('border-color','#d5d5d5');
            $('.ie-num').hide();
        }).blur(function()
        {
            if($(this).val()=='')
            {
                $('.ie-num').show();
            }
        });
        $('.ie-pass').click(function()
        {
            $('.input-tip2').hide();
            $(this).hide();
            $('#password').focus();
        });
        $('#password').focus(function()
        {
            $(this).css('border-color','#d5d5d5');
            $('.ie-pass').hide();
        }).blur(function()
        {
            if($(this).val()=='')
            {
                $('.ie-pass').show();
            }
        });
    }
}