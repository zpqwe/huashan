<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'invest_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<link rel="dns-prefetch" href="#">
		<link rel="dns-prefetch" href="#">
		<link rel="dns-prefetch" href="#">
		<link rel="dns-prefetch" href="#">
		<link rel="dns-prefetch" href="#">
		<meta property="qc:admins" content="3542563377645164116375">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="css/base.css">
		<link rel="stylesheet" href="css/layout.css">
		<link rel="stylesheet" href="css/component.css">
		<link rel="stylesheet" href="css/xiamen-bank.css">
		<link rel="stylesheet" href="css/cgt20161107.css">
		<link rel="stylesheet" href="css/NewBorrowDetail.css">
		<script charset="utf-8" src="js/v.js"></script>
		<script async="" src="js/sensorsdata.min.js"></script>
		<script src="js/hm.js"></script>
		<script type="text/javascript" async="" src="js/webaccess.js"></script>
		<script type="text/javascript" src="js/6a90d8b9f8e64cf9410db404c47f81fc.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<title>小型投资项目,短期投资,P2P投资平台就上【团贷网】</title>
		<meta name="mobile-agent" content="format=html5;url=需删除或修改m.tuandai.com/pages/invest/invest_list">
		<link rel="alternate" media="only screen and (max-width: 640px)" href="#">
		<meta name="keywords" content="小型投资项目,短期投资,P2P投资">
		<meta name="description" content="团贷网拥有大量互联网投资产品,为你提供优质的小型投资项目、个人短期投资产品,专业可靠的P2P投资平台上团贷网">
		<link rel="stylesheet" href="css/new_invest_list.css">
		<style type="text/css">
			#waf_nc_block {
				position: fixed;
				_position: absolute;
				width: 100%;
				height: 100%;
				top: 0;
				bottom: 0;
				left: 0;
				z-index: 9999;
			}
			
			.waf-nc-mask {
				background: #f8f8f8;
				opacity: 0.5;
				filter: alpha(opacity=50);
				width: 100%;
				height: 100%;
			}
			
			.waf-nc-wrapper {
				width: 480px;
				height: 254px;
				position: absolute;
				top: 50%;
				left: 50%;
				margin-top: -127px;
				margin-left: -240px;
				margin-bottom: 16px;
				background: #ffffff;
				border: 3px solid #00A2CA;
			}
			
			.waf-nc-icon {
				position: absolute;
				top: 18px;
				left: 20px;
			}
			
			.waf-nc-title {
				margin-top: 23px;
				margin-left: 47px;
				font-size: 16px;
				color: #333333;
				line-height: 10px;
				text-align: left;
			}
			
			.waf-nc-splitter {
				margin-left: 26px;
				margin-top: 5px;
				width: 430px;
				height: 0px;
				border: 1px solid #f4f4f4;
			}
			
			.waf-nc-description {
				margin-top: 22px;
				margin-left: 23px;
				font-size: 12px;
				color: #333333;
				text-align: left;
			}
			
			#nocaptcha {
				margin-top: 20px;
				margin-left: 92px;
				width: 300px;
				height36px;
			}
		</style>
		<script src="js/nc.js"></script>
		
	</head>

	<body>
		<jsp:include page="top.jsp"></jsp:include>
			<div class="container w1200 auto fix cl">
				<div class="invest-tag  cl fix  mr10 ">
					<ul class="cl fix mb10">
						<li class="inv-tag-1 ">
							<a href="welist.htm">自动投标服务</a>
						</li>
						<li class="inv-tag-2 on">散标专区</li>
					</ul>
				</div>
				<div class="tags bgff">
					<div class="conition-tag cl fix">
						<div class="r pt15 toptool"><i class="reckon icon"></i>
							<a href="#">收益计算器</a>
						</div>
						<!-- 修改部分style样式 -->
						<style>
						
						.pagination a {
 							 cursor:pointer;
 							 
						}
						
						</style>
						<script type="text/javascript">
	var siitype="";
	var siirepayment="";
	var siiairate="";
	var siireturn="";
	var pageNo=1;
	var rmoney=1;
	var sum="";
	$(document).ready(function() {
		myAjax();
		//还款方式
		$("dd[name='siirepaymentd']").click(function(){
		var siirepaymentd=$("dd[name='siirepaymentd']");
		for(var i=0;i<siirepaymentd.length;i++){
				siirepaymentd.eq(i).attr("class","off");
			}
			$(this).attr("class","on");
			$("#siirepayment").val($(this).text());
			if($(this).text()==null||$(this).text()=="全部"){
				$("#siirepayment").val("");
			}
			pageNo=1;
			siirepayment=$("#siirepayment").val();
			myAjax();
		});
		$("#dvCurStatus").click(function(){
			$("#dvPopSort").show();
		});
		$("#dvPopSort").mouseleave(function(){
			$("#dvPopSort").hide();
		});
		$("#pop01").click(function(){
			$("#dvPopSort").hide();
			rmoney=1;
			$("#dvCurStatus").attr("attrname","进行中的");
			$("#dvCurStatus").attr("attrval","1");
			$("#dvCurStatus").html("进行中的<i class=\"tdw-icons arrow\"></i>");
			myAjax();
		});
		$("#pop02").click(function(){
			$("#dvPopSort").hide();
			rmoney=2;
			$("#dvCurStatus").attr("attrname","已完成的");
			$("#dvCurStatus").attr("attrval","2");
			$("#dvCurStatus").html("已完成的<i class=\"tdw-icons arrow\"></i>");
			myAjax();
		});
		$("#pop03").click(function(){
			$("#dvPopSort").hide();
			rmoney=3;
			$("#dvCurStatus").attr("attrname","已满标的");
			$("#dvCurStatus").attr("attrval","3");
			$("#dvCurStatus").html("已满标的<i class=\"tdw-icons arrow\"></i>");
			myAjax();
		});
		//还款期限
		$("dd[name='siireturnd']").click(function(){
			var siireturnd=$("dd[name='siireturnd']");		
			for(var i=0;i<siireturnd.length;i++){
				siireturnd.eq(i).attr("class","off");
			}	
			$(this).attr("class","on");
			$("#siireturn").val($(this).attr("attrmin"));
			if($(this).text()==null||$(this).text()=="全部"){
				$("#siireturn").val("");
			}
			pageNo=1;
			siireturn=$("#siireturn").val();
			myAjax();
		});
		//年化利率
		$("dd[name='siiairated']").click(function(){
			var siiairated=$("dd[name='siiairated']");		
			for(var i=0;i<siiairated.length;i++){
				siiairated.eq(i).attr("class","off");
			}	
			$(this).attr("class","on");
			$("#siiairate").val($(this).attr("attrval")/100);
			if($(this).text()==null||$(this).text()=="全部"){
				$("#siiairate").val("");
			}
			pageNo=1;
			siiairate=$("#siiairate").val();
			myAjax();
		});
		//标的类型
		$("dd[name='siityped']").click(function(){
		var siitypeds=$("dd[name='siityped']");		
			for(var i=0;i<siitypeds.length;i++){
				siitypeds.eq(i).attr("class","off");
			}	
			$(this).attr("class","on");
			$("#siitype").val($(this).text());
			if($(this).text()==null||$(this).text()=="全部"){
				$("#siitype").val("");
			}
			pageNo=1;
			siitype=$("#siitype").val();
			myAjax();
		});	
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
			myAjax();
		});
		
			$("a[name='orderBy']").click(function(){
		
			var orderBy=$("a[name='orderBy']");		
			for(var i=0;i<orderBy.length;i++){
				orderBy.eq(i).attr("class","off");
				orderBy.eq(i).next().children().attr("class","down-g icon mysort");
				
			}	
			$(this).attr("class","on");
			sum=$(this).attr("orderby");
			if($(this).attr("orderby")<5){
				$(this).attr("orderby",parseInt(sum)+10);
				$(this).next().children().attr("class","icon mysort down-o");
			}else{
				$(this).attr("orderby",parseInt(sum)-10);
				$(this).next().children().attr("class","icon mysort up-o");
			}
			sum=$(this).attr("orderby");
			if(sum==null){
				sum="";
			}
			myAjax();
		});						
		//获取pageNo事件
		$(document).on("click",".pagination a",function(){
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
			myAjax();
		});
	
	});
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
        return date.getFullYear() + "-" + month + "-" + currentDate+" "+hour + ":" + min + ":" + sec;

    }
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
	function myAjax(){
		$.ajax({
			     "url":"${pageContext.request.contextPath}/tsiItemAjax", 
			     "type":"post", 
			     "data":{"siitype":siitype,"siirepayment":siirepayment,"siiairate":siiairate,"pageNo":pageNo,"siireturn":siireturn,"order":sum,"rmoney":rmoney}, 
			     "dataType":"json", 
			     "success":function(page) { 	
			     var pages=$("#divfqbaolist");
			     	pages.empty();
					pages.append("<div id=\"pagination\" class=\"pagination\"></div>");
					var pagination=$(".pagination");
			     	pagination.empty();
					pagination.append("<div class=\"godiv\"></div>");
			     	var godiv=$(".godiv");
			     	godiv.empty();
			     	if(page.totalPage>1){	
			     	if(page.pageNo==1){
			     	pagination.append("<span class=\"current prev\">上一页</span>");
			     	}else if(page.pageNo>1){
			     		pagination.append("<a class=\"prev\">上一页</a>");
			     	}	   		
					for(var i=1;i<=page.totalPage;i++){
					if(page.pageNo==i){
						pagination.append("<span  class=\"current\">"+i+"</span>");
					}else{
						pagination.append("<a class=\"pageNo\">"+i+"</a>");
					}
					}
					if(page.pageNo>=page.totalPage){
						pagination.append("<span class=\"current next\">下一页</span>");
					}
					if(page.pageNo<page.totalPage){
						pagination.append("<a  class=\"next\">下一页</a>");
					}
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
			     	}
			     	var list=$("#fqbaolist");
			     	list.empty();
			     	var result=page.list;
			     	if(result==""||result.length==1){
			     		$("#inv-list-1").css("display","block");
			     	}else{
			     		$("#inv-list-1").css("display","none");
			     	}
			     	list.append("<div id=\"divfqbaolist\"></div> ");
			     		var listdiv=$("#divfqbaolist");
			     		var tsidata="";
			     		var nowtime=formatterDateTime(new Date());
			     		var nowtimes= new Date(nowtime);
			     	for(var i=0;i<result.length;i++){
			     		var siiresidue=changeDateFormat(result[i].siiresidue);
			     		var siiresidues=new Date(siiresidue);
			     		
			     		tsidata+="<dl class=\"inv-list cl fix\"><dd class=\"l ml20 detail\">"
			     		+"<div class=\"inv-title pt5\">"
			     		+"<a href=\"${pageContext.request.contextPath}/mini_detail?siiid="+result[i].siiid+"\" class=\"ell i-b-d \" title=\""+result[i].siititle+"\">"+result[i].siititle+"</a>"
			     		+"</div>"
			     		+"<div class=\"inv-data\">"
			     		+"<ul>"
			     		+"<li>借款金额:"+result[i].siitmoney+"</li>"
			     		+"<li>起投金额:"+result[i].siismoney+"元 </li>"
			     		+"<li class=\"surplus\">剩余:"+result[i].siirmoney+"元</li>"
			     		+"<li class=\"percent\"><span class=\"f36 g-orange2 fa\"> "+result[i].siiairate+"</span><span class=\"g-orange2\">%</span> 利率 </li>"
			     		+"<li class=\"ml1 repays\"><span class=\"f28 g303030 fa\">"+result[i].siireturn+"${inv.siireturn}</span><span class=\"g303030\">个月</span>/"+result[i].siirepayment+"</li>"
			     		+"</ul>"
			     		+"</div>"
			     		+"</dd>"
			     		+"<dd class=\"l inv-progress fqb\">";
			     		if(result[i].siirmoney==0){
			     			tsidata+="<a class=\"join td-btn-1   td-btn-1-gar mt20\" href=\"javascript:void(0);\">已满标</a>";
			     		}else{
			     		if(siiresidues-nowtimes>0){
			     			tsidata+="<a class=\"join td-btn-1  mt20 td-btn-1-or\" href=\"${pageContext.request.contextPath}/mini_detail?siiid="+result[i].siiid+"\" attrid=\"B437C68E-2AE2-4C57-A5EC-CE3CF3B4AE3F\">我要投标</a>";
			     		}else{
			     			tsidata+="<a class=\"join td-btn-1   td-btn-1-gar mt20\" href=\"javascript:void(0);\">已完成</a>";
			     		}
			     		}
			     		
			     		tsidata+="</dd></dl>";
              		 }
              		listdiv.append(tsidata);
				  },
			      "error":function() { 
			      	 alert("请求失败");
				  }
			});
	}
