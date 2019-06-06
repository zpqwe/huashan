var isEnterAutoInvestSetPage = getCookie("cda6d0e8" + "isEnterAutoInvestSetPage");//是否进入自动投标设置
var isClosedYellowTip2 = getCookie("cda6d0e8" + "isClosedYellowTip");//手动点击关闭黄标签
var isDefaultShowed = getCookie("cda6d0e8" + "_account_default");//是否首页显示
var tuandaiw = getCookie("tuandaiw");
$(function () {
    $(".a_code").mouseover(function () {
        $(".codexe").show();
    }).mouseout(function () {
        $(".codexe").hide();
    });

    try {
        getRandomValue();
    } catch (e) { }
    $('#menu_autoTender').hover(function () {
        $('#YellowTips').fadeIn(150);
    },
        function () {
            $('#YellowTips').stop().fadeOut();
        }
    );
    $('#menu_myWePlan').hover(function () {
        $('#YellowTips2').fadeIn(150);
    },
        function () {
            $('#YellowTips2').stop().fadeOut();
        }
    );
    $("#menu_withdraw,#menu_recharge").click(function () {
        try {
            getRandomValue();
            if (!checkIsOpen("chongzhi"))
                return false;
        }
        catch (e) { }
    });

    $("#menu_borrowMiniEdit").click(function () {
        try {
            if (!checkIsOpen("noshouquan"))
                return false;
        }
        catch (e) { }
    });
    $("#menu_userservice").click(function () {
        try {
            if (!checkIsOpen())
                return false;
        }
        catch (e) { }
    });
    $("#menu_autoTender").click(function () {
        try {
            if (!checkIsOpen("touzi"))
                return false;
        }
        catch (e) { }
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

    $('#menu_autoTender').find('.close').click(function () {
        $('#YellowTips').fadeOut();
        setCloseYellowTips();
    });
});
function setCloseYellowTips() {
    setCookie("cda6d0e8" + "isClosedYellowTip", "1");
}


var left_newTitle = '团贷网提醒您：';
var left_IsValidateMobile = 'True';
var left_IsValidateIdentity = 'True';
var left_IsSetPayPwd = "True";
var IsbindBankNo = 'True';
var IsOpenCGT = '1';

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
 
 

        function showErr() {
            $(".alertDiv").css("display", "");
        }
        function clearErr() {
            $(".alertDiv ul").html("");
        }
        function addErr(err) {
            $(".alertDiv ul").append("<li>" + err + "</li>");
        }
        function hideErr() {
            $(".alertDiv").css("display", "none");
        }
        function hasErr() {
            return $(".alertDiv ul li").length > 0;
        }

        var newTitle = '团贷网提醒您：';
        var IsOpenCGT = '1';
        jQuery(document).ready(function () {

            $("#menu_userdetail").addClass("currentMenu");

        var nickName = '白饭_青菜';
            if (nickName) {
            jQuery("#txtNickName").val(nickName);
        }

            $("#txtNickName").keypress(function (e) {
                if (e.keyCode == 13) {
            UpdateNickName();
        }
            });
        });

        function UpdateNickName() {
            var nickName = jQuery.trim(jQuery("#txtNickName").val());
            var pat = new RegExp("^[\u4E00-\u9FA5A-Za-z0-9_]{2,12}$", "i");
            clearErr();
            hideErr();
            if (nickName == '') {
            addErr('您还没有填写昵称！');
        }
            if (!pat.test(nickName)) {
            addErr('昵称必须为：2-12个中文、字母、数字、下划线。！');
        }
            if (hasErr()) {
            showErr();
        return false;
            }
            else {
            $.ajax({
                type: "POST",
                url: "/member/ajaxCross/ajax.ashx",
                dataType: "json",
                data: { Cmd: "UpdateNickName", nickName: nickName },
                success: function (json) {
                    var d = json.result;
                    if (parseInt(d) == -100) { window.location.href = "/View/NoticeMessage?status=2"; }
                    if (parseInt(d) == -99) { window.location.href = "/View/login?ReturnUrl=" + window.location.href; }
                    if (d == "-1") {
                        addErr('修改失败：用户参数错误！');
                        showErr();
                        return;
                    } else if (d == "-2") {
                        addErr('修改失败：用户信息错误！');
                        showErr();
                        return;
                    } else if (d == "-4") {
                        addErr('修改失败：昵称已使用！');
                        showErr();
                        return;
                    } else if (d == "-5") {
                        addErr('修改失败：昵称不能与用户名相同！');
                        showErr();
                        return;
                    } else if (d == "-6") {
                        addErr('您的昵称含有敏感词语，请重新输入');
                        showErr();
                        return;
                    } else if (d == "1") {
                        //globalDialog(newTitle, "您好，昵称修改成功！", location.href, "1");
                        noticeWindow(newTitle, "您好，昵称修改成功！", location.href);
                    } else if (d == "2") {
                            noticeWindow(newTitle, "您好，昵称修改成功！", location.href);
                    } else {
                        //globalDialog(newTitle, "您好，操作失败，请联系客服！", location.href, "1");
                        noticeWindow(newTitle, "您好，操作失败，请联系客服！", location.href);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    //globalDialog(newTitle, "您好，操作失败，请联系客服！", location.href, "1");
                    noticeWindow(newTitle, "您好，操作失败，请联系客服！", location.href);
                }
            });

        }
        }

        //提示窗口
        function noticeWindow(title, content, link) {
            showDialWindows(title, content, "确定", function () {
                closeLoadingWindows();
                window.location = link;
            });
        }

        (function () {
            $('.member-list').hover(function () {
                $(this).find('ul').addClass('ul-type').end().find('.mission').show();
                $(this).find('.arrow').removeClass('down-arrow').addClass('up-arrow');
            }, function () {
                $(this).find('ul').removeClass('ul-type').end().find('.mission').hide();
                $(this).find('.arrow').removeClass('up-arrow').addClass('down-arrow');
            }
            )
        })();
        