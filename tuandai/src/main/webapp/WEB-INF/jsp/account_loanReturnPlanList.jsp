<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
<title>团贷网_安全可靠的投资理财网站_P2P理财网贷平台</title>
<meta name="keywords" content="p2p理财,p2p网贷,投资理财" />
<meta name="description" content="团贷网是安全可靠的P2P理财投资网贷平台,专注为投资理财和贷款用户提供优质的互联网金融服务,为投资者带来稳定收益,解决中小微企业资金需求" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="mobile-agent" content="format=html5;url=#">
<link rel="alternate" media="only screen and (max-width: 640px)" href="">
<link rel="dns-prefetch" href="">
<link rel="dns-prefetch" href="">
<link rel="dns-prefetch" href="">
<link rel="dns-prefetch" href="">
<link rel="dns-prefetch" href="">
<meta property="qc:admins" content="3542563377645164116375" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/base.css?v=2018092701" />
<link rel="stylesheet" href="css/layout.css?v=2018092701" />
<link rel="stylesheet" href="css/component.css?v=2018092701" />
<link rel="stylesheet" href="css/NewBorrowDetail.css?v=2018092701" />
<link rel="stylesheet" href="css/account-new.css?v=2018092701" />
<link rel="stylesheet" href="css/account-public.css?v=2018092701" />
<link rel="stylesheet" href="css/xiamen-bank.css?v=2018092701" />
<link rel="stylesheet" href="css/cgt20161107.css?v=2018092701" />
<link rel="stylesheet" href="css/bind_bank.css?v=2018092701" />
<!-- <link rel="dns-prefetch" href="//vip.tuandai.com" />
<link rel="dns-prefetch" href="//hd.tuandai.com" />
<link rel="dns-prefetch" href="//bbs.tuandai.com" /> -->
<meta property="qc:admins" content="3542563377645164116375" />
<link rel="stylesheet" href="css/account_invest.css" />
<style type="text/css">
        .org-bg {
            border: 1px solid #ff9900;
            background: #feedd9;
            color: #ff9900;
            border-radius: 3px;
            width: 375px;
            line-height: 24px;
            height: 24px;
            text-align: center;
        }

        .account_paytotal {
            width: 800px;
            height: 80px;
            overflow: hidden;
            padding-top: 0px;
        }

        .account_paytotal dl {
            float: left;
            height: 70px;
            padding-top: 8px;
            padding-bottom: 8px;
            border-right: #e1e1e1 solid 1px;
        }

        .payBox1 {
            width: 240px;
        }

        .payBox4 {
            width: 370px;
            padding-left: 46px;
            border-right: none !important;
            border-left: none;
        }

        .account_paytime {
            width: 800px;
            height: 48px;
            float: none;
        }

        .account_paytime dd {
            float: left;
            line-height: 20px;
            padding: 4px 10px;
            height: 40px;
            margin-right: 8px;
            font-size: 14px;
            color: #666;
            cursor: pointer;
            border-radius: 3px;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
        }

        .account_paycustom {
            width: 800px;
            height: 24px;
            margin: 0px auto;
            float: none;
        }

        .account_paycustom dt {
            float: left;
            font-size: 14px;
            width: 90px;
            height: 24px;
            line-height: 24px;
            text-align: right;
            margin-right: 5px;
        }

        .account_paycustom dd {
            float: left;
            line-height: 24px;
            height: 24px;
            margin-right: 8px;
            font-size: 14px;
            color: #666;
            margin-left: 0px;
        }

        .account_paytime dd:hover,
        .account_paytime dd.payTime_now {
            background: #f90;
            color: #FFF;
        }

        .account_paytotal {
            width: 800px;
            padding-top: 20px;
            margin: 0px auto;
        }

        .account_paytotal dl {
            float: left;
            padding-bottom: 8px;
            border-right: #e1e1e1 solid 1px;
        }

        .account_paytotal dl dt {
            font-size: 14px;
            color: #999;
            line-height: 30px;
        }

        .account_paytotal dl dt span {
            display: inline-block;
        }

        .account_paytotal dl dd {
            font-size: 14px;
            color: #666;
            line-height: 34px;
        }

        .account_paytotal dl dd b {
            color: #f60;
            font-size: 22px;
            font-weight: normal;
        }

        .payBox1 {
            width: 372px;
        }

        .payBox2 {
            width: 158px;
            padding-left: 46px;
        }

        .payBox3 {
            width: 300px;
            padding-left: 46px;
            border-right: none !important;
        }

        .payBox4 {
            width: 370px;
            padding-left: 46px;
            border-right: none !important;
            border-left: 1px solid #e5e5e5;
        }

        .payBox5 {
            width: 110px;
            border-right: none !important;
        }

        .payBox6 {
            width: 128px;
            padding-left: 46px;
        }

        .payBox7 {
            width: 290px;
            padding-left: 46px;
            border-right: none !important;
        }

        .payBox8 {
            width: 208px;
            padding-left: 25px;
            border-right: none !important;
        }

        .payBox9 {
            width: 250px;
            border-right: none !important;
        }

        .payBox10 {
            width: 120px;
            border-right: none !important;
        }

        .payBox11 {
            width: 190px;
            float: right;
        }

        .payBox12 {
            width: 144px;
            border-right: none !important;
            float: right !important;
        }

        .payBox13 {
            width: 146px;
            border-right: none !important;
        }

        .payBox14 {
            width: 250px;
            border-right: none !important;
        }
    </style>
