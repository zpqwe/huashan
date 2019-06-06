<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>${ti.siititle }</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<link rel="dns-prefetch" href="#">
		<link rel="dns-prefetch" href="#">
		<link rel="dns-prefetch" href="#">
		<link rel="dns-prefetch" href="#">
		<link rel="dns-prefetch" href="#">
		<meta property="qc:admins" content="3542563377645164116375">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="shortcut icon" href="https://js3.tuandai.com/images/default/favicon.ico?v=20180926">
		<link rel="stylesheet" href="css/base.css">
		<link rel="stylesheet" href="css/layout.css">
		<link rel="stylesheet" href="css/component.css">
		<link rel="stylesheet" href="css/xiamen-bank.css">
		<link rel="stylesheet" href="css/cgt20161107.css">
		<link rel="stylesheet" href="css/NewBorrowDetail1.css">
		<script charset="utf-8" src="js/v.js"></script>
		<script async="" src="js/sensorsdata.min.js"></script>
		<script src="js/hm.js"></script>
		<script type="text/javascript" async="" src="js/webaccess.js"></script>
		<script type="text/javascript" src="js/6a90d8b9f8e64cf9410db404c47f81fc.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<title>P2P转让_101521281892-团贷网</title>
		<link rel="stylesheet" type="text/css" href="css/invest_dialog.css">
		<link href="css/invest_div1.css" rel="stylesheet" type="text/css">
		
	</head>

  <jsp:include page="top.jsp" />

<div class="position w1000 auto">
您当前所在的位置： <a href="index.htm">团贷网</a> &gt; <a href="${pageContext.request.contextPath}/invest_list">我要投资</a>&gt; 借款详情
</div>

<div class="bid_invest_inf clearfloat">
<div class="bid_inf_content clearfloat">
<div class="bid_inf_main">
<div class="bid-info-title">
<div class="l">
<i class="tao-biao icon feng"></i>
<i class="tao-biao icon bao"></i>
</div>
<div class="l bid_inf_title">
<a style="text-decoration: none;">${ti.siititle}</a>
</div>
</div>
<div class="bid_inf_line">
</div>
<ul class="bid-amount-wrap">
<li class="l bid-amount-col bid-amount-col-1">
<div class="g9 mb5">借款总额</div>
<div class="c_484848"><b class="c_ff7506">${ti.siitmoney }</b>元</div>
</li>
<li class="l bid-amount-col bid-amount-col-2">
<div class="g9 rel mb5 showtips-box">预期年化利率
<span class="lv-we-showtips-box">
<span class="lv-we-showtips lv-showtips-prom" style="display: none;">
本平台所有项目预期年化利率是在参考同类型项目历史数据得出，并不代表实际收益，市场有风险，投资需谨慎。
<i class="lv-arrow-tip"></i></span>
</span>
</div>
<div class="c_484848">
<span><b class="c_ff7506" >${ti.siiairate }</b>%</span>
</div>
</li>
<li class="l bid-amount-col bid-amount-col-3">
<div class="g9 mb5">借款期限</div>
<div class="c_484848"><b class="c_ff7506">${ti.siireturn }</b>个月</div>
</li>
</ul>
<ul class="bid-infom-wrap">
<li class="bid-infom-col-1">
<span class="g9" name="qtid" val="${ti.siismoney}">起投金额：</span>${ti.siismoney}0 元
</li>
<c:set var="rmoney" value="${ti.siirmoney}"/>
<c:set var="tmoney" value="${ti.siitmoney}"/>
<li class="bid-infom-col-2">
<span class="g9">剩余金额：</span>${ti.siirmoney}0 元
<dl class="bid_progress_bar inline-block-debug ml5">
<dd>
<c:set var="jd" value="${(1-(rmoney/tmoney))*100}"/>
<c:set var="jd2" value="width:${jd}%"/>
<div class="rate-bg1">
<div class="rate-bg2" style="${jd2}">
</div>
</div>
</dd>


<dt><fmt:formatNumber type="number" value="${jd}" pattern="0.00" maxFractionDigits="2"/>%</dt>
</dl>
</li>
<li class="bid-infom-col-1"> 
<span class="g9">还款方式：</span>${ti.siirepayment }
<div class="rel bid_inf_question" id="RepaymentType_05">
<div class="bid_tipbox box_dw" id="boxdw" style="display: none;">
<div class="tips-detail" id="">
<i class="tips-arrow"></i>
<c:if test="${ti.siirepayment=='到期本息'}">
<h2>到期本息：</h2>
<p>
定义：借款人借款到期后一次性返还本金和利息。如：借款金额为X，预期年化利率为Y，借款期限为Z月，则到期后应还总利息计算公式为：X*Y/12*Z，应还本金为X。
</p>
<p>
实例：借款30,000元、期限3个月、预期年化利率10%，则还款安排如下
</p>
<table cellspacing="0" cellpadding="0" border="1">
<tbody>
<tr>
<th>期数</th>
<th>需还利息（元）</th>
<th>需还本金（元）</th>
<th>还款金额（元）</th>
</tr>
<tr>
<td>1</td>
<td>750.00</td>
<td>30,000.00</td>
<td>30,750.00</td>
</tr>
<tr>
<td>合计</td>
<td>750.00</td>
<td>30,000.00</td>
<td>30,750.00</td>
</tr>
</tbody>
</table>
</c:if>
<c:if test="${ti.siirepayment=='等额本息'}">
<h2>等额本息：</h2>
<p>
定义：借款人每月支付等额金额，本金随期限逐渐增加，利息随期限逐渐减少。
</p>
<p>
实例：借款30,000元、期限3个月、预期年化利率10%，还款安排如下
</p>
<table cellspacing="0" cellpadding="0" border="1">
<tbody>
<tr>
<th>期数</th>
<th>需还利息（元）</th>
<th>需还本金（元）</th>
<th>还款金额（元）</th>
</tr>
<tr>
<td>1</td>
<td>250.00</td>
<td>9,917.13</td>
<td>10,167.13</td>
</tr>
<tr>
<td>2</td>
<td>167.36</td>
<td>9,999.77</td>
<td>10,167.13</td>
</tr>
<tr>
<td>3</td>
<td>84.03</td>
<td>10,083,10</td>
<td>10,167.13</td>
</tr>
<tr>
<td>合计</td>
<td>501.39</td>
<td>30,000.00</td>
<td>30,501.39</td>
</tr>
</tbody>
</table>
</c:if>
<c:if test="${ti.siirepayment=='每月付息'}">
<h2>每月付息：</h2>
<p>
定义：借款人每月支付利息，本金到期返还 。如：借款金额为X，预期年化利率为Y，借款期限为Z月，则每月应还利息计算公式为X*Y/12，应还总利息计算公式为：X*Y/12*Z，应还本金为X。
</p>
<p>
实例：借款30,000元、期限3个月、预期年化利率10%，则还款安排如下
</p>
<table cellspacing="0" cellpadding="0" border="1">
<tbody>
<tr>
<th>期数</th>
<th>需还利息（元）</th>
<th>需还本金（元）</th>
<th>还款金额（元）</th>
</tr>
<tr>
<td>1</td>
<td>250.00</td>
<td>0</td>
<td>250.00</td>
</tr>
<tr>
<td>2</td>
<td>250.00</td>
<td>0</td>
<td>250.00</td>
</tr>
<tr>
<td>3</td>
<td>250.00</td>
<td>30,000.00</td>
<td>30,250.00</td>
</tr>
<tr>
<td>合计</td>
<td>750.00</td>
<td>30,000.00</td>
<td>30,750.00</td>
</tr>
</tbody>
</table>
</c:if>
</div>
</div>
</div>
</li>
<li class="bid-infom-col-2">
<span class="g9">保障方式：</span><span class="text-333">适用于第三方担保公司担保</span>
</li>
<li class="bid-infom-col-1">
<span class="g9">剩余时间：</span>
<span id="timeSet" class="timeSet" style="color: block;" enddate="2018/11/01 16:18:41" startdate="2018/10/31 17:51:30" serverdate="2018/11/01 16:18:41">
    <span id="day" class="c_ff7506">0</span>天
    <span id="hour" class="c_ff7506">0</span>时
    <span id="mini" class="c_ff7506">0</span>分
    <span id="sec" class="c_ff7506">0</span>秒
</span>
</li>

<li class="bid-infom-col-2">
<div class="">
<span class="g9">起息日期：</span>
<div class="showtips-box di">
T （满标日） +1天
<span class="lv-we-showtips-box">
<span class="lv-we-showtips lv-showtips-prom" style="display: none; top: -35px;">
满标日指该项目满标当天的日期
<i class="lv-arrow-tip"></i>
</span>
</span>
</div>
</div>
</li>
<li class="bid-infom-col-3">
<span class="g9">投资人条件：</span>风险承受能力"${ti.siiicondition }"及以上
</li>
</ul>
</div>
</div>

