<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="pragma " content="no-cache ">
<meta http-equiv="cache-control " content="no-cache ">
<meta http-equiv="expires " content="0 ">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport">
<title>充值</title>
<script src="js/jquery-1.11.2.min.js.下载"></script>
<script src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/Validform_v17.js.下载"></script>
<link rel="icon" href="images/favicon-1.ico"
	mce_href="images/favicon-1.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon-1.ico"
	mce_href="images/favicon-1.ico" type="image/x-icon">
<link type="text/css" href="css/style_v13.css" rel="stylesheet">
<link type="text/css" href="css/jquery.areaopt.css" rel="stylesheet">
</head>
<style>
#img,#sp {
	vertical-align: middle;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("smsCode").focus(function(){ //输入框获得焦点
			$("#smsCode").val("");
		})
		$("tranpasswordy").focus(function(){
			$("#tranpasswordy").val("");
		})
			$("#nextButton").click(function() {
				if ($("#isAgreeReg").is(":checked")) {
			var smsCode = $("#smsCode").val();
			var tranpasswordy = $("#tranpasswordy").val();
			if (smsCode == null|| smsCode == ""){
				document.getElementById("Validform_checktip Validform_wrong").style.display = "inline-block";
			} else if (tranpasswordy == null|| tranpasswordy == "") {
			document.getElementById("jiaoy").style.display = "inline-block";
			} else {
			$("#form").submit();
			}
			} else {
				document.getElementById("sp").style.display = "inline-block";
				alert('未选中');
			}
		})
				$("#isAgreeReg").click(function() {
					document.getElementById("sp").style.display = "none";
				})
		})
