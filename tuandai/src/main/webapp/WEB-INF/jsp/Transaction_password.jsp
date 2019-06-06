<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta http-equiv="pragma " content="no-cache ">
    <meta http-equiv="cache-control " content="no-cache ">
    <meta http-equiv="expires " content="0 ">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">

    <title>修改交易密码</title>

    <script src="js/jquery-1.11.2.min.js.下载"></script>
    <script type="text/javascript" src="js/Validform_v17.js.下载"></script>
    


  
    
    <script>
       /*  $(document).ready(function () {
            sms.init($("#sendSmsVerify"), {
                requestKey: '7fb11f9446214cc0bb5415eb630830db'
            });
        }); */
    </script>



    <link rel="icon" href="images/favicon-1.ico" mce_href="images/favicon-1.ico" type="image/x-icon">
    <link rel="shortcut icon" href="images/favicon-1.ico" mce_href="images/favicon-1.ico" type="image/x-icon">
    <link type="text/css" href="css/style_v13.css" rel="stylesheet">
    <link type="text/css" href="css/jquery.areaopt.css" rel="stylesheet">
  
    
     <!-- <script type="text/javascript" src="js/bha_v13.js.下载"></script> -->
    <script type="text/javascript" src="js/requestKey.js.下载"></script>
    <script type="text/javascript" src="js/areaopt.data.js.下载"></script>
    <script type="text/javascript" src="js/jquery.areaopt.js.下载"></script>
</head>
 <!-- <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> -->
<script type="text/javascript">
var count = 60;
	var sh;
	function sho() {
		var doc = $("#sendSmsVerify");//获取按钮对象
		doc.disabled = true;
		doc.val("重新发送" + count + "s"); //改变对象value值			
		if (count > 0) { //判断count>=0的时候才自身减1
			count--;
		} else {
			doc.val("点击获取"); //倒计时完成重新修改value的值
			doc.disabled = false; //按钮设为可以点击
			clearInterval(sh); //清除定时函数
		}
	}
	function start() {
		count = 60; //每次点击重新赋值count
		var doc = $("#sendSmsVerify"); //获取按钮对象
		doc.disabled = true; //每次点击倒计时中按钮设为禁用
		sh = setInterval("sho()", 1000); //设置定时函数，每秒执行一次
	}
						
   $(document).ready(function(){
 	$("#sendSmsVerify").click(function(){
 	$.ajax({
	"url":"${pageContext.request.contextPath}/ajaxsmsCode",
	"data":{"":""},
	"dataType":"json",
	"type":"get",
	"success":function(data){
	$("#yanzm").val(data);//获取验证码
		start();
		alert(data)
	},
	"error":function(){
		alert("请求失败!")
	}
	})
 	})
 	/* 点击下一步 */
 	$("#nextButton").click(function(){
 	$("#form").submit();
 	});
 	var yes=$("#yes").val();
 	if(yes!=null&yes!=""){
 	$("#alertLayer-2").css("display"," none");
 	}
});
</script>
<body>

<div class="header">
    <div class="div-m">
        
        <h1 class="logo">
            <a href="https://cunguan.xmbankonline.com/bha-neo-app/gateway/desktop/resetPassword/forgetPassword?requestKey=7fb11f9446214cc0bb5415eb630830db#" class="logoImg"><img src="images/logo-CBXM.png"></a>
        </h1>
    </div>
</div>


  

<!--主体开始-->
<div class="container" style="min-height: 418px;">
<div class="scrollPart">
    <div class="infoBar">
        <div class="div-m">
            <span class="subtitle">修改交易密码</span>
            <ul>
                <li class="first">平台名称：团贷网</li>
                <li>平台公司名称：东莞团贷网互联网科技服务有限公司</li>
            </ul>
        </div>
    </div>
    <!-- 文字滚动 开始-->
		    
	            <div class="box">
	                <div class="marquee" id="marquee">
	                    <p>
	                        <span id="marquee-content">
	                            <marquee scrollamount="8"><font size="2px">厦门银行官方App可以查询存管账户余额、充值、提现记录。在App Store或安卓应用商店搜索“厦e站”，或扫描图片上的二维码，立即下载“厦e站”查询！</font></marquee></span>
	                       <!--  <span id="marquee-content-footer"></span> -->
	                    </p>
	                </div>
	            </div>
		    
            <!-- 文字滚动 结束-->
</div>
    
    
        <div class="div-m" style="min-height: 266px;">
            <div class="formBlock">
                <div class="titleInfo blue">您正在使用银行卡信息进行验证：</div>
                <form id="form" action="${pageContext.request.contextPath }/news_password" method="post">
                    <div class="formBlock">
                        <ul>
                           <!--  真实姓名为手动输入 -->
<!--                             <li> -->
<!--                                 <label>真实姓名</label> -->