<script type="text/javascript">
	var endtime;
	var intDiff;
    var tzmoney=0;
    var	qtmoney=0;
	var sirstate;
	var sirdate;
	var userid;
	var pageNo=1;
	var pageNo2=1;
	var ucavail;
	var sum="";
	var siirmoney=0;
	var siiid;
	var updatermoney;
	var upmoney;
	//我可加入
	var joinin=0;
	//加入金额
	var payamount;
	//预期收益
	//计算回款记录
	//预期收益
	var c1;
	//本息合计
	var c2;
	//月收本息
	var c3;
	//插入回款记录用的字段
	var rrtotal=new Array();
	var rrmoney=new Array();
	var rrinterest=new Array();
	var rrnownum;
	
	
	$(document).ready(function(){
		chushi();
		//获取输入的投资金额
		$("[name='tzmoney']").on('input',function(){
			myfans(this);	
		});
		//剩余时间倒计时
		function timer(intDiff){
    window.setInterval(function(){
    var day=0,
        hour=0,
        minute=0,
        second=0;//时间默认值        
    if(intDiff > 0){
        day = Math.floor(intDiff / (60 * 60 * 24));
        hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
        minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
        second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
    }
    if (minute <= 9) minute = '0' + minute;
    if (second <= 9) second = '0' + second;
    $('#day').html(day);
    $('#hour').html(hour);
    $('#mini').html(minute);
    $('#sec').html(second);
    intDiff--;
    }, 1000);
	} 
		//根据输入的金额计算我可加入，加入金额等属性
		function myfans(list){
		tzmoney=$(list).val();
			tzmoney=parseInt(tzmoney/10)*10;
			siirmoney=$("#siirmoney").val();
			qtmoney=$("span[name='qtid'] ").attr("val");
			siirmoney=parseInt(siirmoney/10)*10;
			qtmoney=$("span[name='qtid'] ").attr("val");
			if(joinin==0){
				$("#payamount").html("0.00");
				$("#payamount2").html("0.00");
				return;
			}else{
				if(joinin>=tzmoney){
					payamount=tzmoney;
					$("#payamount").html(tzmoney+".00");
					$("#payamount2").html(tzmoney+".00");
					calculate();
						if(isNaN(c1)){
							c1=0;
							$("#profit").html(c1+".00");
							$("#profit2").html(c1+".00");
						}else{
						$("#profit").html(c1);
						$("#profit2").html(c1);
						}
				}else{
					payamount=joinin;
					$("#payamount").html(joinin+".00");
					$("#payamount2").html(joinin+".00");
					calculate();
					
					if(isNaN(c1)){
							c1=0;
							$("#profit").html(c1+".00");
							$("#profit2").html(c1+".00");
						}else if(c1==0){
							$("#profit").html(c1+".00");
							$("#profit2").html(c1+".00");
						}else{
							$("#profit").html(c1);
							$("#profit2").html(c1);
						}
							
				}
				
			}
		}
		//还款方式的？号帮助
		$("#RepaymentType_05").hover(function(){
   			 $("#boxdw").show();
    	},function(){
   			 $("#boxdw").hide();
  		});
  		//加10块
		$("#jiek_plus").click(function(){
		if($("#tzmoney").val()>parseInt(joinin)-10){
			$("#tzmoney").val(joinin);
			myfans($("#tzmoney"));
			return;
		}
			$("#tzmoney").val(parseInt(tzmoney)+10);
			myfans($("#tzmoney"));
			
		});
		//确认投资后弹出的DIV
		$("[name='closejy']").click(function(){
			$("#td-atr-layer").hide();
			$("#closeWindowTh").hide();
			window.location.href="${pageContext.request.contextPath}/mini_detail?siiid="+siiid;
		});

		//减10块
		$("#jiek_minus").click(function(){
			if($("#tzmoney").val()>joinin){
				$("#tzmoney").val(joinin);
				myfans($("#tzmoney"));
				return;

			}
			if($("#tzmoney").val()<10){
				$("#tzmoney").val(0.0);
				myfans($("#tzmoney"));
				return;
			}
			$("#tzmoney").val(parseInt(tzmoney)-10);
			myfans($("#tzmoney"));	
		});
		//弹出层加10块
		$("#btnPlus").click(function(){
		if($("#tzmoney2").val()>parseInt(joinin)-10){
			$("#tzmoney2").val(joinin);
			myfans($("#tzmoney2"));
			return;
		}
			$("#tzmoney2").val(parseInt(tzmoney)+10);
			myfans($("#tzmoney2"));
			
		});
		//弹出层减10块
		$("#btnMinus").click(function(){
			if($("#tzmoney2").val()>joinin){
				$("#tzmoney2").val(joinin);
				myfans($("#tzmoney2"));
				return;
			}
			if($("#tzmoney2").val()<10){
				$("#tzmoney2").val(0.0);
				myfans($("#tzmoney2"));
				return;
			}
			$("#tzmoney2").val(parseInt(tzmoney)-10);
			myfans($("#tzmoney2"));	
		});
		//关闭投资的弹出层
		$("#close").click(function(){
			$("#td-art").hide();
			$("#td-atr-layer").hide();
			$("#art-body").hide();
			
		});
		//最大的投资金额
		$("#AllInvest").click(function(){
			$("#tzmoney2").val(joinin);
			myfans($("#tzmoney2"));
		});
		$("#MaxInvest").click(function(){
			$("#tzmoney").val(joinin);
			myfans($("#tzmoney"));
			
		});
	
		//投资-插入交易记录表
		$("#tsimoney").click(function(){
		var usergrade=$("#usergrade").val();
		var siiicondition=$("#siiicondition").val();
			if(siiicondition=="稳健型"&&usergrade=="1"){
				showTips("您未满足投资人条件，请提升评级");
				return;
			}
			tzmoney=$("#tzmoney").val();
			if(joinin==0){
				return;
			}
			if(tzmoney>joinin){
				$("#tzmoney").val(payamount);
				tzmoney=$("#tzmoney").val();
				return;
			}
			$("#td-art").show();
			$("#td-atr-layer").show();
			$("#art-body").show();
			$("#tzmoney2").val(payamount);
			});
			
			$("#tsimoney2").click(function(){
			tzmoney=$("#tzmoney2").val();
			if(tzmoney>joinin){
				$("#tzmoney2").val(payamount);
				
				return;
			}
			calculate();
			var benxi=$(".benxi");
			var benjin=$(".benjin");
			var lixi=$(".lixi");
			for(var i=0;i<benxi.length;i++){
				rrtotal[i]=benxi.eq(i).text();
				rrmoney[i]=benjin.eq(i).text();
				rrinterest[i]=lixi.eq(i).text();
		
				
			}
			if(tzmoney2>payamount){
				$("#tzmoney2").val(payamount);
				return;
			}		
			rrnownum=parseInt($("#moneydata").val());
			tzmoney=$("#tzmoney2").val();
			siirmoney=$("#siirmoney").val();
			qtmoney=$("span[name='qtid'] ").attr("val");
			siiid=$("#siiid").val();
			//alert(qtmoney);
			
			if(tzmoney<qtmoney-0.01){
				
				$("#tzmoney2").val("0.0");
			}else{
				sirstate =formatterDateTime(new Date());
				sirdate=new Date();
			//	alert(qtmoney);
				userid=$("#userid").val();
				ucavail=$("#ucavail").val();
				//alert("666");
				if(parseInt(ucavail)-parseInt(tzmoney)<0){
					
					return;
				}else{
				ucavail=parseInt(ucavail)-parseInt(tzmoney);
				if(tzmoney%10>0){
					$("#tzmoney2").val(payamount);
					tzmoney=$("#tzmoney2").val();
					return;
				}
					if(confirm("确定投资该项目?")){
					myAjax();
					}
				}
				}
			
			
			//alert(sirstate);
			//alert("666");
		});
		//初始化，显示数据
		function chushi(){ 
		siiid=$("#siiid").val();
		var nowtime=$("#nowtime").html();
		var siiresidue=$("#siiresidue").html();
		var date1 = new Date(nowtime);
		var date2 = new Date(siiresidue);
		endtime=date2-date1;
		intDiff = parseInt(endtime/1000);
		var siistate=$("#siistate").val();
		if(siistate=='发布中'){
			if(intDiff<0){
				$("#timeSet").html("已结束");
			}else{
				timer(intDiff);
			}
		}else{
			$("#timeSet").html("已结束");
		}
		siiid=$("#siiid").val();
			myAjax2();
			myAjax3();
			tzmoney=$("#tzmoney").val();
			siirmoney=$("#siirmoney").val();
			siirmoney=parseInt(siirmoney/10)*10;
			qtmoney=$("span[name='qtid'] ").attr("val");
			ucavail=$("#ucavail").val();
			ucavail=parseInt(ucavail/10)*10;
			if(ucavail<qtmoney){
				$("#joinin").html("我可加入：0.00元");
			}else{
				if(ucavail>=siirmoney){
					joinin=siirmoney;
					$("#joinin").html("我可加入："+siirmoney+".0元");
				}else{
					joinin=ucavail;
					$("#joinin").html("我可加入："+ucavail+".0元");
				}
				
			}
			$("#joinin2").html(joinin+".0元");
		}
		//Date类型时间转换
		function formatterDateTime(date) {
        var datetime = date.getFullYear()
                + "-"// "年"
                + ((date.getMonth() + 1) > 10 ? (date.getMonth() + 1) : "0"
                        + (date.getMonth() + 1))
                + "-"// "月"
                + (date.getDate() < 10 ? "0" + date.getDate() : date
                        .getDate())
                + " "
                + (date.getHours() < 10 ? "0" + date.getHours() : date
                        .getHours())
                + ":"
                + (date.getMinutes() < 10 ? "0" + date.getMinutes() : date
                        .getMinutes())
                + ":"
                + (date.getSeconds() < 10 ? "0" + date.getSeconds() : date
                        .getSeconds());
        return datetime;
    }
		
		//ajax 日期转换
		function changeDateFormat(d) {
		//alert(d);
 		//将时间戳转为int类型，构造Date类型（这里存疑:时间戳这一大串数字是表示的毫秒数吗？）
 		var date = new Date(parseInt(d.time, 10));
 		//月份得+1，且只有个位数时在前面+0
 		var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1): date.getMonth() + 1;
 		//日期为个位数时在前面+0
		 var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
 		var hour = date.getHours()< 10 ? "0" + date.getHours() :   date.getHours();
 		var min = date.getMinutes()< 10 ? "0" + date.getMinutes() : date.getMinutes();
        var sec = date.getSeconds()< 10 ? "0" + date.getSeconds() : date.getSeconds();
        //getFullYear得到4位数的年份 ，返回一串字符串

    return date.getFullYear() + "/" + month + "/" + currentDate+" "+hour + ":" + min + ":" + sec;

    }
		function myAjax(){
		$.ajax({
			     "url":"${pageContext.request.contextPath}/AddTSiReCord", 
			     "type":"post", 
			     "data":{"userid":userid,"drdate":sirstate,"drdtype":"3","drexpenditure":tzmoney,
			     "drincome":"0.0","drbalance":ucavail,"drexplain":"散标投资","qtmoney":updatermoney,"upmoney":upmoney,
			     "siiid":siiid,"sirinmoney":tzmoney,"sirdate":sirdate,"rrdate":sirdate,"tzmoney":tzmoney,
			     "rrtotal":rrtotal,"rrmoney":rrmoney,"rrinterest":rrinterest,"rrnownum":rrnownum,"sirreinst":c1}, 
			     "dataType":"json", 
			    "traditional": true,
			     "success":function(page) { 
			    	$("#td-art").hide();
					$("#art-body").hide();			
			     	$("#closeWindowTh").show();
			     	var siititle=$("#siititle").val();
			     	if(page.qtmoney==0){
			     		
			     		myAjax4();
			     	}
              		$("#body_dv_head2").html(siititle+"投标成功！");
              		after();
				  },
			      "error":function() { 
			      	 alert("请求失败");
				  }
			});
	
	}
	
	var i=5;
	function after(){
    $("#djs").html(i+"s");
    i=i-1;
    setTimeout(function(){
        after();
        if(i==-1){
        	 window.location.href="${pageContext.request.contextPath}/mini_detail?siiid="+siiid;
        }
    },1000);
}
	function myAjax4(){
			$.ajax({
				     "url":"${pageContext.request.contextPath}/updatelists", 
				     "type":"post", 
				     "data":{"siiid":siiid}, 
				     "dataType":"json", 
				    "traditional": true,
				     "success":function() { 
					  },
				      "error":function() { 
				      	 alert("请求失败");
					  }
				});
		
		}
	function myAjax2(){
		$.ajax({
			     "url":"${pageContext.request.contextPath}/TSiRecordAjaxBySiiid", 
			     "type":"post", 
			     "data":{"siiid":siiid,"pageNo":pageNo}, 
			     "dataType":"json", 
			     "success":function(page) { 
			   		 var pages=$("#divfqbaolist");
			     	pages.empty();
					pages.append("<div id=\"pagination\" class=\"pagination\"></div>");
					var pagination=$("#pagination");
			     	pagination.empty();
			     	if(page.pageNo==1){
			     	pagination.append("<span class=\"current prev\">上一页</span>");
			     	}else if(page.pageNo>1){
			     		pagination.append("<a href=\"javascript:void(0);\" class=\"prev\">上一页</a>");
			     	}	
					for(var i=1;i<=page.totalPage;i++){
					
					if(page.pageNo==i){
						pagination.append("<span  class=\"current\">"+i+"</span>");
					}else{
						pagination.append("<a href=\"javascript:void(0);\" class=\"pageNo\">"+i+"</a>");
					}
					}
					if(page.pageNo>=page.totalPage){
						pagination.append("<span class=\"current next\">下一页</span>");
					}
					if(page.pageNo<page.totalPage){
						pagination.append("<a  href=\"javascript:void(0);\" class=\"next\">下一页</a>");
					}
					$("#tzrs").html(page.totalCount+"人");
					
					pagination.append("<div id=\"godiv\"  class=\"godiv\"></div>");
			     	var godiv=$("#godiv");
			     	godiv.empty();
					godiv.append("<input id=\"num\" class=\"input-val page-text\" type=\"text\""
					+" style=\"height:80px;\" placeholder=\"跳转页数\">"
					+"<input id=\"tiaozhuan\" class=\"gobtn page-btn\" type=\"button\" value=\"\" style=\"\"\> ");
			     	$("#tiaozhuan").css({"color":"#BEBEBE"});
			     	$("#tiaozhuan").mouseover(function () {
 					 $(this).css("color","#FFFFFF");});
  					$("#tiaozhuan").mouseout(function () {
 					 $(this).css("color","#BEBEBE");});
			     	if(page.totalPage<=1||page.totalPage==null){
			     		$("#divfqbaolist").css("display","none");
			     	}else{
			     		$("#divfqbaolist").css("display","block");
			     	}
			 	   	
			     	var list=$("#tsiRecordList");
			     	list.empty();
			     	list.append(""
			     	+"<tr id=\"Subscribelist\">"
					+"<th style=\"width: 60px;\">序号"
					+"</th>"
					+"<th style=\"width: 20%;\">投标人"
					+"</th>"
					+"<th style=\"width: 20%;\">投标金额"
					+"</th>"
					+"<th style=\"width: 25%;\">投标方式"
					+"</th>"
					+"<th>投标时间"
					+"</th>"
					+"</tr>");
			     	var lists=$("#Subscribelist");
			     	//if(result==""||result.length==1){
			     //		$("#inv-list-1").css("display","block");
			     //	}else{
			     //		$("#inv-list-1").css("display","none");
			     //	}
			   	
					var result=page.list;
					var data="";
			     	for(var i=0;i<result.length;i++){
			     		//alert(result.length);
			     	//var style=i%2==0?"background-color: #F7F7F7":"";
			     	var phone=result[i].tUserData.phone.substring(0, 3) + "****" + result[i].tUserData.phone.substring(7, 11);
			     	var sirdate=changeDateFormat(result[i].sirdate);
			     		data+="<tr><td>"+(i+1+pageNo*10-10)+"</td>"
						+"<td>"+phone+"</td>"
						+"<td><span class=\"c_ff6600\">￥"+result[i].sirinmoney+".00</span></td>"
						+"<td><img src=\"images/icon_toubiao_pc.png\"></td>"
						+"<td>"+sirdate+"</td></tr>";
              		 }
              		 
              		// alert(data);
              		lists.after(data);
				  },
			      "error":function() { 
			      	 alert("请求失败");
				  }
			});
	
	}
	
	
	function myAjax3(){
		$.ajax({
			     "url":"${pageContext.request.contextPath}/TReceRecordAjax", 
			     "type":"post", 
			     "data":{"siiid":siiid,"pageNo":pageNo2}, 
			     "dataType":"json", 
			     "success":function(page) { 
			    
			   		 var pages=$("#divfqbaolist2");
			     	pages.empty();
					pages.append("<div id=\"pagination2\" class=\"pagination\"></div>");
					var pagination=$("#pagination2");
			     	pagination.empty();
			     	if(page.pageNo==1){
			     	pagination.append("<span class=\"current prev\">上一页</span>");
			     	}else if(page.pageNo>1){
			     		pagination.append("<a href=\"javascript:void(0);\" class=\"prev\">上一页</a>");
			     	}	
					for(var i=1;i<=page.totalPage;i++){
					
					if(page.pageNo==i){
						pagination.append("<span  class=\"current\">"+i+"</span>");
					}else{
						pagination.append("<a href=\"javascript:void(0);\" class=\"pageNo2\">"+i+"</a>");
					}
					}
					if(page.pageNo>=page.totalPage){
						pagination.append("<span class=\"current next\">下一页</span>");
					}
					if(page.pageNo<page.totalPage){
						pagination.append("<a  href=\"javascript:void(0);\" class=\"next\">下一页</a>");
					}
					//alert("666");
					pagination.append("<div id=\"godiv2\" class=\"godiv\"></div>");
			     	var godiv=$("#godiv2");
			     	godiv.empty();
					godiv.append("<input id=\"num2\" class=\"input-val page-text\" type=\"text\""
					+" style=\"height:80px;\" placeholder=\"跳转页数\">"
					+"<input id=\"tiaozhuan2\" class=\"gobtn page-btn\" type=\"button\" value=\"\" style=\"\"\> ");
			     	$("#tiaozhuan2").css({"color":"#BEBEBE"});
			     	$("#tiaozhuan2").mouseover(function () {
 					 $(this).css("color","#FFFFFF");});
  					$("#tiaozhuan2").mouseout(function () {
 					 $(this).css("color","#BEBEBE");});
			     	if(page.totalPage<=1||page.totalPage==null){
			     		$("#divfqbaolist2").css("display","none");
			     	}else{
			     		$("#divfqbaolist2").css("display","block");
			     	}
			     	var list=$("#tReceRecord");
			     	list.empty();
			     	list.append(""
			     	+"<tr id=\"subscribedetaillist\">"
					+"<th style=\"width: 60px;\">序号"
					+"</th>"
					+"<th style=\"width: 20%;\">还款日期"
					+"</th>"
					+"<th style=\"width: 20%;\">还款金额"
					+"</th>"
					+"<th>本金+利息"
					+"</th>"
					+"<th style=\"width: 20%;\">还款状态"
					+"</th>"
					+"</tr>");
			     	var lists=$("#subscribedetaillist");
			     	//if(result==""||result.length==1){
			     //		$("#inv-list-1").css("display","block");
			     //	}else{
			     //		$("#inv-list-1").css("display","none");
			     //	}
			   	
					var result=page.list;
					var data="";
					if(result.length<1){
						data+="<div class=\"daihou-nodata\" >暂无相关信息，请稍后查看...</div>";

					}
			     	for(var i=0;i<result.length;i++){
			     		//alert(result.length);
			     	//var style=i%2==0?"background-color: #F7F7F7":"";
			     	var rrdate=result[i].rrdate;
			     		data+="<tr><td>"+(i+1+pageNo*10-10)+"</td>"
						+"<td>"+rrdate+"</td>"
						+"<td><span class=\"c_ff6600\">￥"+result[i].rrtotal+".00</span></td>"
						+"<td>￥"+result[i].rrmoney+"+￥"+result[i].rrinterest+"</td>"
						+"<td>未还款</td></tr>";
              		 }
           
              		// alert(data);
              		lists.after(data);
				  },
			      "error":function() { 
			      	 alert("请求失败");
				  }
			});
	
	}
		//跳转功能
		$(document).on("click","#tiaozhuan",function(){
			var num=$("#num").val();
			var size=$("#pagination").children("a");
			for(var i=0;i<size.length;i++){
				if(num!=size.eq(i).text()){
					pageNo=1;
				}else{
					pageNo=num;
					break;
				}
			}
			myAjax2();
		});
			//跳转功能2
		$(document).on("click","#tiaozhuan2",function(){
			var num=$("#num2").val();
			var size=$("#pagination2").children("a");
			for(var i=0;i<size.length;i++){
				if(num!=size.eq(i).text()){
					pageNo2=1;
				}else{
					pageNo2=num;
					break;
				}
			}
			myAjax3();
		});	
		//遮挡层显示
       function showTips(msg) {
            publicUi.tdPopAlert({
                id:'popAlert1',
                type:'toast',
                title:'',
                contents:'<br><br><p class="text-333" style="color:#333;font-size:16px">'+msg+'</p>',
                TextAlign:'center',
                width:320,
                height:'100'
            });
        }
		//获取pageNo事件
		$(document).on("click","#pagination a",function(){
			
			var pg=$(this).text();
			if(pg!=null||pg!=""){
			if(pg=="上一页"){
				pageNo=parseInt(pageNo)-1;
			}else if(pg=="下一页"){
				pageNo=parseInt(pageNo)+1;
				
			}else{
				pageNo=pg;
				
			}
			}
			myAjax2();
		});
		//获取pageNo2事件
		$(document).on("click","#pagination2 a",function(){
			
			var pg=$(this).text();
			if(pg!=null||pg!=""){
			if(pg=="上一页"){
				pageNo2=parseInt(pageNo2)-1;
			}else if(pg=="下一页"){
				pageNo2=parseInt(pageNo2)+1;
				
			}else{
				pageNo2=pg;
				
			}
			}
			myAjax3();
		});
		
		Number.prototype.toFixed2 = function () {
   				 return parseFloat(this.toFixed(2).toString().replace(/(\.\d{2})\d+$/, "$1"));
		};
		//计算回款记录的相关数据
function calculate() {
   // alert("666");
    var amount = payamount; //获取投资金额	
    var apr = $("#toolrate"); //获取年利率
    var mons = $("#moneydata"); //获取投资期限
	//alert(amount);
    var type = initTypeCode(); //获取投资期限类型  1日，2月
	updatermoney=siirmoney-tzmoney;
	upmoney=parseInt($("#ucavail").val())-tzmoney;
    // getValue  还款方式
    
    var principal = parseFloat(amount); //返回一个金额浮点数
    var interest = parseFloat(apr.val()) / 100 / 12; //parseFloat(apr.val()) / 100 / 12; //每月利率
    var payments = parseInt(mons.val()); //投资期限
	//alert(payments);
    //var c1, c2, c3;
    
    var str = "<tr><th>期数</th><th>回款本息</th><th>回款本金</th><th>利息</th><th>待收本息</th></tr>";
	var getValue=$("#repayment").val();
	//alert(getValue);
	//var getValue="到期本息";
    if (getValue == "每月付息") {

        if (parseInt(payments) == 1) {
            $("#c1").html((principal * interest * payments).toFixed2());
            $("#c2").html(((principal * interest * payments) + principal).toFixed2());   //本息合计
            $("#c3").html(((principal * interest * payments) + principal).toFixed2());

            c1 = (principal * interest * payments).toFixed2();
            c2 = ((principal * interest * payments) + principal).toFixed2();
            c3 = ((principal * interest * payments) + principal).toFixed2();
        } else {
            $("#c1").html((principal * interest * payments).toFixed2());
            $("#c2").html(((principal * interest * payments) + principal).toFixed2());   //本息合计
            $("#c3").html((principal * interest).toFixed2());

            c1 = (principal * interest * payments).toFixed2();
            c2 = ((principal * interest * payments) + principal).toFixed2();
            c3 = (principal * interest).toFixed2();
        }

        var mon = 0;
        for (var j = 1; j < parseInt(payments) + 1; j++) {
            if (j == parseInt(payments)) {
                mon = principal;    //最后一期还款的本金
            }

            str += "<tr>";
            str += "<td class='qishu'>" + (j) + "</td>";//期数
            if (j == parseInt(payments))
            {
                str += "<td class='benxi'>"  + (principal+(c1-(principal * interest).toFixed2()*(j-1)).toFixed2())+ "</td>"; //每期回款本息
                str += "<td class='benjin'>"  + (mon).toFixed2() + "</td>"; //每期回款本金
                str += "<td class='lixi'>"  + (c1 - (principal * interest).toFixed2()*(j-1)).toFixed2() + "</td>"; //利息
                str += "<td class='daishou'>" + "0</td>"; //余额
            } else {
                str += "<td class='benxi'>"  + (principal * interest + mon).toFixed2() + "</td>"; //每期回款本息
                str += "<td class='benjin'>"  + (mon).toFixed2() + "</td>"; //每期回款本金
                str += "<td class='lixi'>"  + (principal * interest).toFixed2() + "</td>"; //利息
                str += "<td class='daishou'>"  + (c2 - (principal * interest).toFixed2()*(j)).toFixed2() + "</td>"; //余额
            }
            str += "</tr>";
        }
        $(".mt25").html(str);

    } else if (getValue == "到期本息") {
			var type=2;
        if (type == 1) {  //天数

            str += "<tr>";
            str += "<td class='qishu'>" + 1 + "</td>";//期数	
            str += "<td class='benxi'>"  + (parseFloat((principal * parseFloat(apr.val()) * 0.01 * payments / 365)) + principal).toFixed2() + "</td>"; //	每期还款本息
            str += "<td class='benjin'>"  + (principal).toFixed2() + "</td>"; //每期还款本金
            str += "<td class='lixi'>"  + (principal * parseFloat(apr.val()) * 0.01 * payments / 365).toFixed2() + "</td>"; //利息
            str += "<td class='daishou'>" + "0.00</td>"; //余额
            str += "</tr>";
			
            $(".mt25").html(str);

            $("#c1").html((principal * parseFloat(apr.val()) * 0.01 * payments / 365).toFixed2());
            $("#c2").html((parseFloat((principal * parseFloat(apr.val()) * 0.01 * payments / 365)) + parseFloat(principal)).toFixed2());   //本息合计
            $("#c3").html("--");

            c1 = (principal * parseFloat(apr.val()) * 0.01 * payments / 365).toFixed2();
            c2 = (parseFloat((principal * parseFloat(apr.val()) * 0.01 * payments / 365)) + parseFloat(principal)).toFixed2();
            c3 = 0.00;

        } else if (type == 2) {

            str += "<tr>";
            str += "<td class='qishu'>" + 1 + "</td>";//期数	
            str += "<td class='benxi'>"  + ((principal * interest * payments) + principal).toFixed2() + "</td>"; //	每期还款本息
            str += "<td class='benjin'>"  + (principal).toFixed2() + "</td>"; //每期还款本金
            str += "<td class='lixi'>"  + (principal * interest * payments).toFixed2() + "</td>"; //利息
            str += "<td class='daishou'>" + "0.00</td>"; //余额
            str += "</tr>";

            $(".mt25").html(str);

            $("#c1").html((principal * interest * payments).toFixed2());
            $("#c2").html(((principal * interest * payments) + principal).toFixed2());   //本息合计
            $("#c3").html("--");

            c1 = (principal * interest * payments).toFixed2();
            c2 = ((principal * interest * payments) + principal).toFixed2();
            c3 = 0.00;
        }

    } else if (getValue == "等额本息") {
       // alert("zz");
       
        var monthRate = interest;
     
        var tempAmount = 0.00, tempInterestAmount = 0.00, tempAmountAndInterest = 0.00, totalInterest = 0.00, totalAmount = 0.00; interestAmount = 0.00;
        var index = 1;
        interestAmount = GetInterest(principal, payments, apr.val());
        while (index <= payments) {
            tempAmount = Number(principal * monthRate * Math.pow(1 + monthRate, index - 1) / (Math.pow(1 + monthRate, payments) - 1)).toFixed(2);
            tempAmountAndInterest = Number(principal * monthRate * Math.pow(1 + monthRate, payments) / (Math.pow(1 + monthRate, payments) - 1)).toFixed(2);
            tempInterestAmount = Number(tempAmountAndInterest - tempAmount);
            if (index == payments) {
                tempAmount = (Number(principal) - Number(totalAmount)).toFixed(2);
                tempInterestAmount = Number(tempAmountAndInterest - tempAmount);
            }
            totalInterest += Number(tempInterestAmount);
           
            totalAmount += Number(tempAmount);
            str += "<tr>";
            str += "<td class='qishu'>" + (index) + "</ td>";//期数	
            str += "<td class='benxi'>"  + (Number(tempAmountAndInterest)).toFixed2() + "</ td>"; //	每期还款本息
            str += "<td class='benjin'>"  + (Number(tempAmount)).toFixed2() + "</ td>"; //每期还款本金
            str += "<td class='lixi'>"  + (Number(tempInterestAmount)).toFixed2() + "</ td>"; //利息
            
            if (index == payments) {
                str += "<td class='daishou'>" + "0.00</ td>"; //余额
            } else {
                str += "<td class='daishou'>"  + (interestAmount + principal - Number(tempAmountAndInterest * index)).toFixed2() + "</ td>"; //余额
            }
            str += "</tr>";
            index++;
        }
        interestAmount = ((Number(totalInterest) * 100) / 100); //总利息

        $(".mt25").html(str);

        $("#c1").html(interestAmount.toFixed2());
        $("#c2").html((Number(interestAmount) + principal).toFixed2());   //本息合计
        $("#c3").html((Number(tempAmountAndInterest)).toFixed2());

        c1 = interestAmount.toFixed2();
        c2 = (Number(interestAmount) + principal).toFixed2();
        c3 = Number(tempAmountAndInterest).toFixed2();
    }
	
    
}
$("loginsa").click(function(){
	 window.location.href="${pageContext.request.contextPath}/login";
})
function count(cc1,cc2,cc3) {
    var c1 = new CountUp("c1", 0, cc1, 2, 1, options);
    var c2 = new CountUp("c2", 0, cc2, 2, 1, options);
    var c3 = new CountUp("c3", 0, cc3, 2, 1, options);
    c1.start();
    c2.start();
    c3.start();
}

//解决js计算bug
function accDiv(arg1, arg2) {
    var t1 = 0, t2 = 0, r1, r2;
    try { t1 = arg1.toString().split(".")[1].length } catch (e) { }
    try { t2 = arg2.toString().split(".")[1].length } catch (e) { }
    with (Math) {
        r1 = Number(arg1.toString().replace(".", ""))
        r2 = Number(arg2.toString().replace(".", ""))
        return (r1 / r2) * pow(10, t2 - t1);
    }
}


function GetInterest(amount, deadline, interestRate) {
//alert("666"+amount);
//alert(deadline);
//alert(interestRate);
    var interestAmount = 0.00;
    if (amount == "" || amount == "0" || deadline == "" || deadline == "0" || interestRate == "" || interestRate == "0")
        return interestAmount;

    var monthRate = interestRate * 0.010000000000 / 12.00;
    var tempAmount = 0.00, tempInterestAmount = 0.00, tempAmountAndInterest = 0.00, totalInterest = 0.00, totalAmount = 0.00;
    var index = 1;
    while (index <= deadline) {
        tempAmount = Number(amount * monthRate * Math.pow(1 + monthRate, index - 1) / (Math.pow(1 + monthRate, deadline) - 1));
        tempAmountAndInterest = Number(amount * monthRate * Math.pow(1 + monthRate, deadline) / (Math.pow(1 + monthRate, deadline) - 1));
        tempInterestAmount = Number(tempAmountAndInterest - tempAmount);
        if (index == deadline) {
            tempAmount = (Number(amount) - Number(totalAmount));
            tempInterestAmount = Number(tempAmountAndInterest - tempAmount);
        }
        totalInterest += Number(tempInterestAmount);
        totalAmount += Number(tempAmount);
        index++;
    }
    interestAmount = Number(((Number(totalInterest) * 100) / 100));

    return interestAmount;
}


	
		
		
    
    function showLine() {
    $(".payment").find('tr:even').css({
        'background': "#f7f7f7"
    });

}
	
	});
