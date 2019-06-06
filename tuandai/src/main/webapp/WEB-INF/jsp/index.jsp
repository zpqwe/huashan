<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" /><!-- 获取系统当前时间 -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
 <head>
<title>团贷网_专业可靠的互联网金融平台_P2P网贷投资服务</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="mobile-agent" content="format=html5;url=#" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" href="images/favicon.ico?v=20180926" /> 
<link rel="stylesheet" href="css/base.css-v=20180926.css"  />
<link rel="stylesheet" href="css/layout.css-v=20180926.css" />
<link rel="stylesheet" href="css/component.css-v=20180926.css"  />
<link rel="stylesheet" href="css/xiamen-bank.css-v=20180926.css"  />
<link rel="stylesheet" href="css/cgt20161107.css-v=20180926.css"  />
<link rel="stylesheet" href="css/NewBorrowDetail.css-v=20180926.css"  />
<script type="text/javascript" src="js/jquery-1.7.2.min.js" ></script>

<meta name="keywords" content="投资,互联网金融,p2p网贷,p2p投资">
<meta name="description" content="团贷网是专业可靠的互联网金融平台,专注为投资和贷款用户提供优质的互联网投资、网络借贷信息中介服务,为投资者带来稳定收益,解决中小微企业资金需求">
<link rel="stylesheet" href="css/default.css-v=20180926.css" tppabs="css/default.css?v=20180926"/>
</head>
<script type="text/javascript">
 var isWePlanProject = false;         //标记是否在We计划详情页
    var IsOpenCGT = '1';                                       //是否开通存管通
    var isOpenCgtSub = '1';     //是否开启存管通申购
    var isOpenCgtSubWe = '1'; //是否开启存管通申购WE计划
    var IsOpenCgtSubFtb = '1'; //是否开启存管通申购复投宝
    $(document).ready(function(){
     $.ajax({
    	"url":"${pageContext.request.contextPath}/ajaxindex",
    	"type":"post",
    	"data":"json",
    	"dataType":"json",
    	"success":function(data){
    	var tuser=data;
    	if(tuser!=null){
    	$(".tdw-reg-login").css("display","block");
    	$(".tdw-reg-unlogin").css("display","none");
    	
    	}else{
    	$(".tdw-reg-login").css("display","none");
    	$(".tdw-reg-unlogin").css("display","block");
    	}
    	},
    	"error":function(){
    	alert("请求错误")
    	},
    })
    
    	$("#sb").mouseover(function(){
    	$("#sb").attr("class","huiyuan-head  active").siblings().attr("class","huiyuan-head");
    		$("#huiyuan-subject-list-sb-subject-list").show().siblings().hide();
    	})
    	$("#zq").mouseover(function(){
    	$("#zq").attr("class","huiyuan-head  active").siblings().attr("class","huiyuan-head");
    		$("#huiyuan-subject-list-zq").show().siblings().hide();
    	})
    	$("#xw").mouseover(function(){
    	$("#xw").attr("class","huiyuan-head  active").siblings().attr("class","huiyuan-head");
    		$(".huiyuan-subject-list-xw").show().siblings().hide();
    	})
    	$("#wtd").mouseover(function(){
    	$("#wtd").attr("class","huiyuan-head  active").siblings().attr("class","huiyuan-head");
    		$("#huiyuan-subject-list-wtd").show().siblings().hide();
    	})
    	$("#fqb").mouseover(function(){
    	$("#fqb").attr("class","huiyuan-head  active").siblings().attr("class","huiyuan-head");
    		$("#huiyuan-subject-list-fqb").show().siblings().hide();
    	})
    	$("#gyl").mouseover(function(){
    	$("#gyl").attr("class","huiyuan-head  active").siblings().attr("class","huiyuan-head");
    		$("#huiyuan-subject-list-gyl").show().siblings().hide();
    	})
    })