<!--                             </li> -->
                            
                           
                                <li>
                                    <label>真实姓名</label>
                                    <input type="text" name="realName" id="realName" class="inpText" value="${ tbank.realName}" datatype="*" nullmsg="请填写用户姓名">

                                    
                                <span class="Validform_checktip"></span></li>
                            
                            
                            <li>
                                <label>证件类型</label>
                                <span class="phone inpText"><c:if test="${tbank.documenttype==1 }">中华人民共和国身份证</c:if></span>
                                <input type="hidden" name="documenttype">
                            </li>

                            <!--证件好为手动输入-->
<!--                             <li> -->
<!--                                 <label>证件号</label> -->

<!--                             </li> -->

                             
                                <li>
                                    <label>证件号</label>
                                    <input type="text" name="idCardNo" id="idCardNo" class="inpText" value="${ tbank.idCardNo}" datatype="*" nullmsg="请填写身份证号">

                                    ${error}
                                <span class="Validform_checktip"></span></li>
                            

                            <li>
                                <label>已绑定银行卡</label>

                                <div class="bank_area fl"><span class="bankIcon"><img src="images/SZDB.jpg"></span>尾号${bankwei}
                                <input type="hidden" name="BindingbankImage">
                                </div>
                            </li>

                            
                                <li>
                                    <label>银行卡号</label>
                                    <input type="text" name="cardNo" id="cardno" class="inpText" placeholder="请输入您的银行卡号" value="${tbank.cardNo }" datatype="*" nullmsg="请填写银行卡号">

                                    
                                <span class="Validform_checktip"></span></li>
                            
                            
                                <li>
                                    <label>预留手机号</label>
                                    <span class="phone" >${tbank.reservePhone}</span>
                                    <input type="hidden" name="reservePhone">
                                </li>
                                
                                    <li>
                                        <label>验证码</label>
                                        <input name="smsCode" id="smsCode" type="text" class="inpText inpCode " value="" datatype="*" nullmsg="请输入验证码">
                                        <input type="button" class="codeBtn " id="sendSmsVerify" value="发送验证码">
                                        <input type="hidden" id="yanzm" name="yanzm" value="0">
                                    <span class="Validform_checktip"></span></li>
                                
                            
                            <li>
                                <label>&nbsp;</label>
                                <input type="button" class="submitBtn" value="下一步" id="nextButton">
                                
                            </li>
                        </ul>
                    </div>
                <input name="requestKey" id="requestKey" type="hidden" value="7fb11f9446214cc0bb5415eb630830db"></form>
            </div>
             <!-- 新增广告位 -->
          
            <div class="advertCon">
                <img src="images/2018090008.jpg" alt="">
            </div>
           
         <!-- 新增广告位 -->
        </div>
    
    

    
    
    

    <div class="clear"></div>
    


    <div class="tips">温馨提示：厦门银行不承担团贷网平台的投融资标的物及投融资人的审核责任，不对团贷网平台业务提供明示或默示的担保或连带责任，团贷网平台的交易风险由投融资人自行承担，与厦门银行无关。</div>


    <script type="text/javascript" src="js/pageRequestNum.js.下载"></script>
    <script type="text/javascript" src="js/cityjson"></script>
    <script type="text/javascript">
        postBankData("http://26.63.71.4:9528/logsrv/LogReceiver","3000000119", "6fd2338d-94ec-4fa8-82de-856d1a10ec25", "1049531636","15914198026", "reset_password_cardno", "7fb11f9446214cc0bb5415eb630830db");
    </script>
</div>
<!--主体结束-->




<div id="__env__" style="visibility: collapse;">
    <input type="hidden" id="contextPath" name="contextPath" value="/bha-neo-app">
    <input name="requestKey" id="requestKey" type="hidden" value="7fb11f9446214cc0bb5415eb630830db">
</div>

<div class="footer">
    <p class="tc">
        
    </p>
</div>
<div id="mask" style="display: none; height: 613px;"></div>
<div id="alertLayer-2" style="display: none; width: 400px; height: 210px; left: 474.5px; top: 201.5px;">
    <div class="layerTit">提 示</div>
    <div class="layerCtr">
        <div class="layerCon tc">验证成功</div>
        <a href="javascript:void(0);" class="submitBtn submitBtn-2" id="yes" value="${yes}">我知道了</a>
    </div>
</div>

<!--   <script>
        // 文字滚动js
        $(function () {
            var m = $('#marquee')[0];
            var m1 = $('#marquee-content')[0];
            var m2 = $('#marquee-content-footer')[0];
            m2.textContent = m1.textContent;

            function marquee() {
                if (m2.offsetWidth <= m.scrollLeft) {
                    m.scrollLeft -= m2.offsetWidth;
                } else {
                    m.scrollLeft++;
                }
            }

            timer = setInterval(marquee, 30);
        })  
    </script> -->

</body></html>