</script>
<!-- HIDDEN -->
						<input type="text" id="siirepayment" name="siirepayment" value="${tsi.siirepayment }"  hidden/>
						<input id="usergrade" value="${user.usergrade }" hidden/>
						<input id="siiicondition" value="${ti.siiicondition }" hidden/>
						<input id="userid" value="${user.userid }" hidden/>
						<input id="ucavail" value="${ta.ucavail }" hidden/>
						<input id="siirmoney" value="${ti.siirmoney}" hidden/>
						<input id="siiid" value="${ti.siiid}"hidden/>
						<input id="toolrate" value="${ti.siiairate}" hidden/>
						<input id="moneydata" value="${ti.siireturn}" hidden/>
						<input id="repayment" value="${ti.siirepayment }" hidden/>
						<input id="siistate" value="${ti.siistate }" hidden/>
						<input id="siititle" value="${ti.siititle }" hidden/>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<div id="nowtime" style="display: none;">${now}</div>
<div id="siiresidue" style="display: none;">${ti.siiresidue}</div>
<div class="bid_inf_right" style="height: auto;">
<c:if test="${ti.siistate!='发布中'}">
<div class="bid_inf_right" style="height: auto;">
<div class="bid_finish">
<p class="pl10">
<c:if test="${ti.siistate=='已满标'}">
<img src="images/finish2.png">
</c:if>
<c:if test="${ti.siistate=='已完成'}">
<img src="images/finish1.png">
</c:if>
<c:if test="${ti.siistate=='已流标'}">
<div class="bid_finish">
				<p class="pl10">
				<img src="images/finish4.png">
				</p>
				</div>
