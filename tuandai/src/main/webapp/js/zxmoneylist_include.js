var type = 0, oldIndex=0,enable=0;
$(function () {
 
    LoadAmountStatictis(0, 0);
    $('.ranking-index li.selected').find('img').show();
    $('.column-index li.selected').find('img').show();
    //选择类型
    $('.column-index').find('li').mouseenter(function () {
        _index = $(this).index();
        $(this).parent().find('li').removeClass('selected');
        $(this).addClass('selected');
        $(this).parent().find("img").hide();
        $(this).find("img").show();
        if (type == 0) {
            $("#p_title1").html($(this).html());
        } else {
            $("#p_title2").html($(this).html());
        }
        LoadAmountStatictis(type, _index);
    });
    //切换
    $('.column-type').find('.column-title').find('span').click(function () {
        var _index = $(this).index();
        type = _index;
        $('.column-type').find('.column-tag').hide();
        $('.column-type').find('.column-tag').eq(_index).show();
        $('.column-type').find('.column-title').find('span').removeClass('selected');
        $(this).addClass('selected');
        LoadAmountStatictis(type, 0);
    })

    $(".plus").click(function () {
        if (enable == 0) {
            return;
        }
        enable = 0;
        if (type == 0) {
            var cyear = $("#sYear").html();
            cyear++;
            $("#sYear").html(cyear);
        } else {
            var cyear = $("#sYear2").html();
            cyear++;
            $("#sYear2").html(cyear);
        }
        LoadAmountStatictis(type, oldIndex);
    });
    $(".minus").click(function () {
        if (enable == 0) {
            return;
        }
        enable = 0;
        if (type == 0) {
            var cyear = $("#sYear").html();
            cyear--;
            $("#sYear").html(cyear);
        } else {
            var cyear = $("#sYear2").html();
            cyear--;
            $("#sYear2").html(cyear);
        }
        LoadAmountStatictis(type, oldIndex);
    });    
});

// 路径配置
require.config({
    paths: {
        echarts: '//js3.tuandai.com/scripts/echarts'
    }
});


var incomedata=null;
var payoutdata = null;
var oldyear, oldyear1;

//type 0:收益统计 1:支出统计

function LoadAmountStatictis(type, index) {
    oldIndex = index;
    if (type == 0) {
        if (incomedata == null || oldyear != $("#sYear").html()) {
            oldyear = $("#sYear").html();
            GetData();
        } else {
            var p_data = new Array();
            if (incomedata == null) {
                p_data = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            } else {
                var status = 0;
                for (var J = 1; J <= 12; J++) {
                    s = 0;
                    for (var i = 0; i < incomedata.length; i++) {
                        if (incomedata[i].YearMonth == oldyear + "-" + (J >= 10 ? J : "0" + J)) {
                            status = 1;
                            switch (index) {
                                case 0:
                                    p_data.push(parseFloat(Round2(parseFloat(incomedata[i].InterestAmout_1 + incomedata[i].InterestAmout_2 + incomedata[i].InterestAmout_3))));
                                    break;
                                case 1:
                                    p_data.push(parseFloat(Round2(parseFloat(incomedata[i].InterestAmout_2))));
                                    break;
                                case 2:
                                    p_data.push(parseFloat(Round2(parseFloat(incomedata[i].InterestAmout_1))));
                                    break;
                                case 3:
                                    p_data.push(parseFloat(Round2(parseFloat(incomedata[i].InterestAmout_3))));
                                    break;
                            }
                            break;
                        }
                    }
                    if (status == 1) {
                        continue;
                    } else {
                        p_data.push(0);
                    }
                }
            }
            fn_LoadProfit(p_data);
        }
    } else {
        if (payoutdata == null || oldyear1 != $("#sYear2").html()) {
            oldyear1 = $("#sYear2").html();
            GetPayData();
        } else {
            var p_data = new Array();
            if (payoutdata == null || payoutdata.length == 0) {
                p_data = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            } else {
                var s = 0;
                for (var m = 1; m <= 12; m++) {
                    s = 0;
                    for (var i = 0; i < payoutdata.length; i++) {
                        if (payoutdata[i].YearMonth == oldyear1 + "-" + (m >= 10 ? m : "0" + m)) {
                            s = 1;
                            switch (index) {
                                case 0:
                                    p_data.push(parseFloat(Round2(parseFloat(payoutdata[i].InterestAmout_2))));
                                    break;
                                case 1:
                                    p_data.push(parseFloat(Round2(parseFloat(payoutdata[i].InterestAmout_1) + parseFloat(payoutdata[i].InterestAmout_3) +
                                                parseFloat(payoutdata[i].PenaltyAmount_3) + parseFloat(payoutdata[i].Penalty_4))));
                                    break;
                            }
                            break;
                        }
                    }
                    if (s == 1) {
                        continue;
                    } else {
                        p_data.push(0);
                    }
                }
            }
            fn_PayoutStatictis(p_data);
       }
    }
}

