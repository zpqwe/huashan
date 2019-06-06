/**
 * Created by Administrator on 15-4-23.
 */
var type = 0;
$(function () {
    simulationList(); //下拉模拟
    getInfo();
    column(); //柱状图选择
    ranking(); //排名
    columnTag(); //柱状图TAG
    infItemCheckBox(); //人个信息单选框
    lvUp(); //等级成长
    $('#dahei').height($('body').outerHeight());
    //    ganbenglunbo(3000);
    $('#check1').find('label').toggle(
        function () {
            $(this).css({
                backgroundPosition: "-15px -214px"
            });
        },
        function () {
            $(this).css({
                backgroundPosition: "-15px -14px"
            });
        }
    );

    $('#check2').find('label').toggle(
        function () {
            $(this).css({
                backgroundPosition: "-15px -214px"
            });
        },
        function () {
            $(this).css({
                backgroundPosition: "-15px -14px"
            });
        }
    );
    $(".account_tableNR").find("tr").css("background-color", "#f4f4f4");
    $(".account_tableNR").find("tr:odd").css("background-color", "#fff");
    $(".new-rec-table").find("tr").css("background-color", "#f4f4f4");
    $(".new-rec-table").find("tr:odd").css("background-color", "#fff");
    $('.account-left').find('dt').toggle( //左边导航
        function () {
            $(this).parent().find('dd').slideUp("fast");
            $(this).parent().find('dt').css({
                borderBottom: "none"
            });
            $(this).parent().find('dt').find('.arrow').addClass('arrow-change');
        },
        function () {
            $(this).parent().find('dd').slideDown("fast");
            $(this).parent().find('dt').css({
                borderBottom: "1px solid #e5e5e5"
            });
            $(this).parent().find('dt').find('.arrow').removeClass('arrow-change');
        }
    );
});

function simulationList() { //模拟下拉-->
    $('.simulation-list').find('.arrow').click(
        function () {
            $(this).parents('.text-box').css({
                position: "relative"
            });
            $(this).parent().find('ul').slideToggle('fast');
            $('.text-box').mouseleave(function () {
                $(this).find('ul').show().hide();
                $(this).css({
                    position: "static"
                });
            });
            $(this).parent().find('li').click(
                function () {
                    var newVal = $(this).text();
                    $(this).parents('.text-box').find('.text').text(newVal);
                    $(this).parent().hide();
                    $(this).parents('.text-box').css({
                        position: "static"
                    });
                }
            )
        }
    );

}

function simulationList2() {
    $('.simulation-list').find('.arrow').click(function () {
        $(this).parents('.text-box').css({
            position: 'relative'
        });
    });
}

function layerBox(includeBox, topH) { //弹出框
    var boxWidth = $(includeBox).outerWidth();
    $('#layer-bg').show();
    $('#layer-bg').css({
        opacity: 0.3
    });
    $('.layer-box').width(boxWidth);
    $('.layer-box').css({
        marginLeft: -boxWidth / 2,
        top: topH
    });
    $(includeBox).appendTo('.layer-box');
    $(includeBox).show();
    $('.layer-box').show();
    $('.layer-box').find('.close').click(
        function () {
            $(this).parents('.layer-box').fadeOut('fast');
            $('#layer-bg').fadeOut('fast');
            $(includeBox).fadeOut('fast');
        }
    );
}

window.onload = function () {
    $('#dahei').height($('body').outerHeight());
}

function guandiao() {
    document.getElementById("dahei").style.display = "none";
    document.getElementById("xinbantishi").style.display = "none";
}

function getInfo() {
    var s = "";
    s += "" + document.body.clientHeight;
}

function column() { //柱状图选择
    $('.column-index').find('li').mouseenter(function () {
        _index = $(this).index();
        $(this).parent().find('li').removeClass('selected');
        $(this).addClass('selected');
        if (type == 0) {
            $("#p_title1").html($(this).html());
        } else {
            $("#p_title2").html($(this).html());
        }
        LoadAmountStatictis(type, _index);
    });
}

function ranking() {
    $('.ranking-index').find('li').mouseenter(function () { //排名
        var lD1 = $('.left-d').find('.d1');
        var lD2 = $('.left-d').find('.d2');
        var lD3 = $('.left-d').find('.d3');
        var d1 = $(this).find('.d1').text();
        var d2 = $(this).find('.d2').text();
        var d3 = $(this).find('.d3').text();
        lD1.text(d1);
        lD2.text(d2);
        lD3.text(d3);
        var _index = $(this).index();
        switch (_index) {
            case 0:
                {
                    $("#p1").html("<a href=\"" + portalWebsiteUrl + "/pages/invest_list\" class=\"font-orange2 font-14 margin-top-15\">去投资提升排名</a>");
                    break;
                }
            case 1:
                {
                    $("#p1").html("<span style='color:orange;font-size:13px;line-height:22px;'>去充值，提升排名</span>");
                    break;
                }
            case 2:
                {
                    $("#p1").html("<span style='color:orange;font-size:13px;line-height:22px;'>去借款，提升排名</span>");
                    break;
                }
            case 3:
                {
                    if (parseFloat(d2.replace("￥", "").replace("元", "")) > 10000) {
                        $("#p1").html("<span style='color:orange;font-size:13px;line-height:22px;'>您的累计提现太多了，建议开通会员，提现费低至0.1%</span>");
                    } else {
                        $("#p1").html("<span style='color:orange;font-size:13px;line-height:22px;'>开通会员，提现费低至0.1%，你还等什么？</span>");
                    }
                    break;
                }
            case 4:
                {
                    $("#p1").html("<span style='color:orange;font-size:13px;line-height:22px;'>感谢您对团贷网做出的贡献</span>");
                    break;
                }
        }

        $(this).parent().find('li').removeClass('selected');
        $(this).addClass('selected');
    });
}