</c:if> 
</p>
<c:if test="${ti.siistate!='已流标'}">
<p class="pl10 c_484848">
<span class="c_999" id="finishtime">完成时间：</span><span ><fmt:formatDate value="${ti.siifinishtime }" pattern="yyyy-MM-dd hh:mm"/><br></span>
<span class="c_999">出借次数：</span><span id="tzrs">次</span>
</p>
</c:if>
</div>
</div> 
</c:if>

				<c:if test="${ti.siistate=='发布中'}">
				<c:if test="${now>ti.siiresidue }">
				<div class="bid_finish">
				<p class="pl10">
				<img src="images/finish3.png">
				</p>
				<p class="pl10 c_484848">
<span class="c_999">出借次数：</span><span id="tzrs">次</span>
</p>
</div>
				</c:if>
				<c:if test="${now<ti.siiresidue }">
				<div id="recharge-art" style="height: auto;">
					<div class="right">
					<c:if test="${user.userid!=null&&user.userid!=''}">
					<p>可用余额：${ta.ucavail }元</p>
					<p id="joinin">我可加入：0.00元 </p>
						<a href="Recharge" class="charge">去充值</a>
					</c:if>
					<c:if test="${user.userid==null||user.userid==''}">
					<a class="charge" href="${pageContext.request.contextPath}/login">立即登录</a>
					<p>可用余额：<span class="fc9" style=''color: #999;"> 登录后可显示余额</span></p>
					<p>我可加入：0.00元 </p>
					</c:if>
						<p>
							加入金额：<span class="font-orange font-bold" id="payamount">0.00</span><span style="color: #ff7800 !important; font-weight: bold !important;">元</span>
						</p>
						<p>
							预期收益：<span class="font-orange font-bold" id="profit">0.00</span><span style="color: #ff7800 !important; font-weight: bold !important;">元</span>
						</p>
						<p>可用余额：${ta.ucavail }元</p>
						<div class="invent-form">
							<div class="form-box">
								<input id="tzmoney" name="tzmoney" value="1" type="text" class="input-text" maxshares="0.00">元
							</div>
							<i class="top" id="jiek_plus"></i><i class="bottom" id="jiek_minus"></i>
							<a id="MaxInvest" href="javascript:void(0);" >全额</a>
						</div>
						<div class="money-errmes">
							输入金额只能为起投金额的整数倍，已为您自动调整
						</div>
						<a href="javascript:void(0);" <c:if test="${user.userid!=null&&user.userid!=''}"> id="tsimoney"</c:if> zqzrid="1" class="invent-btn invent-btn-1" attrid="E702EB95-66F6-41C4-A350-E0FB0674F3EB" istran="true">确认投资</a>
						<div class="agreement">
							<label>
<input id="ckbAgree" type="checkbox" checked="checked">
我已阅读并同意</label>
							<a class="text-yellow" href="#" target="_blank">《债权转让协议》</a>
							<a class="text-yellow" href="#" target="_blank">《风险揭示书》</a>
						</div>
					</div>
				</div>
				</c:if>
				</c:if>
			</div>
			
		</div>
</div>
<div id="td-art" style="margin-left: -309px;display: none;" class="z101">
<div id="art-body" class="art-body" style="display: none;">
<i id="close" class="close icons close-x icon abs" style="top: -30px; right: -32px;"></i>
<div id="recharge-art" class="recharge-art">
<div class="left" style="height: 303px;">
<p id="art_UserName">承接人：${ti.siititle}</p>
<p id="art_ProjectAmount">计划金额：${ti.siitmoney }元</p>
<p id="art_ReTime">计划期限：${ti.siireturn }个月</p>
<p id="art_Rate">预期年化利率：${ti.siiairate }%</p>
<p id="txtLowerUnit">最低出借：${ti.siismoney}元</p>
<p id="art_ReType">结清方式：${ti.siirepayment }</p>
<div class="reward" id="art_PublicRate" style="display: none;">
<p>
<i class="i-1"></i>发标人投标奖励【无】
</p>
<p class="padding-bottom-0">
<i class="i-2"></i>团贷网投标奖励【无】
</p>
</div>
</div>
<div class="right">
<a rel="nofollow" href="javascript:;" onclick="checkRecharge();" class="charge recharge-flag">去充值</a>
<p>
可用余额：<span class="font-000" id="art_UserFund">${ta.ucavail }元</span>
</p>
<p id="txtMaxUnit1">我可加入：<span class="font-000" id="joinin2">0.00元</span></p>
<p>
<span id="txtInvestAmountWord">加入金额</span>：<span class="font-orange font-bold" id="payamount2">0.00</span><span style="color: #ff7800 !important; font-weight: bold !important;">元</span>
</p>
<p id="p_Expected">
预期收益：<span class="font-orange font-bold" id="profit2">0.00</span><span style="color: #ff7800 !important; font-weight: bold !important;">元</span>
<span id="spPrizeInterest" style="display:none;"><b class="font-orange font-bold">+</b><span class="hongbao-jx font-orange font-bold">0.00</span>元</span>
</p>
<div class="invent-form">
<div class="form-box">
<input type="text" class="input-text autoinput" name="tzmoney" id="tzmoney2" value="1" maxlength="10" onpaste="return false" oncontextmenu="return true" oncopy="return false" oncut="return false" data-input="true">元
</div>
<i class="top" id="btnPlus" attrid="0" rewardamount="0"></i><i class="bottom" id="btnMinus"></i>
<a href="javascript:void(0)" id="AllInvest">全额</a>
</div>
<div class="invent-form" style="margin-top: 15px; margin-bottom: 35px; height: 16px; line-height: 16px; display: none;" id="dCode">
<input type="text" placeholder="请输入手机验证码" id="MobileCode" style="height: 33px; line-height: 33px; padding-left: 12px; border: 1px solid #d5d5d5; width: 195px; border-radius: 3px; -webkie-border-radius: 3px;">
<a href="javascript:void(0)" id="GetCode">发送验证码</a>
</div>
<div id="redpackform"><div class="select-redbox"><div class="rel select-menu"><span class="dynamic_red"></span><span class="value" id="redValue" prizeid="">无适用优惠券</span><i class="arrow"></i><ul style="display: none;">    <li prizeid="" prizetype="0">不使用优惠券</li><li prizeid="1D01C8BF-98DC-496C-9F2E-F1E8D7B219E7" prizetype="2" prizevalue="150" class="noSelect gray li-auto li-auto">150元，满30000使用，11月25日过期<div class="sm"><span class="ts-gray-icon"></span>不适用于分期宝使用</div></li><li prizeid="2C9E34F2-D78A-4084-9778-07764BBC1650" prizetype="2" prizevalue="80" class="noSelect gray li-auto li-auto">80元，满16000使用，11月25日过期<div class="sm"><span class="ts-gray-icon"></span>不适用于分期宝使用</div></li><li prizeid="61495344-6BDD-427F-82F2-F4AAEDD1B114" prizetype="2" prizevalue="50" class="noSelect gray li-auto li-auto">50元，满10000使用，11月25日过期<div class="sm"><span class="ts-gray-icon"></span>不适用于分期宝使用</div></li><li prizeid="86B9FA93-1750-47CA-A910-76D71AF67EAA" prizetype="2" prizevalue="20" class="noSelect gray li-auto li-auto">20元，满4000使用，11月25日过期<div class="sm"><span class="ts-gray-icon"></span>不适用于分期宝使用</div></li></ul> </div></div></div>
<div id="jd-ecard" style="display: none">
<div class="jd-ecard-box">
<div class="jd-ecard-tit">
<span class="tdw-icons ecard-icon"></span>
<span class="ecard-value" id="ecardValue"></span>
<i class="arrow"></i>
</div>
<ul>
</ul>
</div>
</div>
<div class="money-errmes">
输入金额只能为最低出借的整数倍，已为您自动调整
</div>
<a target="_blank" class="invent-btn" id="tsimoney2" style="cursor:pointer;" projectid="6FD166F2-E455-459B-8E3E-2AF42EF2D735" attr_expected="0" attr_commission="0">确认投资</a>
<input type="hidden" id="hiDeadline" value="36">
<input type="hidden" id="hiInterestRate" value="12.5">
<input type="hidden" id="hiRepaymentType" value="5">
<input type="hidden" id="hiProjectType" value="59">
<input type="hidden" id="hiUnit" value="10">
<input type="hidden" id="txtPublicRate" value="0">
<input type="hidden" id="txtTuandaiRate" value="0">
<input type="hidden" id="hiNeedPassWord" value="true">
<input type="hidden" id="hiTotalInvest ">
<input type="hidden" id="hiCanGetPackage ">
<input type="hidden" id="hiNeedInvest ">
<input type="hidden" id="hiIsNewUser ">
<input type="hidden" id="hiIsAwardOverdue ">
<input type="hidden" id="hiAreaInvest ">
<input type="hidden" id="hiIsScribeTanfer" value="false">
<input type="hidden" id="hiProjectDeadline" value="36">
<input type="hidden" id="hiNewHandRate" value="0">
<input type="hidden" id="hiHQBAmount" value="0">
<input type="hidden" id="hiDeadType" value="1">
<div class="agreement f12  font-666" id="AgreeDiv"><label><input type="checkbox" id="ckbInvestAgree" checked="checked">我已阅读并同意</label><a class="font-orange" href="//contract.tuandai.com/p2p/web/contractType59.html" target="_blank">《借款合同》</a></div>
</div>
</div>
</div>
</div>





