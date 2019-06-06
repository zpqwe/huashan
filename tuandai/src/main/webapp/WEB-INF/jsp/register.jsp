<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
 <script type="text/javascript" >

var truephone=/^1[34578]\d{9}$/;
var cphone=false;
var cpwd=false;
$(document).ready(function(){

//注册验证
	$("#txtPhone").blur(checkphone);
	$("#txtPwd").blur(checkpwd);
	$(document).on("click","#rbtnSendMsg",clickSend);
	$("#btnSendMsg").click(clickSend);
	$("#btnReg").click(function(){
		var phone=$("#txtPhone").val();
		$("#dialPhone").html(phone);
		if(cphone&cpwd){
			show();
		}
	});
	
	  	 $("#btnSubReg").click(function(){
		   var input = $("#txt_smsCode").val();
		   var keyPhone=$("#dialPhone").html(); 
			 if(input==""){
				 $("#dvCode").html("请输入验证码").css("color","red"); 
			}  else{
				$("#dvCode").html("");
			 	$.ajax({
					url:"${pageContext.request.contextPath}/checkVerCode",
					type:"post",
					data:{"input":input,"keyPhone":keyPhone},
					dataType:"text",
					success:function(result){
						if(result=="true"){
							$("#dvCode").remove();
							$("#ChitCode").append("<div class='reg-message1 clearfloat' id='dvCode' style='color:red'>验证码不正确或已过时</div>")
						}else{
							$("#reg").submit();
						}
						
					},
					err:function(){
						alert("请求失败")
					} 
				}) 
			} 
		 })  
})

function checkphone(){
	var phone=$("#txtPhone").val();
	$("#dvPhone div").remove();
	if(phone==""){
		//$("#txtPhone~span").html("*请输入手机号码").css("color","red");
		$("#dvPhone").append("<div class='info-mes' style='color:red'>*请输入手机号码</div>");
	}else if(!truephone.test(phone)){
		//$("#txtPhone~span").html("*手机号码格式有误").css("color","red");
		$("#dvPhone").append("<div class='info-mes' style='color:red'>*手机号码格式有误</div>");
	}else{
		//$("#txtPhone~span").html("");
		$.ajax({
			"url":"${pageContext.request.contextPath}/checkPhone",
			"type":"post",
			"data":{"phone":phone},
			"dataType":"text",
			"success":function(result){
				if(result=="true"){
					$("#dvPhone").append("<div class='info-mes' style='color:red'>*手机号码已注册</div>");
					//$("#txtPhone~span").html("*手机号码已注册").css("color","red");
				}else{
					//$("#txtPhone~span").html("");
					cphone=true;
				};
			},
			"err":function(){
				alert("请求失败");
			},
		});
	};
}

function checkpwd(){
	var pwd= $("#txtPwd").val();
	$("#dvPwd div").remove();
	if(pwd==""){
		$("#dvPwd").append("<div class='info-mes' style='color:red'>*请输入密码</div>");
		cpwd=false;
	}else if (/^.*?[\d]+.*$/.test(pwd) && /^.*?[A-Za-z].*$/.test(pwd) && /^.{6,16}$/.test(pwd)){
		cpwd=true;
	}else{
		$("#dvPwd").append("<div class='info-mes'>*字母+数字和符号两种以上组合</div>");
		cpwd=false;
	}
}

function show()  //显示隐藏层和弹出层 
{ 
   $("#diallayer").attr("style","display:block");//显示隐藏层
  $("#phoneDial").attr("style","display:block");//显示弹出层 
} 
function hide()  //去除隐藏层和弹出层 
{ 
	$("#diallayer").attr("style","display:none");//去除隐藏层
	$("#phoneDial").attr("style","display:none"); //去除弹出层 
}
var time=60;

function clickSend(){
	$("#err").html("");
	var phone = $("#txtPhone").val();
	timing();
 	$.ajax({
		url:"${pageContext.request.contextPath}/sendsms",
		type:"post",
		data:{"phone":phone},
		dataType:"text",
		success:function(result){
		},
		err:function(){
			alert("请求失败");
		}
	});  
}  

