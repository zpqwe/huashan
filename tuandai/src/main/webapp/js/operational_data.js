TabBox('.month-tit li','.month-con .box');
//月度融资额表格
var allMoney = echarts.init(document.getElementById('month-all-money'));
var allMoneyData = {
    color: ['#3398DB'],
    tooltip : {
        trigger: 'axis',
        axisPointer : {            //坐标轴指示器，坐标轴触发有效
            type : 'none'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    grid: {
        left: '1%',
        right: '1%',
        top:'3%',
        bottom: '0%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            data : [arrBar1[0].month,arrBar1[1].month,arrBar1[2].month,arrBar1[3].month,arrBar1[4].month,arrBar1[5].month],
            axisTick: {
                alignWithLabel: true
            }
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:Bar1_name,
            type:'bar',
            barWidth: '36',
            data:[arrBar1[0].value,arrBar1[1].value,arrBar1[2].value,arrBar1[3].value,arrBar1[4].value,arrBar1[5].value],
            itemStyle:{
                normal:{
                    color:'#ffbb26'
                },
                emphasis:{
                    color:'#ffbb26'
                }
            }
        }
    ]
};
allMoney.setOption(allMoneyData);
//月度撮合融资笔数
var dealTime = echarts.init(document.getElementById('deal-time'));
var dealTimeData = {
    color: ['#3398DB'],
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'none'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    grid: {
        left: '1%',
        right: '1%',
        top:'3%',
        bottom: '0%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            data : [arrBar2[0].month,arrBar2[1].month,arrBar2[2].month,arrBar2[3].month,arrBar2[4].month,arrBar2[5].month],
            axisTick: {
                alignWithLabel: true
            }
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:Bar2_name,
            type:'bar',
            barWidth: '36',
            data:[arrBar2[0].value,arrBar2[1].value,arrBar2[2].value,arrBar2[3].value,arrBar2[4].value,arrBar2[5].value],
            itemStyle:{
                normal:{
                    color:'#85a2ff'
                },
                emphasis:{
                    color:'#85a2ff'
                }
            }
        }
    ]
};
dealTime.setOption(dealTimeData);

//    第一个饼图，投资人基本信息,投资人年龄占比
var investPie = echarts.init(document.getElementById('invest-age'));
var investPieData = {
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {d}%"
    },

    series: [
        {
            name:'投资人年龄占比',
            type:'pie',
            radius: ['60%', '90%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: false,
                    textStyle: {
                        fontSize: '30',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:arrageInvest
        }
    ]
};
investPie.setOption(investPieData);

//    第二个饼图，投资人基本信息,投资人性别占比
var investsexPie = echarts.init(document.getElementById('invest-sex'));
var investsexPieData = {
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {d}%"
    },

    series: [
        {
            name:'投资人性别占比',
            type:'pie',
            radius: ['60%', '90%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: false,
                    textStyle: {
                        fontSize: '30',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:arrsexInvest
        }
    ]
};
investsexPie.setOption(investsexPieData);

//第一个中国地图，投资人区域分布
var mapInvestPie = echarts.init(document.getElementById('map-invest'));
var mapInvestPieDate = {
    tooltip: {
        trigger: 'item',
        show:true,
        formatter: function (params) {
            if(params.value){
                return params.name+'：'+params.value+'%';
            }
        }
    },
    visualMap: {
        min: 0,
        max: 2500,
        left: '0%',
        top: '0%',
        right: '0%',
        bottom: '0%',
        inRange: {
            color: ['#99cbff']
        },
        text: ['高'],           // 文本，默认为数值文本
        calculable: true,
        show:false
    },
    series: [
        {
            type: 'map',
            mapType: 'china',
            itemStyle: {
                normal: {
                    label: {
                        show: true
                    },
                    areaColor: '#ebf6fe',
                    borderColor: '#a7d7ff'
                }
            },
            label: {
                normal: {
                    show: true,
                    textStyle: {
                        color: '#496f8e'
                    }
                }
            },
            data:mapChinaOne
        }
    ]
};
mapInvestPie.setOption(mapInvestPieDate);

//    第三个饼图，融资人基本信息,融资人年龄占比
var getagePie = echarts.init(document.getElementById('get-age'));
var getagePieData = {
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {d}%"
    },

    series: [
        {
            name:'融资人年龄占比',
            type:'pie',
            radius: ['60%', '90%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: false,
                    textStyle: {
                        fontSize: '30',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:arrageGet
        }
    ]
};
getagePie.setOption(getagePieData);

//    第四个饼图，融资人基本信息,融资人性别占比
var getsexPie = echarts.init(document.getElementById('get-sex'));
var getsexPieData = {
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {d}%"
    },

    series: [
        {
            name:'融资人性别占比',
            type:'pie',
            radius: ['60%', '90%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: false,
                    textStyle: {
                        fontSize: '30',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:arrsexGet
        }
    ]
};
getsexPie.setOption(getsexPieData);

//第二个中国地图,融资人地域分布
var mapGetPie = echarts.init(document.getElementById('map-get'));
var mapGetPieDate = {
    tooltip: {
        trigger: 'item',
        show:true,
        formatter: function (params) {
            if(params.value){
                return params.name+'：'+params.value+'%';
            }
        }
    },
    visualMap: {
        min: 0,
        max: 2500,
        left: '0%',
        top: '0%',
        right: '0%',
        bottom: '0%',
        inRange: {
            color: ['#99cbff']
        },
        text: ['高'],           // 文本，默认为数值文本
        calculable: true,
        show:false
    },
    series: [
        {
            type: 'map',
            mapType: 'china',
            itemStyle: {
                normal: {
                    label: {
                        show: true
                    },
                    areaColor: '#ebf6fe',
                    borderColor: '#a7d7ff'
                }
            },
            label: {
                normal: {
                    show: true,
                    textStyle: {
                        color: '#496f8e'
                    }
                }
            },
            data:mapChinaTwo
        }
    ]
};
mapGetPie.setOption(mapGetPieDate);

showYear();
function showYear()
{
    for(var i=0;i<arrBar1.length;i++)
    {
        if(arrBar1[i].month=='1月')
        {
            $('.year').html(arrBar1[i].year).css('left',81+59*i);
            break;
        }

    }
}
$('.nei').each(function()
{
    $(this).css('width',$(this).parents('.min').find('span').html());
})
//tab切换
function TabBox(tabtit,tabcon) {
    $(tabtit).click(function(){
        $(this).addClass('on').siblings().removeClass('on');
        var index = $(this).index();
        $(tabcon).hide();
        $(tabcon).eq(index).show();
    });
}
