var newTitle = "团贷网提醒您";
var arrBox = new Array();
arrBox["dvPwd"] = "6-16个字符，建议由字母、数字和符号两种以上组合";
arrBox["dvRepwd"] = "请再次输入密码";
//设置新密码
$(function () {
    $('#txtPwd').click(function () { ClickBox("#txtPwd", "dvPwd"); });
    $('#txtRepwd').click(function () { ClickBox("#txtRepwd", "dvRepwd") });

    $('#txtPwd').blur(function () { BlurPwd(1); });
    $('#txtRepwd').blur(function () { BlurRepwd(1); });

    $("#reg_left input").keypress(function (e) {
        if (e.keyCode == "13")
            $("#btnSubmit").click();
    });

    $("#btnSubmit").click(function () {
        var validateResult = true;
        if (!BlurPwd(2))
            validateResult = false;
        if (!BlurRepwd(2))
            validateResult = false;
        if (!validateResult)
            return false;
        var url= location.protocol + "\\\\" + location.hostname + ":" + (location.port == "" ? 80 : location.port) +"\\tuandaiw"
        $.ajax({
            url:url+"\\updatepwd",
            type: "post",
            dataType:"text",
            data: {newPassword: $.trim($("#txtRepwd").val()),"phone":$("#phone").val()},
            success: function (result) {
                if (result=="true") {
                   $("#reg_left").hide();
                    $("#settitle").html("修改成功");
                    $("#temp2").show();
                } 
            },
            error: function () {
                showDialWindows("团贷网提醒您", "系统异常，请稍后操作", "确认", function () { closeLoadingWindows(); }, null);
                ////删除其他弹出层
                //var list = art.dialog.list;
                //for (var i in list) {
                //    list[i].close();
                //};
                //art.dialog({
                //    width: 300,
                //    zIndex: 9999999,
                //    time: 5,
                //    title: newTitle,
                //    content: '系统异常，请稍后操作。'
                //});
            }
        });
    });
})

function BlurPwd(type) {
    var txt = "#txtPwd";
    var td = "#dvPwd";
    var str = $.trim($(txt).val());
    if (type == 1 && str == "") {
        ChangeClass(txt, "");
        $(td).html("");
        return false;
    }
    $(td).css("line-height", "40px");
    if (str == "") {
        ChangeClass(txt, "red-border-input");
        $(td).html(GetP("reg_wrong", "请输入密码"));
        return false;
    }
    if (/^.*?[\d]+.*$/.test(str) && /^.*?[A-Za-z].*$/.test(str) && /^.{6,16}$/.test(str)) {
        //格式正确
        $(td).html("");
        ChangeClass(txt, "");
        return true;
    }
    else {
        ChangeClass(txt, "red-border-input");
        $(td).css("line-height", "19px");
        $(td).html(GetP("reg_wrong", "6-16个字符，建议由字母、数字和符号两种以上组合"));
        return false;
    }
}

function BlurRepwd(type) {
    var txt = "#txtRepwd";
    var td = "#dvRepwd";
    var str = $.trim($(txt).val());
    if (type == 1 && str == "") {
        ChangeClass(txt, "");
        $(td).html("");
        return false;
    }
    if (str == "") {
        ChangeClass(txt, "red-border-input");
        $(td).html(GetP("reg_wrong", "请确认密码"));
        return false;
    }
    if (str == $.trim($("#txtPwd").val()) && str.length > 5) {
        //格式正确
        ChangeClass(txt, "");
        $(td).html("");
        return true;
    }
    else {
        ChangeClass(txt, "red-border-input");
        $(td).html(GetP("reg_wrong", "两次输入密码不一致"));
        return false;
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

function ClickBox(id1, id2) {
    if ($(id1).hasClass("red-border-input")) {
        $(id1).removeClass("red-border-input");
    }
    if (!$(id1).hasClass("green-border-input")) {
        $(id1).addClass("green-border-input");
    }
    if (id2 == "dvPwd") {
        $("#dvPwd").css("line-height", "19px");
    }

    $("#" + id2).html(GetP("reg_info", arrBox[id2]));
}

function GetP(clsName, c) { return "<div class='" + clsName + "'>" + c + "</div>"; }

function getbyid(id) {
    return document.getElementById(id);
}