<div id="td-atr-layer" class="z100" style="display: none;"></div>
<div class="bid_invest_nav" style="position: static; top: 0px; left: 0px;">
<ul>
<li><a class="n1 bid_nav bid_nav2 n1-selected" onclick="getTager('.a1');" href="javascript:void(0);">风控信息</a></li>
<li><a class="n2 bid_nav bid_nav2" onclick="getTager('.a2');" href="javascript:void(0);">借款人信息</a></li>
<li><a class="n3 bid_nav bid_nav2" onclick="getTager('.a3');" href="javascript:void(0);">投标记录</a></li>
<li><a class="n4 bid_nav bid_nav2" onclick="" href="javascript:void(0);">还款记录</a></li>
<li><a class="n5 bid_nav bid_nav2" id="test12" onclick="" href="javascript:void(0);">贷后追踪</a></li>
<li><a class="n6 bid_nav bid_nav2" onclick="" href="javascript:void(0);">产品介绍</a></li>
</ul>
</div>
<div class="bid_ensure_box clearfloat a1" id="a1" name="a1" style="margin-top: 0px;display:none;">
<div class="profit-count profit-count2">
            <h3>计算结果：<span class="g9 f14">（收益仅供参考，实际收益以最终出借结果为准！）</span></h3>
            <ul class="result cl fix">
                <li>
                    <p>预期收益</p>
                    <p class="num"><span id="c1">0</span><span class="g9 f14">元</span></p>
                </li>
                <li>
                    <p>本息合计</p>
                    <p class="num"><span id="c2">0</span><span class="g9 f14">元</span></p>
                </li>
                <li class="br0">
                    <p>月收本息</p>
                    <p class="num"><span id="c3">0</span><span class="g9 f14">元</span></p>
                </li>
            </ul>
        </div>

        <div class="payment" style="display: block;">
            <h3>回款明细：  </h3>
            <table width="100%" class="calDetail mt25">
                <tbody>
                <tr style="background: rgb(247, 247, 247);">
                   
                </tr></tbody>
            </table>
            <ul class="payment-int cl fix">
                <li><span>每月付息：</span>借款人每月偿还固定利息，最后一期偿还全部本金。 </li>
                <li class="w400"><span>到期本息：</span>借款人借款到期后一次性偿还本金和利息。</li>
                <li><span>等额本息：</span>借款d人每月以相等的金额偿还借款本息，也是银行房贷等采用的方法。</li>
            </ul>
        </div>
<dl class="clearfloat">
<dt class="ensure_t01"></dt>
<dd class="clearfloat">
<h4>项目描述</h4>
<p>
本项目由广东鸿特普惠信息服务有限公司提供，鸿特普惠通过入驻消费场景，严格筛选借款人，实地调研借款人真实借款意图及还款能力，并结合主流第三方征信公司及公司内部大量历史数据，进行合理风险定价。鸿特普惠致力于为广大白领人士、工薪阶层等高成长群体提供普惠金融信息服务，努力践行普惠金融。
</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>资金用途</h4>
<p>用于购物消费</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>风险评估</h4>
<p>本项目经过多轮大数据风控排查及人工审核，借款人身份信息真实，借款人为受雇人士。本次借款用途明确。<br>本项目适合风险承受能力为“保守型”及以上的投资者投资。</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>还款保障措施</h4>
<p>第一还款来源：借款人工资收入<br>
第二还款来源：第三方担保公司提供连带责任保证担保<br>
平台大数据风控系统及资产端贷后管理人员对借款人进行贷中、贷后管理，定期对借款人进行风险排查和预警，防范逾期风险。</p>
</dd>
</dl>
<dl class="clearfloat" style="margin-bottom: 0px;">
<dt class="ensure_t04"></dt>
<dd>
<h4>风险告知</h4>
<p>
市场有风险 投资需谨慎 查看<a href="https://contract.tuandai.com/P2P/Web/RiskWarningContract.html" style="color:#ffb700 ;" target="_blank">《风险揭示书》</a>
</p>
</dd>
</dl>
</div>
<c:if test="${ti.siitype=='小微企业'}">
<div class="bid_ensure_box clearfloat a1" id="a1" name="a1" style="margin-top: 0px;">
<dl class="clearfloat">
<dt class="ensure_t01"></dt>
<dd class="clearfloat">
<h4>项目描述</h4>
<p>
本项目由广东鸿特普惠信息服务有限公司提供，鸿特普惠通过入驻消费场景，严格筛选借款人，实地调研借款人真实借款意图及还款能力，并结合主流第三方征信公司及公司内部大量历史数据，进行合理风险定价。鸿特普惠致力于为广大白领人士、工薪阶层等高成长群体提供普惠金融信息服务，努力践行普惠金融。
</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>资金用途</h4>
<p>用于装修支出</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>风险评估</h4>
<p>本项目经过多轮大数据风控排查及人工审核，借款人身份信息真实，借款人为受雇人士。本次借款用途明确。<br>本项目适合风险承受能力为'${ti.siiicondition }'及以上的出借人出借。</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>还款保障措施</h4>
<p>第一还款来源：借款人工资收入<br>第二还款来源：第三方担保公司提供连带责任保证担保<br>平台大数据风控系统及资产端贷后管理人员对借款人进行贷中、贷后管理，定期对借款人进行风险排查和预警，防范逾期风险。</p>
</dd>
</dl>
<dl class="clearfloat" style="margin-bottom: 0px;">
<dt class="ensure_t04"></dt>
<dd>
<h4>风险告知</h4>
<p>
市场有风险 出借需谨慎 查看<a href="//contract.tuandai.com/P2P/Web/RiskWarningContract.html" style="color:#ffb700 ;" target="_blank">《风险揭示书》</a>
</p>
</dd>
</dl>
</div>
</c:if>
<c:if test="${ti.siitype=='分期宝'}">
<div class="bid_ensure_box clearfloat a1" id="a1" name="a1" style="margin-top: 0px;">
<dl class="clearfloat">
<dt class="ensure_t01"></dt>
<dd class="clearfloat">
<h4>项目描述</h4>
<p>
本项目由分期宝服务有限公司提供，项目为信用借款，借款方信用状态良好，还款能力较强，同时有第三人承诺在借款人不能偿还借款时，按约定承担连带担保责任。
</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>资金用途</h4>
<p>用于个人用途</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>风险评估</h4>
<p>本项目经过多轮大数据风控排查及人工审核，借款人身份信息真实，借款人为受雇人士。本次借款用途明确。<br>本项目适合风险承受能力为'${ti.siiicondition }'及以上的出借人出借。</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>还款保障措施</h4>
<p>第一还款来源：借款人工资收入<br>第二还款来源：第三方担保公司提供连带责任保证担保<br>平台大数据风控系统及资产端贷后管理人员对借款人进行贷中、贷后管理，定期对借款人进行风险排查和预警，防范逾期风险。</p>
</dd>
</dl>
<dl class="clearfloat" style="margin-bottom: 0px;">
<dt class="ensure_t04"></dt>
<dd>
<h4>风险告知</h4>
<p>
市场有风险 出借需谨慎 查看<a href="//contract.tuandai.com/P2P/Web/RiskWarningContract.html" style="color:#ffb700 ;" target="_blank">《风险揭示书》</a>
</p>
</dd>
</dl>
</div>
</c:if>
<c:if test="${ti.siitype=='微团贷'}">
<div class="bid_ensure_box clearfloat a1" id="a1" name="a1">
<dl class="clearfloat">
<dt class="ensure_t01"></dt>
<dd class="clearfloat">
<h4>项目描述</h4>
<p>
项目为信用借款，借款方信用状态良好，还款能力较强，同时有第三人承诺在借款人不能偿还借款时，按约定承担连带担保责任。
</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>资金用途</h4>
<p>
用于市场推广
</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>风险评估</h4>
<p>本项目经过多轮大数据风控排查及人工审核，借款人身份信息真实，借款人为自雇人士。本次借款用途明确。<br>本项目适合风险承受能力为'${ti.siiicondition }'及以上的出借人出借。</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>还款保障措施</h4>
<p>第一还款来源：经营所得<br>第二还款来源：第三人担保+担保公司担保<br>平台大数据风控系统及资产端贷后管理人员对借款人进行贷中、贷后管理，定期对借款人进行风险排查和预警，防范逾期风险。</p>
</dd>
</dl>
<dl class="clearfloat" style="margin-bottom: 0px;">
<dt class="ensure_t04"></dt>
<dd>
<h4>风险告知</h4>
<p>
市场有风险 出借需谨慎 查看<a href="//contract.tuandai.com/P2P/Web/RiskWarningContract.html" style="color:#ffb700 ;" target="_blank">《风险揭示书》</a>
</p>
</dd>
</dl>
</div>
</c:if>
<c:if test="${ti.siitype=='供应链'}">
<div class="bid_ensure_box clearfloat a1" id="a1" name="a1">
<dl class="clearfloat">
<dt class="ensure_t01"></dt>
<dd class="clearfloat">
<h4>项目描述</h4>
<p>
项目为信用借款，借款方信用状态良好，还款能力较强，同时有第三人承诺在借款人不能偿还借款时，按约定承担连带担保责任。
</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>资金用途</h4>
<p>
用于供应链
</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>风险评估</h4>
<p>本项目经过多轮大数据风控排查及人工审核，借款人身份信息真实，借款人为自雇人士。本次借款用途明确。<br>本项目适合风险承受能力为'${ti.siiicondition }'及以上的出借人出借。</p>
</dd>
</dl>
<dl class="clearfloat">
<dt class=""></dt>
<dd>
<h4>还款保障措施</h4>
<p>第一还款来源：经营所得<br>第二还款来源：第三人担保+担保公司担保<br>平台大数据风控系统及资产端贷后管理人员对借款人进行贷中、贷后管理，定期对借款人进行风险排查和预警，防范逾期风险。</p>
</dd>
</dl>
<dl class="clearfloat" style="margin-bottom: 0px;">
<dt class="ensure_t04"></dt>
<dd>
<h4>风险告知</h4>
<p>
市场有风险 出借需谨慎 查看<a href="//contract.tuandai.com/P2P/Web/RiskWarningContract.html" style="color:#ffb700 ;" target="_blank">《风险揭示书》</a>
</p>
</dd>
</dl>
</div>
</c:if>
<div class="bid_invest_main clearfloat a2" id="a2" name="a2">
<c:if test="${user.userid==null||user.userid==''}">
<div style="text-align: center; margin: 10px 0px 10px 0px">
只有会员才有权限查看借款人信息，请<a style="color: #FF9600;" id="loginsa"href="javaScript:void(0)" >&nbsp;登录&nbsp;</a>后再查看!
</div>
</c:if>
<c:if test="${user.userid!=null&&user.userid!=''}">
<c:if test="${ti.tBorrowerInfo.biname!=null}">
<div class="staging_info_box clearfloat">
<h3>基本信息</h3>
<ul class="staging_blist clearfloat" id="basicPersonInfo">
<li>借款方：<label id="borrow_RealName">
<c:set var="name" value="${ti.tBorrowerInfo.biname}"/>
<c:out value="${fn:substring(name,0,1)}**"></c:out></label></li>
<li>借款人主体性质：<label id="borrow_MainNature">
<c:if test="${ti.tBorrowerInfo.bitype==1}">
自然人</c:if>
<c:if test="${ti.tBorrowerInfo.bitype==2}">
法人</c:if>
</label></li>
<li>年龄：<label id="borrow_Age">${ti.tBorrowerInfo.biage}</label></li>
<li>手机号码：<label id="borrow_TelNo">
<c:set var="phone" value="${ti.tBorrowerInfo.biphone}"/>
<c:out value="${fn:substring(phone,0,3)}****${fn:substring(phone,7,11)}"></c:out>
</label></li>
<li>性别：<label id="borrow_Sex"><c:if test="${ti.tBorrowerInfo.bisex==1}">男</c:if><c:if test="${ti.tBorrowerInfo.bisex==2}">女</c:if></label></li>
<li>所属行业：<label id="borrow_Industry">${ti.tBorrowerInfo.biindustry}</label></li>
<li>居住城市：<label id="borrow_BankCity">${ti.tBorrowerInfo.bicity}</label></li>
<li>月均收入：<label id="borrow_Salary">${ti.tBorrowerInfo.biincome}</label></li>
<li>住房情况：<label id="borrow_IsHouse">${ti.tBorrowerInfo.bihousing}</label></li>
<li>婚姻状况：<label id="borrow_Marriage">${ti.tBorrowerInfo.bimarriage}</label></li>
<li>当前负债：<label id="borrow_CurrentDebts">${ti.tBorrowerInfo.biliab}元</label></li>
<li class="full-li">在其他网络借贷平台借款情况：<label id="borrow_OtherBorrow">${ti.tBorrowerInfo.biloan}</label></li>
<li class="full-li">近6个月征信报告中的逾期情况：<label id="borrow_CreditOverDue">${ti.tBorrowerInfo.bioverdue}</label></li>
</ul>
<ul class="staging_blist clearfloat" id="basicEnterpriseInfo" style="display:none;">
<li>借款方：<label id="borrow_OrgName">张**</label></li>
<li>借款人主体性质：<label id="borrow_RegMainNature">自然人</label></li>
<li>所属行业：<label id="borrow_OrgIndustry">制造业</label></li>
<li>成立时间：<label id="borrow_RegDate">2018年10月31日</label></li>
<li>法定代表人：<label id="borrow_LegalName"></label></li>
<li>注册资本：<label id="borrow_RegAmount"></label></li>
<li>注册地址：<label id="borrow_RegAddress"></label></li>
<li>当前负债：<label id="borrow_OrgCurrentDebts"></label></li>
<li>近半年营业收入：<label id="borrow_HalfYearSalesRevenue"></label></li>
<li class="full-li">在其他网络借贷平台借款情况：<label id="borrow_OrgOtherBorrow"></label></li>
<li class="full-li">近6个月征信报告中的逾期情况：<label id="borrow_OrgCreditOverDue"></label></li>
</ul>
</div>
<div class="staging_info_box clearfloat">
<h3>审核信息</h3>
<div class="staging_certifia clearfloat">
<p class="staging_verify01">
<span></span><i>身份认证</i>
</p>
<p class="staging_verify02">
<span></span><i>手机认证</i>
</p>
<p class="staging_verify03">
<span></span><i>邮箱认证</i>
</p>
</div>
</div>
</c:if>
</c:if>
</div>
<div class="bid_content_box a3" id="a3" name="a3">