</script>
						<form name='form1' id="form1" action='${pageContext.request.contextPath}/invest_list' method='post'>  
						<input type="text" id="siitype"  name="siitype" value="${tsi.siitype }" hidden/>
						<input type="text" id="siireturn" name="siireturn" value=""  hidden/>
						<input type="text" id="siiairate" name="siiairate" value="${tsi.siiairate }"  hidden/>
						<input type="text" id="siirepayment" name="siirepayment" value="${tsi.siirepayment }"  hidden/>
						
						<div class="l condition-list">
							<dl class="invest-tag" id="invest-tags" type="projecttype">
								<dt>标的类型：</dt>
								
								<dd name="siityped" id="inv-tag-0" <c:if test="${tsi.siitype==''||tsi.siitype==null}"> class="on"</c:if>  attrisfirst="0" attrstatus="1" >全部<span class="or"></span></dd>
								<dd name="siityped" id="inv-tag-1" <c:if test="${tsi.siirepayment=='小微企业'}"> class="on"</c:if> attrisfirst="0" attrstatus="1">小微企业<span class="or"></span></dd>
								<dd name="siityped" id="inv-tag-2" <c:if test="${tsi.siirepayment=='微团贷'}"> class="on"</c:if> attrisfirst="0" attrstatus="1">微团贷<span class="or"></span></dd>
								<dd name="siityped" id="inv-tag-3" <c:if test="${tsi.siirepayment=='分期宝'}"> class="on"</c:if> attrisfirst="0" attrstatus="1">分期宝<span class="or"></span></dd>
								<dd name="siityped" id="inv-tag-4" <c:if test="${tsi.siirepayment=='供应链'}"> class="on"</c:if> attrisfirst="0" attrstatus="1">供应链<span class="or"></span></dd>
							</dl>
							<dl class="payback" type="term" style="width: 800px;">
								<dt>还款期限：</dt>
								<dd name="siireturnd" attrtype="3" attrmin="0" attrmax="0" attrval="0" class="on">全部</dd>
								<dd name="siireturnd" attrtype="3" attrmin="1" attrmax="3">1-3个月</dd>
								<dd name="siireturnd" attrtype="3" attrmin="3" attrmax="6">3-6个月</dd>
								<dd name="siireturnd" attrtype="3" attrmin="6" attrmax="12">6-12个月</dd>
								<dd name="siireturnd" attrtype="3" attrmin="12" attrmax="60">12个月以上</dd>
							</dl>
							<dl class="" type="interest-rate">
								<dt>年化利率：</dt>
								<dd name="siiairated" attrtype="1" attrval="0" class="on">全部</dd>
								<dd name="siiairated" attrtype="1" attrval="5">5%以上</dd>
								<dd name="siiairated" attrtype="1" attrval="9">9%以上</dd>
								<dd name="siiairated" attrtype="1" attrval="11">11%以上</dd>
								<dd name="siiairated" attrtype="1" attrval="13">13%以上</dd>
							</dl>
							<dl type="payback-type">
								<dt>还款方式：</dt>
								<dd name="siirepaymentd" attrtype="2" attrval="0" <c:if test="${tsi.siirepayment==''||tsi.siirepayment==null}"> class="on"</c:if>>全部</dd>
								<dd name="siirepaymentd" attrtype="2" attrval="2" <c:if test="${tsi.siirepayment=='每月付息'}"> class="on"</c:if>>每月付息</dd>
								<dd name="siirepaymentd" attrtype="2" attrval="1" <c:if test="${tsi.siirepayment=='到期本息'}"> class="on"</c:if>>到期本息</dd>
								<dd name="siirepaymentd" attrtype="2" attrval="5" <c:if test="${tsi.siirepayment=='等额本息'}"> class="on"</c:if>>等额本息</dd>
								<dd name="siirepaymentd" attrtype="2" attrval="9" <c:if test="${tsi.siirepayment=='不等额还款'}"> class="on"</c:if>>不等额还款</dd>
							</dl>
						</div>
						</form>
						<div class="r pr20">
							<div class="we_pro pt20 ">
								<a href="#"><img class="db" src="images/we-pro-1.png" alt="智能投资WE计划"></a>
							</div>
						</div>
					</div>
				</div>
				<div class="w1200 mt15 cl fix mb35">
					<div class="news-list r db">
						<div class="news bgff">
							<div class="news-body">
								<h2 class="f16"><a href="#" class="r more f14">更多&gt;</a>常见问题</h2>
								<ul>
									<li>
										<a href="#">在团贷网投资有哪些保障？</a>
									</li>
									<li>
										<a href="#">投标后什么时间开始计息？</a>
									</li>
									<li>
										<a href="#">什么是自动投标？</a>
									</li>
									<li>
										<a href="#">团贷网投资是否需要收取佣金？</a>
									</li>
									<li>
										<a href="#">银行存管有什么优势？</a>
									</li>
									<li>
										<a href="#">什么是We计划？</a>
									</li>
									<li>
										<a href="#">什么是第三方担保？</a>
									</li>
									<li>
										<a href="#">借款人逾期了怎么办？</a>
									</li>
									<li>
										<a href="#">投标前需要注意什么？</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="inv-list-warp auto bgff l">
						<div class="sort rel z1 auto">
						<div class="sort-condition  abs r">
