// 路径配置
require.config({
    paths: {
        echarts: ''
    }
});
var year, month, dlist, tindex = 1, enable = 1;
var x = 10; var y = 20;

$(window).ready(function () {
    var myDate = new Date();
    year = myDate.getFullYear();
    month = myDate.getMonth() + 1;

    $(".plus").click(function () {
        if (enable == 0) {
            return;
        }
        enable = 0;
        var cyear = $("#ddlYear").html();
        cyear++;
        $("#ddlYear").html(cyear);
        LoadInvestProfit(cyear);
    });
    $(".minus").click(function () {
        if (enable == 0) {
            return;
        }
        enable = 0;
        var cyear = $("#ddlYear").html();
        cyear--;
        $("#ddlYear").html(cyear);
        LoadInvestProfit(cyear);
    });

    $("#changeTip").click(function () {
        if (tip.length > 1) {
            tindex++;
            if (tip.length < tindex) {
                tindex = 1;
            }
            $("#p1").html(tip[tindex - 1]);
            $("#p2").html(tip[tindex - 1]);
        }
    });

    LoadInvestProfit(year);
    $("#tip").mouseenter(function (e) {
        $(".tip").css({ "top": (e.pageY + y) + "px", "left": (e.pageX - 100) + "px" }).show();
    }).mouseleave(function () {
        $(".tip").hide();
    });

    $("#tip1").mouseenter(function (e) {
        $(".tip1").css({ "top": (e.pageY + y) + "px", "left": (e.pageX - 100) + "px" }).show();
    }).mouseleave(function () {
        $(".tip1").hide();
    });
});

function LoadInvestProfit(syear) {
    $.ajax({
        url: "/member/investProfit/autoLoan",
        type: "post",
        dataType: "json",
        async: true,
        data: {
            Date: syear + "-01-01"
        }, success: function (data) {
            ReadData(syear, data);
        }, error: function () {
        }
    });
}
function ReadData(syear, data) {
    var dt1 = new Array();
    var dt2 = new Array();
    var t = "", s = false;
    for (var i = 1; i <= 12; i++) {
        t = syear + (i < 10 ? "-0" + i : "-" + i);
        s = false;
        if (data != null && data.length > 0) {
            for (var j = 0; j < data.length; j++) {
                if (data[j].cycDate.toString() == t.toString()) {
                    s = true;
                    dt1.push(Round2(data[j].recAmount));
                    dt2.push(Round2(data[j].dueAmount));
                    break;
                }
            }
        }
        if (s != true) {
            dt1.push(0);
            dt2.push(0);
        }
    }
    loadProfitData(dt1, dt2);
    setTimeout("fnRestart()", 500);
}
function fnRestart() {
    enable = 1;
}

function loadProfitData(dt1, dt2) {
    require(
    [
        'echarts',
        'echarts/chart/bar'
    ],
    function (ec) {
        var myChart = ec.init(document.getElementById('total-index'));
        var option = {
            title: {
                text: $("#ddlYear").html() + '年每月投资收益统计',
                x: 'center',
                textStyle: {
                    fontSize: 18,
                    fontFamily: '微软雅黑',
                    color: '#ff9900'
                }
            },
            legend: {
                data: ['已收收益', '待收收益'],
                x: 'center',
                y: 'bottom'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            calculable: false,
            xAxis: [
                               {
                                   type: 'category',
                                   data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                               }
            ],
            yAxis: [
                               {
                                   type: 'value'
                               }
            ],
            series: [
                               {
                                   name: '已收收益',
                                   type: 'bar',
                                   stack: '收益',
                                   barWidth: 26,
                                   data: dt1
                               },
                               {
                                   name: '待收收益',
                                   type: 'bar',
                                   stack: '收益',
                                   barWidth: 26,
                                   data: dt2
                               }
            ]
        };
        myChart.setOption(option);
    }
);
}
