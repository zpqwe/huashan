<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		//获取动态验证码
		$(document).ready(function(){
			$("#change").click(function(){
				$("#img").attr("src","${pageContext.request.contextPath }/ver?date="+ new Date());
			});
			
			var regerrrer=sessionStorage.getItem("url");
			//alert(regerrrer)
			var index=regerrrer.indexOf("tuandaiw");
			regerrrer=regerrrer.substring(index+8,regerrrer.length);
			//alert(regerrrer);
			$("#geturl").val(regerrrer);
			/*  for ( var i= regerrrer.length; i>0 ; i--) {
				if("/"==regerrrer[i]){
				var url=regerrrer.substring(i);
				alert("地址"+url);
				$("#geturl").val(url);
				alert($("#geturl").val());
				break;
				}
			}  */
			/* if (document.referrer === '') {
    		// 没有来源页面信息的时候，改成首页URL地址
    		$('.demo').attr('href', '/index');
			}else{
				
			} */
			
		});
	</script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="images/favicon.ico">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>团贷网 - 登录</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script async="" src="js/sensorsdata.min.js"></script><script type="text/javascript" async="" src="js/webaccess.js"></script><script async="" src="js/sensorsdata.min.js"></script><script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.cookies.2.2.0.js"></script>
    <script src="js/jsencrypt.js"></script>
  
</head>
<body>
<header>
    <div class="page-wrap">
        <a href="index.htm" class="pt5 dib l" style="padding-top: 25px">
            <img src="images/logo.png" alt="">
        </a>
        <div class="logo-gyx" style=" padding-top: 35px;">
            <!--<img src="//js.tuandai.com/images/default/logo1.png?v=20170803001" alt=""/>-->
            <img alt="" src="images/1532358093495.png">
        </div>
    </div>
</header>
<div class="container" style="background:url(images/1535967571805.jpg) no-repeat center;">
    <a target="_blank" class="banner-link abs " href="#">&nbsp;</a>
</div>
<section class="login-frame">
    <div class="login-box">
    <form action="${pageContext.request.contextPath}/check" method="post" id="login">
        <div class="login-box-title">
            <span>还没账号？<a class="g-blue reg-now g-org" href="${pageContext.request.contextPath }/openregister">马上注册</a></span>
            <h2>登录</h2>
        </div>
        <input type="hidden" name="geturl" id="geturl" value="">
        <div class="input-box">
            <input type="hidden" id="returnUrl" name="returnUrl" value="index.htm">
            <input class="input-text" name="username" id="username" type="text" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false" placeholder="请输入账户名/手机号/邮箱" value="<c:if test="${un==null &&un==''}">${cookie.username.value}</c:if>${un}" style="border-color: rgb(213, 213, 213);">
            <div class="input-tip input-tip1" style="visibility: hidden;">
                <i></i>请输入账户名/手机号/邮箱
            </div>
        </div>
        <div class="input-box">
            <input class="input-text" name="password" id="password" type="password" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false" placeholder="请输入密码" style="border-color: rgb(213, 213, 213);">
            <div class="input-tip input-tip2" style="visibility: hidden;">
                <i></i>请输入密码
            </div>
        </div>
        <div class="input-box">
            <img id="img" src="${pageContext.request.contextPath }/ver"  style="cursor:pointer;float:right;padding:0px 10px 0px 0px"/>
            <a id="change" href="#" style="line-height:45px;">换一换</a>
            <input class="input-ver" name="verification" id="verification" type="text" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false" placeholder="请输入验证码" value="" style="border-color: rgb(213, 213, 213);float:left;" >
            <div id="err" style="color:red;font-size:12px">${err}</div>
            <div class="input-tip input-tip3" style="visibility: hidden;">
                <i></i>请输入验证码
            </div>
        </div> 
      
        <input type="hidden" id="geetestChallenge" name="geetestChallenge" value="">
        <input type="hidden" id="geetestValidate" name="geetestValidate" value="">
        <input type="hidden" id="geetestSeccode" name="geetestSeccode" value="">
        <div class="input-setting">
            <a href="resetpwd.htm">忘记密码</a>
            <input class="input-check" type="checkbox" name="isRemember" id="isRemember" >
            <label for="isRemember">记住账号</label>
        </div>
        <a href="javascript:viod(0);" id="loginBtn" logintitle="登录" dologintitle="登录中..." class="login-btn login-btn-org"><img id="loginBtnImage" src="images/tuandai_login_loading.gif" class="loading-icon" style="display: none;">登录<span id="afterLoginBtnImage" style="display: none;">中...</span></a>
        <div class="login-tip">您的账户信息已使用SSL加密技术，数据传输安全</div>
        <div class="ie-holder ie-num">请输入账户名/手机号/邮箱</div>
        <div class="ie-holder ie-pass">请输入密码</div>
    </div>
    </form>
    <!-- /* business code */ -->
    <div style="width: 0px;height: 0px;" id="myCode">
    </div>
</section>
<footer>
    2010-<span id="copyRightEnd">2018</span> 版权所有 © 团贷网
    <a href="#" target="_blank" class="g6">粤ICP备12043601号-1</a> 粤公安网备44190002000538号&nbsp;&nbsp;&nbsp;&nbsp;东莞团贷网互联网科技服务有限公司<br>
    地址：东莞市南城街道莞太路111号民间金融大厦1号楼28楼
</footer>


<script type="text/javascript" src="js/login_tuandai.js"></script>

</body></html>