function GetData() {
    var year = $("#sYear").html();
    $(".spyear").html(year);
   /*  $.ajax({
        url: "/member/ajaxCross/getZXProfitStatistics",
        type: "get",
        dataType: "json",
        async: true,
        data: {
            year: year
        }, success: function (data) {
            if(data.code!=0) {
                return;
            }
            data = data.data;
            incomedata = data;
            var p_data = new Array();
            var total = 0, t1 = 0, t2 = 0, t3 = 0, status;
            if (data != null && data.length>0) {
                for (var J = 1; J <= 12; J++) {
                    status = 0;
                    for (var i = 0; i < incomedata.length; i++) {
                        if (incomedata[i].YearMonth == oldyear + "-" + (J >= 10 ? J : "0" + J)) {
                            status = 1;
                            t1 += parseFloat(incomedata[i].InterestAmout_1);
                            t2 += parseFloat(incomedata[i].InterestAmout_2);
                            t3 += parseFloat(incomedata[i].InterestAmout_3);
                            total += parseFloat(incomedata[i].InterestAmout_1 + incomedata[i].InterestAmout_2 + incomedata[i].InterestAmout_3);
                            switch (oldIndex) {
                                case 0:
                                    p_data.push(parseFloat(Round2(parseFloat(incomedata[i].InterestAmout_1 + incomedata[i].InterestAmout_2 + incomedata[i].InterestAmout_3))));
                                    break;
                                case 1:
                                    p_data.push(parseFloat(incomedata[i].InterestAmout_2));
                                    break;
                                case 2:
                                    p_data.push(parseFloat(incomedata[i].InterestAmout_1));
                                    break;
                                case 3:
                                    p_data.push(parseFloat(incomedata[i].InterestAmout_3));
                                    break; 
                            }
                            break;
                        }
                    }
                    if (status == 1) {
                        continue;
                    } else {
                        p_data.push(0);
                    }
                }
            } else {
                p_data = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            }
            $(".s1").html("￥" + fmoney2(total));
            $(".s2").html("￥" + fmoney2(t2));
            $(".s3").html("￥" + fmoney2(t1));
            $(".s4").html("￥" + fmoney2(t3)); 
            fn_LoadProfit(p_data);
            setTimeout("fnRestart()", 500);
        }, error: function () {
            // GetData();
        }
    }); */
}

//收益统计
function  fn_LoadProfit(dt) {
    var strtype = "收益";
    switch (oldIndex) {
        case 0:
            strtype = "收益总计";
            break;
        case 1:
            strtype = "已收收益";
            break;
        case 2:
            strtype = "待收收益";
            break;
        case 3:
            strtype = "逾期收益";
            break; 
    }
    require(
        [
            'echarts',
            'echarts/theme/blue',
            'echarts/chart/bar'
        ],
        function (ec) {
            var myChart = ec.init(document.getElementById('column'));
            myChart.showLoading({
                text: "图表数据正在努力加载..."
            });
            option = {
                title: {
                    text: oldyear + "年1~12月" + strtype + "情况统计",
                    x: 'center',
                    textStyle: {
                        fontSize: 18,
                        fontFamily:'微软雅黑',
                        color: '#ff9900'
                    }
                },
                tooltip: {
                    trigger: 'axis'
                },
                calculable: false,
                xAxis: [{
                    type: 'category',
                    data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                }],
                 yAxis: [{
                     type: 'value'
                }],
                 series: [{
                     name: '收益',
                    type: 'bar',
                    data:dt
                }]
            };

            myChart.setOption(option);
            myChart.hideLoading();
        }
    ); 
}

