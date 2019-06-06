<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%-- <base href="<%=basePath%>"> --%>
    
    <title>My JSP 'accout_top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
  <jsp:include page="top.jsp"></jsp:include>
<div class="account-container clearfloat">
<div class="account-leftBox clearfloat">
<div class="account-left">
<div>
<div class="home border-bottom-0">
<p><i class="dt-1"></i><a href="account_default">账户首页</a></p>
</div>
<dl>
<dt><i class="dt-2"></i>我的资金 <i class="arrow"></i></dt>
<dd id="menu_money"><a href="account_moneylist">资金统计</a></dd>
<dd id="menu_moneyhistory"><a href="account_moneyhistory">交易记录</a></dd>
<dd id="menu_myprize"><a href="">我的团宝箱</a></dd>
<dd id="menu_recharge"><a href="Recharge">充值</a></dd>
<dd id="menu_withdraw" ><a href="drawmoney" onclick="return left_CheckAllowDraw();" >提现</a></dd>
</dl>
<div>
<dl>
<dt><i class="dt-3"></i>网贷<i class="arrow"></i></dt>
<dd id="menu_myWePlan">
<a href="account_weFTBAll.html" >自动投标服务</a>
</dd>
<dd id="menu_mySubscribe"><a href="account_loaninbid" >散标投资</a></dd>
<dd id="loanReturnPlan"><a href="account_loanReturnPlanList" >回款计划</a></dd>
</dl>
<dl>
<dt><i class="dt-4"></i>智享转让<i class="arrow"></i></dt>
<dd id="menu_zxMySubscribe"><a href="account_zxloaninbid.html">投资记录</a></dd>
<dd id="menu_zxMyBorrowList"><a href="account_zxborrowInBid.html">发起记录</a></dd>
<dd id="menu_zxReturnPlan"><a href="account_loanReturnPlanList">结清/回款</a></dd>
</dl>
<dl>
<dt><i class="dt-5"></i>我的周转<i class="arrow"></i></dt>
<dd id="menu_borrowList"><a href="account_borrowInBid.html" >周转记录</a></dd>
<dd id="borrowReturnPlan"><a href="account_borrowReturnPlanList.html" >结清安排</a></dd>
</dl>
</div>
</div>
<div>
<dl>
<dt><i class="dt-6"></i>个人设置<i class="arrow"></i></dt>
<dd id="menu_userdetail"><a href="userinfo">基本信息 </a></dd>
<dd id="menu_safety"><a href="index.html">安全中心</a></dd>
<!-- <dd id="menu_userVip">
<div class="left-new"></div>
<a href="" >团贷会员</a>
</dd>
<dd id="menu_userservice"><a href="">超级会员</a></dd> -->
<dd id="menu_sysinfo"><a href="account_loginhistory.jsp">消息中心</a></dd>
</dl>
 <dl>
<dt><i class="dt-7"></i>推广赚钱<i class="arrow"></i></dt>
<dd id="menu_PartnerPromotion">
<div class="left-hot" style="right: 10px;"></div>
<a href="">团贷合伙人</a></dd>
<dd id="menu_promotionList"><a href="">赚钱记录</a></dd>
</dl>
</div>
</div>
</div>
  </body>
</html>