<table width="100%" align="center" class="bid_records">
<tbody id="tsiRecordList">
<!--
<tr id="Subscribelist">
<th style="width: 60px;">序号
</th>
<th style="width: 20%;">投标人
</th>
<th style="width: 20%;">投标金额
</th>
<th style="width: 25%;">投标方式
</th>
<th>投标时间
</th>
</tr>
<c:forEach items="${trlist}" var="trs">  
<tr>
<td>1</td>
<c:set var="trsphone" value="${trs.tUserData.phone}"/>
<td><c:out value="${fn:substring(trsphone,0,3)}****${fn:substring(trsphone,7,11)}"></c:out></td>
<td><span class="c_ff6600">￥${trs.sirinmoney}</span></td>
<td><img src="images/icon_toubiao_pc.png"></td>
<td>${trs.sirdate}</td>
</tr>
</c:forEach>
 -->
</tbody>
</table>
<div id="divfqbaolist" class="pagetop" style="display:block;">
<div id="pagination" class="pagination">

<span class="current prev">上一页</span><span class="current">1</span><a class="pageNo">2</a>
<a class="pageNo">3</a><a class="next">下一页</a>
<div class="godiv">
<input id="tiaozhuan" class="gobtn page-btn" type="button" value="跳转" style="color: rgb(190, 190, 190);">
<input id="num" class="input-val page-text" type="text" style="height:80px;" placeholder="跳转页数">
</div>
</div>
</div>
</div>
<div class="bid_content_box a4" id="a4" name="a4">
<table width="100%" align="center" class="bid_records">
<tbody id="tReceRecord">
<tr id="subscribedetaillist">
<th style="width: 60px;">序号
</th>
<th style="width: 20%;">还款日期
</th>
<th style="width: 20%;">还款金额
</th>
<th>本金+利息
</th>
<th style="width: 20%;">还款状态
</th>
</tr>
<tr>
</tbody>
</table>
<div id="divfqbaolist2" class="pagetop" style="display:block;">
<div id="pagination2" class="pagination">


</div>
</div>
</div>
<div class="bid_content_box a5 post-loan" id="a5" name="a5">

<h3>鸿特普惠业务模型</h3>
<div class="business_model_le">
<p class="model_lestep1">
借款人申请借款
</p>
<p class="model_lestep2">
合作资产端贷前调查,核<br> 实借款人身份和各项资料
</p>
<p class="model_lestep3">
合作资产端向团贷网推荐<br>标的
</p>
<p class="model_lestep4">
团贷网大数据风控系统自<br>动审核
</p>
<p class="model_lestep5">
团贷网人工审核
</p>
<p class="model_lestep6">
发标借款
</p>
<p class="model_lestep7">
满标，借款人按期还<br> 款，第三方担保公司担保
</p>
<p class="model_lestep8">
到期结清
</p>
<i class="model_lestate1">发起申请</i><i class="model_lestate2">审核通过</i><i class="model_lestate3"></i>
<i class="model_lestate4">审核通过</i><i class="model_lestate5">满标</i><i class="model_lestate6">到期结清</i>
</div>
</div>
</div>
<div class="tdw-footer">
			<div class="wth-1200 tdw-footer-container">
				<div class="tdw-footer-t">
					<div class="l col1">
						<dl>
							<dt>新手帮助</dt>
							<dd>
								<a rel="nofollow" href="https://hd.tuandai.com/web/newhand/welfare.aspx">新手指引</a>
							</dd>
							<dd>
								<a rel="nofollow" href="https://info.tuandai.com/help/index.html">帮助中心</a>
							</dd>
							<dd>
								<a rel="nofollow" href="https://info.tuandai.com/help/list.html?mark=70">资费介绍</a>
							</dd>
						</dl>
						<dl>
							<dt>保障体系</dt>
							<dd>
								<a rel="nofollow" href="https://info.tuandai.com/about/laws.html?mark=26">法律法规</a>
							</dd>
							<dd>
								<a rel="nofollow" href="https://info.tuandai.com/about/guarantee.html?mark=1">保障体系</a>
							</dd>
							<dd>
								<a rel="nofollow" href="https://info.tuandai.com/about/partners.html?mark=24">合作机构</a>
							</dd>
						</dl>
						<dl>
							<dt>如何投资</dt>
							<dd>
								<a target="_blank" href="https://www.tuandai.com/article/">投资资讯</a>
							</dd>
							<dd>
								<a target="_blank" href="http://ask.tuandai.com/">团贷问答
								</a>
							</dd>
							<dd>
								<a target="_blank" href="http://baike.tuandai.com/">团贷百科
								</a>
							</dd>
						</dl>
					</div>
					<div class="l col2">
						<div class="app-code">
							<p>手机APP下载</p>
						</div>
						<div class="wechat-code">
							<p>微信服务号</p>
						</div>
						<div class="service-code">
							<p>微信订阅号</p>
						</div>
					</div>
					<div class="r col3">
						<strong>1010-1218</strong>
						<p>客服电话：（服务时间：9:00-22:00）</p>
						<div class="rel">
							<div class="r rel emailbox-wrap">
								<a class="rel emailbox" href="javascript:;"><span class="btn-text">投诉与建议</span></a>
								<div class="abs email-tips">
									<i class="abs tdw-icons i-tips-arrow1"></i>
									<p class="text-333">客服邮箱</p>
									<p>kefu@tuandai.com</p>
								</div>
							</div>
							<a class="r rel custombox" href="http://www.sobot.com/chat/pc/index.html?sysNum=20ab7dce1e3346e8b90b649bd8baf591" target="_blank" title="在线服务" rel="nofollow">
								<span class="btn-text">在线客服</span></a>
						</div>
					</div>
				</div>
				<div class="tdw-footer-supervise">
					<a class="super-img1" rel="external nofollow" href="http://www.miibeian.gov.cn/" target="_blank"></a>
					<a class="super-img2" rel="external nofollow" href="http://www.gddg110.gov.cn/publicfiles/business/htmlfiles/dgjch/index.htm" target="_blank"></a>
					<a class="super-img3" rel="external nofollow" href="https://v.pinpaibao.com.cn/cert/site/?site=www.tuandai.com&amp;at=realname" target="_blank"></a>
					<a class="super-img4" rel="external nofollow" href="https://ss.knet.cn/verifyseal.dll?sn=e12110944190036882000000&amp;ct=df&amp;a=1&amp;pa=0.6580442255885031" target="_blank"></a>
					<a class="super-img5" rel="external nofollow" href="http://www.itrust.org.cn/home/index/itrust_certifi/wm/PJ2018020102" target="_blank"></a>
					<a class="super-img6" rel="external nofollow" id="___szfw_logo___" href="https://credit.szfw.org/CX20180307037573561533.html" target="_blank"></a>
					<a class="super-img8" rel="external nofollow" id="_pingansec_bottomimagesmall_p2p" target="_blank" href="http://si.trustutn.org/info?sn=260150522000147261072"></a>
					<a class="super-img9" target="_blank" href="http://wljg.gdgs.gov.cn/corpsrch.aspx?key=441900002895462" alt="企业名称：东莞团贷网互联网科技服务有限公司法定代表人：唐军标识状态：已激活 粤工商备P191608002336"></a>
				</div>
				<div class="footer-content auto fix cl">
					<div class="address fa f12 tc mt15">
						2010-<span>2018</span> 版权所有 © 团贷网
						<a href="http://www.miibeian.gov.cn/" target="_blank" rel="nofollow">粤ICP备12043601号-1</a> 粤公安网备44190002000538号 东莞团贷网互联网科技服务有限公司
						<br>地址：东莞市南城街道莞太路111号民间金融大厦1号楼28楼
					</div>
				</div>
			</div>
		</div>
		<div class="tdw-tools-bar" id="tdwToolBar">
			<ul>
				<li>
					<a href="javascript:;" id="toolRisk">
						<i class="tdw-icons i-tool-risk"></i>
						<p>风险<br>提示</p>
					</a>
					<div class="risk-tips">
						<i></i>
						<p>市场有风险<br>投资需谨慎</p>
					</div>
				</li>
				<li>
					<a href="javascript:;" onclick="" target="_blank">
						<i class="tdw-icons i-tool-service"></i>
						<p>在线<br>客服</p>
					</a>
				</li>
				<li>
					<a href="javascript:;" onclick="">
						<i class="tdw-icons i-tool-help"></i>
						<p>帮助<br>中心</p>
					</a>
				</li>
				<li>
					<a href="javascript:;" onclick="">
						<i class="tdw-icons i-tool-calculate"></i>
						<p>计算<br>工具</p>
					</a>
				</li>
				<li class="last-border tool-backtop" id="tool-backtop">
					<a href="javascript:;">
						<i class="tdw-icons i-tool-backtop"></i>
						<p>回到<br>顶部</p>
					</a>
				</li>
			</ul>
		</div>
		<div id="layer" style="display: none;"></div>
		
		<div id="dial-window" style="display: none;" class="z103">
			<div class="title">
				加载中 <i class="close close-x icon abs"></i>
			</div>
			<div class="body">
				<img src="images/loading.gif" alt="加载中">
			</div>
			<div id="dial-window-btns" class="btns tc">
				<a href="javascript:void(0)" class="td-btn-1 td-btn-1-or dete " id="dial-window-okbtn">确定</a>
				<a href="javascript:void(0)" class="td-btn-1 td-btn-1-gar  cancle " id="dial-window-canclebtn">取消</a>
			</div>
		</div>
		<a id="tt_link" style="display: none;">bank</a>
		<div id="diallayer" style="display: none;"></div>
		<div class="stop-taking stop-dialog" id="funcStopService" style="display: none;z-index: 9999999">
			<div id="guan"></div>
			<h2><b class="b1"></b><span class="stop-title">团贷网系统升级公告</span><b class="b2"></b></h2>
			<div class="stop-text" id="funcStopCentent"></div>
			<div class="knob">我知道了</div>
		</div>
		<div id="bankBindAlert" style="display: none; margin-left: -220px;" class="dial-window xm-window bankBindAlert">
			<div class="title rel">温馨提示：
				<a href="https://www.tuandai.com/member/account_default.aspx"><i class="close-x cgt-close-x icon db abs"></i></a>
			</div>
			<div class="body">
				<div class="" style="text-align: center;">
					<p class="p1">请您在新打开的页面完成
						<span id="sp_title"></span>
					</p>
					<p class="p2">
						<span id="sp_title2"></span>完成前请不要关闭此窗口，根据完成结果，选择下面的操作</p>
				</div>
			</div>
			<div class="bottom">
				<div class="btn-group">
					<a href="https://www.tuandai.com/member/account_default.aspx" id="remind_aa" class="btn">
						<span id="aa_title">绑卡成功</span>
					</a>
				</div>
				<a class="question" href="http://info.tuandai.com/help/index.html" target="_blank">
					<span id="sp_title3"></span>遇到问题</a>
			</div>
		</div>
		<div class="xm-mask" style="display: none;"></div>
		<div id="bankBlock" class="xiamen-pop" style="display: none;">
			<div class="close"></div>
			<div class="pop-tit">
				<h3></h3>
				<h4>团贷网联手厦门银行</h4>
				<p>个人账户升级为厦门银行存管账户</p>
			</div>
			<div class="tc mt30">资金有保障，投资更放心</div>
			<div class="pop-body">
				<p>
					<span id="sp_open" style="display: none;">您尚未开通厦门银行资金存管账户，请先开通</span>
					<span id="sp_active" style="display: none;">您的账号已升级为厦门银行资金存管账户，请您激活账户</span>
				</p>
				<a href="https://www.tuandai.com/member/Bank/XM_BankBind.aspx" id="aOpen" class="btn" target="_blank">马上升级</a>
			</div>
		</div>
		<div style="display: none;" class="cgt_10100 dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body cgt-box">
				<div class="  mt10">
					<div id="body_dv_top" class="top">
						<p>
							<span class="ok-icon"></span>
							<span id="body_dv_head">升级存管账户成功</span>
						</p>
					</div>
					<div id="body_dv_bottom" class="bottom">
						<div id="btn_01" class="count" style="display:block;">
							<p class="pb30">此页将在
								<span class="num"></span>后关闭，请在原页面继续操作</p>
							<a class="td-btn-1 td-btn-1-or btn cgt-close-x" href="javascript:;">立即关闭</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div style="display: none;" class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body cgt-box g6">
				<div class=" pl20 mt10">
					<div id="body_dv_top" class="top">
						<p>
							<span class="ok-icon"></span>
							<span id="body_dv_head">升级存管账户成功</span>
						</p>
					</div>
					<div id="body_dv_bottom" class="bottom">
						<div id="btn_01" class="count tl " style="display:block;">
							<p class="pb5 ff7301">由于您的证件为【港澳通行证】，您还需要完成以下操作才能进行资金操作：</p>
							<p>1、添加专属客服
								<a target="blank" href="tencent://message/?uin=2880761023&amp;Site=%E4%B8%80%E5%B8%90%E9%80%9A&amp;Menu=yes">
									<span class="qq-bg">