function GetPayData() {
    var year = $("#sYear2").html();
    $(".spyear").html(year);
    /* $.ajax({
        url: "/member/ajaxCross/getZXPayStatistics",
        type: "get",
        dataType: "json",
        async: true,
        data: {
            year: year
        }, success: function (data) {
            if(data.code!=0) {
                return;
            }
            data = data.data;
            payoutdata = data;
            var p_data = new Array();
            var t1 = 0, t2 = 0, s = 0;
            if (data != null && data.length > 0) {
                for (var j = 1; j <= 12; j++) {
                    s = 0;
                    for (var i = 0; i < data.length; i++) {
                        if (data[i].YearMonth == year + "-" + (j >= 10 ? j : "0" + j)) {
                            t1 +=  parseFloat(data[i].InterestAmout_2);
                            t2 +=  parseFloat(data[i].InterestAmout_1) +  parseFloat(data[i].InterestAmout_3) +
                                 parseFloat(data[i].PenaltyAmount_3) +  parseFloat(data[i].Penalty_4);
                            if (oldIndex == 0) {
                                p_data.push(parseFloat(Round2( parseFloat(data[i].InterestAmout_2))));
                            } else {
                                p_data.push( parseFloat(data[i].InterestAmout_1) +  parseFloat(data[i].InterestAmout_3) +
                                 parseFloat(data[i].PenaltyAmount_3) +  parseFloat(data[i].Penalty_4));
                            }
                            s = 1;
                            break;
                        }
                    }
                    if (s == 1) {
                        continue;
                    } else {
                        p_data.push(0);
                    }
                }
            } else {
                p_data = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            }
            $(".s7").html("￥" + fmoney2(t2));
            $(".s6").html("￥" + fmoney2(t1));
            fn_PayoutStatictis(p_data);
            console.info(JSON.stringify(p_data))
            setTimeout("fnRestart()", 500);
        }, error: function () {
            // GetPayData();
        }
    }); */
}
function fnRestart() {
    enable = 1;
}
//获取2位小数，不四舍五入
function Round2(temp) {
    temp = temp.toString();
    if (temp.indexOf(".") > -1) {
        return temp.substring(0, temp.indexOf(".") + 3);
    }
    else {
        return temp;
    }
}
//金额格式化(无四舍五入)
function fmoney2(s) {
    s = parseFloat(Round2((s + "").replace(/[^\d\.-]/g, ""))).toFixed(2) + "";
    var l = s.split(".")[0].split("").reverse(),
            r = s.split(".")[1];
    t = "";
    for (i = 0; i < l.length; i++) {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    return t.split("").reverse().join("") + "." + r;
} 

// 支出统计
function fn_PayoutStatictis(dt) {
    var strtype = "支出";
    switch (oldIndex) {
        case 0:
            strtype = "已还利息(含逾期罚息)支出";
            break;
        case 1:
            strtype = "待还利息(含逾期罚息)支出";
            break;
    }
    require(
    [
        'echarts',
        'echarts/chart/bar'
    ],
    function (ec) {
        var myChart = ec.init(document.getElementById('payout'));
        myChart.showLoading({
            text: "图表数据正在努力加载..."
        });
        var option = {
               title: {
                   text: oldyear1 + "年1~12月" + strtype + "情况统计",
                   x: 'center',
                    textStyle: {
                        fontSize: 18,
                        fontFamily: '微软雅黑',
                        color: '#ff9900'
                    }
                },
                tooltip: {
                    trigger: 'axis'
                },
                calculable: false,
                xAxis: [
                {
                    type: 'category',
                    data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                }],
                yAxis: [{
                    type: 'value'
                }],
                series: [{
                    name: '支出',
                    type: 'bar',
                    data:dt
                }]
            };
            myChart.setOption(option);
            myChart.hideLoading();
        }
    );
}