<script type="text/javascript" src="js/6a90d8b9f8e64cf9410db404c47f81fc.js?t=1539592219"></script></head>
<body>
<c:import url="accout_top.jsp"/>
<form id="form1" style="*margin-top:10px">
<div class="account-rightBox clearfloat">
<div class="box-padding">
<div style="width:800px; overflow:hidden;  " class="mt10">
<dl class="account_paytime" style="float:left; width:460px; margin-top:5px;">
<dd class="payTime_now dd_Months" months="1" style="margin-right:1px;">
未来一月<br /> ￥${one}
</dd>
<dd class="dd_Months" months="3" style="margin-right:1px;">
未来三月<br /> ￥${three}
</dd>
<dd class="dd_Months" months="6" style="margin-right:1px;">
未来半年<br /> ￥${six }
</dd>
<dd class="dd_Months" months="all" style="margin-right:1px;">
全部<br /> ￥<fmt:formatNumber type="number" value="${all }" pattern="0.00" maxFractionDigits="2"/>
</dd>
</dl>
<dl class="account_paycustom" style="float:left; width:340px;">
<dt style="width:290px; text-align:left;">自定义查询：</dt>
<dd>
<input class="Wdate" type="text"  id="txt_start" onclick="WdatePicker({minDate:'%y-%M-{%d}'})" readonly="readonly" style="width: 90px;"></dd>
<dd>
至</dd>
<dd>
<input class="Wdate" type="text" id="txt_end" onclick="WdatePicker({ minDate:&#39;#F{$dp.$D(\&#39;txt_start\&#39;)}&#39; })" readonly="readonly" style="width: 90px;"></dd>
<dd>
<a class="search_btn" href="javascript:;" style="width:50px;">查看</a></dd>
<dd class="payCustom01">
</dd>
</dl>
</div>
<div class="account_paytotal" style="height:100px;padding-bottom:10px;">
<dl class="payBox1" style="width:400px; height:90px;">
<dt>待收本息总额：</dt>
<dd><b>￥<span id="spnDuecomeTotal"></span></b> /
<span id="spnDuecomeCount"></span>笔&nbsp;&nbsp;&nbsp;&nbsp;<a id="clickexcel" class="g9">导出回款计划</a></span></dd>
<dd class="mt-5">
<span class="g9 mt-5">本金￥<span id="duecomeamount"></span> + 利息￥<span id="duecomeinterest"></span></span>
</dd>