</script>
<body>
<!-- 引入头部 -->
<script type="text/javascript" src="js/getUrl.js"></script>
<jsp:include page="top.jsp"></jsp:include>
<div class="tdw-banner rel">
<div class="bannner-container rel" id="banner-slidebox">
<div class="hd abs z5">
<ul id="thumb-li"><li class=""></li><li class=""></li><li class="on"></li><li class=""></li></ul>
</div>
<div class="bd">
<ul class="slider" id="slideBox" serverdate="" style="position: relative; width: 100%; height: 400px;">
<li data-opacity="0.1" style="background: url(images/1531928667476.jpg) 50% 50% no-repeat; position: absolute; width: 100%; left: 0px; top: 0px; display: none;">
<a href="index.htm" target="_blank">团贷网合规在升级-存管查询上线</a></li>
<li data-opacity="0.1" style="background: url(images/1520752291743.jpg) 50% 50% no-repeat; position: absolute; width: 100%; left: 0px; top: 0px; display: none;">
<a href="index.htm" target="_blank">智能风云系统</a></li>
<li data-opacity="0.1" style="background: url(images/1522720423702.jpg) 50% 50% no-repeat; position: absolute; width: 100%; left: 0px; top: 0px;">
<a href="index.htm" target="_blank">存管成功页</a></li>
<li data-opacity="0.1" style="background: url(images/1538279566655.png) 50% 50% no-repeat; position: absolute; width: 100%; left: 0px; top: 0px; display: none;">
<a href="index.htm" target="_blank">新手学堂活动</a></li></ul>
</div>
</div>
<div class="abs banner-tips"></div>
<div class="abs tdw-reg">
<%-- <c:if test="${tuser==null }"> --%>
<div class="tdw-reg-unlogin" style="display:block">
<div class="text-1 text-orange tc fz16">
<p class="text-666 fz14 mt5">团贷网注册用户</p>
<strong class="text-orange">${userCont}</strong> 人
</div>
<div class="text-1 text-orange tc">
<p class="text-666">参考年回报率</p>
<strong>7%～12.6%</strong>
</div>
<a class="tdw-reg-btn" rel="nofollow" href="registershow">注册领518红包福利</a>
<div class="tc mt15">
<a class="fz14 text-999" rel="nofollow" href="login">立即登录</a>
</div>
</div>
<%-- </c:if> --%>
<%-- <c:if test="${tuser!=null }"> --%>
<div class="tdw-reg-login" style="display: none">
<dl class="userinfo tc">
<dt>
<a href="account_useravatar.htm">
<img src="images/headImg.png" alt="会员头像">
</a>
</dt>
<dd>
<div class="mt10 username text-333">${tuser.username }</div>
<div class="mt25 lv">
<a rel="nofollow" href="account_touplevel" target="_blank">
<img src="images/vip2.png" alt="vip会员">
</a>
</div>
</dd>
</dl>
<a class="tdw-reg-btn" rel="nofollow" href="account_default?windowUrl=${windowUrl }">进入我的账户</a>
</div>
<%-- </c:if> --%>
</div>
</div>