function timing(){
	 if(time>=0){
		$(".reg-text a").remove()
		$("#time").append("<a href='javascript:;' class='get_code' style='vertical-align: 12px;' id='btnSendMsg'>重新获取(<b style='color:orange;'>"+time+"</b>S)</a>")
		 time--
		setTimeout(function(){timing()},1000) 
	}else{
		$(".reg-text a").remove()
		$("#time").append("<a href='javascript:;' class='get_code' style='vertical-align: 12px;' id='rbtnSendMsg'>获取短信验证码</a>")
		time=60
	} 
}



</script> 


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
	<link rel="shortcut icon" href="images/favicon.ico">
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
	<link rel="stylesheet" href="css/new.user.public.css">
	<link rel="stylesheet" href="css/new_login.css">
	<meta name="renderer" content="webkit">
	<link type="text/css" href="css/nc.css" rel="stylesheet" disabled="">
	<script type="text/javascript" src="js/nc.js"></script><meta name="keywords" content="团贷网注册,用户注册,会员注册">
	<meta name="description" content="团贷网（tuandai.com）成立于2011年，并于2012年正式上线运营，是一家专注于为用户提供省心的投资产品服务平台，注册团贷网会员，挑选适合您的投资产品">
	<meta http-equiv="pragma" content="no-cache">
</head>
<body>

