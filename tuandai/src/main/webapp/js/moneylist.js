	/*$(document).ready(function(){
		$.ajax({
	     	"url":"${pageContext.request.contextPath}/ajaxStatistics",
	     	 "data":{}, 
	     	"type":"get",
	     	"dataType":"json",
	     	"success":function(data){
	     	$("#spanz").html((data.ucavail+data.ucwmoney+data.ucinterest+
	     	data.ucodraft+data.ucmoney+data.ucaccp+data.ucfrcp).toFixed(2));
	     	$("#sp1").html(data.ucavail.toFixed(2));//保留两位小数
	     	$("#sp2").html(data.ucwmoney.toFixed(2));
	     	$("#sp3").html(data.ucinterest.toFixed(2));
	     	
	     	$("#sp5").html(data.ucmoney.toFixed(2));
	     	$("#sp6").html(data.ucaccp.toFixed(2));
	     	$("#sp7").html(data.ucfrcp.toFixed(2));
	     	$("#sp4").html(data.ucodraft.toFixed(2));
	     	},
	     	"error":function(){
	     	alert("请求失败");
	     	}
	     	}); 
	})*/
	 
	
/*function Pie(name,CinArray,divId,colorL) {
    // 基于准备好的dom，初始化echarts实例
        var NameArray = CinArray.map(function(cinarray){
            return cinarray.name;
        }), 
        DataArray = CinArray.map(function(cinarray){
            return cinarray.value;
        });
        var myChart = echarts.init(document.getElementById(divId));
        
        // 指定图表的配置项和数据
        option = {
            title : {//标题设置‘参保情况’
                x : 'center',//标题位置
                text : name,//传入标题名称‘参保情况’
                textStyle:{//标题字体颜色等设置
                    fontSize:16,
                    fontWeight:'bold'
                }
            },
            tooltip : {//鼠标hover覆盖提示框
                show : 'true',//可视
                trigger : 'item',//根据item提示信息
                formatter : "{a} <br/>{b}: {c} ({d}%)"//提示内容
            },
            legend : {//位于右侧的属性按钮
                orient : 'vertical',//竖直放置
                icon: 'circle',//图标为圆形，默认是方形
                align:'auto',
                itemGap: 6 ,//两个属性的距离
                itemWidth : 8,//图标的宽度，对应有itemHeight为高度,圆形只有半径
                x : '60%',//距离左侧位置
                y : '45%',//距离上面位置
                data : NameArray,//属性名称‘已参保’，‘未参保’
                align: 'left',//图标与属性名的相对位置，默认为right，即属性名在左，图标在右
                selectedMode: true,//可选择
                formatter: function(v) {
                    return v ;
                },
                textStyle:{//属性名的字体样式设置
                    fontSize:13,
                    color: '#666'
                }
            },
            series : [ {//饼状图设置
                name : name,//设置名称，跟数据无相关性
                type : 'pie',//类型为饼状
                radius : [ '0%', '80%' ],//内圈半径，外圈半径
                center : ['50%','55%'],//饼状图位置，第一个参数是左右，第二个是上下。
                avoidLabelOverlap : false,
                hoverAnimation: false,//鼠标悬停效果，默认是true
                label : {//设置饼状图圆心属性
                    //normal,emphasis分别对应正常情况下与悬停效果
                    normal : {
                        show : false,
                        position : 'center'
                    },
                    emphasis : {
                        show : false,
                        textStyle : {
                            fontSize : '20',
                            fontWeight : 'bold'
                        }
                    }
                },
                labelLine : {
                    normal : {
                        show : true
                    }
                },
                data : CinArray,//对应数据
                itemStyle : {//元素样式
                    normal : {
                        //柱状图颜色  
                        color : function(params) {//对每个颜色赋值
                            // 颜色列表  
                            var colorList = colorL;
                            //返回颜色  
                            return colorList[params.dataIndex];
                        },

                    },
                    emphasis : {
                                 
                    }
                }
            } ]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }
    
var ucavail=document.getElementById("sp1").innerHTML;//保留两位小数
var ucwmoney=document.getElementById("sp2").innerHTML;
var ucinterest=document.getElementById("sp3").innerHTML;
var ucodraft=document.getElementById("sp4").innerHTML;
var ucmoney=document.getElementById("sp5").innerHTML;
var ucaccp=document.getElementById("sp6").innerHTML;
var ucfrcp=document.getElementById("sp7").innerHTML;
var cin=[
{ name: '可用金额:￥'+ucavail, value:ucavail},
{name: '待收本金:￥' +ucwmoney, value:ucwmoney},
{ name: '待收利息:￥'+ucinterest,value:ucinterest},
{ name: '待确认投标:￥'+ucodraft,value:ucodraft},
{ name: '待确认提现:￥'+ucmoney,value:ucmoney },
{ name: '剩余活动奖金:￥' +ucaccp,value:ucaccp},
{  name: '冻结资金:￥'+ucfrcp,value:ucfrcp }];
         {name:'已参保',value:80},{name:'未参保',value:80}];
{ value: Round2(circledata.avimoney), name: '可用金额' ,itemStyle:{ normal:{ color:'#FF8247'}}},
{ value: Round2(circledata.dueamount), name: '待收本金' ,itemStyle:{ normal:{ color:'#87CEFF'}}},
{ value: Round2(circledata.dueinterest), name: '待收利息',itemStyle:{ normal:{ color:'#CD69C9'}}},
{ value: Round2(circledata.borrowout), name: '待确认投标',itemStyle:{ normal:{ color:'#43CD80'}}},
{ value: Round2(circledata.withdraw), name: '待确认提现',itemStyle:{ normal:{ color:'#5CACEE'}} },
{ value: Round2(circledata.reward), name: '剩余活动奖金' ,itemStyle:{ normal:{ color:'#FF69B4'}}},
{ value: Round2(circledata.freeze), name: '冻结资金',itemStyle:{ normal:{ color:'#9F79EE'}} }
var color=[ 'rgb(0,191,255)','rgb(60,179,113)' ,'rgb(0, 105, 8)' ];
Pie('资金统计',cin,'circle',color);
    //myChart.setOption(option);

setTimeout(function(){ Pie('资金统计',cin,'circle',color)}, 500);//延迟一秒加载
*/