function columnTag() {
    $('.column-type').find('.column-title').find('span').click(function () {
        var _index = $(this).index();
        type = _index;
        $('.column-type').find('.column-tag').hide();
        $('.column-type').find('.column-tag').eq(_index).show();
        $('.column-type').find('.column-title').find('span').removeClass('selected');
        $(this).addClass('selected');
        LoadAmountStatictis(type, 0);
    });
}

function infItemCheckBox() { //人个信息单选框
    $('.inf-item').find('.check-box').find('span').click(function () {
        $(this).parent().find('span').removeClass('checked');
        $(this).addClass('checked');
    });
}

function chuxian1() {
    document.getElementById("open1action").style.display = "block";
}

function yincang1() {
    document.getElementById("open1action").style.display = "none";
}

function chuxian2() {
    document.getElementById("open6action").style.display = "block";
}

function yincang2() {
    document.getElementById("open6action").style.display = "none";
}

function chuxian3() {
    document.getElementById("open12action").style.display = "block";
}

function yincang3() {
    document.getElementById("open12action").style.display = "none";
}

function lvUp() { //等级成长
    var score = 5;
    var aLv = ["LV1骑士", "LV2骑士", "LV3骑士", "LV4骑士", "LV5骑士", "LV6骑士", "LV7骑士", "LV8骑士", "LV9骑士", "LV10骑士"];
    for (var i = 0; i < score; i++) {
        $('.group-progress-line').find('li').eq(i).css({
            color: "#fff",
            background: "#f98721"
        });
        if (i == score - 1) {
            $('.group-progress-line').find('li').eq(i).html(aLv[i]);
        }
    }
}


//20160331 南粤银行弹窗
$(function () {
    ClickBox();
    closed();
});

function closed() {
    $(".NyBank-alert .close").click(function () {
        $(".Nymask").hide();
        $(".NyBank-alert").hide();
    });
}


function ClickBox() {
    //$("#menu_recharge a").click(function(){showAlert();});       
    //$("#menu_withdraw a").click(function(){showAlert();});
}
var listItemSelect = function () { // 回款详情下拉
    var moveIn = function () {
        $('.list-item-1').mousemove(function () {
            $(this).css('z-index', 1).find('dd').show()
        })
    }
    var moveOut = function () {
        $('.list-item-1').mouseout(function () {
            $(this).css('z-index', 0).find('dd').hide()
        })
    }
    moveIn();
    moveOut()
};
listItemSelect();


//左侧菜单(left-menu)公共JS封装
;(function (window,$) {
    return accountFn = {

        //存管验证
        cgtEventInit : function (){
            $("#menu_recharge").click(function () {
                try {
                    if (!checkIsOpen("chongzhiother"))
                        return false;
                }
                catch (e) {
                }
            });
            $("#menu_withdraw").click(function () {
                try {
                    if (!checkIsOpen("tixian"))
                        return false;
                }
                catch (e) {
                }
            });

            $("#menu_transfer").click(function () {
                try {
                    if(!checkIsOpen()) {
                        return false;
                    }
                    if(!checkToPlatformPermit()) {
                        return false;
                    }
                }catch (e) {}
            });

            $("#menu_borrowMiniEdit,#menu_userservice").click(function () {
                try {
                    if (!checkIsOpen())
                        return false;
                }
                catch (e) {
                }
            });

            $('#menu_autoTender').click(function () {
                try {
                    if (!checkIsOpen("touzi"))
                        return false;
                }
                catch (e) {
                }
            });
        },
        showYellowTips : function () {
            var _this = this;
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
                _this.setCloseYellowTips();
            });
        },
        setCloseYellowTips : function () {
            setCookie(Id + "isClosedYellowTip", "1");
        },
        //检测是否绑定银行卡
        left_CheckAllowBindBank : function () {
            console.log(left_IsValidateMobile)
            if (left_IsValidateMobile != 'True' || left_IsValidateIdentity != 'True') {
                userbank.tips(left_IsValidateMobile, left_IsValidateIdentity);
                return false;
            }

            return true;
        }
    };

})(window,jQuery);

