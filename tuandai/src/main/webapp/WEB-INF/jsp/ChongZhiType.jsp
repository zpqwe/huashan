<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ChongZhiType.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div class="account-rightBox clearfloat">
<div class="box-padding mb10">
<div class="protect-green-v1"><span>您的充值、提现操作将在 <span class="xm-logo"></span> 厦门银行存管平台进行，资金安全无忧</span>
</div>
</div>
<div class="box-padding" style="min-height: 920px">
<div class="nav_top">
<ul class="nav_title">
<li class="tab_title_a">
<a href="Recharge" id="kuai">快捷充值</a>
</li>

<li class="tab_title_b" onclick="">
<a href="normalRecharge">网银充值</a>
</li>
<li class="tab_title_b" onclick="">
<a href="transfer">转账充值</a>
<i class="i-mem-new"></i>
</li>
<li class="tab_title_b" onclick="">
<a href="pay/payindex">支付宝充值</a>
<i class="i-mem-new"></i>
</li>
</ul>
<a class="recharge-record" href="rechagehistory">充值记录</a>
</div>
  </body>
</html>