/*$(function () {
    $('.ranking-index li.selected').find('img').show();
    $('.column-index li.selected').find('img').show();
    $('.ranking-index').find('li').mouseenter(function () {//排名
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
                $("#p1").html("<a href=\"../invest_list.html\" class=\"font-orange2 font-14 margin-top-15\">去投资提升排名</a>");
                break;
            case 1:
                $("#p1").html("<a href=\"../Recharge.html\" class=\"font-orange2 font-14 margin-top-15\">去充值，提升排名</a>");
                break;
            case 2:
                $("#p1").html("<a href=\"../account_projectweibasic.aspx\" class=\"font-orange2 font-14 margin-top-15\">去借款，提升排名</a>");
                break;
            case 3:
                if (parseFloat(d2.replace("￥", "").replace("元", "")) > 10000) {
                    $("#p1").html("<a href=\"../account_touplevel.html\" style='color:orange;font-size:13px;line-height:22px;'>您的累计提现太多了，建议开通会员，提现费低至0.1%</a>");
                } else {
                    $("#p1").html("<a href=\"../account_touplevel.html\" style='color:orange;font-size:13px;line-height:22px;'>开通会员，提现费低至0.1%</a>");
                }
                break;
            case 4:
                $("#p1").html("<span style='color:orange;font-size:13px;line-height:22px;'>感谢您对团贷网做出的贡献</span>");
                break;
        }

        $(this).parent().find('li').removeClass('selected');
        $(this).addClass('selected');
        $(this).parent().find("img").hide();
        $(this).find("img").show();
    });


    // 资产统计
    var myChart = echarts.init(document.getElementById('circle'));
    myChart.showLoading({
        text: "图表数据正在努力加载..."
    });
    var option = {
        tooltip: {
            trigger: 'item',
            formatter: "{b}:<br/>{c} ({d}%)"
        },
        legend: {
            show: false,
            orient: 'vertical',
            x: 'right',
            y: 'center',
            data: ['可用金额', '待收本金', '待收利息', '待确认投标', '待确认提现', '剩余活动奖金', '冻结资金']
        },
        calculable: false,
        series: [
            {
                type: 'pie',
                radius: '70%',
                center: ['50%', '50%'],
                itemStyle: {
                    normal: {
                        label: {
                            show: false
                        },
                        labelLine: {
                            show: false
                        }
                    },
                    emphasis: {
                        label: {
                            show: true,
                            position: 'center',
                            textStyle: {
                                fontSize: '16',
                                color: '#fff',
                                fontFamily: 'microsoft yahei'
                            }
                        }
                    }
                },
                data: [
                    { value: Round2(circledata.avimoney), name: '可用金额' ,itemStyle:{ normal:{ color:'#FF8247'}}},
                    { value: Round2(circledata.dueamount), name: '待收本金' ,itemStyle:{ normal:{ color:'#87CEFF'}}},
                    { value: Round2(circledata.dueinterest), name: '待收利息',itemStyle:{ normal:{ color:'#CD69C9'}}},
                    { value: Round2(circledata.borrowout), name: '待确认投标',itemStyle:{ normal:{ color:'#43CD80'}}},
                    { value: Round2(circledata.withdraw), name: '待确认提现',itemStyle:{ normal:{ color:'#5CACEE'}} },
                    { value: Round2(circledata.reward), name: '剩余活动奖金' ,itemStyle:{ normal:{ color:'#FF69B4'}}},
                    { value: Round2(circledata.freeze), name: '冻结资金',itemStyle:{ normal:{ color:'#9F79EE'}} }
                ]
            }
        ]
    };
    myChart.setOption(option);
    if (parseFloat(circledata.avimoney) <= 0 && parseFloat(circledata.dueamount) <= 0 && parseFloat(circledata.dueinterest) <= 0 && parseFloat(circledata.borrowout) <= 0
        && parseFloat(circledata.withdraw) <= 0 && parseFloat(circledata.reward) <= 0 && parseFloat(circledata.wewaitinvestment) <= 0 && parseFloat(circledata.freeze) <= 0) {
        $("#defaultPic").show();
    } else{
        $("#defaultPic").hide();
    }

    myChart.hideLoading();
});*/





