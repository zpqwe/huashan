<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fm" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<!--   <script type="text/javascript" src="js/jquery-1.4.2.min.js"> -->
  <script type="text/javascript">
  //获取上一个请求的url
  $(document).ready(function(){
  	var regerrrer=window.location.href;
			//alert("url请求"+regerrrer);
			sessionStorage.setItem("url",regerrrer);
			var index=sessionStorage.getItem("url");
			//alert(index);
			/* for ( var i= regerrrer.length; i>0 ; i--) {
				if("/"==regerrrer[i]){
				var url=regerrrer.substring(i);
				alert(url);
				$("#geturl").val(url);
				alert($("#geturl").val());
				break;
				}
			} */
  });
			
  </script>
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
<span class="c-poi top-bd-sina" onclick=""><i class="tdw-icons i-sina"></i></span>
<a class="rel top-bd-app mouseToTop" href="javascript:;">
<i class="tdw-icons i-app"></i>手机APP
<div class="abs showcode-tips" style="left: -46px;">
<i class="abs tdw-icons i-tips-arrow"></i>
<img src="images/app-code1.png" alt="手机APP">
</div>
</a>
</div>
<div class="r top-bd-r">
<div class="inline-block-debug c-poi-a" id="topinfo"><span class="text-yellow"></span>
<c:if test="${user==null}">
<a href="login" rel="nofollow" class="login-a" style="padding-left: 0px;">登录</a>
<a class="reg-a" href="${pageContext.request.contextPath}/openregister" >注册</a></div>
</c:if>
<c:if test="${user!=null}">
<a href="account_default" rel="account_default" class="login-a" style="padding-left: 0px;">${user.username}</a>
<a class="reg-a" href="${pageContext.request.contextPath}/logout" style="color:#ccc">退出</a></div>
</c:if>
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
<a class="tdw-logo-a" href="index"><img src="images/logo.png" alt="团贷网"> </a>
<div class="logoinfo"><img src="images/1532358093495.png" alt="让金融更简单！"></div>
</div>
<ul class="r tdw-nav-list">
<li><a href="${pageContext.request.contextPath}/index">首页</a></li>
<li class="subMenuShow">
<a href="${pageContext.request.contextPath}/invest_list">我要投资<i class="tdw-icons i-arrow-up"></i></a>
<div class="sonmenu">
<i class="tdw-icons i-tips-arrow"></i>
<a href="${pageContext.request.contextPath}/invest_list" >散标专区</a>
<a href="${pageContext.request.contextPath}/Transfer/list" >债权转让</a>
</div>
</li>
<li class="subMenuShow" id="myTransfer"><a href="${pageContext.request.contextPath}/zx_invest_list">转让专区<i class="tdw-icons i-arrow-up"></i></a>
                    <div class="sonmenu">
                        <i class="tdw-icons i-tips-arrow"></i>
                        <a href="${pageContext.request.contextPath}/zx_invest_list" >智享转让</a>
                        <a href="${pageContext.request.contextPath}/zqzr_list" >债权转让</a>
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
            <c:if test="${user!=null}">
            <li class="subMenuShow last-li">
<div id="myAccount"><a href="${pageContext.request.contextPath}/account_default" class="my-account db">我的账户<i class="tdw-icons i-arrow-up"></i></a><div class="sonmenu"><i class="tdw-icons i-tips-arrow"></i><a href="${pageContext.request.contextPath}/Recharge">立即充值</a><a href="${pageContext.request.contextPath}/account_moneylist">资金统计</a><a href="account_weFTBAll.html">自动投标</a><a href="${pageContext.request.contextPath}/account_zxloaninbid">散标投资</a><a href="${pageContext.request.contextPath}/account_loanReturnPlanList">回款计划</a><a href="account_zxborrowReturnPlanList.html">结清安排</a><a href="${pageContext.request.contextPath}/account_borrowInBid">周转记录</a><a href="${pageContext.request.contextPath}/exit">退出</a></div></div>
</li>
            </c:if>
            <c:if test="${user==null}">
<li class="subMenuShow last-li">
<div id="myAccountDefault"><a href="${pageContext.request.contextPath}/account_default" class="my-account-default db">我的账户</a></div>
</li>
</c:if>
</ul>
</div>
</div>
</div>
  </body>
</html>