<div class="tdw-notice">
<div class="wth-1200 tdw-notice-container">
<div class="l tdw-notice-text">
<a class="fz14 text-aaa" target="_blank" href="1776.html?mark=9">
<i class="tdw-icons i-notice"></i>
<span class="text-words">关于团贷网系统停服升级的公告</span>
<span class="text-date">2018-10-11</span>
</a>
</div>
<a class="l fz14 text-aaa more-text" target="_blank" href="notict.html?mark=9">查看更多</a>
<a class="r fz14 operation-text-btn" href="operational-data.html?mark=15">
<i class="tdw-icons i-operation"></i>运营数据
</a>
</div>
</div>
<div class="tdw-databox">
<div class="wth-1200">
<div class="tdw-circle">
<div class="col-lg-2 mr16">
<a rel="nofollow" href="bank.html?mark=32" target="_blank">
<dl>
<dt class="l tdw-icons i-guarantee1 tc">
<span class="tdw-icons i-depository"></span>
</dt>
<dd class="l">
<p class="fz18 text-333">银行存管</p>
<p class="fz14 text-999">厦门银行存管，资金分账管理</p>
</dd>
</dl>
</a>
</div>
<div class="col-lg-2 mr16">
<a rel="nofollow" href="safeguard.html?mark=18" target="_blank">
<dl>
<dt class="l tdw-icons i-guarantee1 tc">
<span class="tdw-icons i-risk"></span>
</dt>
<dd class="l">
<p class="fz18 text-333">严格风控</p>
<p class="fz14 text-999">大数据风控模型及专业风控团队</p>
</dd>
</dl>
</a>
</div>
<div class="col-lg-2 col-w-310 mr16 ml5">
<a rel="nofollow" href="aptitude.html" target="_blank">
<dl>
<dt class="l tdw-icons i-guarantee1 tc">
<span class="tdw-icons i-powerful"></span>
</dt>
<dd class="l">
<p class="fz18 text-333">协会理事单位</p>
<p class="fz14 text-999">中国互联网金融协会理事单位</p>
</dd>
</dl>
</a>
</div>
<div class="col-lg-2 last ml5">
<a rel="nofollow" href="operational-data.html?mark=15" target="_blank">
<dl>
<dt class="l tdw-icons i-guarantee1 tc">
<span class="tdw-icons i-strength"></span>
</dt>
<dd class="l">
<p class="fz18 text-333">合规运营</p>
<p class="fz14 text-999">六年稳健运营，合规披露运营数据</p>
</dd>
</dl>
</a>
</div>
</div>
</div>
</div>
<div class="wth-1200">
<div class="tdw-pages tdw-page1">
<h3 class="tdw-page-title">
散标专区
<small class="fz14 text-orange1 text-999 ml5">2018-08-16 17:25起新注册用户，限3次加入机会，累计限额10万</small>
<a class="fz14 text-aaa r" href="invest_list" target="_blank">查看更多</a>
</h3>
<div class="tdw-page1-container">
<c:forEach items="${tsitem}" var="tsitem" varStatus="var">
<c:if test="${var.index!=3 }">
<div class="col-lg-2 mr16">
<a class="rel tdw-subject-box tc c-poi mouseover-shadow" href="mini_detail?siiid=${tsitem.siiid}" target="_blank">
<h4 class="fz20 text-333">${tsitem.siititle}</h4>
<div class="tdw-subject-adddiv">
</div>
<div class="tdw-subject-rate">
<p class="big-text text-orange">${tsitem.siiairate }<small class="fz18">
% </small>
</p>
<p class="fz12 text-999">参考年回报率</p>
</div>
<div class="tdw-progress">
<div class="tdw-progress-bar" style="width:54.00%"></div>
</div>
<div class="tdw-subject-limit fz12">
<p class="l text-999">期限：<span class="text-333">
<c:set var= "interval" value= "${tsitem.siiresidue.time - now.time}" />
<fmt:formatNumber value= "${interval/1000/60/60/24}" type="CURRENCY" pattern= "#" />天</span></p>
<p class="r text-999">剩余：<span class="text-333">${tsitem.siirmoney }万</span></p>
</div>
<div class="mt38 tdw-btn-lg">
<span class="btn-text">加入服务</span>
</div>
</a>
</div>
</c:if>
<c:if test="${var.index==3 }">
<div class="col-lg-2">										<!-- 进入散标详情页 -->
<a class="rel tdw-subject-box tc c-poi mouseover-shadow" href="" target="_blank">
<h4 class="fz20 text-333">${tsitem.siititle}</h4>
<div class="tdw-subject-adddiv">
</div>
<div class="tdw-subject-rate">
<p class="big-text text-orange">${tsitem.siiairate }<small class="fz18">
% </small>
</p>
<p class="fz12 text-999">参考年回报率</p>
</div>
<div class="tdw-progress">
<div class="tdw-progress-bar" style="width:54.00%"></div>
</div>
<div class="tdw-subject-limit fz12">
<p class="l text-999">期限：<span class="text-333">
<%-- <fmt:formatDate value="${tsitem.siiresidue }" pattern="yyyy-MM-dd"/> --%>
<c:set var= "interval" value= "${tsitem.siiresidue.time - now.time}" />
<fmt:formatNumber value= "${interval/1000/60/60/24}" type="CURRENCY" pattern= "#" />天</span></p></span></p>
<p class="r text-999">剩余：<span class="text-333">${tsitem.siirmoney }万</span></p>
</div>
<div class="mt38 tdw-btn-lg">
<span class="btn-text">加入服务</span>
</div>
</a>
</div>
</c:if>
</c:forEach>
</div>
</div>
<div class="tdw-pages tdw-page2">
<h3 class="tdw-page-title">
债权转让
<small class="fz14 text-999 ml5">优先投标&nbsp;&nbsp;快人一步</small>
<a class="fz14 text-aaa r" href="Transfer/list" target="_blank">查看更多</a>
</h3>
<div class="tdw-page2-container">
<c:forEach items="${ttitem}" var="ttitem" varStatus="var">
<c:if test="${var.index!=3}">
<div class="col-lg-2 mr16">
<a class="rel tdw-subject-box tc mouseover-shadow c-poi weOpenBtn" href="Transfer/detail?title=${ttitem.tititle}" data-href="weftb_detail.htm">
<h4 class="fz20 text-333">${ttitem.tititle }<span></span>
<span></span>
</h4>
<div class="tdw-subject-adddiv">
<span class="tdw-addinterest-tag">金秋加息0.5%</span>
</div>
<div class="tdw-subject-rate">
<p class="big-text text-orange">${ttitem.tiinterest }
<small class="fz18">+0.5% </small>
</p>
<p class="fz12 text-999">参考年回报率</p>
</div>
<div class="tdw-progress">
<div class="tdw-progress-bar" style="width:2.00%"></div>
</div>
<div class="tdw-subject-limit fz12">
<p class="l text-999">期限：<span class="text-333">${ttitem.tireperiod }天</span></p>
<p class="r text-999">剩余：<span class="text-333">${ttitem.tisurmoney }万</span></p>
</div>
<div class="mt38 tdw-btn-lg">
<span rel="nofollow" class="btn-text" href="Transfer/detail?title=${ttitem.tititle}" data-href="weftb_detail.htm">加入服务</span>
</div>
</a>
</div>
</c:if>
<c:if test="${var.index==3}">
<div class="col-lg-2">
<a class="rel tdw-subject-box tc mouseover-shadow c-poi weOpenBtn" href="Transfer/detail?title=${ttitem.tititle}" data-href="weftb_detail.htm">
<h4 class="fz20 text-333">${ttitem.tititle }<span></span>
<span></span>
</h4>
<div class="tdw-subject-adddiv">
<span class="tdw-addinterest-tag">金秋加息0.5%</span>
</div>
<div class="tdw-subject-rate">
<p class="big-text text-orange">${ttitem.tiinterest }
<small class="fz18">+0.5% </small>
</p>
<p class="fz12 text-999">参考年回报率</p>
</div>
<div class="tdw-progress">
<div class="tdw-progress-bar" style="width:2.00%"></div>
</div>
<div class="tdw-subject-limit fz12">
<p class="l text-999">期限：<span class="text-333">${ttitem.tireperiod }天</span></p>
<p class="r text-999">剩余：<span class="text-333">${ttitem.tisurmoney }万</span></p>
</div>
<div class="mt38 tdw-btn-lg">
<span rel="nofollow" class="btn-text" href="Transfer/detail?title=${ttitem.tititle}" data-href="weftb_detail.htm">加入服务</span>
</div>
</a>
</div>
</c:if>
</c:forEach>
<!-- 下一模块 -->
<div class="cl"></div>
<div class="col-lg-4 mt16 mr16">
<!-- <a class="tdw-subject-box-lg mouseover-shadow c-poi weOpenBtn" href="weproduct_detail.htm" data-href="weproduct_detail.htm">
<h4 class="fz20 text-333">
<span>We自动服务C</span>
<span></span>
<span class="tdw-addinterest-tag">金秋加息1.5%</span>
<span></span>
</h4>
<div class="tdw-subject-data">
<div class="l subject-col-172">
<p class="big-text text-orange">
11
<small class="fz18 ">+1.5%</small>
</p>
<p class="mt5 fz12 text-999">参考年回报率</p>
</div>
<div class="l subject-col-60 tc">
<p class="mt25 fz18 text-333">12个月</p>
<p class="mt10 fz12 text-999">期限</p>
</div>
<div class="l subject-col-176 tc">
<p class="mt25 fz18 text-333">422.06万</p>
<p class="mt10 fz12 text-999">剩余</p>
</div>
<div class="mt18 tdw-btn">
<span rel="nofollow" class="btn-text" href="weproduct_detail.htm" data-href="weproduct_detail.htm" target="_blank">加入服务</span>
</div>
<div class="tdw-progress">
<div class="tdw-progress-bar" style="width:16.00%"></div>
</div>
</div>
</a> -->
</div>
</div>
</div>
<div class="tdw-pages tdw-page6">
<h3 class="tdw-page-title">
<strong>投资专区</strong>
<a class="fz14 text-aaa r" href="invest_list" target="_blank">查看更多</a>
</h3>
<div class="tdw-page6-container">
<div class="col-lg-2 mr16">
<div class="tdw-huiyuan-box">
<div class="huiyuan-tabtit" id="huiYuanTab">
<ul>
<li class="huiyuan-head  active" data-id="sb" id="sb" style="display:block;">散标专区 <span>${countSanb }</span></li>
<li class="huiyuan-head" data-id="zq" id="zq">债权转让 <span class="opacity-60">${countZh }</span></li>
<li class="huiyuan-head" data-id="xw" id="xw">小微企业 <span class="opacity-60">0</span></li>
<li class="huiyuan-head" data-id="wtd" id="wtd">微团贷 <span class="opacity-60">${countwtd }</span></li>
<li class="huiyuan-head" data-id="fqb" id="fqb">分期宝 <span class="opacity-60">${countfqb }</span></li>
<li class="huiyuan-head" data-id="gyl" id="gyl">供应链 <span class="opacity-60">${countgyl }</span></li>
</ul>
</div>
</div>
</div>
<div class="col-lg-5">
<div class="tdw-huiyuan-box" id="huiYuanTabCon" href="zqzr_detail">
<input type="hidden" id="zShareIds" value="">
<!--散标投资  huiyuan-subject-list zx-subject-list
huiyuan-subject-list-sb-subject-list
-->