<i class="qq-icon"></i>2880761023</span>
								</a> 为好友。</p>
							<p style="line-height:23px">2、QQ联系客服专员，提交以下申请材料：手持港澳台通行证证件彩色半身照【保证证件号码清晰且
								<br>不能是镜面照】港澳台通行证背面彩色照片,受理时间为：工作日8:30-12:00 13:30-18:00。</p>
							<p>3、资料提交后，平台及银行将会进行双重审核，一般时长为2个工作日。</p>
							<p class="pb30">4、审核通过后即可进行资金操作，届时会有短信通知。</p>
							<a class="td-btn-1 td-btn-1-or btn cgt-close-x" href="javascript:;">我知道了</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="display: none;" class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body cgt-box g6">
				<div class=" pl20 mt10">
					<div id="body_dv_top" class="top">
						<p>
							<span class="ok-icon  warning-icon"></span>
							<span id="body_dv_head">升级存管账户成功</span>
						</p>
					</div>
					<div id="body_dv_bottom" class="bottom">
						<div id="btn_01" class="count tl " style="display:block; line-height:30px;">
							<p class="  ff7301 pb30">注意：由于您的身份信息或银行卡信息有误，您暂时还不能进行充值、投资、提现等资金操作，请尽快联系团贷网专属客服
								<a target="blank" href="tencent://message/?uin=2880761023&amp;Site=%E4%B8%80%E5%B8%90%E9%80%9A&amp;Menu=yes">
									<span class="qq-bg">
<i class="qq-icon"></i>2880761023</span>
								</a>　进行资料核实及修改。</p>
							<a class="td-btn-1 td-btn-1-or btn  cgt-close-x" href="javascript:;">我知道了</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="display: none;" class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body cgt-box g6">
				<div class=" pl20 mt10">
					<div id="body_dv_top" class="top">
						<p>
							<span class="ok-icon  warning-icon"></span>
							<span id="body_dv_head">升级存管账户成功</span>
						</p>
					</div>
					<div id="body_dv_bottom" class="bottom">
						<div id="btn_01" class="count tl " style="display:block; line-height:30px;">
							<p class="  ff7301 pb30">注意：由于您填写的预留手机号与银行预留手机号不符，您暂时不能进行快捷充值操作，请及时到"我的账户—安全中心"进行修改。</p>
							<a class="td-btn-1 td-btn-1-or btn  " href="javascript:;">我要修改预留手机号</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="bankCheckFaile" style="display: none;" class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body cgt-box g6">
				<div class=" pl20 mt10">
					<div id="body_dv_bottom" class="bottom">
						<div id="btn_01" class="count tl bankCheckTxt" style="display:block; line-height:30px;">
							<p id="bankCheckFaile-tip" class="  ff7301 pb10">由于您升级存管时使用的证件为【外国人护照】，您还需完成以下操作才能进行资金操作：</p>
							<p>1、添加专属客服
								<a target="blank" href="tencent://message/?uin=2880761023&amp;Site=%E4%B8%80%E5%B8%90%E9%80%9A&amp;Menu=yes">
									<span class="qq-bg">
