<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script charset="utf-8" src="js/v.js"></script>
	<script src="js/112.js" id="AWSC_uabModule"></script>
	<script async="" src="css/sensorsdata.min.js"></script>
	<script type="text/javascript" class="nc-required-js-1 nc-umid-script" src="js/um.js"></script>
	<script type="text/javascript" class="nc-required-js-1 nc-uab-script" src="js/awsc.js"></script>
	<script src="css/initialize.jsonp"></script>
	
 
	<link rel="dns-prefetch" href="#">
	<link rel="dns-prefetch" href="#">
	<link rel="dns-prefetch" href="#">
	<link rel="dns-prefetch" href="#">
	<link rel="dns-prefetch" href="#">
	<meta property="qc:admins" content="3542563377645164116375">
	<!-- 启用360浏览器的极速模式(webkit) -->
	<meta name="renderer" content="webkit">
	<!-- 避免IE使用兼容模式 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="shortcut icon" href="#">
	<link rel="stylesheet" href="css/base.css">
	<!-- 前端公用CSS库-->
	<!--<link rel="stylesheet" th:href="'//js3.tuandai.com/styles/public.css?v=' + ${Globals.version}" />-->
	<link rel="stylesheet" href="css/layout.css-v=20180926.css">
	<link rel="stylesheet" href="css/component.css-v=20180926.css">
	<link rel="stylesheet" href="css/xiamen-bank.css-v=20180926.css">
	<link rel="stylesheet" href="css/cgt20161107.css-v=20180926.css">
	<link rel="stylesheet" href="css/account-new.css">
	<link rel="stylesheet" href="css/account-public.css">
	<link rel="stylesheet" href="css/NewBorrowDetail.css">
	<script src="js/hm.js"></script><script type="text/javascript" async="" src="js/webaccess.js"></script><script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<!-- 首页UI CSS-->
	<title>用户注册_团贷网</title>
	<!--<link rel="stylesheet" th:href="'//js3.tuandai.com/styles/user/register/new.user.public.css?v=' + ${Globals.version}" />
	<link rel="stylesheet" type="text/css" th:href="'//js3.tuandai.com/styles/user/register/new_login.css?v=' + ${Globals.version}" />-->
	<link rel="stylesheet" href="css/new.user.public.css">
	<link rel="stylesheet" href="css/new_login.css">
	<meta name="renderer" content="webkit">
	<link type="text/css" href="css/nc.css" rel="stylesheet" disabled="">
	<script type="text/javascript" src="js/nc.js"></script><meta name="keywords" content="团贷网注册,用户注册,会员注册">
	<meta name="description" content="团贷网（tuandai.com）成立于2011年，并于2012年正式上线运营，是一家专注于为用户提供省心的投资产品服务平台，注册团贷网会员，挑选适合您的投资产品">
	<meta http-equiv="pragma" content="no-cache">
</head>
<body>
<div class="header">
<div class="tdw-top">
<div class="wth-1200 tdw-top-bd">
<div class="l top-bd-l">
<span><i class="tdw-icons i-customer"></i>客服电话：1010-1218（9:00~22:00）</span>
<span class="rel c-poi top-bd-wechat mouseToTop">
<i class="tdw-icons i-wechat"></i>
<div class="abs showcode-tips" style="left: -144px;">
<i class="abs tdw-icons i-tips-arrow"></i>
<img src="images/wechat-code1.png" alt="订阅号，服务号">
</div>
</span>
<span class="c-poi top-bd-sina" onclick="javascript:window.open();"><i class="tdw-icons i-sina"></i></span>
<a class="rel top-bd-app mouseToTop" href="javascript:;">
<i class="tdw-icons i-app"></i>手机APP
<div class="abs showcode-tips" style="left: -46px;">
<i class="abs tdw-icons i-tips-arrow"></i>
<img src="images/app-code1.png" alt="手机APP">
</div>
</a>
</div>
<div class="r top-bd-r">
<div class="inline-block-debug c-poi-a" id="topinfo"><a class="login-a" href="login.htm">登录</a><a class="reg-a" rel="nofollow" href="register.jsp">注册</a></div>
<span class="s-line"></span>
<a class="pl0" rel="nofollow" href="" >投资者教育 <i class="tdw-icons i-invest-new"></i></a>
<a rel="nofollow" href="" >邀请有礼</a>
<a rel="nofollow" href="" >社会责任</a>
<a rel="nofollow" href="helping.html" >帮助中心</a>
<a rel="nofollow" href="" >社区</a>
<a rel="nofollow" href="" >会员中心</a>
</div>
</div>
</div>
<div class="tdw-nav">
<div class="wth-1200 tdw-nav-bd">
<div class="l tdw-logo">
<a class="tdw-logo-a" href="index.htm"><img src="images/logo.png" alt="团贷网"> </a>
<div class="logoinfo"><img src="images/1532358093495.png" alt="让金融更简单！"></div>
</div>
<ul class="r tdw-nav-list">
<li><a href="index.htm">首页</a></li>
<li class="subMenuShow">
<a href="welist.htm">我要投资<i class="tdw-icons i-arrow-up"></i></a>
<div class="sonmenu">
<i class="tdw-icons i-tips-arrow"></i>
<a href="welist.htm" >自动投标</a>
<a href="invest_list.htm" >散标专区</a>
</div>
</li>
<li class="subMenuShow" id="myTransfer"><a href="zx_invest_list.htm">转让专区<i class="tdw-icons i-arrow-up"></i></a>
                    <div class="sonmenu">
                        <i class="tdw-icons i-tips-arrow"></i>
                        <a href="zx_invest_list.htm" >智享转让</a>
                        <a href="zqzr_list.htm" >债权转让</a>
                    </div></li>
            <li class="subMenuShow">
                <a href="#">信息披露<i class="tdw-icons i-arrow-up"></i></a>
                <div class="sonmenu">
                    <i class="tdw-icons i-tips-arrow"></i>
                 <a rel="nofollow" href="GuanYuPingTai.html" target="_blank">关于我们</a>
						<a rel="nofollow" href="shenhe.html" target="_blank">对外公告</a>
						<a rel="nofollow" href="yunyinshuju.html" target="_blank">运营数据</a>
						<a rel="nofollow" href="baozhangtixi.html" target="_blank">保障体系</a>
						<a rel="nofollow" href="faren.html" target="_blank">承诺书</a>
						<a rel="nofollow" href="jiaguanbumen.html" target="_blank">法律法规</a>
                </div>
            </li>
<li class="subMenuShow last-li">
<div id="myAccountDefault"><a href="account_default.htm" class="my-account-default db">我的账户</a></div>
</li>
</ul>
</div>
</div>
</div>