</dl>
<dl class="payBox3" style="height:90px;">
<dt>近期回款日：</dt>
<dd id="Recently"><span class="ml10"></span><b><span></span></b>
</dd>
</dl>
</div>
<div class="account_tableBox clearfloat">
<div class="account_table margin-top-20">
<table width="" align="center" border="0" cellspacing="0" cellpadding="0" class="account_tableNR">
<thead>
<tr id="trhead" style="background-color: rgb(240, 240, 240);">
<th class="a_low09 txt_left">
回款日期
</th>
<th class="a_low03 txt_left">
回款本息
</th>
<th class="a_low03 txt_left">
回款本金
</th>
<th class="a_low03 txt_left">
利息
</th>
<th class="a_low03 txt_left">
回款笔数
</th>
<th class="a_low03">
操作
</th>
</tr>
</thead>
<tbody id="tbody"></tbody>
</table>
<div id="pager" class="pagination" style="text-align:center;"></div>
</div>
</div>
</div>
</div>
<div id="dahei" style="display: none"></div>
<div id="tooltip" class="tooltip"></div>
</div>
<div id="diallayer" style="display: none;"></div>
</form>
<div id="dahei" style="display: none"></div>
<div id="tooltip" class="tooltip"></div>
</div>
<div class="tdw-footer">
<div class="wth-1200 tdw-footer-container">
<div class="tdw-footer-supervise">
<a class="super-img1" rel="external nofollow" href="#" target="_blank"></a>
<a class="super-img2" rel="external nofollow" href="#" target="_blank"></a>
<a class="super-img3" rel="external nofollow" href="#" target="_blank"></a>
<a class="super-img4" rel="external nofollow" href="#" target="_blank"></a>
<a class="super-img5" rel="external nofollow" href="#" target="_blank"></a>
<a class="super-img6" rel="external nofollow" id='#' target='_blank'></a>
<a class="super-img8" rel="external nofollow" id="_pingansec_bottomimagesmall_p2p" target='_blank' href="#"></a>
<a class="super-img9" target="_blank" href="#" alt="企业名称：东莞团贷网互联网科技服务有限公司法定代表人：唐军标识状态：已激活 粤工商备P191608002336"></a>
</div>
<div class="tdw-footer-address tc fz12">
2010-<span>2018</span> 版权所有 © 团贷网 <a href="#" target="_blank" rel="nofollow">粤ICP备12043601号-1</a> 粤公安网备44190002000538号 东莞团贷网互联网科技服务有限公司
<br/>地址：东莞市南城街道莞太路111号民间金融大厦1号楼28楼
</div>
</div>
</div>
<div class="tdw-tools-bar" id="tdwToolBar">
<ul>
<li>
<a href="javascript:;" id="toolRisk">
<i class="tdw-icons i-tool-risk"></i>
<p>风险<br>提示</p>
</a>
<div class="risk-tips">
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
<a href="javascript:;" onclick="javascript:window.open('index.html')">
<i class="tdw-icons i-tool-help"></i>
<p>帮助<br>中心</p>
</a>
</li>
<li>
<a href="javascript:;" onclick="javascript:window.open('');">
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
<a rel="nofollow" href="#" target="_blank" class="charge">去充值</a>
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
<input type="text" class="input-text autoinput" id="txtUnit" value="1" maxlength="10" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false" data-input="true" />份
</div>
<i class="top" id="btnPlus"></i><i class="bottom" id="btnMinus"></i>
<a href="javascript:void(0)" id="AllInvest">全额</a>
</div>
<div class="invent-form" style="margin-top: 15px; margin-bottom: 35px; height: 16px; line-height: 16px; display: none;" id="dCode">
<input type="text" placeholder="请输入手机验证码" id="MobileCode" style="height: 33px; line-height: 33px; padding-left: 12px; border: 1px solid #d5d5d5; width: 195px; border-radius: 3px; -webkie-border-radius: 3px;" />
<a href="javascript:void(0)" id="GetCode">发送验证码</a>
</div>
<div id="redpackform">
</div>
<a target="_blank" class="invent-btn" id="PostData" style="cursor:pointer;">立即投资</a>
<input type="hidden" id="hiDeadline" />
<input type="hidden" id="hiInterestRate" />
<input type="hidden" id="hiRepaymentType" />
<input type="hidden" id="hiProjectType" />
<input type="hidden" id="hiUnit" />
<input type="hidden" id="txtPublicRate" />
<input type="hidden" id="txtTuandaiRate" />
<input type="hidden" id="hiNeedPassWord" />
<input type="hidden" id="hiTotalInvest " />
<input type="hidden" id="hiCanGetPackage " />
<input type="hidden" id="hiNeedInvest " />
<input type="hidden" id="hiIsNewUser " />
<input type="hidden" id="hiIsAwardOverdue " />
<input type="hidden" id="hiAreaInvest " />
<input type="hidden" id="hiIsScribeTanfer" />
<input type="hidden" id="hiProjectDeadline" />
<input type="hidden" id="hiNewHandRate" />
<input type="hidden" id="hiHQBAmount" />
<input type="hidden" id="hiDeadType" />
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
<img src="images/loading.gif" alt="加载中" />
</div>
<div id="dial-window-btns" class="btns tc">
<a href="javascript:void(0)" class="td-btn-1 td-btn-1-or dete " id="dial-window-okbtn">确定</a>
<a href="javascript:void(0)" class="td-btn-1 td-btn-1-gar  cancle " id="dial-window-canclebtn">取消</a>
</div>
</div>
<a id="tt_link" style="display: none;">bank</a>
<div class="stop-taking stop-dialog" id="funcStopService" style="display: none;z-index: 9999999999">
<div id="guan"></div>
<h2><b class="b1"></b><span class="stop-title"></span><b class="b2"></b></h2>
<div class="stop-text" id="funcStopCentent">
</div>
<div class="knob">我知道了</div>
</div>
<div id="diallayer" style="display: none;"></div>
<div id="bankBindAlert" style="display: none;" class="dial-window xm-window bankBindAlert">
<div class="title rel">温馨提示：
<a href="/member/account_default"><i class="close-x cgt-close-x icon db abs"></i></a>
</div>
<div class="body">
<div class="" style="text-align: center;">
<p class="p1">请您在新打开的页面完成
<span id="sp_title"></span>
</p>
<p class="p2">
<span id="sp_title2"></span>完成前请不要关闭此窗口，根据完成结果，选择下面的操作</p>
</div>
</div>
<div class="bottom">
<div class="btn-group">
<a href="/member/account_default" id="remind_aa" class="btn">
<span id="aa_title">绑卡成功</span>
</a>
</div>
<a class="question" href="#" target="_blank">
<span id="sp_title3"></span>遇到问题</a>
</div>
</div>
<div class="xm-mask" style="display: none;"></div>
<div id="bankBlock" class="xiamen-pop" style="display: none;">
<div class="close"></div>
<div class="pop-tit">
<h3></h3>
<h4>团贷网联手厦门银行</h4>
<p>个人账户升级为厦门银行存管账户</p>
</div>
<div class="tc mt30">资金有保障，投资更放心</div>
<div class="pop-body">
<p>
<span id="sp_open" style="display: none;">您尚未开通厦门银行资金存管账户，请先开通</span>
<span id="sp_active" style="display: none;">您的账号已升级为厦门银行资金存管账户，请您激活账户</span>
</p>
<a href="/member/Bank/XM_BankBind" id="aOpen" class="btn" target="_blank">马上升级</a>
</div>
</div>
<div id="bindingBank" class="xiamen-pop" style="display: none;">
<div class="close"></div>
<div class="pop-tit">
<h3></h3>
<h4>团贷网联手厦门银行</h4>
<p>个人账户升级为厦门银行存管账户</p>
</div>
<div class="tc mt30">资金有保障，投资更放心</div>
<div class="pop-body">
<p>
<span id="sp_open" style="display: none;">您尚未开通厦门银行资金存管账户，请先开通</span>
<span id="sp_active" style="display: none;">您的账号已升级为厦门银行资金存管账户，请您激活账户</span>
</p>
<a href="/member/Bank/XM_BankBind" id="aOpen" class="btn" target="_blank">绑定银行卡</a>
</div>
</div>
<div style="display: none;" class="cgt_10100 dial-window xm-window layer-win">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body cgt-box">
<div class="  mt10">
<div id="body_dv_top" class="top">
<p>
<span class="ok-icon"></span>
<span id="body_dv_head">升级存管账户成功</span>
</p>
</div>
<div id="body_dv_bottom" class="bottom">
<div id="btn_01" class="count" style="display:block;">
<p class="pb30">此页将在
<span class="num"></span>后关闭，请在原页面继续操作</p>
<a class="td-btn-1 td-btn-1-or btn cgt-close-x" href="javascript:;">立即关闭</a>
</div>
</div>
</div>
</div>
</div>
<div style="display: none;" class="dial-window xm-window layer-win">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body cgt-box g6">
<div class=" pl20 mt10">
<div id="body_dv_top" class="top">
<p>
<span class="ok-icon"></span>
<span id="body_dv_head">升级存管账户成功</span>
</p>
</div>
<div id="body_dv_bottom" class="bottom">
<div id="btn_01" class="count tl " style="display:block;">
<p class="pb5 ff7301">由于您的证件为【港澳通行证】，您还需要完成以下操作才能进行资金操作：</p>
<p>1、添加专属客服
<a target=blank href=>
<span class="qq-bg">
<i class="qq-icon"></i>2880761023</span>
</a> 为好友。</p>
<p style="line-height:23px">2、QQ联系客服专员，提交以下申请材料：手持港澳台通行证证件彩色半身照【保证证件号码清晰且
<br/>不能是镜面照】港澳台通行证背面彩色照片,受理时间为：工作日8:30-12:00 13:30-18:00。</p>
<p>3、资料提交后，平台及银行将会进行双重审核，一般时长为2个工作日。</p>
<p class="pb30">4、审核通过后即可进行资金操作，届时会有短信通知。</p>
<a class="td-btn-1 td-btn-1-or btn cgt-close-x" href="javascript:;">我知道了</a>
</div>
</div>
</div>
</div>
</div>
<div style="display: none;" class="dial-window xm-window layer-win">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body cgt-box g6">
<div class=" pl20 mt10">
<div id="body_dv_top" class="top">
<p>
<span class="ok-icon  warning-icon"></span>
<span id="body_dv_head">升级存管账户成功</span>
</p>
</div>
<div id="body_dv_bottom" class="bottom">
<div id="btn_01" class="count tl " style="display:block; line-height:30px;">
<p class="  ff7301 pb30">注意：由于您的身份信息或银行卡信息有误，您暂时还不能进行充值、投资、提现等资金操作，请尽快联系团贷网专属客服
<a target=blank href=>
<span class="qq-bg">
<i class="qq-icon"></i>2880761023</span>
</a>　进行资料核实及修改。</p>
<a class="td-btn-1 td-btn-1-or btn cgt-close-x" href="javascript:;">我知道了</a>
</div>
</div>
</div>
</div>
</div>
<div style="display: none;" class="dial-window xm-window layer-win">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body cgt-box g6">
<div class=" pl20 mt10">
<div id="body_dv_top" class="top">
<p>
<span class="ok-icon  warning-icon"></span>
<span id="body_dv_head">升级存管账户成功</span>
</p>
</div>
<div id="body_dv_bottom" class="bottom">
<div id="btn_01" class="count tl " style="display:block; line-height:30px;">
<p class="  ff7301 pb30">注意：由于您填写的预留手机号与银行预留手机号不符，您暂时不能进行快捷充值操作，请及时到"我的账户—安全中心"进行修改。</p>
<a class="td-btn-1 td-btn-1-or btn  " href="javascript:;">我要修改预留手机号</a>
</div>
</div>
</div>
</div>
</div>
<div id="bankCheckFaile" style="display: none;" class="dial-window xm-window layer-win">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body cgt-box g6">
<div class=" pl20 mt10">
<div id="body_dv_bottom" class="bottom">
<div id="btn_01" class="count tl bankCheckTxt" style="display:block; line-height:30px;">
<p id="bankCheckFaile-tip" class="  ff7301 pb10">由于您升级存管时使用的证件为【外国人护照】，您还需完成以下操作才能进行资金操作：</p>
<p>1、添加专属客服
<a target=blank href="">
<span class="qq-bg">
<i class="qq-icon"></i>2880761023</span>
</a> 为好友。</p>
<p style="line-height:23px">2、QQ联系客服专员，提交以下申请材料：手持<span class="bankCheckFaile-tip2">港澳台通行证</span>证件彩色半身照【保证证件号码清晰且
<br/>不能是镜面照】<span class="bankCheckFaile-tip2">港澳台通行证</span>背面彩色照片,受理时间为：工作日8:30-12:00 13:30-18:00</p>
<p>3、资料提交后，平台及银行将会进行双重审核，一般时长为2个工作日。</p>
<p class="pb30">4、审核通过后即可进行正常投资，届时会有短信通知。</p>
<div class="tc">
<a class="td-btn-1 cgt-close-x td-btn-1-or btn" href="javascript:;">我知道了</a>
</div>
</div>
</div>
</div>
</div>
</div>
<div id="0pass" style="display: none;" class="dial-window xm-window layer-win">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body cgt-box g6">
<div class=" pl20 mt10">
<div id="body_dv_bottom" class="bottom">
<div id="btn_01" class="count tl " style="display:block; line-height:30px;">
<p class="  ff7301 pb30 mb10">注意：由于您的身份信息或银行卡信息有误，您暂时还不能进行充值、投资、提现等资金操作，请尽快联系团贷网客服（1010-1218）进行资料核实及修改。</p>
<a class="td-btn-1 cgt-close-x td-btn-1-or btn" href="javascript:;">我知道了</a>
</div>
</div>
</div>
</div>
</div>
<div id="risk" style="display: none;  width:450px!important; margin-left: -225px!important;" class="dial-window xm-window layer-win">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body" style="height: 214px;">
<div class="  mt10">
<div id="body_dv_bottom" class="bottom ">
<div id="btn_01" class="count" style="display:block;  ">
<p class="pb20 f18 g6">您尚未进行风险承受能力评测，请先完成评测后再进行投资</p>
<a class="td-btn-1 riskBtn td-btn-1-or btn btn-s" href="javascript:;">立即评测</a>
</div>
<div class="tc mt20">您今年还有三次评估机会</div>
</div>
</div>
</div>
</div>
<div id="chongzhiother" style="display: none;" class="dial-window xm-window layer-win">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body cgt-box g6">
<div class=" pl20 mt10">
<div id="body_dv_bottom" class="bottom">
<div id="btn_01" class="count tl " style="display:block; line-height:30px;">
<p class="  ff7301 pb30 mb10">注意：由于您填写的预留手机号与银行预留手机号不符，您暂时不能进行快捷充值操作，请及时到"我的账户—安全中心"进行修改。</p>
<a id="chongzhiotherbtn" target="_blank" class="td-btn-1  td-btn-1-or btn" href="javascript:;">我要修改预留手机号</a>
</div>
</div>
</div>
</div>
</div>
<div style="display: none;" id="closeWindowTh" class="dial-window xm-window layer-win">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body cgt-box">
<div class="  mt10">
<div id="body_dv_top" class="top">
<p>
<span class="ok-icon"></span>
<span id="body_dv_head">js3投标成功</span>
</p>
</div>
<div id="body_dv_bottom" class="bottom">
<div id="btn_01" class="count" style="display:block;">
<p class="pb30">此页将在
<span class="num">3s</span>后关闭，请在原页面继续操作</p>
<a class="td-btn-1 cgt-close-x td-btn-1-or btn" href="javascript:;">立即关闭</a>
</div>
</div>
</div>
</div>
</div>
<div style="display: none;   width:450px!important;  margin-left: -225px!important; " class="dial-window xm-window layer-win ">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body  ">
<div class="  mt10">
<div id="body_dv_top" class="top">
<p class="f18">
此证件号已注册！
</p>
</div>
</div>
</div>
</div>
<div style="display: none;   width:450px!important;   margin-left: -225px!important; " class="dial-window xm-window layer-win ">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body  ">
<div class="  mt10">
<div id="body_dv_top" class="top">
<p class="f18" style="line-height:25px">
银行卡号：***************0980已被使用，
<br> 请更换后重试！
</p>
</div>
</div>
</div>
</div>
<div style="display: none;  width:450px!important; margin-left: -225px!important;" class="dial-window xm-window layer-win">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body  ">
<div class="  mt10">
<div id="body_dv_bottom" class="bottom " style="padding-bottom:20px;">
<div id="btn_01" class="count" style="display:block;  ">
<p class="pb30 f18 g6" style="line-height:28px;">为保证转账顺利进行，
<br>请先前往迅辉财富(www.tdw.cn)升级存管。</p>
<a class="td-btn-1 td-btn-1-or btn" href="javascript:;">去授权</a>
</div>
</div>
</div>
</div>
</div>
<div id="zhixiang" style="display: none;  width:450px!important; margin-left: -225px!important; " class="dial-window xm-window layer-win">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body">
<div class="mt10">
<div id="body_dv_bottom" class="bottom ">
<div id="btn_01" class="count" style="display:block;  ">
<p class="pb30 f18 g6" style="line-height:28px;">您需要授权【自动还款】服务，才能发起智享转让</p>
<a id="zhixiang-btn" target="_blank" class="td-btn-1 td-btn-1-or btn btn-s" href="javascript:;">去授权</a>
</div>
</div>
</div>
</div>
</div>
<div id="touzi" style="display: none;  width:450px!important; margin-left: -225px!important;" class="dial-window xm-window layer-win">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body  ">
<div class="  mt10">
<div id="body_dv_bottom" class="bottom ">
<div id="btn_01" class="count" style="display:block;  ">
<p class="pb30 f18 g6">您需要授权【自动投标】服务，才能投资复投宝</p>
<a id="touzi-btn" class="td-btn-1 td-btn-1-or btn btn-s" href="javascript:;">去授权</a>
</div>
</div>
</div>
</div>
</div>
<div id="accountError" style="display: none ;" class="dial-window xm-window layer-win">
<div class="title1 rel">温馨提示：
<i class="close-x cgt-close-x icon db abs"></i>
</div>
<div class="body cgt-box g6">
<div class=" pl20 mt10">
<div id="body_dv_bottom" class="bottom">
<div id="btn_01" class="count tc " style="display:block; line-height:30px;">
<p class="  ff7301 pb30 mb10"> 注意：您的银行存管账户异常，请尽快联系团贷网客服（1010-1218）进行处理。</p>
<a id="accountError-btn" class="td-btn-1 cgt-close-x  td-btn-1-or btn" href="javascript:;">我知道了</a>
</div>
</div>
</div>
</div>
</div>
<div id="showToPlatformPermit" style="display: none;width: 450px;" class="dial-window xm-window forgetPhone">
<div class="title rel" style="display: block;">温馨提示：<i class="close-x cgt-close-x icon db abs"></i></div>
<div class="body">
<div>
<p style="text-align: center; line-height: 23px;font-size: 16px;">为保证转账顺利进行，<br />请先前往迅辉财富（www.tdw.cn）升级存管。</p>
</div>
</div>
<div class="bottom" style="text-align: center">
<div id="btn_03" class="btn-group">
<a id="qiyeBtn" href="javascript:;" class="btn cgt-close-x">我知道了</a>
</div>
<a style="color:red;text-decoration: underline;" href="javascript:;"  target="_blank">
遇到问题，联系客服
</a>
</div>
</div>
<script type="text/javascript">
    var isWePlanProject = false;         //标记是否在We计划详情页
    var IsOpenCGT = '1';                                       //是否开通存管通