<i class="qq-icon"></i>2880761023</span>
								</a> 为好友。</p>
							<p style="line-height:23px">2、QQ联系客服专员，提交以下申请材料：手持<span class="bankCheckFaile-tip2">港澳台通行证</span>证件彩色半身照【保证证件号码清晰且
								<br>不能是镜面照】<span class="bankCheckFaile-tip2">港澳台通行证</span>背面彩色照片,受理时间为：工作日8:30-12:00 13:30-18:00</p>
							<p>3、资料提交后，平台及银行将会进行双重审核，一般时长为2个工作日。</p>
							<p class="pb30">4、审核通过后即可进行正常投资，届时会有短信通知。</p>
							<div class="tc">
								<a class="td-btn-1 cgt-close-x td-btn-1-or btn" href="javascript:;">我知道了</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="0pass" style="display: none;" class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body cgt-box g6">
				<div class=" pl20 mt10">
					<div id="body_dv_bottom" class="bottom">
						<div id="btn_01" class="count tl " style="display:block; line-height:30px;">
							<p class="  ff7301 pb30 mb10">注意：由于您的身份信息或银行卡信息有误，您暂时还不能进行充值、投资、提现等资金操作，请尽快联系团贷网客服（1010-1218）进行资料核实及修改。</p>
							<a class="td-btn-1 cgt-close-x td-btn-1-or btn" href="javascript:;">我知道了</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="chongzhiother" style="display: none;" class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body cgt-box g6">
				<div class=" pl20 mt10">
					<div id="body_dv_bottom" class="bottom">
						<div id="btn_01" class="count tl " style="display:block; line-height:30px;">
							<p class="  ff7301 pb30 mb10">注意：由于您填写的预留手机号与银行预留手机号不符，您暂时不能进行快捷充值操作，请及时到"我的账户—安全中心"进行修改。</p>
							<a id="chongzhiotherbtn" target="_blank" class="td-btn-1 td-btn-1-or btn" href="javascript:;">我要修改预留手机号</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="display: none;" id="closeWindowTh" class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs" name="closejy"></i>
			</div>
			<div class="body cgt-box">
				<div class="  mt10">
					<div id="body_dv_top" class="top">
						<p>
							<span class="ok-icon"></span>
							<span id="body_dv_head2">${ti.siititle }投标成功!</span>
						</p>
					</div>
					<div id="body_dv_bottom" class="bottom">
						<div id="btn_01" class="count" style="display:block;">
							<p class="pb30">此页将在
								<span class="num" id="djs">3s</span>后关闭，请在原页面继续操作</p>
							<a class="td-btn-1 td-btn-1-or btn cgt-close-x" name="closejy" href="javascript:;">立即关闭</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="display: none;   width:450px!important;  margin-left: -225px!important; " class="dial-window xm-window layer-win ">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body  ">
				<div class="  mt10">
					<div id="body_dv_top" class="top">
						<p class="f18">
							此证件号已注册！
						</p>
					</div>
				</div>
			</div>
		</div>
		<div style="display: none;   width:450px!important;   margin-left: -225px!important; " class="dial-window xm-window layer-win ">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body  ">
				<div class="  mt10">
					<div id="body_dv_top" class="top">
						<p class="f18" style="line-height:25px">
							银行卡号：***************0980已被使用，
							<br> 请更换后重试！
						</p>
					</div>
				</div>
			</div>
		</div>
		<div style="display: none;  width:450px!important; margin-left: -225px!important;" class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body  ">
				<div class="  mt10">
					<div id="body_dv_bottom" class="bottom " style="padding-bottom:20px;">
						<div id="btn_01" class="count" style="display:block;  ">
							<p class="pb30 f18 g6" style="line-height:28px;">为保证转账顺利进行，
								<br>请先前往迅辉财富(www.tdw.cn)升级存管。</p>
							<a class="td-btn-1 td-btn-1-or btn" href="javascript:;">去授权</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="zhixiang" style="display: none;  width:450px!important; margin-left: -225px!important; " class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body">
				<div class="mt10">
					<div id="body_dv_bottom" class="bottom ">
						<div id="btn_01" class="count" style="display:block;  ">
							<p class="pb30 f18 g6" style="line-height:28px;">您需要授权【自动还款】服务，才能发起智享转让</p>
							<a id="zhixiang-btn" target="_blank" class="td-btn-1 td-btn-1-or btn btn-s" href="javascript:;">去授权</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="touzi" style="display: none;  width:450px!important; margin-left: -225px!important;" class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body  ">
				<div class="  mt10">
					<div id="body_dv_bottom" class="bottom ">
						<div id="btn_01" class="count" style="display:block;  ">
							<p class="pb30 f18 g6">您需要授权【自动投标】服务，才能投资复投宝</p>
							<a id="touzi-btn" class="td-btn-1 td-btn-1-or btn btn-s" href="javascript:;">去授权</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="accountError" style="display: none ;" class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body cgt-box g6">
				<div class=" pl20 mt10">
					<div id="body_dv_bottom" class="bottom">
						<div id="btn_01" class="count tc " style="display:block; line-height:30px;">
							<p class="  ff7301 pb30 mb10"> 注意：您的银行存管账户异常，请尽快联系团贷网客服（1010-1218）进行处理。</p>
							<a id="accountError-btn" class="td-btn-1 cgt-close-x  td-btn-1-or btn" href="javascript:;">我知道了</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="risk" style="display: none;  width:450px!important; margin-left: -225px!important;" class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body" style="height: 214px;">
				<div class="  mt10">
					<div id="body_dv_bottom" class="bottom ">
						<div id="btn_01" class="count" style="display:block;  ">
							<p class="pb20 f18 g6">您尚未进行风险承受能力评测，请先完成评测后再进行投资</p>
							<a class="td-btn-1 riskBtn td-btn-1-or btn btn-s" href="javascript:;">立即评测</a>
						</div>
						<div class="tc mt20">您今年还有三次评估机会</div>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			var isWePlanProject = false; //标记是否在We计划详情页
			var IsOpenCGT = '1'; //是否开通存管通
			var isOpenCgtSub = '1'; //是否开启存管通申购
			var isOpenCgtSubWe = '1'; //是否开启存管通申购WE计划
			var IsOpenCgtSubFtb = '1'; //是否开启存管通申购复投宝
		</script>
		<script type="text/javascript" src="js/thirdlib.js"></script>
		<script src="js/jquery.cookie.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/jquery.slimscroll.js"></script>
		<script type="text/javascript" src="js/public.js"></script>
		<script type="text/javascript" src="js/jnumber.js"></script>
		<script type="text/javascript" src="js/project_dialog_cgt1.js"></script>
		<script type="text/javascript" src="js/select_redbox1.js"></script>
		<script charset="GB2312" type="text/javascript" src="js/cgt_common.js"></script>
		<script type="text/javascript" src="js/jquery.pagination.js"></script>
		<script type="text/javascript" src="js/iframe.js"></script>
		<script type="text/javascript" src="js/jquery.mCustomScrollbar.concat.min.js"></script>
		<script type="text/javascript" src="js/auto_integer.js"></script>
		<script type="text/javascript" src="js/invest_common_new1.js"></script>
		<script type="text/javascript" src="js/zq_timedown.js"></script>
		<script type="text/javascript">
			/*<![CDATA[*/
			var lowerunit = "100.39";
			var rete = "10.95";
			var deadline = 138;
			var pId = "E702EB95-66F6-41C4-A350-E0FB0674F3EB";
			var repaymentType = "\u6BCF\u6708\u4ED8\u606F";
			var IsScribeTanfer = true; //是否债权转让
			var isLogin = false;
			var tdwUrl = "https:\/\/www.tdw.cn";
			var userFund = "0"; //可用余额
			var LowerUnit = "100.3917"; //起投金额
			var residualAmount = "72884.43"; //剩余金额
			var subscribeAviAmount = "0.00" //我可申购
			var amount = null; //标的剩余金额4位小数
			var aviMoney = null; //用户可用金额4位小数
			subscribeAviAmount = subscribeAviAmount.split(',').join('');
			$(function() {
				$('html').on('contextmenu', function() {
					return true;
				});
				initSubscribesPagin($("#divPagination").attr("totalcount"));
				SubscribeList();
				//加载借款人基本信息
				if(isLogin) {
					LoadUserInfo();
				}
			});
			//定位scrollBox层始终在屏幕
			function tools() {
				var tabbarH = $(".top-bar").height() + 160 + $(".detail_logo_bg").height() + $(".position").height() + $(".bid_invest_inf").height();
				var top = $(document).scrollTop();
				if(($.browser.msie == true) && ($.browser.version == 6.0)) {
					if(top > tabbarH) $(".bid_invest_nav").css({
						position: "absolute",
						top: top - tabbarH
					});
				} else {
					if(top > tabbarH) {
						$(".bid_invest_nav").css({
							position: "fixed",
							top: 0,
							left: 0
						});
						$('.bid_ensure_box.a1').css({
							'margin-top': '75px'
						});
					}

				}
				if(top <= tabbarH) {
					$(".bid_invest_nav").css({
						position: "static"
					});
					$('.bid_ensure_box.a1').css({
						'margin-top': '0'
					});
				}
			}
			$(function() {
				window.onscroll = tools;
				window.onresize = tools;
			});

			//*----滑动锚点
			//tager 为元素

			function getTager(tager) {
				$('html,body').animate({
					scrollTop: $(tager).offset().top - 60
				}, 250);
				return false;
			}
			//************************************************************************
			
			

			//分页申购列表
			arrowChange(); //申购箭头层级
			function arrowChange() {
				$('.invent-form').find('i').bind("mousemove", function() {
					$(this).parent().find('i').css({
						"z-index": "1"
					});
					$(this).css({
						"z-index": "2"
					});
				})
			}

			function initSubscribesPagin(recordCount) {
				var num_entries = recordCount;
				$("#divPagination").pagination(num_entries, {
					callback: getSubscribes,
					items_per_page: 15,
					num_display_entries: 5,
					current_page: parseInt(pageindex - 1),
					num_edge_entries: 1,
					link_to: "#Subscribelist",
					prev_text: "上一页",
					next_text: "下一页",
					ellipse_text: "...",
					prev_show_always: true,
					next_show_always: true,
					renderer: "defaultRenderer",
					show_if_single_page: false,
					load_first_page: true
				});
			}
			//获取投资人列表
			function getSubscribes(page_index, jq) {
				if(parseInt(pageindex - 1) == page_index) {
					return false;
				}
				pageindex = (page_index + 1);
				SubscribeList();
				return false;
			}

			//        function MaxInvest() {
			//            if (!isCookieLogin()) {
			//                fnLogin();
			//            } else {
			//                $("#jiek_Share").val(0);
			//                Calculate(1);
			//            }
			//        }

			//加载用户基本信息 TODO
			function LoadUserInfo() {
				jQuery.ajax({
					async: true,
					type: "get",
					url: "/pages/invest/getZqBorrowUserInfo",
					dataType: "json",
					data: {
						subscriberTanferId: "E702EB95-66F6-41C4-A350-E0FB0674F3EB"
					},
					success: function(json) {
						if(json.code == 0) {
							$("#nickName").text("昵称：" + json.data.NickName);
							$("#age").html("年<span style=\"padding-left: 28px;\"></span>龄：" + json.data.Age);
							$("#telNo").text("手机号：" + json.data.TelNo);
							$("#sex").text("性别：" + (json.data.Sex == 1 ? '男' : '女'));
							$("#registerDate").text("注册时间：" + json.data.AddDate);
							$("#bankCity").text("所在地：" + (json.data.BankCity == null ? "" : json.data.BankCity));
						}
					}
				});
			}
			/*]]>*/
		</script>
		<script type="text/javascript">
			/*<![CDATA[*/
			(function() { //红包下拉
				try {
					getRandomValue();
				} catch(e) {}
				$('.red-package-list').css({
					'margin-bottom': '-5px'
				});
				$('.red-package-list').find('dt').click(function(event) {
					$(this).parent().find('dd').slideDown(300);
					event.stopPropagation();
				});
				$('.red-package-list').find('li').click(function() {
					var thisVal = $(this).attr('data');
					$(this).parents('.red-package-list').find('.data').text(thisVal);
					$(this).find('dd').slideUp(300);
				});
				$(window).click(function(event) {
					$('.red-package-list').find('dd').slideUp(300);
				});
			})();
			(function() {
				$(".a_code").mouseover(function() {
					$(".codexe").show();
				}).mouseout(function() {
					$(".codexe").hide();
				});
				$('.member-list').hover(function() {
					$(this).find('ul').addClass('ul-type').end().find('.mission').show();
					$(this).find('.arrow').removeClass('down-arrow').addClass('up-arrow');
				}, function() {
					$(this).find('ul').removeClass('ul-type').end().find('.mission').hide();
					$(this).find('.arrow').removeClass('up-arrow').addClass('down-arrow');
				})
			})();

			function stringToHex(s) {
				var r = '';
				var hexes = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'];
				for(var i = 0; i < (s.length); i++) {
					r += hexes[s.charCodeAt(i) >> 4] + hexes[s.charCodeAt(i) & 0xf]
				}
				return r
			}

			function HexTostring(s) {
				var r = '';
				for(var i = 0; i < s.length; i += 2) {
					var sxx = parseInt(s.substring(i, i + 2), 16);
					r += String.fromCharCode(sxx)
				}
				return r
			}

			var nwbi_userName = "";
			var nwbi_sysNo = "TDW";
			var IsLogin = isCookieLogin();
			if(IsLogin) {
				var nickname = jaaulde.utils.cookies.get("TDWUserName");
				nwbi_userName = nickname;
			}
			(function() {
				var ta = document.createElement('script');
				ta.type = 'text/javascript';
				ta.async = true;
				ta.src = ((("https:") == document.location.protocol) ? "https://" : "http://") + 'bilog.niiwoo.com/js/webaccess.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ta, s);
			})();

			var _hmt = _hmt || [];
			(function() {
				var hm = document.createElement("script");
				hm.src = "//hm.baidu.com/hm.js?6dff67da4e4ef03cccffced8222419de";
				var s = document.getElementsByTagName("script")[0];
				s.parentNode.insertBefore(hm, s);
			})();
			/*]]>*/
		</script>
		<script type="text/javascript">

    var getValue = $("#repayment").val();

    var options = {
        useEasing: true,
        useGrouping: true,
        separator: ',',
        decimal: '.',
        prefix: '',
        suffix: ''
    };

    (function () {//计数

        $('#tsimsoney').click(function () {
			//alert("666");
            var cou = 0;
            inputLength = $('.text-tip').length;
            for (i = 0; i < inputLength; i++) {
                val = Number($('.text-tip').eq(i).val());
                if (isNaN(val) || val == 0) {

                    $('.text-tip').eq(i).parent().find('.err-tip').show();
                    $('.text-tip').eq(i).css({ 'color': 'red' }).addClass('reb-border');
                    cou++;
                } else {

                    if (i == 2) {

                        var type = initTypeCode();
                        var mons = $("#moneydata"); //获取投资期限
                        var payments = parseInt(mons.val()); //投资期限

                        if (type == 1) {

                            if (payments > 90) {
                                $("#err-time").html("标的期限不得超过90天");

                                $('.text-tip').eq(i).parent().find('.err-tip').show();
                                $('.text-tip').eq(i).css({ 'color': 'red' }).addClass('reb-border');
                                cou++;
                            }

                        } else if (type == 2) {

                            if (payments > 48) {
                                $("#err-time").html("标的期限不得超过48个月");

                                $('.text-tip').eq(i).parent().find('.err-tip').show();
                                $('.text-tip').eq(i).css({ 'color': 'red' }).addClass('reb-border');
                                cou++;
                            }
                        }

                    }else if(i == 1){

                        var apr = $("#toolrate").val();   //获取年利率

                        if (apr < 5 || apr > 100) {
                            $("#err-rate").html("年利率区间为5%-100%");

                            $('.text-tip').eq(i).parent().find('.err-tip').show();
                            $('.text-tip').eq(i).css({ 'color': 'red' }).addClass('reb-border');
                            cou++;
                        }

                    } else if (i == 0) {

                        var amount = $("#money").val(); //获取投资金额

                        if (amount < 100) {
                            $("#err-money").html("最低出借金额为100");

                            $('.text-tip').eq(i).parent().find('.err-tip').show();
                            $('.text-tip').eq(i).css({ 'color': 'red' }).addClass('reb-border');
                            cou++;
                        }
                    }
                }
            }

            if (cou == 0) {
                $('.payment').show();
                calculate();
            }

        })
    })();

    function initTypeCode() {
        var code;
        $("#dvPopSort li").each(function () {
            if ($(this).hasClass("on")) {
                code = $(this).attr("attrval");
            }
        });
        return code;
    }

    (function () {//日月切换
        $('.sort-condition ul').hover(function () {
            $(this).find('li').show();
        }, function () {
            $('.sort-condition ul li').hide();
            $(this).find('.on').show();
        });
        $('.sort-condition ul li, .tool-arrow').click(function () {
            $('.sort-condition ul li').removeClass('on').hide();
            $(this).show().addClass('on');

            if ($(this).html() == "月") {

                $('#gar').show();
                $('#garday').hide();
                getValue = "每月付息";

            } else {

                $('#gar').hide();
                $('#garday').show();
                getValue = "到期本息";
            }

        });
    })();

    (function () { //还款方式下拉
        $('.re-payment-type-1, .tool-arrow-1').click(function (event) {
            $('.re-payment-type-1').css({ 'display': 'none' });
            $('.re-payment-type').css({ 'display': 'inline-block', '*display': 'inline' });
            $('.re-payment-type dd').slideDown(200);
            event.stopPropagation();
        });
        $('.re-payment-type dt, .re-payment-type dd').click(function () {
            getValue = $(this).attr('value');
            setValue = $('.re-payment-type dt').attr('value');
            $('.re-payment-type-1').attr({ 'get-value': getValue }).text(getValue);
            $('.re-payment-type dt').attr({ 'value': getValue }).text(getValue);
            $(this).attr({ 'value': setValue }).text(setValue);
            $('.re-payment-type dd').slideUp();
            $('.re-payment-type').hide();
            $('.re-payment-type-1').css({
                'display': 'inline-block',
                '*display': 'inline'
            });
        });
        $(document).click(function (event) {
            $('.re-payment-type').hide();
            $('.re-payment-type-1').show();
        })
    })();

    (function () { // 表单错误提示
        $('.text-tip').focus(function () {

            tipVal = $(this).attr('value');
            tipVal = Number(tipVal);
            $(this).css({ 'color': '#333' });
            if (isNaN(tipVal)) {
                $(this).attr({ 'value': '' });
            }
            return tipVal;
        })


        $('.text-tip').blur(function () {
            $(this).css({ 'color': '#999' });
            val = Number($(this).val());
            if (isNaN(val) == true) {
                $(this).css({ 'color': 'red' }).addClass('reb-border');
                $(this).parent().find('.err-tip').show();
            } else {
                $(this).removeClass('reb-border').css({ 'color': '#333' });
                $(this).parent().find('.err-tip').hide();
            }
        });

        /*JQuery 限制文本框只能输入数字*/
        $("#money,#moneydata").keyup(function () {
            $(this).val($(this).val().replace(/\D|^0/g, ''));
        }).bind("paste", function () {  //CTR+V事件处理
            $(this).val($(this).val().replace(/\D|^0/g, ''));
        }).css("ime-mode", "disabled"); //CSS设置输入法不可用

        /*JQuery 限制文本框只能输入数字和小数点*/
        $("#toolrate").keyup(function () {
            $(this).val($(this).val().replace(/[^0-9.]/g, ''));
        }).bind("paste", function () {  //CTR+V事件处理
            $(this).val($(this).val().replace(/[^0-9.]/g, ''));
        }).css("ime-mode", "disabled"); //CSS设置输入法不可用

    })();
</script>        <!--footer start-->
		<script type="text/javascript" src="js/settuandaicookie.js"></script>

		<div id="waf_nc_block" style="display: none;">
			<div class="waf-nc-mask"></div>
			<div id="WAF_NC_WRAPPER" class="waf-nc-wrapper"><img class="waf-nc-icon" src="images/TB1_3FrKVXXXXbdXXXXXXXXXXXX-129-128.png" alt="" height="20" width="20">
				<p class="waf-nc-title">安全验证</p>
				<div class="waf-nc-splitter"></div>
				<p class="waf-nc-description">请完成以下验证后继续操作：</p>
				<div id="nocaptcha"></div>
			</div>
		</div>
	</body>

</html>