<ul class="huiyuan-subject-list zx-subject-list" id="huiyuan-subject-list-sb-subject-list" style="display:block;">
<c:forEach items="${tsitem}" var="tsitem">
<li class="mouseover-shadow1">
<a class="rel huiyuan-subject-item c-poi zshare-rate" data-name="" href="javascript:;">
<div class="abs huiyan-tag">
<span class="auto-hand-tag automation-tag mr10" style="display: inline-block;">自动工具加息1%</span>
<span class="auto-hand-tag hand-movement-tag" style="display: none;"></span>
</div>
<dl class="l huiyuan-wth-435 huiyuan-zxtit">
<dt class="fz18 text-333">${tsitem.siititle}</dt>
<dd class="l huiyuan-wth-126">金额：${tsitem.siitmoney }元</dd>
<dd class="l huiyuan-wth-126">剩余：${tsitem.siirmoney }元</dd>
<dd class="l">起投：${tsitem.siismoney }元</dd>
</dl>
<div class="l huiyuan-wth-94 tc">
<p class="huiyuan-rate text-orange">${tsitem.siiairate }<small class="fz16">%</small><small class="fz16 auto-rate"></small></p>
<p class="mt4 text-999">年化利率</p>
</div>
<div class="l huiyuan-col-223 tc">
<p class="hy-month fz18 text-333">
<%-- <fmt:formatDate value="${tsitem.siiresidue  }" pattern="yyyy-MM-dd"/> --%>
<c:set var= "interval" value= "${tsitem.siiresidue.time - now.time}" />
<fmt:formatNumber value= "${interval/1000/60/60/24}" type="CURRENCY" pattern= "#" /><small class="fz16">天</small></p>
<p class="text-999">期限</p>
</div>
<div class="l tdw-btn-group">
<div class="tdw-btn">
<span rel="nofollow" class="btn-text" href="invest_list?">投资</span>
</div>
</div>
</a>
</li>
</c:forEach>
</ul>