<div class="val bgff" id="dvCurStatus" attrname="进行中的" attrval="1">进行中的
<i class="tdw-icons arrow"></i>
</div>
<ul class="bgff abs" style="display: none;" id="dvPopSort">
<li class="sort-condition-first v1" id="pop01" attrval="1" attrname="进行中的">进行中的</li>
<li class="sort-condition-last v2" id="pop02" attrval="2" attrname="已完成的">已完成的</li>
<li class="sort-condition-last v2" id="pop03" attrval="3" attrname="已满标的">已满标的</li>
</ul>
</div>
							<dl>
								<dt>排序方式：</dt>
								<dd onclick="OrderByFun(DefaultOrderBy);">
									<a name="orderBy" class="on" href="javascript:void(0);" orderby="0" id="DefaultOrderBy">默认排序</a>
								</dd>
								
								
								<dd class="rate-wth" onclick="OrderByFun('APROrderBy',9);">
								<a name="orderBy" href="javascript:void(0);" orderby="1" >年化利率</a>
								<span class="arr">
								<span class="down-g icon mysort"  id="orderBy1"></span>
								</span>
								</dd>
								
								<dd onclick="">
									<a name="orderBy" href="javascript:void(0);" orderby="2">投资期限</a>
									<span class="arr">
									<span class="down-g icon mysort"  id="orderBy2"></span>
									</span>
								</dd>
								<dd onclick="">
									<a name="orderBy" href="javascript:void(0);" orderby="3">投标进度</a>
									<span class="arr">
									<span class="down-g icon mysort"  id="orderBy3"></span>
									</span>
								</dd>
								<dd onclick="">
									<a name="orderBy" href="javascript:void(0);" orderby="4">发标时间</a>
									<span class="arr">
									<span class="down-g icon mysort"  id="orderBy4"></span>
									</span>
								</dd>
							</dl>
							
						</div>
						<!--使用new_investlist.js的$.ajax-->
						<div class="inv-list-detail auto">
							
						<!--沈浩天JSP修改部分-->
							<div id="inv-list-3" class="financial-list list-3 cl fix" style="display:block;">
								<div id="fqbaolist">
								<!--
								 <c:forEach items="${page.list}" var="inv"> 
								 
									<dl class="inv-list cl fix">
										<dd class="l ml20 detail">
											<div class="inv-title pt5">
												<a href="${pageContext.request.contextPath}/zqzr_detail?siiid=${inv.siiid}" class="ell i-b-d " title="${inv.siititle }">${inv.siititle }</a>
											</div>
											<div class="inv-data">
												<ul>
													<li>借款金额:${inv.siitmoney }</li>
													<li>起投金额:${inv.siismoney}元 </li>
													<li class="surplus">剩余:${inv.siirmoney}元</li>
													<li class="percent"><span class="f36 g-orange2 fa"> ${inv.siiairate*100}</span><span class="g-orange2">%</span> 利率 </li>
													<li class="ml1 repays"><span class="f28 g303030 fa">${inv.siireturn}</span><span class="g303030">个月</span>/${inv.siirepayment}</li>
												</ul>
											</div>
										</dd>
										<dd class="l inv-progress fqb">
											
											<a class="join td-btn-1  mt20 td-btn-1-or" href="${pageContext.request.contextPath}/zqzr_detail?siiid=${inv.siiid}" attrid="B437C68E-2AE2-4C57-A5EC-CE3CF3B4AE3F">我要投标</a>
										</dd>
									</dl>
									</c:forEach>
							-->

								</div>
								
								
							</div>
						</div>
						<div id="inv-list-1" class="financial-list list-1 cl fix" style="display:none;">
								<div id="projectlist">
									<div style="text-align:center;"><img width="880px;" alt="厦门银行" src="images/1516161723557.jpg"><img width="880px;" alt="第三方担保" src="images/1516161749857.jpg"><img width="880px;" alt="大数据风控" src="images/1523525146176.jpg"></div>
								</div>
								<div id="divPagination" class="pagetop"></div>
							</div>
							<div id="divfqbaolist" class="pagetop" style="display:block;">
								<!-- 
									<div class="pagination">
									<c:if test="${page.pageNo==1}"><span class="current prev">上一页</span></c:if>
									<c:if test="${page.pageNo>1}">
									<a href="${pageContext.request.contextPath}/invest_list?pageNo=${page.pageNo-1}" class="prev">上一页</a></c:if>
									<c:forEach begin="1" end="${page.totalPage}" var="i" >
									<c:if test="${page.pageNo==i}"><span class="current">${i}</span></c:if>
									<c:if test="${page.pageNo!=i}"><a href="${pageContext.request.contextPath}/invest_list?pageNo=${i}">${i}</a></c:if>
									</c:forEach>
									<c:if test="${page.pageNo==page.totalPage}"><span class="current next">下一页</span></c:if>
									<c:if test="${page.pageNo<page.totalPage}"><a href="${pageContext.request.contextPath}/invest_list?pageNo=${page.pageNo+1}" class="next">下一页</a></c:if>
										<div class="godiv"><input class="input-val page-text" type="text" style="height:80px;"placeholder="跳转页数"><input id="tiaozhuan" class="gobtn page-btn" type="button" style="color:#D3D3D3;" value="跳转"></div>
									</div>
								-->
								</div>
						<!--123-->
						<div id="inv-list-4" class="financial-list list-4" style="display: none;">
							<div id="gyllist">
								<dl class="inv-list cl fix">
									<dd class="l ml20 detail">
										<div class="inv-title pt5">
											<a href="#" class="ell i-b-d " title="供应链【JT20181012173320648】">供应链【JT20181012173320648】</a>
											<div class="jing-tip-box clearfloat" style="display: none;"> </div>
										</div>
										<div class="inv-data">
											<ul>
												<li>借款金额:100万</li>
												<li>起投金额:10元 </li>
												<li class="surplus">剩余:0元</li>
												<li class="percent"><span class="f36 g-orange2 fa">8.5</span><span class="g-orange2">%</span> 利率 </li>
												<li class="ml1 repays"><span class="f28 g303030 fa">3</span><span class="g303030">个月</span>/到期本息</li>
											</ul>
										</div>
									</dd>
									<dd class="l inv-progress">
										<a class="join td-btn-1   td-btn-1-gar mt20" href="javascript:void(0);">已满标</a>
									</dd>
								</dl>
								<dl class="inv-list cl fix">
									<dd class="l ml20 detail">
										<div class="inv-title pt5">
											<a href="#" class="ell i-b-d " title="供应链【JT20181012173049988】">供应链【JT20181012173049988】</a>
											<div class="jing-tip-box clearfloat" style="display: none;"> </div>
										</div>
										<div class="inv-data">
											<ul>
												<li>借款金额:100万</li>
												<li>起投金额:10元 </li>
												<li class="surplus">剩余:0元</li>
												<li class="percent"><span class="f36 g-orange2 fa">8.5</span><span class="g-orange2">%</span> 利率 </li>
												<li class="ml1 repays"><span class="f28 g303030 fa">3</span><span class="g303030">个月</span>/到期本息</li>
											</ul>
										</div>
									</dd>
									<dd class="l inv-progress">
										<a class="join td-btn-1   td-btn-1-gar mt20" href="javascript:void(0);">已满标</a>
									</dd>
								</dl>
								<dl class="inv-list cl fix">
									<dd class="l ml20 detail">
										<div class="inv-title pt5">
											<a href="#" class="ell i-b-d " title="供应链【JT20181012152112611】">供应链【JT20181012152112611】</a>
											<div class="jing-tip-box clearfloat" style="display: none;"> </div>
										</div>
										<div class="inv-data">
											<ul>
												<li>借款金额:10万</li>
												<li>起投金额:10元 </li>
												<li class="surplus">剩余:0元</li>
												<li class="percent"><span class="f36 g-orange2 fa">11</span><span class="g-orange2">%</span> 利率 </li>
												<li class="ml1 repays"><span class="f28 g303030 fa">6</span><span class="g303030">个月</span>/等额本息</li>
											</ul>
										</div>
									</dd>
									<dd class="l inv-progress">
										<a class="join td-btn-1   td-btn-1-gar mt20" href="javascript:void(0);">已满标</a>
									</dd>
								</dl>
								<dl class="inv-list cl fix">
									<dd class="l ml20 detail">
										<div class="inv-title pt5">
											<a href="#" class="ell i-b-d " title="供应链【JT20181011-1】">供应链【JT20181011-1】</a>
											<div class="jing-tip-box clearfloat" style="display: none;"> </div>
										</div>
										<div class="inv-data">
											<ul>
												<li>借款金额:29.872万</li>
												<li>起投金额:10元 </li>
												<li class="surplus">剩余:0元</li>
												<li class="percent"><span class="f36 g-orange2 fa">8.5</span><span class="g-orange2">%</span> 利率 </li>
												<li class="ml1 repays"><span class="f28 g303030 fa">3</span><span class="g303030">个月</span>/到期本息</li>
											</ul>
										</div>
									</dd>
									<dd class="l inv-progress">
										<a class="join td-btn-1   td-btn-1-gar mt20" href="javascript:void(0);">已满标</a>
									</dd>
								</dl>
								<dl class="inv-list cl fix">
									<dd class="l ml20 detail">
										<div class="inv-title pt5">
											<a href="#" class="ell i-b-d " title="供应链【JT20181011135315439】">供应链【JT20181011135315439】</a>
											<div class="jing-tip-box clearfloat" style="display: none;"> </div>
										</div>
										<div class="inv-data">
											<ul>
												<li>借款金额:100万</li>
												<li>起投金额:10元 </li>
												<li class="surplus">剩余:0元</li>
												<li class="percent"><span class="f36 g-orange2 fa">8.5</span><span class="g-orange2">%</span> 利率 </li>
												<li class="ml1 repays"><span class="f28 g303030 fa">3</span><span class="g303030">个月</span>/到期本息</li>
											</ul>
										</div>
									</dd>
									<dd class="l inv-progress">
										<a class="join td-btn-1   td-btn-1-gar mt20" href="javascript:void(0);">已满标</a>
									</dd>
								</dl>
							</div>
							<div id="divPaginationGyl" class="pagetop">
								<div class="pagination"><span class="current prev">上一页</span><span class="current">1</span>
									<a href="#">2</a>
									<a href="#">3</a>
									<a href="#">4</a>
									<a href="#">5</a><span>...</span>
									<a href="#" class="ep">19</a>
									<a href="#" class="ep">20</a>
									<a href="#" class="next">下一页</a>
									<div class="godiv"><input class="input-val page-text" type="text" placeholder="跳转页数"><input class="gobtn page-btn" type="button" value=""></div>
								</div>
							</div>
						</div>

						<div id="inv-list-7" class="financial-list list-7" style="display:none;">
							<div id="ZqZrlist">
							</div>
							<div id="divPaginationZqZr" class="pagetop">
							</div>
						</div>
					</div>
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
								<a rel="nofollow" href="#">新手指引</a>
							</dd>
							<dd>
								<a rel="nofollow" href="#">帮助中心</a>
							</dd>
							<dd>
								<a rel="nofollow" href="#">资费介绍</a>
							</dd>
						</dl>
						<dl>
							<dt>保障体系</dt>
							<dd>
								<a rel="nofollow" href="#">法律法规</a>
							</dd>
							<dd>
								<a rel="nofollow" href="#">保障体系</a>
							</dd>
							<dd>
								<a rel="nofollow" href="#">合作机构</a>
							</dd>
						</dl>
						<dl>
							<dt>如何投资</dt>
							<dd>
								<a href="#">投资资讯</a>
							</dd>
							<dd>
								<a href="#">团贷问答
								</a>
							</dd>
							<dd>
								<a href="#">团贷百科
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
							<a class="r rel custombox" href="#" title="在线服务" rel="nofollow">
								<span class="btn-text">在线客服</span></a>
						</div>
					</div>
				</div>
				<div class="tdw-footer-supervise">
					<a class="super-img1" rel="external nofollow" href="#"></a>
					<a class="super-img2" rel="external nofollow" href="#"></a>
					<a class="super-img3" rel="external nofollow" href="#"></a>
					<a class="super-img4" rel="external nofollow" href="#"></a>
					<a class="super-img5" rel="external nofollow" href="#"></a>
					<a class="super-img6" rel="external nofollow" id="___szfw_logo___" href="#"></a>
					<a class="super-img8" rel="external nofollow" id="_pingansec_bottomimagesmall_p2p" href="#"></a>
					<a class="super-img9" href="#" alt="企业名称：东莞团贷网互联网科技服务有限公司法定代表人：唐军标识状态：已激活 粤工商备P191608002336"></a>
				</div>
				<div class="footer-content auto fix cl">
					<div class="address fa f12 tc mt15">
						2010-<span>2018</span> 版权所有 © 团贷网
						<a href="#" rel="nofollow">粤ICP备12043601号-1</a> 粤公安网备44190002000538号 东莞团贷网互联网科技服务有限公司
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
					<a href="javascript:;" onclick="">
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
		<div id="td-art" style="display:none">
			<div class="art-body">
				<i class="close icons close-x icon abs" style="top: -30px; right: -32px;"></i>
				<div id="recharge-art" class="recharge-art">
					<div class="left">
						<p id="art_UserName">
						</p>
						<p id="art_ProjectAmount">
						</p>
						<p id="art_ReTime">
						</p>
						<p id="art_Rate">
						</p>
						<p id="txtLowerUnit">
						</p>
						<p id="art_ReType">
						</p>
						<div class="reward" id="art_PublicRate">
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
							可用余额：<span class="font-000" id="art_UserFund"></span>
						</p>
						<p id="txtMaxUnit1">
						</p>
						<p>
							申购金额：<span class="font-orange font-bold" id="txtInvestAmount"></span>
						</p>
						<p id="p_Expected">
							预期收益：<span class="font-orange font-bold" id="txtExpected"></span>
							<span id="spPrizeInterest" style="display:none;"><b class="font-orange font-bold">+</b><span class="hongbao-jx font-orange font-bold">0.00</span>元</span>
						</p>
						<div class="invent-form">
							<div class="form-box">
								<input type="text" class="input-text autoinput" id="txtUnit" value="1" maxlength="10" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false" data-input="true">元
							</div>
							<i class="top" id="btnPlus"></i><i class="bottom" id="btnMinus"></i>
							<a href="javascript:void(0)" id="AllInvest">全额</a>
						</div>
						<div class="invent-form" style="margin-top: 15px; margin-bottom: 35px; height: 16px; line-height: 16px; display: none;" id="dCode">
							<input type="text" placeholder="请输入手机验证码" id="MobileCode" style="height: 33px; line-height: 33px; padding-left: 12px; border: 1px solid #d5d5d5; width: 195px; border-radius: 3px; -webkie-border-radius: 3px;">
							<a href="javascript:void(0)" id="GetCode">发送验证码</a>
						</div>
						<div id="redpackform">
						</div>
						<div class="money-errmes">
							输入金额只能为起投金额的整数倍，已为您自动调整
						</div>
						<a class="invent-btn" id="PostData" style="cursor:pointer;">立即投资</a>
						<input type="hidden" id="hiDeadline">
						<input type="hidden" id="hiInterestRate">
						<input type="hidden" id="hiRepaymentType">
						<input type="hidden" id="hiProjectType">
						<input type="hidden" id="hiUnit">
						<input type="hidden" id="txtPublicRate">
						<input type="hidden" id="txtTuandaiRate">
						<input type="hidden" id="hiNeedPassWord">
						<input type="hidden" id="hiTotalInvest ">
						<input type="hidden" id="hiCanGetPackage ">
						<input type="hidden" id="hiNeedInvest ">
						<input type="hidden" id="hiIsNewUser ">
						<input type="hidden" id="hiIsAwardOverdue ">
						<input type="hidden" id="hiAreaInvest ">
						<input type="hidden" id="hiIsScribeTanfer">
						<input type="hidden" id="hiProjectDeadline">
						<input type="hidden" id="hiNewHandRate">
						<input type="hidden" id="hiHQBAmount">
						<input type="hidden" id="hiDeadType">
						<div class="agreement f12  font-666" id="AgreeDiv"></div>
					</div>
				</div>
			</div>
		</div>
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
				<a href="#"><i class="close-x cgt-close-x icon db abs"></i></a>
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
					<a href="#" id="remind_aa" class="btn">
						<span id="aa_title">绑卡成功</span>
					</a>
				</div>
				<a class="question" href="#">
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
				<a href="#" id="aOpen" class="btn">马上升级</a>
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
								<a target="blank" href="#">
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
								<a target="blank" href="#">
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
								<a target="blank" href="#">
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
							<a id="chongzhiotherbtn" class="td-btn-1 td-btn-1-or btn" href="javascript:;">我要修改预留手机号</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="display: none;" id="closeWindowTh" class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body cgt-box">
				<div class="  mt10">
					<div id="body_dv_top" class="top">
						<p>
							<span class="ok-icon"></span>
							<span id="body_dv_head">js3投标成功</span>
						</p>
					</div>
					<div id="body_dv_bottom" class="bottom">
						<div id="btn_01" class="count" style="display:block;">
							<p class="pb30">此页将在
								<span class="num">3s</span>后关闭，请在原页面继续操作</p>
							<a class="td-btn-1 td-btn-1-or btn cgt-close-x" href="javascript:;">立即关闭</a>
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
							<a id="zhixiang-btn" class="td-btn-1 td-btn-1-or btn btn-s" href="javascript:;">去授权</a>
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
		<script type="text/javascript" src="js/project_dialog_cgt.js"></script>
		<script type="text/javascript" src="js/select_redbox.js"></script>
		<script charset="GB2312" type="text/javascript" src="js/cgt_common.js"></script>
		<script type="text/javascript">
			var isWePlanProject = false; //标记是否在We计划详情页
			var IsOpenCGT = '1'; //是否开通存管通
			var isOpenCgtSub = '1'; //是否开启存管通申购
			var isOpenCgtSubWe = '1'; //是否开启存管通申购WE计划
			var IsOpenCgtSubFtb = '1'; //是否开启存管通申购复投宝
		</script>
		<script type="text/javascript" src="js/jquery.pagination.js"></script>
		<script type="text/javascript" src="js/new_investlist.js"></script>
		<script type="text/javascript">
			var contractViewUrl = "\/\/contract.tuandai.com";
			var portalWebsiteUrl = "https:\/\/www.tuandai.com";
			var invest_count = 0;
			var micro_count = 0;
			var fqb_count = 0;
			var gyl_count = 0;
			var xmb_count = 0;
			var jing_count = 0;
			var zqzr_count = 0;
			var CanInvestObj = {
				invest_count: 0,
				micro_count: 0,
				fqb_count: 0,
				gyl_count: 0,
				xmb_count: 0,
				jing_count: 0,
				zqzr_count: 0
			};
			var type = 1; //当页页签索引

			$(function() {
				//$('#login-window').find('.input-text').focus(function () {
				//    $('#login-window').find('.input-text').css({ "border": "1px solid #d5d5d5" });
				//    $(this).css({ "border": "1px solid #48d6a2" })
				//});
				$('input[placeholder], textarea[placeholder]').each(function() {
					$(this).is('input') ? $(this).iePlaceholder() : $(this).iePlaceholder({
						onInput: false
					});
				}); //INPUT   提示
				initSearch(type);
				getInvestList(type, true);
				//初始化申购事件
				// investInitActive();
				//InitAllPagePagin();
				initSearch(type);
			});
		</script>
		<script type="text/javascript">
			/*<![CDATA[
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
				ta.src = ((("https:") == document.location.protocol) ? "需删除或修改" : "http://") + 'bilog.niiwoo.com/js/webaccess.js';
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