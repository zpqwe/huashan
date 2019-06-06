$(function () {
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
            data: ['待收本金', '待收利息']
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
                    { value: Round2(circledata.dueamount), name: '待收本金',itemStyle:{ normal:{ color:'#FF8247'}} },
                    { value: Round2(circledata.dueinterest), name: '待收利息',itemStyle:{ normal:{ color:'#87CEFF'}} }
                ]
            }
        ]
    };
    myChart.setOption(option);
    if (parseFloat(circledata.dueamount) <= 0 && parseFloat(circledata.dueinterest) <= 0) {
        $("#defaultPic").show();
    } else{
        $("#defaultPic").hide();
    }
    myChart.hideLoading();
});