<!-- 债权转让 huiyuan-subject-list-->
<ul class="huiyuan-subject-list" id="huiyuan-subject-list-zq" style="display:none;">
<c:forEach items="${ttitem}" var="ttitem">
<li class="mouseover-shadow1">
<a class="huiyuan-subject-item c-poi" href="" target="_blank">
<dl class="l huiyuan-wth-435">
<dt class="fz18 text-333">${ttitem.tititle }P2P转让_101413594812</dt>
<dd class="l huiyuan-wth-160">转让总额：${ttitem.timoney }万</dd>
<dd class="l huiyuan-wth-126">剩余：${ttitem.tisurmoney }万</dd>
<dd class="l">起投：${ttitem.tistmoney }元</dd>
</dl>
<div class="l huiyuan-wth-94 tc">
<p class="huiyuan-rate text-orange">${ttitem.tiinterest }<small class="fz16">%</small></p>
<p class="mt4 text-999">年化利率</p>
</div>
<div class="l huiyuan-col-223 tc">
<p class="hy-month fz18 text-333">${ttitem.tireperiod }<small class="fz16">天</small></p>
<p class="text-999">期限</p>
</div>
<div class="l tdw-btn-group">
<div class="tdw-btn">
<span rel="nofollow" class="btn-text" href="Transfer/list" target="_blank">投资</span>
</div>
</div>
</a>
</li>
</c:forEach>
</ul>
<!-- 微团贷 -->
<ul class="huiyuan-subject-list" id="huiyuan-subject-list-wtd" style="display:none;">
<c:forEach items="${tsitemwtd}" var="tsitemwtd">
<li class="mouseover-shadow1">
<a class="huiyuan-subject-item c-poi" href="mini_detail" target="_blank">
<dl class="l huiyuan-wth-435">
<dt class="fz18 text-333">${tsitemwtd.siititle}</dt>
<dd class="l huiyuan-wth-126">金额:${tsitemwtd.siitmoney}万</dd>
<dd class="l huiyuan-wth-126">剩余:${tsitemwtd.siirmoney}元</dd>
<dd class="l">起投:${tsitemwtd.siismoney }元</dd>
</dl>
<div class="l huiyuan-wth-94 tc">
<p class="huiyuan-rate text-orange">${tsitemwtd.siiairate }<small class="fz16">%</small></p>
<p class="mt4 text-999">年化利率</p>
</div>
<div class="l huiyuan-col-223 tc">
<p class="hy-month fz18 text-333">${tsitemwtd.siireturn }<small class="fz16">个月</small></p>
<p class="text-999">期限</p>
</div>
<div class="l tdw-btn-group">
<div class="tdw-btn-gray">
<span class="btn-text" href="invest_list?">已满标</span>
</div>
</div>
</a>
</li>
</c:forEach>
</ul>
<!-- 分期宝 -->
<ul class="huiyuan-subject-list" id="huiyuan-subject-list-fqb" style="display:none;">
<c:forEach items="${tsitemfqb}" var="tsitemfqb">
<li class="mouseover-shadow1">
<a class="huiyuan-subject-item c-poi" href="mini_detail" target="_blank">
<dl class="l huiyuan-wth-435">
<dt class="fz18 text-333">${tsitemfqb.siititle}</dt>
<dd class="l huiyuan-wth-126">金额:${tsitemfqb.siitmoney }万</dd>
<dd class="l huiyuan-wth-126">剩余:${tsitemfqb.siirmoney }元</dd>
<dd class="l">起投:${tsitemfqb.siismoney }元</dd>
</dl>
<div class="l huiyuan-wth-94 tc">
<p class="huiyuan-rate text-orange">${tsitemfqb.siiairate }<small class="fz16">%</small></p>
<p class="mt4 text-999">年化利率</p>
</div>
<div class="l huiyuan-col-223 tc">
<p class="hy-month fz18 text-333">${tsitemfqb.siireturn }<small class="fz16">个月</small></p>
<p class="text-999">期限</p>
</div>
<div class="l tdw-btn-group">
<div class="tdw-btn-gray"><!-- javascript:void(0); -->
<span class="btn-text" href="invest_list?">已满标</span>
</div>
</div>
</a>
</li>
</c:forEach>
</ul>
<!-- 小微企业  -->
<ul class="huiyuan-subject-list-xw" style="display:none;">
<li>
<div class="huiyuan-subject-img">
<img src="images/1516161723557.jpg-2018-02-06T17-40-37.jpg" tppabs="images/1516161723557.jpg?2018-02-06T17:40:37" alt="厦门银行">
<img src="images/1516161749857.jpg-2018-06-07T13-53-30.jpg" tppabs="images/1516161749857.jpg?2018-06-07T13:53:30" alt="第三方担保">
<img src="images/1523525146176.jpg-2018-06-07T13-53-43.jpg" tppabs="images/1523525146176.jpg?2018-06-07T13:53:43" alt="大数据风控">
</div>
</li>
</ul>
<!-- 供应链 -->
<ul class="huiyuan-subject-list" id="huiyuan-subject-list-gyl" style="display:none;">
<c:forEach items="${tsitemgyl}" var="tsitemgyl">
<li class="mouseover-shadow1">
<a class="huiyuan-subject-item c-poi" href="mini_detail" target="_blank">
<dl class="l huiyuan-wth-435">
<dt class="fz18 text-333"><%-- ${tsitemgyl.siititle} --%></dt>
<dd class="l huiyuan-wth-126">金额:${tsitemgyl.siitmoney }万</dd>
<dd class="l huiyuan-wth-126">剩余:${tsitemgyl.siirmoney }元</dd>
<dd class="l">起投:${tsitemgyl.siismoney }元</dd>
</dl>
<div class="l huiyuan-wth-94 tc">
<p class="huiyuan-rate text-orange">${tsitemgyl.siiairate }<small class="fz16">%</small></p>
<p class="mt4 text-999">年化利率</p>
</div>
<div class="l huiyuan-col-223 tc">
<p class="hy-month fz18 text-333">${tsitemgyl.siireturn }<small class="fz16">个月</small></p>
<p class="text-999">期限</p>
</div>
<div class="l tdw-btn-group">
<div class="tdw-btn-gray">
<span class="btn-text" href="invest_list?">已满标</span>
</div>
</div>
</a>
</li>
</c:forEach>
</ul>
</div>
</div>
</div>
</div>
<div class="tdw-pages tdw-page7">
<div class="tdw-page7-container">
<div class="col-lg-4 mr16">
<h3 class="tdw-page-title1"><span class="l">政府关怀</span><a class="fz14 text-aaa r" href="guest.html?mark=10" target="_blank">查看更多</a></h3>
<div class="tdw-news-box">
<dl>
<dt class="l">
<a rel="nofollow" href="index.htm" target="_blank"><img src="images/1528354373239.jpg-2018-06-07T14-52-53.jpg" alt="团贷网入选高新技术企业培育库 获政府奖补金300万"></a>
</dt>
<dd class="l">
<a class="fz20 text-333" rel="nofollow" href="index.htm" target="_blank">团贷网入选高新技术企业培育库 获政府奖补金300万</a>
<span class="news-date">2018-06-07</span>
</dd>
</dl>
<ul class="tdw-news-list">
<li>
<i class="new-circle-type"></i><a rel="nofollow" href="#" title="湖北省荆门市委统战部常务副部长任清锋一行到访团贷网" target="_blank">湖北省荆门市委统战部常务副部长任清锋一行到访团贷网</a><span class="news-date">2018-03-22</span>
</li>
<li>
<i class="new-circle-type"></i><a rel="nofollow" href="#" title="东莞南城人力资源分局莅临团贷网，给予春节慰问" target="_blank">东莞南城人力资源分局莅临团贷网，给予春节慰问</a><span class="news-date">2018-02-24</span>
</li>
<li>
<i class="new-circle-type"></i><a rel="nofollow" href="#" title="社科院黄国平、统计之都冯凌秉等到访团贷网" target="_blank">社科院黄国平、统计之都冯凌秉等到访团贷网</a><span class="news-date">2018-01-18</span>
</li>
</ul>
</div>
</div>
<div class="col-lg-4">
<h3 class="tdw-page-title1"><span class="l">公司动态</span><a class="fz14 text-aaa r" href="#" target="_blank">查看更多</a></h3>
<div class="tdw-news-box">
<dl>
<dt class="l">
<a rel="nofollow" href="#" target="_blank"><img src="images/1538101159186.jpg-2018-09-28T10-38.jpg" alt="拥抱监管 全员参与！团贷网合规自查工作再升级"></a>
</dt>
<dd class="l">
<a rel="nofollow" class="fz20 text-333" href="#" target="_blank">拥抱监管 全员参与！团贷网合规自查工作再升级</a>
<span class="news-date">2018-09-24</span>
</dd>
</dl>
<ul class="tdw-news-list">
<li>
<i class="new-circle-type"></i><a rel="nofollow" href="#" target="_blank">团贷网存管银行位列中国互金协会公布首批银行存管白名单</a><span class="news-date">2018-09-21</span>
</li>
<li>
<i class="new-circle-type"></i><a rel="nofollow" href="#" target="_blank">团贷网参加中国互联网金融协会P2P自查自纠培训</a><span class="news-date">2018-08-31</span>
</li>
<li>
<i class="new-circle-type"></i><a rel="nofollow" href="#" target="_blank">团贷网王刚博士获评东莞“首席技师”，市长颁奖勉励</a><span class="news-date">2018-08-27</span>
</li>
</ul>
</div>
</div>
</div>
</div>
<div class="tdw-pages tdw-page8">
<h3 class="tdw-page-title">合作伙伴</h3>
<div class="tdw-page8-container">
<div class="cooperate-links-box">
<ul>
<li class="cooperate-imgs cooperate-img1">
<a></a>
</li>
<li class="cooperate-imgs cooperate-img2">
<a></a>
</li>
<li class="cooperate-imgs cooperate-img3">
<a></a>
</li>
<li class="cooperate-imgs cooperate-img4">
<a></a>
</li>
<li class="cooperate-imgs cooperate-img6">
<a></a>
</li>
<li class="cooperate-imgs cooperate-img9">
<a></a>
</li>
<li class="cooperate-imgs cooperate-img12">
<a></a>
</li>
<li class="cooperate-imgs cooperate-img10">
<a></a>
</li>
</ul>
</div>
</div>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<div class="tdw-tools-bar" id="tdwToolBar">
<ul>
<li>
<a href="javascript:;" id="toolRisk">
<i class="tdw-icons i-tool-risk"></i>
<p>风险<br>提示</p>
</a>
<div class="risk-tips" style="display: none;">
<i></i>
<p>市场有风险<br>投资需谨慎</p>
</div>
</li>
<li>
<a href="javascript:;"  target="_blank">
<i class="tdw-icons i-tool-service"></i>
<p>在线<br>客服</p>
</a>
</li>
<li>
<a href="javascript:;" >
<i class="tdw-icons i-tool-help"></i>
<p>帮助<br>中心</p>
</a>
</li>
<li>
<a href="javascript:;" >
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
<div class="newhand-pop tdw-icons" style="display: none; bottom: 33px;">
<span class="newhand-close"></span>
<div class="newhand-default">查看<br>新手额度 </div>
<div class="newhand-tips">
<p class="text-333 fz16 pb10">您的可用新手额度</p>
<p class="fz30 newhand-quota pb5">0<span>元</span></p>
<p class="w-line"></p>
<p class="fz14 text-999">可用新手次数：<span class="newhand-num">0次</span></p>
</div>
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
应付金额：<span class="font-orange font-bold" id="txtInvestAmount"></span>
</p>
<p id="p_Expected">
参考回报：<span class="font-orange font-bold" id="txtExpected"></span>
<span id="spPrizeInterest" style="display:none;"><b class="font-orange font-bold">+</b><span class="hongbao-jx font-orange font-bold">0.00</span>元</span>
</p>
<div class="invent-form">
<div class="form-box">
<input type="text" class="input-text autoinput" id="txtUnit" value="1" maxlength="10" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false" data-input="true">份
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
<a target="_blank" class="invent-btn" id="PostData" style="cursor:pointer;">立即投资</a>
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
<div style="display: none;" class="dial-window xm-window passwordAlt">
<div class="title1 rel">温馨提示：<i class="close-x cgt-close-x icon db abs"></i></div>
<div class="body">
<div class="">
<p class="p1">开启自动投标前，请您先进行以下授权：</p>
<p class="p2" id="mm_toubiao"><em></em>自动投标<span>（适用于设置自动投标的用户）</span></p>
<p class="p2" id="mm_zhaiquan"><em></em>自动购买债权<span>（适用于购买WE计划的用户）</span></p>
<p class="p2" id="mm_huankuan"><em></em>自动还款<span>（适用于有借款的用户）</span></p>
<p class="p2" id="mm_tixian"><em></em>自动提现<span>（适用于企业及业务相关用户）</span></p>
</div>
</div>
<div class="bottom">
<div class="btn-group">
<a target="_blank" id="btn_showquan" class="btn">立即开通</a>
</div>
</div>
</div>
<div class="xm-mask" style="display: none;"></div>
<div class="xiamen-pop" style="display: none;">
<div class="close"></div>
<div class="pop-tit">
<h3></h3>
<h4>团贷网联手厦门银行</h4>
<p>个人账户升级为厦门银行存管账户</p>
</div>
<div class="pop-body">
<p><span id="sp_open" style="display: none;">您尚未开通厦门银行资金存管账户，请先开通</span><span id="sp_active" style="display: none;">您的账号已升级为厦门银行资金存管账户，请您激活账户</span></p>
<a href="member/Bank/XM_BankBind.aspx" id="aOpen" class="btn">马上开通</a>
<a href="javascript:void(0);" target="_blank" id="aActived" class="btn">马上激活</a>
<a href="member/Bank/XM_BankBind_Complete.aspx" id="aBankBind" class="btn">绑定银行卡</a>
</div>
</div>
<div id="bankBindAlert" style="display: none; margin-left: -220px;" class="dial-window xm-window bankBindAlert">
<div class="title rel">温馨提示：<i class="close-x cgt-close-x icon db abs"></i></div>
<div class="body">
<div class="" style="text-align: center;">
<p class="p1">请您在新打开的页面完成<span id="sp_title"></span></p>
<p class="p2"><span id="sp_title2"></span>完成前请不要关闭此窗口，根据完成结果，选择下面的操作</p>
</div>
</div>
<div class="bottom">
<div class="btn-group">
<a href="javascript:void(0);" id="remind_aa" class="btn"><span id="aa_title"></span></a>
</div>
<a class="question" href="javascript:void(0);" target="_blank"><span id="sp_title3"></span>遇到问题</a>
</div>
</div>
<div id="gangaoAlert" style="display: none;" class="dial-window xm-window hongkong">
<div class="title rel">温馨提示：<i class="close-x cgt-close-x icon db abs"></i></div>
<div class="body">
<div class="" style="text-align: center;">
<div class="codexe" style="width:119px;height:124px;background:url(//images/codexe.png);position:absolute;top:36px;left:281px;z-index: 100;display: none;"></div>
<p><b>由于您的证件为<span id="sp_cardTypeName">港澳通行证</span>，您还需完成以下操作才能进行正常理财：</b></p>
<p>
1、添加专属服务<a id="a_qq" target="_blank" href="#">2880761023</a>或<a class="a_qq a_code" style="background: url(//images/code20170426001.png);cursor: pointer;">2880761023</a>为好友。<br> 2、
<span id="sp_2Content">QQ或微信联系客服专员，需提交以下申请材料：手持港澳台通行证证件彩色半身照【保<br>
证证件号码清晰且不能是镜面照】港澳台通行证背面彩色照片,受理时间为：周一至周五9:00-12:00 13:30-18:00，周六日与法定节假日除外。</span><br> 3、资料提交后，平台及银行将会进行双重审核，一般时长为2天，审核通过后即可进行投资理财，届时会有短信通知。
<br> 4、若已提交过资料给客服，则不需要重复提交，且可进行正常投资理财。
</p>
</div>
<div class="bottom">
<div class="btn-group">
<a id="hkBtn" href="javascript:;" class="btn">我知道了</a>
</div>
</div>
</div>
</div>
<div id="TheadAlert" style="display: none;" class="dial-window xm-window forgetPhone">
<div class="title rel" style="display: block;">温馨提示：<i class="close-x cgt-close-x icon db abs"></i></div>
<div class="body">
<div class="">
<p class="p1"><span id="sp_newcontent">如果您忘记银行卡预留手机号，请与您的发卡银行客服联系，咨询预留手机号</span></p>
</div>
</div>
<div class="bottom">
<div id="btn_03" class="btn-group">
<a id="qiyeBtn" href="javascript:;" class="btn">我知道了</a>
</div>
<div id="btn_04" class="count" style="display: none;">
<a class="td-btn-1 td-btn-1-or btn" href="index.htm">我要修改预留手机号</a>
</div>
</div>
</div>
<div class="left-banner" style="bottom: 55px !important; display: block;">
<div class="pic" style="height: 320px !important;">
<i class="close" style="top:1px !important;left: 117px !important;"></i>
</div>
</div>
<div class="general-adbox">
</div>
<div class="left-banner-jd" id="jd-dialog" style=" display: none;">
<a href="">
</a>
<i class="close"></i>
</div>
<div class="jd-win " style="display: none;">
<i class="jd-win-close   close-x"></i>
<div class="title auto "></div>
<div class="text1  f16 tc mt20 pt20">首笔投资（不含智享转让服务、债权转让）满足以下条件，
<br> 即可获得一张对应最大金额的京东E卡
</div>
<div class="text2 tc mt10">（本活动每人仅限参与一次，最多获得一档京东卡奖励）</div>
<table class="auto">
<tbody><tr>
<th width="120">京东E卡</th>
<th>获取条件</th>
<th>有效时间</th>
</tr>
<tr>
<td colspan="3">
<div class="scroll-div" style="max-height:255px!important;overflow: hidden; ">
<table width="100%" style="margin-top: 0; border: none" id="jd-text">
</table>
</div>
</td>
</tr>
</tbody></table>
<a class="  td-btn-1 mt30 auto  td-btn-1-or jd-btn" href="javascript:;">我知道了</a>
</div>
<div id="waf_nc_block" style="display: none;"><div class="waf-nc-mask"></div>
<div id="WAF_NC_WRAPPER" class="waf-nc-wrapper"><img class="waf-nc-icon" src="images/TB1_3FrKVXXXXbdXXXXXXXXXXXX-129-128.png" alt="" height="20" width="20"><p class="waf-nc-title">安全验证</p>
<div class="waf-nc-splitter"></div><p class="waf-nc-description">请完成以下验证后继续操作：</p><div id="nocaptcha"></div></div></div><img src="images/SingleLogin.ashx" style="display: none;"></body></html>