</script>
<body>
	<div class="header">
		<div class="div-m">
			<h1 class="logo">
				<a href="" class="logoImg"><img src="images/logo-CBXM.png">
				</a>
			</h1>
		</div>
	</div>
	<!--主体开始-->
	<div class="container" style="min-height: 418px;">
		<div class="scrollPart">
			<div class="infoBar">
				<div class="div-m">
					<span class="subtitle"> 充值 </span>
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
						<span id="marquee-content"> <marquee scrollamount="8">
								<font size="2px">厦门银行官方App可以查询存管账户余额、充值、提现记录。在App
									Store或安卓应用商店搜索“厦e站”，或扫描图片上的二维码，立即下载“厦e站”查询！</font>
							</marquee>
						</span>
						<!--  <span id="marquee-content-footer"></span> -->
					</p>
				</div>
			</div>

			<!-- 文字滚动 结束-->
		</div>
		<form id="form" action="${pageContext.request.contextPath}/paymentO" method="post">
			<div class="div-m" style="min-height: 266px;">
				<input type="hidden" name="remoney" value="${t_money }"> <input
					type="hidden" name="kuai" value="${kuai}">
				<div class="infoCard">
					<ul>
						<li class="blue sum">金额: ${t_money }元</li>
						<li>&nbsp;</li>
						<li>订单编号：${random}</li>
						<li>客户名称：${tuser.truename}</li>
						<li id="remoney">到账金额：${t_money }元</li>
					</ul>
				</div>
				<div class="formBlock mt15">
					<ul>
						<li><label>银行卡</label>

							<div class="bank_area fl">
								<span class="bankIcon"> <img src="images/SZDB.jpg">
								</span>尾号 ${bankwei}
							</div></li>
						<li><label>预留手机号</label> <span class="phone">${tuser.phone}</span>
						</li>
						<input type="hidden" name="needSecurityCode" value="true">
						<input type="hidden" name="pageBank" value="SZDB">
						<input type="hidden" name="maskedBankcardNo" value="0025">
						<input type="hidden" name="maskedMobile" value="159****8026">
						<input type="hidden" name="projectName" value="">
						<li><label>验证码</label> <input name="smsCode" id="smsCode"
							type="text" class="inpText inpCode " value="${yanz}" datatype="*"
							nullmsg="请输入验证码"> <input type="button" class="codeBtn"
							id="sendSmsVerify" value="点击获取" onclick="start()"> <input
							type="hidden" name="smsCount" id="smsCount" value="60"> <span
							class="Validform_checktip">${yanerror}</span><span
							id="Validform_checktip Validform_wrong" style="display:none">请输入验证码</span>
						</li>
						<li>
						<script type="text/javascript" src="js/Countdown.js"></script>
						<script type="text/javascript">
						//短信倒计时
							$(document).ready(function(){
							start();
							})
						</script>
						
							 <label>交易密码</label> <input name="tranpasswordy" id="tranpasswordy"
							cfca="true" id="password" type="password" class="inpText"
							datatype="*" cfcabind="encryptPassword,clientRandom,serverRandom"
							oncopy="return false;" onpaste="return false;"
							oncut="return false;" nullmsg="请输入交易密码" placeholder="请输入交易密码">
							<span class="Validform_checktip">${jiaoyi}</span><span id="jiaoy"
							style="display:none">请输入交易密码</span></li>
						<input name="encryptPassword" id="encryptPassword" type="hidden"
							value="">
						<input name="serverRandom" id="serverRandom" type="hidden"
							value="">
						<input name="clientRandom" id="clientRandom" type="hidden"
							value="">
						<li class="forgetLi"><label>&nbsp;</label> <span><a
								href="Transaction_password" class="blue" target="_about:blank">忘记交易密码？</a>
						</span></li>
						<li><label>&nbsp;</label> <input type="button"
							class="submitBtn inpText inpTextNew" id="nextButton" value="支付">
						</li>
						<li class="ruleLi" style="height: 20px !important;"><label>&nbsp;</label>
							<input type="checkbox" id="isAgreeReg" name="isAgreeReg"
							class="isAgreeReg">&nbsp;阅读并接受 <a
							href="javascript:void(0);" class="ruleNew blue protocol"
							data-type="swiftProtocol">《用户快捷充值协议》</a> <span id="sp"
							style="display: none;"> <img src="images/zhuce2.gif"
								style='margin:2px;' id="img">请阅读并勾选用户协议</span></li>
					</ul>
				</div>
				<input name="requestKey" id="requestKey" type="hidden"
					value="dea63a3b1bf84acfbffc0621b8949a03">
		</form>
		<!-- 新增广告位 -->
		<div class="advertCon">
			<img src="images/2018090008.jpg" alt="">
		</div>
		<!-- 新增广告位 -->
	</div>
	<div class="clear"></div>
	<div class="tips">温馨提示：厦门银行不承担团贷网平台的投融资标的物及投融资人的审核责任，不对团贷网平台业务提供明示或默示的担保或连带责任，团贷网平台的交易风险由投融资人自行承担，与厦门银行无关。</div>
	</div>
	<!--主体结束-->
	<!--弹出层-->
	<div id="alertLayer" style="display: none; left: 253.5px; top: 66.5px;">
		<a href="javascript:void(0);" class="btnClosed pa"></a>
		<div class="modelContend swiftProtocol">
			<div class="layerTit">用户快捷充值协议</div>
			<div class="layerCtr">
				<div class="layerRule">
					<div>

						<p class="MsoNormal"
							style="text-indent:18.0000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">快捷支付服务协议（以下简称“本协议”）是厦门银行股份有限公司（以下简称“厦门银行”）与存管系统用户(以下简称“用户”或“您”)就</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">用户使用合作支付机构提供的</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">快捷支付服务（以下简称“本服务”）等相关事项所订立的有效合约。</span><b><span
								style="font-family: 宋体; color: rgb(80, 80, 80); font-size: 9pt;">用户通过网络页面点击确认或以其他方式选择接受本协议，即表示用户与厦门银行已达成协议并同意接受本协议的全部约定内容。</span>
							</b><span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-ascii-font-family:Times;mso-hansi-font-family:Times;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal"
							style="text-indent:22.6000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<b><u><span
									style="font-family: 宋体; color: rgb(80, 80, 80); font-size: 9pt;">在接受本协议之前，请您仔细阅读本协议的全部内容（特别是以粗体下划线标注的内容）。如果您不同意本协议的任意内容，或者无法准确理解本协议任何条款的含义，请不要进行后续操作。</span>
							</u>
							</b><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Times;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal"
							style="text-indent:24.0000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">1.您应确保您是使用本服务的银行卡持有人，可合法、有效使用该银行卡且未侵犯任何第三方合法权益，否则因此造成厦门银行、持卡人损失的，您应负责赔偿并承担全部法律责任，包括但不限于冻结您全部或部分存管账户(含该账户之关联账户)及资金、从您的前述存管账户中扣除相应的款项等。</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Times;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal"
							style="text-indent:24.0000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">2.您同意厦门银行有权依据其自身判断对涉嫌欺诈或被他人控制并用于欺诈目的的存管账户采取相应的措施，上述措施包括但不限于冻结账户及资金、处置涉嫌欺诈的资金等。</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Times;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal"
							style="text-indent:24.0000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">3.</span><b><u><span
									style="font-family: 宋体; color: rgb(80, 80, 80); font-size: 9pt;">您应妥善保管银行卡、卡号、密码、发卡行预留的手机号码以及存管账户账号、密码、数字证书、存管账户绑定的手机号码、来自于发卡行和/或厦门银行向您发送的校验码等与银行卡或与存管账户有关的一切信息和设备。如您遗失或泄露前述信息和/或设备的，您应及时通知发卡行及/或厦门银行，以减少可能发生的损失。因您的原因所致损失需由您自行承担。</span>
							</u>
							</b><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Times;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal"
							style="text-indent:24.0000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">4.您在使用本服务时应当认真确认交易信息，并按厦门银行业务流程发出符合</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">您注册时签署的</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">《资金存管系统服务协议》约定的指令。</span><b><u><span
									style="font-family: 宋体; color: rgb(80, 80, 80); font-size: 9pt;">您认可和同意：您发出的指令不可撤回或撤销，厦门银行有权根据您的指令委托银行或第三方从银行卡中划扣资金给收款人。届时您不应以非本人意愿交易或其他任何原因要求厦门银行退款或承担其他责任。您在对使用本服务过程中发出指令的真实性及有效性承担全部责任；您承诺，厦门银行依照您的指令进行操作的一切风险由您承担。</span>
							</u>
							</b><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Times;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal"
							style="text-indent:24.0000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<b><span
								style="font-family: 宋体; color: rgb(80, 80, 80); font-size: 9pt;">5.您认可存管账户的使用记录数据、交易金额数据等均以存管系统记录的数据为准。您授权厦门银行有权留存您存管系统填写的相应信息，以供后续向您持续性地提供相应服务。</span>
							</b><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Times;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal"
							style="text-indent:24.0000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">6.持卡人通过存管系统实施的相关交易应受签约账户可用额度和银行不时规定的快捷支付的单笔或累积交易金额的限制，该交易也需遵守厦门银行制订的风险管理规定包括但不限于相关单笔或累积交易金额的限制。以上各类规则不一致的情况下，以个案情况下各规则允许的最低交易限额为准。您同意，厦门银行有权根据交易安全需要，随时调整本协议相关交易规则和交易金额限制规定。</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Times;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal"
							style="text-indent:24.0000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">7.</span><b><u><span
									style="font-family: 宋体; color: rgb(80, 80, 80); font-size: 9pt;">出现下列情况之一的，厦门银行有权立即终止您使用厦门银行相关服务而无需承担任何责任：（1）将本服务用于非法目的；（2）违反本协议的约定；（3）厦门银行认为向您提供本服务存在风险；（4）您的银行卡有效期届满（如有）。</span>
							</u>
							</b><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Times;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal"
							style="text-indent:24.0000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">8.持卡人不得利用本协议项下的服务实施套现、虚假交易、洗钱等行为，且有义务配合银行进行相关调查，若无正常理由拒绝配合进行相关调查或客户账户状态处于不正常或客户存在违反诚信原则的行为时，厦门银行有权暂停或终止提供本协议项下的服务。</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Times;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal"
							style="text-indent:24.0000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">9.持卡人同意，厦门银行因业务需要，有权变更、升级或暂停本协议项下快捷支付业务服务，有权修改、终止本协议，您于本协议修改后继续使用本服务的，视同接受有关本协议的修改、变更的内容。本协议终止后，持卡人在协议终止前已发送的交易指令仍有效，持卡人应承担其后果。</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Times;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal"
							style="text-indent:24.0000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">10.您同意，本协议适用中华人民共和国大陆地区法律。因厦门银行与您就本协议的签订、履行或解释发生争议，双方应努力友好协商解决。如协商不成，</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">您</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">同意由</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">厦门银行</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">所地法院管辖审理双方的纠纷或争议。</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Times;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal"
							style="text-indent:24.0000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">11.本协议内容包括协议正文及所有厦门银行已经发布的或将来可能发布的厦门银行服务的使用规则。所有规则为本协议不可分割的一部分，与协议正文具有相同法律效力。若您在本协议内容发生修订后，继续使用本服务的，则视为您同意最新修订的协议内容；否则您须立即停止使用本服务。</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Times;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal"
							style="text-indent:24.0000pt;mso-pagination:widow-orphan;line-height:15.7500pt;background:rgb(241,241,241);">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:9.0000pt;mso-font-kerning:0.0000pt;">12.本协议未尽事宜，您需遵守《资金存管系统服务协议》及相关规则。持卡人应认真阅读本协议全文，如有疑义，请及时通过存管系统相关说明页面或拨打客户服务热线咨询。如果您不同意本协议的任何内容，或者无法准确理解相关条款的解释，请不要进行后续操作。</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Times;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;color:rgb(80,80,80);font-size:10.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:Cambria;mso-fareast-font-family:宋体;mso-bidi-font-family:&#39;Times New Roman&#39;;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p>
                        &nbsp;</o:p>
							</span>
						</p>

					</div>
				</div>
				<a href="javascript:void(0);" class="submitBtn agree">同意</a>
			</div>
		</div>
		<div class="modelContend riskTips">
			<div class="layerTit">风险提示</div>
			<div class="layerCtr">
				<div class="layerRule">
					<div>

						<p class="MsoNormal" align="center"
							style="margin-top:15.6500pt;margin-right:0.0000pt;margin-bottom:15.6500pt;margin-left:0.0000pt;mso-para-margin-top:1.0000gd;mso-para-margin-right:0.0000gd;mso-para-margin-bottom:1.0000gd;mso-para-margin-left:0.0000gd;text-indent:0.0000pt;mso-char-indent-count:0.0000;text-autospace:ideograph-numeric;mso-pagination:none;text-align:center;">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:仿宋;mso-bidi-font-family:&#39;Times New Roman&#39;;font-size:10.5000pt;mso-font-kerning:1.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal" style="line-height:150%;">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:仿宋;mso-bidi-font-family:&#39;Times New Roman&#39;;line-height:150%;font-size:10.5000pt;mso-font-kerning:1.0000pt;">尊敬的存管系统用户您好：</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:仿宋;mso-bidi-font-family:&#39;Times New Roman&#39;;line-height:150%;font-size:10.5000pt;mso-font-kerning:1.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="MsoNormal" style="line-height:150%;">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:仿宋;mso-bidi-font-family:&#39;Times New Roman&#39;;line-height:150%;font-size:10.5000pt;mso-font-kerning:1.0000pt;">&nbsp;&nbsp;&nbsp;&nbsp;</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:仿宋;mso-bidi-font-family:&#39;Times New Roman&#39;;line-height:150%;font-size:10.5000pt;mso-font-kerning:1.0000pt;">尊敬的存管系统用户您好：
								充值成功后您将授权您所在的互联网金融平台（以下简称“平台”）代您使用“投标金额”进行投标。您知晓并同意存管系统有权根据平台发起的自动扣划指令，进行相应款项的划扣、支付、冻结及行使其他权利，该指令将视为您的真实意思表示，相关风险由您自行承担，您对此予以接受和认可。。</span>
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:仿宋;mso-bidi-font-family:&#39;Times New Roman&#39;;line-height:150%;font-size:10.5000pt;mso-font-kerning:1.0000pt;"><o:p></o:p>
							</span>
						</p>


						<p class="p"
							style="margin-top:0.0000pt;margin-bottom:0.0000pt;text-indent:24.0000pt;line-height:150%;">
							<span
								style="mso-spacerun:&#39;yes&#39;;font-family:仿宋;mso-bidi-font-family:&#39;Times New Roman&#39;;line-height:150%;font-size:10.5000pt;mso-font-kerning:1.0000pt;">&nbsp;</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:仿宋;mso-bidi-font-family:&#39;Times New Roman&#39;;line-height:150%;font-size:10.5000pt;mso-font-kerning:1.0000pt;"><o:p></o:p>
							</span>
						</p>

						<p class="p" style="margin-top:0.0000pt;margin-bottom:0.0000pt;">
							<b><span
								style="font-family: 仿宋; color: rgb(225, 57, 57); font-size: 10.5pt;  background-position: initial initial; background-repeat: initial initial;">再次</span>
							</b><b><span
								style="font-family: 仿宋; color: rgb(225, 57, 57); font-size: 10.5pt;  background-position: initial initial; background-repeat: initial initial;">提示：</span>
							</b><span
								style="mso-spacerun:&#39;yes&#39;;font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:宋体;color:rgb(225,57,57);font-size:10.5000pt;mso-font-kerning:0.0000pt;background:;mso-shading:;">&nbsp;</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><br>
							</span><b><span
								style="font-family: 仿宋; color: rgb(225, 57, 57); font-size: 10.5pt;  background-position: initial initial; background-repeat: initial initial;">充值成功后，平台将有权使用“投标金额”进行投标，需要您自行承担相应的资金风险和责任，请您谨慎操作！</span>
							</b><b><span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;font-size:12.0000pt;mso-font-kerning:0.0000pt;">&nbsp;</span><span
								style="mso-spacerun:&#39;yes&#39;;font-family:宋体;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>
							</span>
							</b>
						</p>
						<b>

							<p class="MsoNormal">
								<span
									style="mso-spacerun:&#39;yes&#39;;font-family:仿宋;mso-bidi-font-family:&#39;Times New Roman&#39;;font-size:10.5000pt;mso-font-kerning:1.0000pt;"><o:p>&nbsp;</o:p>
								</span>
							</p>

							<p class="MsoNormal">
								<span
									style="mso-spacerun:&#39;yes&#39;;font-family:仿宋;mso-bidi-font-family:&#39;Times New Roman&#39;;font-size:10.5000pt;mso-font-kerning:1.0000pt;"><o:p>&nbsp;</o:p>
								</span>
							</p> </b>
					</div>
					<b> </b>
				</div>
				<b> <a href="javascript:void(0);" class="submitBtn agree">确认</a>
				</b>
			</div>
			<b> </b>
		</div>
		<b> </b>
	</div>
	<b> <script type="text/javascript" src="js/collect.js.下载"></script>



		<div id="__env__" style="visibility: collapse;">
			<input type="hidden" id="contextPath" name="contextPath"
				value="/bha-neo-app"> <input name="requestKey"
				id="requestKey" type="hidden"
				value="dea63a3b1bf84acfbffc0621b8949a03">
		</div>

		<div class="footer">
			<p class="tc"></p>
		</div>
		<div id="mask" style="height: 613px; width: 1347px; display: none;"></div>
		<div id="alertLayer-2"
			style="width: 400px; height: 210px; left: 473.5px; top: 201.5px; display: none;">
			<div class="layerTit">提 示</div>
			<div class="layerCtr">
				<div class="layerCon tc">验证码已发送到159****8026手机，请您查收。</div>
				<a href="javascript:void(0);" class="submitBtn submitBtn-2">我知道了</a>
			</div>
		</div> <!--   <script>
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
    </script> --> </b>
</body>
</html>