<c:import url="top.jsp"/>

    <!-- 中间内容STAR -->
    
    <div class="container">
    
        <div class="reg-content">
            <input style="display: none" name="txtBorrowerTypeId" id="txtBorrowerTypeId" type="text" value="">
            <form id="reg" action="${pageContext.request.contextPath }/register" method="post">
            <div class="reg-top">
                <p class="fl-l p-l">欢迎注册</p>
                <p class="fl-r p-r">我已经注册，<a class="fc-green f14 tdl" href="login.jsp">现在登录</a></p>
            </div>
            <div class="reg-con">
                <div class="fl-l reg-c-left">
                    <div class="form">
                        <div class="reg-input-group mb25">
                            <label>手机号码</label>
                            <div class="reg-text">
                                <input class="text-input" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false" name="txtPhone" id="txtPhone" maxlength="11" type="text" value="">
                            	<span></span>
                            </div>
                            <div class="reg-message" id="dvPhone">
                            	
                            </div>
                        </div>
                        <div class="reg-input-group mb20">
                            <label>登录密码</label>
                            <div class="reg-text pr">
                                <input class="text-input password" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false" name="txtPwd" id="txtPwd" type="password" style="display: inline-block;"><input type="text" id="txtShowPwd" class="text-input password" style="display: none;"><span tabindex="100" class="pa eyes-box" style="cursor: pointer;"><i class="close-eyes pa eyes"></i></span>
                                <span ></span>
                                <p style="display: none">
                                    <label>
                                        <input id="methods" type="checkbox"></label>
                                </p>
                            </div>
                            <div class="reg-message" id="dvPwd">
                                 
                            </div>
                        </div>
                        <div class="reg-register">
                            <div class="agree1 f14">
                                <div class="agree_left g6">
                                    <input id="agreexieyi" name="agreexieyi" type="checkbox" value="" checked="checked">
                                    我已阅读并同意<span><a class="fc-green f14 tdl" target="_blank" href="#">《团贷网服务协议》</a></span>

                                </div>
                                <div class="agree_right"></div>
                            </div>
                            <div class="btn-group mt20">
                                <a onclick="javascript:viod(0);" id="btnReg" class="btnReg" >马上注册</a>
                            </div>
                            
                        </div>

                        <!-- AliyunCapta -->
                        <div id="_umfp" style="display:inline;width:1px;height:1px;overflow:hidden"></div>
                        <input type="hidden" id="alycsessionid" name="alycsessionid" value="">
                        <input type="hidden" id="alysig" name="alysig" value="">
                        <input type="hidden" id="alytoken" name="alytoken" value="">
                        <input type="hidden" id="alyscene" name="alyscene" value="">

                        <%-- <div th:if="${BorrowerTypeId ne '9' and #strings.isEmpty(extendKey)}" class="reg-mail" >-->
                            <a href="/user/RegEmail.aspx" th:if="${#strings.isEmpty(#request.getParameter('ReturnUrl'))}" class="tdl">使用邮箱注册></a>-->
                            <a href="/user/RegEmail.aspx" th:href="@{/user/RegEmail.aspx(ReturnUrl=${#request.getParameter('ReturnUrl')})}" th:if="${#strings.isEmpty(#request.getParameter('ReturnUrl'))} == false" class="tdl">使用邮箱注册></a>
                        </div> --%>

                    </div>
                </div>

                <div class="fl-r reg-c-right"><a href="#" target="_blank" style="display:block;cursor: pointer;"><img src="images/1521804536230.png"></a></div>

            </div>
        </div>
    </div>

    <!-- 验证手机信息弹框 S-->
    <div id="phoneDial" style="display:none;" class="dial-window dial-window-w1 z103">
        <div class="title rel">验证手机信息：<i class="close-x icon db abs" onclick="hide();"></i></div>
        <div class="body">
            <!-- 短信验证 -->
            <div class="reg-code-text" id="ChitCode" style="width: 490px;">
                <div class="phone">
                    <label class="g6">您的手机号码：</label>
                    <span class="tel-num" id="dialPhone"></span>
                </div>
                <input type="hidden" id="geetestChallenge" name="geetestChallenge" value="">
                <input type="hidden" id="geetestValidate" name="geetestValidate" value="">
                <input type="hidden" id="geetestSeccode" name="geetestSeccode" value="">
                <div class="reg-input-group reg-input-group1">
                    <label>验证码：</label>
                    <div id="time" class="reg-text">
                        <input class="w2 text-input" type="text" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false" name="txt_smsCode" id="txt_smsCode" onkeyup="" maxlength="6">
                        <a href="javascript:;" class="get_code" style="vertical-align: 12px;" id="btnSendMsg">获取短信验证码</a>
                        </div>
                    </div>
                    <div class="reg-message1 clearfloat" id="dvCode"></div>
                </div>
            </div>
            <div id="dial-window-btns">
	            <div class="btn-group pl140">
	                <a href="javascript:void(0);" class="td-btn-1 td-btn-1-or btnReg" id="btnSubReg">确认</a>
	            </div>
        	</div>
        </div>
    </form>
    <!-- 验证手机信息弹框 E-->

    <!-- 验证同意协议 B-->
    <div style="display: none;" class="dial-window dial-window-w1 z103">
        <div class="title rel">团贷网提示你：<i class="close-x icon db abs" onclick="colosenewWindow()"></i></div>
        <div class="body">
          	  注册成功：恭喜注册成为团贷网会员。
        </div>
        <div>
            <div class="btn-group tc mt20">
                <a href="javascript:void(0);" class="td-btn-1 td-btn-1-or btnReg" style="margin: 0 auto" onclick="colosenewWindow()">确认</a>
            </div>
        </div>
    </div>
    <!-- 验证同意协议 E-->
    <input id="hd_extendKey" type="hidden" value="">
    <!-- 中间内容END -->

<!-- 中间内容END -->
<!-- 页脚 -->
<div class="footer fix">
    <div class="footer-content auto fix cl">
        <div class="address fa f12 tc mt15">
            2010-<span>2018</span> 版权所有 © 团贷网 <a href="#" target="_blank" rel="nofollow">粤ICP备12043601号-1</a> 粤公安网备44190002000538号    东莞团贷网互联网科技服务有限公司
            <br>地址：东莞市南城街道莞太路111号民间金融大厦1号楼28楼  
        </div>
    </div>
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
<!--遮罩层-->
<div id="diallayer" style="display: none;"></div>

<img src="#" style="display: none;"><script></script></body></html>