</script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/jquery.slimscroll.js"></script>
<script type="text/javascript" src="js/thirdlib.js"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script type="text/javascript" src="js/public.js"></script>
<script type="text/javascript" src="js/jnumber.js"></script>
<script type="text/javascript" src="js/project_dialog_cgt.js"></script>
<script type="text/javascript" src="js/select_redbox.js"></script>
<script type="text/javascript" src="js/cgt_common.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/account.js"></script>

<script>
     <![CDATA[ 
    	var Id =  "6FD2338D";
        var isEnterAutoInvestSetPage = getCookie( Id+ "isEnterAutoInvestSetPage");//是否进入自动投标设置
        var isClosedYellowTip2 = getCookie(Id + "isClosedYellowTip");//手动点击关闭黄标签
        var isDefaultShowed = getCookie(Id + "_account_default");//是否首页显示
        var IsOpenCGT = "1";

        var tuandaiw = getCookie("tuandaiw");
        $(function () {
            try {
                 getRandomValue();
            } catch (e) { }
        });

        $(function () {
            $('#menu_autoTender').hover(function () {
                    $('#YellowTips').fadeIn(150);
                },
                function () {
                    $('#YellowTips').stop().fadeOut();
                }
            );

            $('#menu_myWePlan').hover(function () {
                $('#YellowTips2').fadeIn(150);
            },
                function () {
                    $('#YellowTips2').stop().fadeOut();
                }
            );

            $("#menu_recharge").click(function () {
                try {
                    getRandomValue();
                    if (!checkIsOpen("chongzhiother"))
                        return false;
                }
                catch (e) {
                }
            });
            $("#menu_withdraw").click(function () {
                try {
                    getRandomValue();
                    if (!checkIsOpen("tixian"))
                        return false;
                }
                catch (e) {
                }
            });

            $("#menu_transfer").click(function () {
                try {
//                    if(!checkStopService2()) {
//                        return false;
//                    }

                    if(!checkIsOpen()) {
                        return false;
                    }
                    if(!checkToPlatformPermit()) {
                        return false;
                    }
                }catch (e) {}
            });

            $("#menu_zxNewProject").click(function () {
                try {
//                    if (!checkIsOpen()) {
//                        return false;
//                    }
                }
                catch (e) {
                }
            });


            $("#menu_borrowMiniEdit,#menu_autoTender,#menu_userservice").click(function () {
                try {
                    if (!checkIsOpen())
                        return false;
                }
                catch (e) {
                }
            });

            if (isEnterAutoInvestSetPage != null && isEnterAutoInvestSetPage != "") {
                isEnterAutoInvestSetPage = "1";
            }
            if (isClosedYellowTip2 != null && isClosedYellowTip2 != "") {
                isClosedYellowTip2 = "1";
            }
            if (isDefaultShowed != null && isDefaultShowed != "") {
                isDefaultShowed = "1";
            }

            if (isEnterAutoInvestSetPage != "1") {

                $('#menu_autoTender').find('em').addClass("emClass");
            }

            if (window.location.href.indexOf("member/account_default") < 0) {
                //不是主页,自动提示
                if (isClosedYellowTip2 != "1" && isEnterAutoInvestSetPage != "1") {
                    $('#YellowTips').fadeIn();
                }
            } else {
                //是主页,如果大黑不显示自动提示
                if (isClosedYellowTip2 != "1" && isEnterAutoInvestSetPage != "1" && isDefaultShowed != "1") {
                    $('#YellowTips').fadeIn();
                }
            }

            $('#menu_autoTender').find('.close').click(function () {
                $('#YellowTips').fadeOut();
                setCloseYellowTips();
            });
        });
        function setCloseYellowTips() {
            setCookie(Id + "isClosedYellowTip", "1");
        }

/*         function checkStopService2() {
            var flag = true;
               $.ajax({
                url: "/member/getStopServiceStatus?type=transfer",
                type: "get",
                dataType: "json",
                data: {
                },
                async: false,
                success: function (json) {
                    if (json) {
                        if(json.code == 444) {
                            window.location.href = "member/Bank/account_transfer";
                         $("#diallayer").show();
                            if(json.data && json.data.pcDetail && json.data.pcDetail != "") {
                                $("#funcStopCentent").html(json.data.pcDetail);
                            }
                            $("#funcStopService").show();
                            flag = false;
                        }
                    }
                },
                error: function(json) {
                }
            });

            return flag;
        } */
    </script>
<script>
        <![CDATA[
        var left_newTitle = '团贷网提醒您：';
        var left_IsValidateMobile = "true";
        var left_IsValidateIdentity = "false";
        var left_IsSetPayPwd = "false";
        var IsbindBankNo = "false";

        function left_CheckAllowBindBank() {
            if (left_IsValidateMobile != 'True' || left_IsValidateIdentity != 'True') {
                userbank.tips(left_IsValidateMobile, left_IsValidateIdentity);
                return false;
            }

            return true;
        }

         ]]> 
    </script>
<script type="text/javascript">
        var IsOpenCGT = '1';//是否开通存管通
        var IsOpenCgtTrans = '1';
        var backUrlClose = "";
    </script>
<!-- <script type="text/javascript" src="//js3.tuandai.com/scripts/settdwcookie.js?v=2018092701"></script>
<script type="text/javascript" src="//js3.tuandai.com/scripts/default/project_dialog_cgt.js?v=2018092701"></script>
<script src="//js3.tuandai.com/scripts/member/bank/jquery.selectlist.js"></script>
<script type="text/javascript" src="//js3.tuandai.com/scripts/My97DatePicker/WdatePicker.js"></script> -->
<script type="text/javascript">
        var pageindex = 1;
        var pagesize = 10;
        var Months = '1';
        var type = '1';
        var dateMiniSet = $("#txt_start").attr("name");

        function GetData(one) {
            //            var dialog = art.dialog({
            //                time: 3,
            //                width: 300,
            //                content: "数据加载中..."
            //            });
//            document.getElementById("clickexcel").href = "/member/ajaxCross/export_autoLoan.ashx?startDate=" + $("#txt_start").val() + "&endDate=" + $("#txt_end").val() + "&type=" + type + "&Months=" + Months;
            jQuery.ajax({
                async: false,
                type: "post",
                url: "${pageContext.request.contextPath}/selectRece",
                dataType: "json",
                data: {
                    pageindex: pageindex,
                    startDate: $("#txt_start").val(),
                    endDate: $("#txt_end").val(),
                    Months: Months
                },
                success: function (jsonstr) {
                   /*  jsonstr = jsonstr.data;
                     var list = jsonstr.page.dataList; */
                     var list =jsonstr.page.list;
                    var latelyLoanReturnPlanModel = jsonstr.loanReturnPlanModel;
                    //dialog.close();
                    $("#trhead").nextAll().remove();
                    var html = new Array();
                    var str = "";
                    if (jsonstr.result == "1") {
                        $("#spnDuecomeTotal").text(parseFloat(jsonstr.totalAmount).toFixed(2));
                        $("#spnDuecomeCount").text(jsonstr.dueComeNum);
                        $("#duecomeamount").text(parseFloat(jsonstr.totalMoney).toFixed(2));
                        $("#duecomeinterest").text(parseFloat(jsonstr.totalInterest).toFixed(2));

                        if (one == 1) {
                            if(jsonstr.loanReturn.time==null){
                                $('#Recently').html("暂无回款");
                            }else{
                            	$('#Recently').html(jsonstr.loanReturn.time+ " / " +jsonstr.loanReturn.count + "笔 / 共<b>￥" + jsonstr.loanReturn.totalmoney + "</b>");
                            }
                        }
                        var temp1 = pagesize * (pageindex - 1);
                        for (var i = 0; i < list.length; i++) {
                            str = "<tr>" +
                                "<td class='pl40'>" + list[i].rrdate+ "</td>" +
                                "<td><span class='font-orange2'>￥" + list[i].rrtotal + "</span>" +
                                "<td  >￥" + list[i].rrmoney + "</td>" +
                                "<td >￥" + list[i].rrinterest + "</td>" +
                                "<td >" + list[i].rrnownum +"/" +list[i].rrnumber+"笔</td>" +
                                "<td class='txt_center'><a target='_blank' class='invest_a' href='${pageContext.request.contextPath}/account_loanReturnPlanDetail?rrid="+ list[i].rrid+"&sirid="+list[i].sirid+"'>查看详情</a></td>" +
                                "</tr>"
                            html.push(str);
                        }

                        $('#tbody').html(html.join(''));
                        initLoanReturnPlanPagin(jsonstr.page.totalCount,jsonstr.page.pageSize);
                    }
                    else {
                        $("#spnDuecomeTotal").text("0.00");
                        $("#spnDuecomeCount").text("0");
                        $("#duecomeamount").text("0.00");
                        $("#duecomeinterest").text("0.00");
                        if (one == 1) {
                            $('#Recently').html("暂无回款");
                        }
                        $("#tbody").html("<tr><td colspan=\"4\" align=\"center\">没有数据...</td></tr>");
                        initLoanReturnPlanPagin(0,0)
                    }
                },
                error: function (a, b, c) {
                    $("#trhead").nextAll().remove();
                    $("<tr><td colspan=\"4\" align=\"center\">加载有误...</td></tr>").insertAfter('#trhead');
                }
            });
            $(".account_tableNR").find("tr").css("background-color", "#f0f0f0");
            $(".account_tableNR").find("tr:odd").css("background-color", "#fff");
        }

        function Convert2Digit(num) {
            if (num.toString().indexOf(".") > -1) {
                if (num.toString().length - num.toString().indexOf(".") == 2) {
                    return num + "0";
                }
                return num.toString().substring(0, num.toString().indexOf(".") + 3);

            }
            else
                return num.toFixed(2);
        }

        //所有列表
        function initLoanReturnPlanPagin(recordCount,pageSize) {
            var num_entries = recordCount;
            $("#pager").pagination(num_entries, {
                callback: getList,
                items_per_page: pageSize,
                num_display_entries: 5,
                current_page: parseInt(pageindex - 1),
                num_edge_entries: 2,
                link_to: "#trhead",
                prev_text: "上一页",
                next_text: "下一页",
                ellipse_text: "...",
                prev_show_always: true,
                next_show_always: true,
                renderer: "defaultRenderer",
                show_if_single_page: false,
                load_first_page: true
            });
        }
        function getList(page_index, jq) {
            if (parseInt(pageindex - 1) == page_index) {
                return false;
            }
            pageindex = (page_index + 1);
            GetData(2);
            return false;
        }

        $(function () {
              GetData(1); 
            $(".dd_Months").click(function () {
                $('.dd_Months').removeClass('payTime_now');
                $(this).addClass('payTime_now');
                Months = $(this).attr('Months');
                type = '1';
                pageindex = 1;
                $("#txt_start").val("");
                $("#txt_end").val("");
                GetData(2);
            });
            $('.search_btn').click(function () {
                if ($("#txt_start").val() != "" || $("#txt_end").val() != "") {
                    $('.dd_Months').removeClass('payTime_now');
                    
                }
                type = '2';
                pageindex = 1;
                 GetData(2);
            });

            $('#clickexcel').click(function () {
                $.common.get('/member/canExport', function (data) {
                    if(data) {
                        location.href = "/member/Cross/export_autoLoan?startDate=" + $("#txt_start").val() + "&endDate=" + $("#txt_end").val() + "&type=" + type + "&Months=" + Months;
                    }
                });
            });
        });
    </script>
<script type="text/javascript">
        $("#menu_zxReturnPlan").addClass("currentMenu");
    </script>
<script type="text/javascript">
    <![CDATA[
    (function () {   //红包下拉
        try {
            getRandomValue();
        } catch (e) { }
        $('.red-package-list').css({ 'margin-bottom': '-5px' });
        $('.red-package-list').find('dt').click(function (event) {
            $(this).parent().find('dd').slideDown(300);
            event.stopPropagation();
        });
        $('.red-package-list').find('li').click(function () {
            var thisVal = $(this).attr('data');
            $(this).parents('.red-package-list').find('.data').text(thisVal);
            $(this).find('dd').slideUp(300);
        });
        $(window).click(function (event) {
            $('.red-package-list').find('dd').slideUp(300);
        });
    })();
    (function () {
        $(".a_code").mouseover(function () {
            $(".codexe").show();
        }).mouseout(function () {
            $(".codexe").hide();
        });
        $('.member-list').hover(function () {
                $(this).find('ul').addClass('ul-type').end().find('.mission').show();
                $(this).find('.arrow').removeClass('down-arrow').addClass('up-arrow');
            }, function () {
                $(this).find('ul').removeClass('ul-type').end().find('.mission').hide();
                $(this).find('.arrow').removeClass('up-arrow').addClass('down-arrow');
            }
        )
    })();
    function stringToHex(s) {
        var r = '';
        var hexes = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'];
        for (var i = 0; i < (s.length) ; i++) {
            r += hexes[s.charCodeAt(i) >> 4] + hexes[s.charCodeAt(i) & 0xf]
        }
        return r
    }

    function HexTostring(s) {
        var r = '';
        for (var i = 0; i < s.length; i += 2) {
            var sxx = parseInt(s.substring(i, i + 2), 16);
            r += String.fromCharCode(sxx)
        }
        return r
    }

    var nwbi_userName = "";
    var nwbi_sysNo = "TDW";
    var IsLogin = isCookieLogin();
    if (IsLogin) {
        var nickname = jaaulde.utils.cookies.get("TDWUserName");
        nwbi_userName = nickname;
    }
    (function () {
        var ta = document.createElement('script');
        ta.type = 'text/javascript';
        ta.async = true;
        ta.src = ((("https:") == document.location.protocol) ? "https://" : "http://") + 'bilog.niiwoo.com/js/webaccess.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ta, s);
    })();

    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?6dff67da4e4ef03cccffced8222419de";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
    ]]>
</script>
<script type="text/javascript" src="js/settdwcookie.js"></script>
</body>
</html>