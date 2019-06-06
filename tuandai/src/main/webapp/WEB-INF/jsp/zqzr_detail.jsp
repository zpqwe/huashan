<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<!--债权转让 P2P转让  我要承接页面-->

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="mobile-agent" content="format=html5;url=#">
		<link rel="alternate" media="only screen and (max-width: 640px)" href="">
		<link rel="dns-prefetch" href="">
		<link rel="dns-prefetch" href="">
		<link rel="dns-prefetch" href="">
		<link rel="dns-prefetch" href="">
		<link rel="dns-prefetch" href="">
		<meta property="qc:admins" content="3542563377645164116375">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="../css/base.css">
		<link rel="stylesheet" href="../css/layout.css">
		<link rel="stylesheet" href="../css/component.css">
		<link rel="stylesheet" href="../css/xiamen-bank.css">
		<link rel="stylesheet" href="../css/cgt20161107.css">
		<link rel="stylesheet" href="../css/NewBorrowDetail1.css">
		<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
		<!-- 依赖的的 js -->
		<script type="text/javascript" src="../js/jquery.pagination.js"></script>
		<script type="text/javascript" src="../js/zqzr_detail.js"></script>
		<title>${Titem.tititle }-团贷网</title>
		<link rel="stylesheet" type="text/css" href="../css/invest_dialog.css">
		<link href="../css/invest_div1.css" rel="stylesheet" type="text/css">
		<style type="text/css">
			#waf_nc_block {
				position: fixed;
				_position: absolute;
				width: 100%;
				height: 100%;
				top: 0;
				bottom: 0;
				left: 0;
				z-index: 9999;
			}
			
			.waf-nc-mask {
				background: #f8f8f8;
				opacity: 0.5;
				filter: alpha(opacity=50);
				width: 100%;
				height: 100%;
			}
			
			.waf-nc-wrapper {
				width: 480px;
				height: 254px;
				position: absolute;
				top: 50%;
				left: 50%;
				margin-top: -127px;
				margin-left: -240px;
				margin-bottom: 16px;
				background: #ffffff;
				border: 3px solid #00A2CA;
			}
			
			.waf-nc-icon {
				position: absolute;
				top: 18px;
				left: 20px;
			}
			
			.waf-nc-title {
				margin-top: 23px;
				margin-left: 47px;
				font-size: 16px;
				color: #333333;
				line-height: 10px;
				text-align: left;
			}
			
			.waf-nc-splitter {
				margin-left: 26px;
				margin-top: 5px;
				width: 430px;
				height: 0px;
				border: 1px solid #f4f4f4;
			}
			
			.waf-nc-description {
				margin-top: 22px;
				margin-left: 23px;
				font-size: 12px;
				color: #333333;
				text-align: left;
			}
			
			#nocaptcha {
				margin-top: 20px;
				margin-left: 92px;
				width: 300px;
				height36px;
			}
		</style>
		<script src="../js/nc.js"></script>
		<style>
			@charset "utf-8";
			@font-face {
				font-family: 'nc_iconfont';
				src: url("//at.alicdn.com/t/font_1465353706_4784257.eot");
				src: url("//at.alicdn.com/t/font_1465353706_4784257.eot?#iefix") format('embedded-opentype'), url("//at.alicdn.com/t/font_1465353706_4784257.woff") format('woff'), url("//at.alicdn.com/t/font_1465353706_4784257.ttf") format('truetype'), url("//at.alicdn.com/t/font_1465353706_4784257.svg#iconfont") format('svg')
			}
			
			@font-face {
				font-family: 'ncpc_iconfont';
				src: url("//at.alicdn.com/t/font_384029_rhzpmteb25oecdi.eot");
				src: url("//at.alicdn.com/t/font_384029_rhzpmteb25oecdi.eot?#iefix") format('embedded-opentype'), url("//at.alicdn.com/t/font_384029_rhzpmteb25oecdi.woff") format('woff'), url("//at.alicdn.com/t/font_384029_rhzpmteb25oecdi.ttf") format('truetype'), url("//at.alicdn.com/t/font_384029_rhzpmteb25oecdi.svg#ncpc_iconfont") format('svg')
			}
			
			.nc-container div#nc-loading-circle {
				background: transparent;
				width: 20px;
				height: 20px;
				display: inline-block;
				position: relative;
				vertical-align: middle
			}
			
			.nc-container div#nc-loading-circle .sk-circle {
				background: transparent;
				width: 100%;
				height: 100%;
				position: absolute;
				left: 0;
				top: 0
			}
			
			.nc-container #nc-loading-circle .sk-circle:before {
				content: '';
				display: block;
				margin: 0 auto;
				width: 15%;
				height: 15%;
				background-color: #818181;
				border-radius: 100%;
				-webkit-animation: sk-circleFadeDelay 1.2s infinite ease-in-out both;
				animation: sk-circleFadeDelay 1.2s infinite ease-in-out both
			}
			
			.nc-container #nc-loading-circle .sk-circle2 {
				-webkit-transform: rotate(30deg);
				-ms-transform: rotate(30deg);
				transform: rotate(30deg)
			}
			
			.nc-container #nc-loading-circle .sk-circle3 {
				-webkit-transform: rotate(60deg);
				-ms-transform: rotate(60deg);
				transform: rotate(60deg)
			}
			
			.nc-container #nc-loading-circle .sk-circle4 {
				-webkit-transform: rotate(90deg);
				-ms-transform: rotate(90deg);
				transform: rotate(90deg)
			}
			
			.nc-container #nc-loading-circle .sk-circle5 {
				-webkit-transform: rotate(120deg);
				-ms-transform: rotate(120deg);
				transform: rotate(120deg)
			}
			
			.nc-container #nc-loading-circle .sk-circle6 {
				-webkit-transform: rotate(150deg);
				-ms-transform: rotate(150deg);
				transform: rotate(150deg)
			}
			
			.nc-container #nc-loading-circle .sk-circle7 {
				-webkit-transform: rotate(180deg);
				-ms-transform: rotate(180deg);
				transform: rotate(180deg)
			}
			
			.nc-container #nc-loading-circle .sk-circle8 {
				-webkit-transform: rotate(210deg);
				-ms-transform: rotate(210deg);
				transform: rotate(210deg)
			}
			
			.nc-container #nc-loading-circle .sk-circle9 {
				-webkit-transform: rotate(240deg);
				-ms-transform: rotate(240deg);
				transform: rotate(240deg)
			}
			
			.nc-container #nc-loading-circle .sk-circle10 {
				-webkit-transform: rotate(270deg);
				-ms-transform: rotate(270deg);
				transform: rotate(270deg)
			}
			
			.nc-container #nc-loading-circle .sk-circle11 {
				-webkit-transform: rotate(300deg);
				-ms-transform: rotate(300deg);
				transform: rotate(300deg)
			}
			
			.nc-container #nc-loading-circle .sk-circle12 {
				-webkit-transform: rotate(330deg);
				-ms-transform: rotate(330deg);
				transform: rotate(330deg)
			}
			
			.nc-container #nc-loading-circle .sk-circle2:before {
				-webkit-animation-delay: -1.1s;
				animation-delay: -1.1s
			}
			
			.nc-container #nc-loading-circle .sk-circle3:before {
				-webkit-animation-delay: -1s;
				animation-delay: -1s
			}
			
			.nc-container #nc-loading-circle .sk-circle4:before {
				-webkit-animation-delay: -.9s;
				animation-delay: -.9s
			}
			
			.nc-container #nc-loading-circle .sk-circle5:before {
				-webkit-animation-delay: -.8s;
				animation-delay: -.8s
			}
			
			.nc-container #nc-loading-circle .sk-circle6:before {
				-webkit-animation-delay: -.7s;
				animation-delay: -.7s
			}
			
			.nc-container #nc-loading-circle .sk-circle7:before {
				-webkit-animation-delay: -.6s;
				animation-delay: -.6s
			}
			
			.nc-container #nc-loading-circle .sk-circle8:before {
				-webkit-animation-delay: -.5s;
				animation-delay: -.5s
			}
			
			.nc-container #nc-loading-circle .sk-circle9:before {
				-webkit-animation-delay: -.4s;
				animation-delay: -.4s
			}
			
			.nc-container #nc-loading-circle .sk-circle10:before {
				-webkit-animation-delay: -.3s;
				animation-delay: -.3s
			}
			
			.nc-container #nc-loading-circle .sk-circle11:before {
				-webkit-animation-delay: -.2s;
				animation-delay: -.2s
			}
			
			.nc-container #nc-loading-circle .sk-circle12:before {
				-webkit-animation-delay: -.1s;
				animation-delay: -.1s
			}
			
			@-webkit-keyframes sk-circleFadeDelay {
				0%,
				39%,
				100% {
					opacity: 0
				}
				40% {
					opacity: 1
				}
			}
			
			@-webkit-keyframes sk-circleFadeDelay {
				0%,
				39%,
				100% {
					opacity: 0
				}
				40% {
					opacity: 1
				}
			}
			
			@keyframes sk-circleFadeDelay {
				0%,
				39%,
				100% {
					opacity: 0
				}
				40% {
					opacity: 1
				}
			}
			
			.nc-container .scale_text2 #nc-loading-circle .sk-circle:before {
				background-color: #fff
			}
			
			.nc_iconfont {
				font-family: "nc_iconfont";
				color: #ff3f08;
				font-size: 16px;
				font-style: normal
			}
			
			.ncpc_iconfont {
				font-family: "ncpc_iconfont";
				color: #ff3f08;
				font-size: 16px;
				font-style: normal
			}
			
			.captcha-error .icon_ban {
				float: left;
				font-size: 16px;
				padding-right: 5px;
				line-height: 14px
			}
			
			.clickCaptcha_text .btn_refresh {
				font-style: normal;
				cursor: pointer;
				background: #fff;
				color: #737383
			}
			
			.imgCaptcha .btn_refresh {
				font-size: 20px;
				cursor: pointer;
				background: #fff;
				color: #737383
			}
			
			.nc_voice {
				display: none;
				position: relative;
				margin-top: -34px;
				z-index: 99;
				width: auto;
				height: 34px;
				background: #fff
			}
			
			.omeo-code-img,
			.omeo-code-audio {
				font-size: 0;
				text-align: left
			}
			
			.omeo-code-audiobox,
			.omeo-code-img a,
			.omeo-code-audio a,
			.omeo-code-state {
				display: inline-block;
				*display: inline;
				zoom: 1;
				height: 32px;
				vertical-align: top;
				font-size: 12px
			}
			
			.omeo-code .omeo-code-refresh {
				background: transparent;
				width: 32px;
				height: 32px;
				font-size: 20px;
				color: #888;
				text-align: center;
				text-decoration: none;
				padding-left: 4px;
				line-height: 32px
			}
			
			.omeo-code .omeo-switch {
				display: none;
				width: 32px;
				height: 32px;
				border-left: 1px solid #e1e1e1;
				background-image: url("//g.alicdn.com/sd/ncpc/images/checkcode.png");
				background-repeat: no-repeat
			}
			
			.omeo-img-active .omeo-code-img {
				display: block
			}
			
			.omeo-img-active .omeo-code-audio {
				display: none
			}
			
			.omeo-code-img img {
				border: 1px solid #cdcdcd;
				cursor: pointer
			}
			
			.omeo-code-img .omeo-switch {
				background-position: 9px -41px
			}
			
			.omeo-audio-active .omeo-code-audio {
				display: block
			}
			
			.omeo-audio-active .omeo-code-img {
				display: none
			}
			
			.omeo-code-refresh {
				position: relative;
				left: 95px
			}
			
			.omeo-code-audiobox {
				position: relative;
				height: 30px;
				line-height: 32px;
				border: 1px solid #e1e1e1;
				text-align: center;
				overflow: hidden;
				left: 100px;
				top: 1px;
				width: 45%;
				min-width: 80px;
				background-color: #eee
			}
			
			.omeo-code-audiobox a {
				display: block;
				text-decoration: none;
				color: #06c
			}
			
			.omeo-code-audiobox-playing a {
				visibility: hidden
			}
			
			.omeo-code-audiobox span,
			.omeo-code-audiobox b {
				visibility: hidden;
				position: absolute;
				top: 0;
				left: 0;
				height: 30px;
				font-weight: 100;
				overflow: hidden
			}
			
			.omeo-code-audiobox-playing span,
			.omeo-code-audiobox-playing b {
				visibility: visible
			}
			
			.omeo-code-audiobox span {
				z-index: 0;
				width: 0;
				background: #186bca
			}
			
			.omeo-code-audiobox b {
				width: 100%;
				z-index: 1;
				text-align: left;
				text-indent: 30px;
				color: #999;
				background: url("//g.alicdn.com/sd/ncpc/images/checkcode.png") no-repeat 14px -89px
			}
			
			.omeo-code-audio .omeo-switch {
				background-position: 5px 10px
			}
			
			input[type=text]::-ms-clear {
				display: none
			}
			
			.omeo-box {
				position: relative;
				background-color: #fff
			}
			
			.omeo-code-echo {
				position: absolute;
				top: 2px;
				left: 2px
			}
			
			.omeo-code-echo input {
				padding: 5px;
				height: 18px;
				line-height: 18px;
				border: 1px solid #ddd;
				width: 80px;
				outline: 0
			}
			
			.omeo-code-state {
				height: 30px;
				line-height: 30px;
				text-indent: 25px;
				white-space: nowrap;
				background-image: url("//g.alicdn.com/sd/ncpc/images/checkcode.png");
				background-repeat: no-repeat;
				background-position: 100px 100px
			}
			
			.omeo-code-echo .omeo-code-state-error {
				width: auto;
				background-position: 7px -193px
			}
			
			.omeo-code-echo .omeo-code-state-success {
				position: absolute;
				width: 30px;
				background-position: 7px -243px
			}
			
			.omeo-code-state {
				position: absolute;
				left: 0;
				top: 28px
			}
			
			.nc_voice_close {
				display: inline-block;
				position: relative;
				cursor: pointer;
				left: 95px;
				top: 0;
				border-left: #ddd 2px solid;
				padding: 0 0 0 7px;
				background-color: #fff;
				font-size: 20px;
				color: #888;
				line-height: 32px
			}
			
			.nc_help {
				position: absolute;
				width: 100%;
				height: 100%;
				left: 0;
				top: 0;
				z-index: 99999
			}
			
			.nc_help .mask {
				background-color: #000;
				opacity: .5;
				filter: alpha(opacity=50);
				width: 100%;
				height: 100%;
				top: 0;
				left: 0
			}
			
			.nc_btn_close {
				position: absolute;
				height: 20px;
				left: 500px;
				border-radius: 20px;
				padding: 10px 30px;
				background-color: #aaa;
				color: #fff;
				cursor: pointer;
				z-index: 10
			}
			
			.nc_btn_close:hover {
				background-color: #afafaf
			}
			
			.nc_hand {
				position: absolute;
				width: 68px;
				height: 53px;
				background-image: url("//g.alicdn.com/sd/ncpc/images/hand.png");
				z-index: 3
			}
			
			.nc_slide_bg {
				z-index: 3;
				font-size: 12px;
				text-align: center;
				color: #fff;
				line-height: 34px
			}
			
			.nc_voicebtn {
				position: absolute;
				padding: 0;
				right: -25px;
				font-size: 23px;
				color: #888;
				cursor: pointer;
				line-height: 34px
			}
			
			.nc_helpbtn {
				position: absolute;
				cursor: pointer;
				right: -95px;
				top: 4px;
				font-size: 12px;
				background-color: #ffb668;
				color: #fff;
				padding: 4px;
				border-radius: 2px;
				line-height: 18px;
				display: none
			}
			
			.nc_helpbtn:before {
				width: 0;
				height: 0;
				content: "";
				position: absolute;
				left: -2px;
				top: 6px;
				border-top: 4px solid transparent;
				border-bottom: 4px solid transparent;
				border-right: 4px solid #ffb668
			}
			
			.nc-container .errloading {
				border: #faf1d5 1px solid;
				text-indent: 3px;
				background-image: none;
				font-size: 12px;
				width: 290px;
				line-height: 20px;
				padding: 7px 5px 8px 5px;
				color: #ef9f06;
			}
			
			.nc-container .errloading a {
				color: #30a7fc
			}
			
			.nc_captcha_text .nc_err {
				float: left;
				text-indent: 0
			}
			
			.button_move {
				transition: left .5s;
				-moz-transition: left .5s;
				-webkit-transition: left .5s;
				-o-transition: left .5s
			}
			
			.bg_move {
				transition: width .5s;
				-moz-transition: width .5s;
				-webkit-transition: width .5s;
				-o-transition: width .5s
			}
			
			.nc_slide_box {
				position: absolute
			}
			
			.nc_captcha_text {
				height: auto;
				line-height: 20px;
				visibility: hidden;
				font-size: 12px;
				color: #999;
				font-weight: normal
			}
			
			.nc-container .nc_captcha_img_text {
				width: auto;
				height: auto;
				line-height: 20px;
				visibility: hidden;
				font-size: 12px;
				color: #999;
				font-weight: normal;
				display: none;
				padding: 0 0 10px 0;
				background-position: 0 0;
			}
			
			.nc-container .nc_captcha_img_text span.nc-lang-cnt {
				line-height: inherit
			}
			
			.nc-container .imgCaptcha .nc_captcha_img_text {
				width: auto
			}
			
			.nc_captcha_img_text {
				height: auto;
				line-height: 20px;
				visibility: hidden;
				font-size: 12px;
				color: #999;
				font-weight: normal;
				display: none;
				padding: 0 0 10px 3px;
				background-position: 0 0
			}
			
			.nc-container .nc_wrapper {
				width: auto
			}
			
			.nc_scale {
				width: auto;
				height: 34px;
				background: #e8e8e8;
				position: relative;
				margin: 0;
				padding: 0
			}
			
			.nc_scale.is_audio {
				margin-right: 25px
			}
			
			.nc-container .nc_scale div {
				height: auto
			}
			
			.nc-container .nc_scale ul {
				list-style: none
			}
			
			.nc-container .nc_scale .btn_slide {
				color: #737383;
				background-image: none;
				-webkit-font-smoothing: antialiased;
				-moz-osx-font-smoothing: grayscale
			}
			
			.nc-container .nc_scale span {
				text-align: center;
				width: 40px;
				height: 32px;
				line-height: 32px;
				border: 1px solid #ccc;
				position: absolute;
				left: 0;
				cursor: move;
				background: #fff;
				z-index: 2
			}
			
			.nc-container .nc_scale span.nc-lang-cnt {
				*line-height: 34px;
				float: none;
				width: auto;
				height: auto;
				*height: 34px;
				border: none;
				position: static;
				cursor: inherit;
				background: none;
				z-index: 0;
				display: inline
			}
			
			.nc_slide_button {
				width: 40px;
				height: 32px;
				border: 1px solid #ccc;
				position: absolute;
				left: 0;
				cursor: move;
				background: #fff url("//g.alicdn.com/sd/ncpc/images/rt.png") no-repeat center;
				z-index: 2
			}
			
			@media screen and (-ms-high-contrast:active),
			(-ms-high-contrast:none) {
				.nc_scale span {
					height: 32px
				}
			}
			
			.nc-container .nc_scale .btnok {
				cursor: default;
				background: #fff url("//g.alicdn.com/sd/ncpc/images/yes.png") no-repeat center;
				z-index: 3
			}
			
			.nc-container .nc_scale .btnok2 {
				cursor: default;
				font-size: 20px;
				background: #fff url("//g.alicdn.com/sd/ncpc/images/no.png") no-repeat center;
				z-index: 3
			}
			
			.nc-container .nc_scale .btn_warn {
				cursor: default;
				color: #ff3f08;
				line-height: 34px;
				text-align: center;
				font-size: 20px;
				background: #fff;
				z-index: 3
			}
			
			.nc-container .clickCaptcha_text .btn_refresh {
				font-size: 20px
			}
			
			.nc-container .clickCaptcha_text .icon_close {
				line-height: 30px;
				margin-left: 8px;
				cursor: default;
				color: #ff3f08;
				font-size: 16px;
				float: left;
				margin-right: 2px;
				background: transparent;
				z-index: 3
			}
			
			.nc-container .nc_captcha_img_text .icon_close {
				cursor: default;
				color: #ff3f08;
				font-size: 16px;
				float: left;
				margin-right: 4px;
				background: transparent;
				z-index: 3;
				line-height: 18px
			}
			
			.nc-container .errloading .icon_warn {
				cursor: default;
				color: #ff3f08;
				font-size: 18px;
				float: left;
				background: transparent;
				z-index: 3
			}
			
			.nc-container .nc_scale .btn_ok {
				cursor: default;
				line-height: 34px;
				text-align: center;
				font-size: 20px;
				background: #fff;
				z-index: 3;
				color: #76c61d
			}
			
			.nc-container .nc_scale .nc_ok,
			.nc-container .nc_scale .nc_bg {
				background: #7ac23c
			}
			
			.nc-container .nc_scale .nc_bg {
				position: absolute;
				height: 100%;
				_height: 34px;
				left: 0;
				width: 10px
			}
			
			.nc-container .nc_scale div.redbar {
				background: #fc461e;
				opacity: .5;
				filter: alpha(opacity=50)
			}
			
			.nc-container .nc_scale div.orange {
				background: #f00
			}
			
			.nc-container .nc_scale .scale_text {
				width: 100%;
				height: 100%;
				text-align: center;
				position: absolute;
				z-index: 1;
				background: transparent;
				color: #9c9c9c;
				line-height: 34px;
				font-size: 12px;
				cursor: pointer
			}
			
			.nc-container .nc_scale .scale_text2 {
				text-align: left;
				color: #fff;
				font-size: 12px;
				text-indent: 10px
			}
			
			.nc-container .nc_scale .scale_text2 b {
				padding-left: 0;
				font-weight: normal
			}
			
			.nc-container .nc_scale .scale_text.scale_loading_text {
				text-align: center
			}
			
			.nc-container .nc_scale .imgCaptcha,
			.nc-container .nc_scale .clickCaptcha {
				display: none;
				overflow: hidden;
				border: 1px solid #ccc;
				background: #fff;
				z-index: 20000;
			}
			
			.nc-container .nc_scale .imgCaptcha p.error span,
			.nc-container .nc_scale .clickCaptcha p.error span {
				line-height: normal
			}
			
			.nc-container .nc_scale .imgCaptcha {
				height: auto
			}
			
			.nc-container .nc_scale .clickCaptcha {
				position: absolute;
				left: 0;
				top: 35px;
				height: 270px;
				background: #fff;
				display: none;
			}
			
			.nc-container .nc_scale .clickCaptcha p.error i {
				color: #ff3f08;
				font-style: normal
			}
			
			.nc-container .nc_scale .clickCaptcha div {
				position: static;
				clear: both;
				width: 100%;
				background: #fff;
				height: auto
			}
			
			.nc-container .nc_scale .clickCaptcha .clickCaptcha_text {
				height: 30px;
				line-height: 30px;
				font-size: 12px;
				color: #999;
			}
			
			.nc-container .nc_scale .clickCaptcha .clickCaptcha_text b {
				font-weight: normal
			}
			
			.nc_btn_2 {
				position: absolute;
				right: 0;
				top: 0;
				cursor: pointer;
				margin: 2px 9px 0 0
			}
			
			.nc_iconfont.nc_btn_2 {
				position: absolute;
				right: 0;
				top: 0;
				cursor: pointer
			}
			
			.nc_iconfont.nc_btn_1 {
				position: absolute;
				top: 10px;
				right: 5px
			}
			
			.nc_btn_1 {
				top: 10px;
				right: 10px
			}
			
			.scale_text i {
				font-style: normal;
				border: none;
				position: static;
				cursor: default;
				color: #fffc00;
				background: none;
				display: inline;
				width: 100%
			}
			
			.nc-container .clickCaptcha .clickCaptcha_img {
				margin: 0 auto;
				clear: both;
				position: relative;
			}
			
			.nc-container .clickCaptcha .clickCaptcha_img img {
				width: 230px;
				height: 230px;
				margin-left: 10px;
				margin-top: 5px
			}
			
			.nc-container .clickCaptcha .clickCaptcha_btn {
				margin: 10px 0 0 15px;
				position: relative;
				text-align: left;
			}
			
			.nc-container .clickCaptcha .clickCaptcha_btn img {
				cursor: pointer
			}
			
			.nc-container .imgCaptcha {
				position: absolute;
				left: 0;
				top: 35px;
				height: auto;
				padding-bottom: 15px;
				border: 1px solid #ccc;
				background: #fff;
			}
			
			.nc-container .imgCaptcha div {
				position: static;
				width: 90%;
				background-color: #fff
			}
			
			.nc-container .imgCaptcha,
			.nc-container .clickCaptcha {
				text-align: left;
			}
			
			.nc-container .imgCaptcha a,
			.nc-container .clickCaptcha a {
				color: #ff3f08
			}
			
			.nc-container .imgCaptcha .imgCaptcha_text {
				height: 42px;
				line-height: 42px;
				width: 120px;
				background: #fff;
				font-size: 14px;
				text-align: left;
				color: #747474;
				float: left;
				margin-left: 10px;
			}
			
			.nc-container .imgCaptcha .imgCaptcha_text input {
				margin-top: 5px;
				height: 30px;
				line-height: 30px;
				font-size: 14px;
				width: 90px;
				background: #fff
			}
			
			.nc-container .imgCaptcha .imgCaptcha_text input:focus {
				outline: none;
				color: #bbb
			}
			
			.nc-container .imgCaptcha .imgCaptcha_btn {
				margin: 0 0 0 12px;
				*margin-left: 0;
				clear: both;
				padding-top: 5px;
				width: 90%;
			}
			
			.nc-container .imgCaptcha .imgCaptcha_btn img {
				cursor: pointer
			}
			
			.nc-container .imgCaptcha .nc_scale_submit {
				margin: 0 auto;
				cursor: pointer;
				background-color: #fc461e;
				width: 120px;
				height: 32px;
				line-height: 32px;
				color: #fff;
				text-align: center
			}
			
			.nc-container .imgCaptcha .imgCaptcha_img {
				margin: 4px 0 0 100px;
				height: 40px;
				width: 130px;
				overflow: hidden;
				cursor: pointer;
			}
			
			.nc-container .imgCaptcha .imgCaptcha_img img {
				width: 130px
			}
			
			.nc-container .imgCaptcha .imgCaptcha_img input {
				border: solid 1px #ccc
			}
			
			.nc-lang-ar_MA,
			.nc-lang-ar_SA,
			.nc-lang-iw_HE,
			.nc-lang-iw_IL {
				text-align: right;
				*text-align: left;
			}
			
			.nc-lang-ar_MA .nc_scale .scale_text2,
			.nc-lang-ar_SA .nc_scale .scale_text2,
			.nc-lang-iw_HE .nc_scale .scale_text2,
			.nc-lang-iw_IL .nc_scale .scale_text2 {
				text-align: right;
			}
			
			.nc-lang-ar_MA .nc_scale .scale_text2 span,
			.nc-lang-ar_SA .nc_scale .scale_text2 span,
			.nc-lang-iw_HE .nc_scale .scale_text2 span,
			.nc-lang-iw_IL .nc_scale .scale_text2 span {
				*display: inline-block;
				padding: 0 56px 0 0
			}
			
			.nc-lang-ar_MA .nc_captcha_img_text,
			.nc-lang-ar_SA .nc_captcha_img_text,
			.nc-lang-iw_HE .nc_captcha_img_text,
			.nc-lang-iw_IL .nc_captcha_img_text {
				*text-align: right
			}
			
			.nc-lang-ar_MA span.nc-lang-cnt,
			.nc-lang-ar_SA span.nc-lang-cnt,
			.nc-lang-iw_HE span.nc-lang-cnt,
			.nc-lang-iw_IL span.nc-lang-cnt {
				text-align: right;
				direction: rtl
			}
			
			.nocaptcha span.nc-lang-cnt {
				float: none;
				height: auto;
				line-height: 30px
			}
			
			.nc-container {
				font-size: 12px;
				-ms-touch-action: none;
				touch-action: none;
			}
			
			.nc-container p {
				margin: 0;
				padding: 0;
				display: inline
			}
			
			.nc-container .scale_text.scale_text span[data-nc-lang="_startTEXT"] {
				display: inline-block;
				width: 100%
			}
			
			.nc-container .scale_text.scale_text.slidetounlock span[data-nc-lang="_startTEXT"] {
				background: -webkit-gradient(linear, left top, right top, color-stop(0, #4d4d4d), color-stop(.4, #4d4d4d), color-stop(.5, #fff), color-stop(.6, #4d4d4d), color-stop(1, #4d4d4d));
				-webkit-background-clip: text;
				-webkit-text-fill-color: transparent;
				-webkit-animation: slidetounlock 3s infinite;
				-webkit-text-size-adjust: none
			}
			
			.nc-container .nc_scale .nc-align-center.scale_text2 {
				text-align: center;
				text-indent: -42px
			}
			
			@-webkit-keyframes slidetounlock {
				0% {
					background-position: -200px 0
				}
				100% {
					background-position: 200px 0
				}
			}
			
			.nc-container.tb-login .clickCaptcha_text .icon_close {
				line-height: 30px;
				margin-left: 0;
				cursor: default;
				color: #ff3f08;
				font-size: 16px;
				float: left;
				margin-right: 0;
				background: transparent;
				z-index: 3
			}
			
			.nc-container.tb-login {
				position: relative;
				margin-top: 20px;
				display: none;
			}
			
			.nc-container.tb-login .nc_scale {
				width: auto;
			}
			
			.nc-container.tb-login .nc_scale .scale_text2 {
				text-indent: -42px;
				text-align: center;
			}
			
			.nc-container.tb-login .nc_scale .scale_text2 b {
				padding: 0
			}
			
			.nc-container.tb-login .nc_scale.nc_err div.scale_text {
				background: #f79977
			}
			
			.nc-container.tb-login .errloading {
				width: auto
			}
			
			.nc-container.tb-login .imgCaptcha,
			.nc-container.tb-login .clickCaptcha {
				width: 252px;
				*width: 256px;
				border: 0;
				*height: 300px;
				min-height: 300px;
				max-height: inherit !important;
			}
			
			.nc-container.tb-login .imgCaptcha div.login-msg.error,
			.nc-container.tb-login .clickCaptcha div.login-msg.error {
				background: #fff2f2
			}
			
			.nc-container.tb-login .imgCaptcha .captcha-error,
			.nc-container.tb-login .clickCaptcha .captcha-error {
				position: absolute;
				top: 0;
				width: 244px;
				height: auto;
				margin-bottom: 15px;
				padding: 3px;
				border: solid 1px #ff8e8e;
				line-height: 18px
			}
			
			.nc-container.tb-login .imgCaptcha .captcha-inform,
			.nc-container.tb-login .clickCaptcha .captcha-inform {
				font-size: 110%;
				margin-left: 20px
			}
			
			.nc-container.tb-login .imgCaptcha {
				padding-top: 66px;
			}
			
			.nc-container.tb-login .imgCaptcha .imgCaptcha_text {
				width: 100px;
				margin-left: 0;
			}
			
			.nc-container.tb-login .imgCaptcha .imgCaptcha_text input:focus {
				color: #000
			}
			
			.nc-container.tb-login .imgCaptcha .imgCaptcha_img {
				width: 120px;
				_width: 100px
			}
			
			.nc-container.tb-login .imgCaptcha .imgCaptcha_btn {
				width: 100%;
				margin-left: 0
			}
			
			.nc-container.tb-login .imgCaptcha .nc_scale_submit {
				width: 100%;
				height: 36px;
				line-height: 36px;
				margin-top: 20px;
				margin-left: 0;
				border-radius: 3px;
				font-size: 16px;
				font-family: Tahoma, Helvetica, Arial, sans-serif;
				background: #ff3f08
			}
			
			.nc-container.tb-login .clickCaptcha {
				padding-top: 40px;
			}
			
			.nc-container.tb-login .clickCaptcha .clickCaptcha_text {
				text-indent: 4px
			}
			
			.nc-container.tb-login .clickCaptcha .clickCaptcha_img img {
				margin-left: 10px
			}
			
			.nc-container.tb-login .nc_btn_1 {
				top: 77px;
				_top: 57px
			}
			
			.nc-container.tb-login .nc_btn_2 {
				top: 36px
			}
			
			.login .nc-container.tb-login .login-msg p,
			.login-box .nc-container.tb-login .login-msg p {
				width: auto;
				float: left
			}
			
			.nc-container.tb-login.nc-old-login {
				margin: 20px 0 10px 0;
				width: 250px;
			}
			
			.nc-container.tb-login.nc-old-login .nc_wrapper {
				width: 250px
			}
			
			.nc-container.tb-login.nc-old-login .imgCaptcha,
			.nc-container.tb-login.nc-old-login .clickCaptcha {
				width: 250px;
				min-height: auto;
			}
			
			.nc-container.tb-login.nc-old-login .imgCaptcha .captcha-error,
			.nc-container.tb-login.nc-old-login .clickCaptcha .captcha-error {
				line-height: 16px
			}
			
			.nc-container.tb-login.nc-old-login .clickCaptcha {
				padding-top: 28px;
			}
			
			.nc-container.tb-login.nc-old-login .clickCaptcha .clickCaptcha_img img {
				width: 200px;
				height: 200px
			}
			
			.nc-container.nc-old-login.show-click-captcha {
				padding-bottom: 60px
			}
			
			.nc-container.nc-old-login.show-click-captcha.nc-tm-min-fix {
				padding-bottom: 40px
			}
			
			.nc-container.tb-login.nc-tm-min-fix .clickCaptcha {
				max-height: 340px !important
			}
			
			#content .login-box .bd .nc-container.tb-login .login-msg {
				margin: 10px auto 15px auto
			}
			
			#content .login-box .bd .nc-container.tb-login.nc-old-login.show-click-captcha .login-msg {
				margin: 2px 0 0 0
			}
			
			.nc-container .nc_scale .nc-cc {
				display: none;
				position: absolute;
				left: 0;
				top: 35px;
				z-index: 20000;
				width: 360px;
				height: 570px;
				border: 1px solid #5eaef1;
				border-radius: 4px;
				background: #fff;
				font-size: 14px;
				line-height: 18px;
				color: #333;
			}
			
			.nc-container .nc_scale .nc-cc.nc-cc-status-loading .nc-cc-btn,
			.nc-container .nc_scale .nc-cc.nc-cc-status-verifing .nc-cc-btn {
				background-color: #90c1eb
			}
			
			.nc-container .nc_scale .nc-cc.nc-cc-status-loading .nc-cc-btn,
			.nc-container .nc_scale .nc-cc.nc-cc-status-verifing .nc-cc-btn,
			.nc-container .nc_scale .nc-cc.nc-cc-status-loading .nc-cc-refresh,
			.nc-container .nc_scale .nc-cc.nc-cc-status-verifing .nc-cc-refresh {
				cursor: default
			}
			
			.nc-container .nc_scale .nc-cc.nc-cc-status-loading .nc-cc-refresh,
			.nc-container .nc_scale .nc-cc.nc-cc-status-verifing .nc-cc-refresh {
				color: #999
			}
			
			.nc-container .nc_scale .nc-cc a {
				color: #3199f4;
				text-decoration: none
			}
			
			.nc-container .nc_scale .nc-cc .nc_iconfont {
				vertical-align: top;
				margin-right: 8px
			}
			
			.nc-container .nc_scale .nc-cc-btn {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				vertical-align: top;
				letter-spacing: normal;
				word-spacing: normal;
				width: 100px;
				line-height: 30px;
				text-align: center;
				background-color: #3199f4;
				color: #fff;
				border-radius: 4px;
				cursor: pointer;
			}
			
			.nc-container .nc_scale .nc-cc-btn.nc-cc-disabled {
				background-color: #90c1eb;
				cursor: default
			}
			
			.nc-container .nc_scale .nc-cc-btn .nc-lang-cnt {
				line-height: 18px
			}
			
			.nc-container .nc_scale .nc-cc-header {
				padding: 20px 20px 19px 20px;
				height: 100px;
				background: #f4f8fa;
				border-bottom: 1px solid #ccc
			}
			
			.nc-container .nc_scale .nc-cc-img1-box {
				float: left;
				width: 100px;
				height: 100px;
				margin-right: 16px
			}
			
			.nc-container .nc_scale .nc-cc-txt {
				overflow: hidden;
				*zoom: 1;
				line-height: 30px;
				padding-top: 11px
			}
			
			.nc-container .nc_scale .nc-cc-img2-box {
				position: relative;
				padding: 0 20px;
				margin-top: 20px
			}
			
			.nc-container .nc_scale .nc-cc-items {
				position: absolute;
				left: 20px;
				_left: 0;
				top: 0;
				width: 320px;
				overflow: hidden
			}
			
			.nc-container .nc_scale .nc-cc-items-inner {
				margin-right: -20px
			}
			
			.nc-container .nc_scale .nc-cc-item {
				position: relative;
				display: inline-block;
				*display: inline;
				*zoom: 1;
				vertical-align: top;
				letter-spacing: normal;
				word-spacing: normal;
				margin-right: 10px;
				margin-bottom: 10px;
				border: 1px solid #ccc;
				width: 98px;
				height: 98px;
				background: url("//gtms02.alicdn.com/tps/i2/T1ty2QFNNXXXc6Yc2r-1-1.gif");
			}
			
			.nc-container .nc_scale .nc-cc-item:hover {
				border-color: #3199f4
			}
			
			.nc-container .nc_scale .nc-cc-item .nc_iconfont {
				display: none;
				position: absolute;
				right: 0;
				bottom: 0;
				color: #3199f4;
				font-size: 22px;
				margin-right: 0
			}
			
			.nc-container .nc_scale .nc-cc-item.nc-cc-selected .nc_iconfont {
				display: block
			}
			
			.nc-container .nc_scale .nc-cc-tip {
				display: none;
				position: absolute;
				left: 0;
				bottom: 60px;
				width: 360px;
				line-height: 18px;
				text-align: center;
				color: #eb4f38;
			}
			
			.nc-container .nc_scale .nc-cc-tip span {
				line-height: normal
			}
			
			.nc-container .nc_scale .nc-cc-footer {
				position: absolute;
				left: 0;
				bottom: 20px;
				width: 360px;
				height: 30px;
				line-height: 30px;
				text-align: center;
			}
			
			.nc-container .nc_scale .nc-cc-footer .nc_iconfont {
				color: #c4cbd0
			}
			
			.nc-container .nc_scale .nc-cc-refresh,
			.nc-container .nc_scale .nc-cc-wait {
				position: absolute;
				left: 20px;
				top: 0;
				color: #3199f4;
				cursor: pointer
			}
			
			.nc-container .nc_scale .nc-cc-wait {
				display: none
			}
			
			.nc-container .nc_scale .nc-cc-cancel {
				position: absolute;
				right: 20px;
				top: 0;
				color: #3199f4;
				cursor: pointer;
			}
			
			.nc-container .nc_scale .nc-cc-cancel .nc_iconfont {
				position: relative;
				top: -1px
			}
			
			.nc-container .nc_scale .nc-cc-loading {
				margin-top: 247px;
				text-align: center;
				line-height: 14px
			}
			
			.nc-container .nc_scale .nc-cc-loading-img {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				vertical-align: top;
				letter-spacing: normal;
				word-spacing: normal;
				vertical-align: middle;
				background: url("//img.alicdn.com/tps/TB1OdxsKpXXXXcgXFXXXXXXXXXX-14-14.gif") no-repeat;
				width: 14px;
				height: 14px;
				position: relative;
				top: -1px;
				margin-right: 9px
			}
			
			.nc-container .nc_scale .nc-cc-fail {
				position: absolute;
				left: 50%;
				top: 50%;
				width: 320px;
				height: 180px;
				margin-left: -160px;
				margin-top: -90px;
				background: #fff;
				border-radius: 4px
			}
			
			.nc-container .nc_scale .nc-cc-fail-inner {
				text-align: center;
				padding: 55px 10px 10px
			}
			
			.nc-container .nc_scale .nc-cc-fail-action {
				margin: 28px 0 18px;
			}
			
			.nc-container .nc_scale .nc-cc-fail-action a {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				vertical-align: top;
				letter-spacing: normal;
				word-spacing: normal;
				line-height: 30px;
				margin-left: 16px
			}
			
			.nc-container .nc_scale .nc-cc-contact {
				text-align: right;
				color: #666;
				padding-right: 9px
			}
			
			.nc-container .nc_scale .nc-cc-mask {
				display: none;
				position: absolute;
				left: 0;
				top: 0;
				width: 360px;
				height: 570px;
				background: rgba(0, 0, 0, 0.3);
				filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#4C000000', endColorstr='#4C000000');
			}
			
			:root .nc-container .nc_scale .nc-cc-mask {
				-webkit-filter: none;
				filter: none
			}
			
			.nc-container .nc_scale .nc-cc-arrow-1,
			.nc-container .nc_scale .nc-cc-arrow-2 {
				display: none;
				position: absolute;
				top: 340px;
				border: solid transparent;
				height: 0;
				width: 0
			}
			
			.nc-container .nc_scale .nc-cc-arrow-1 {
				border-width: 16px;
				margin-top: -1px
			}
			
			.nc-container .nc_scale .nc-cc-arrow-2 {
				border-width: 15px
			}
			
			.nc-container .nc_scale .nc-cc-right .nc-cc-arrow-1,
			.nc-container .nc_scale .nc-cc-left .nc-cc-arrow-1,
			.nc-container .nc_scale .nc-cc-right .nc-cc-arrow-2,
			.nc-container .nc_scale .nc-cc-left .nc-cc-arrow-2 {
				display: block;
				_display: none
			}
			
			.nc-container .nc_scale .nc-cc-right {
				left: 180px;
				top: -339px;
			}
			
			.nc-container .nc_scale .nc-cc-right .nc-cc-arrow-1 {
				border-right-color: #5eaef1;
				left: -32px
			}
			
			.nc-container .nc_scale .nc-cc-right .nc-cc-arrow-2 {
				border-right-color: #fff;
				left: -30px
			}
			
			.nc-container .nc_scale .nc-cc-left {
				left: -335px;
				top: -339px;
			}
			
			.nc-container .nc_scale .nc-cc-left .nc-cc-arrow-1 {
				border-left-color: #5eaef1;
				right: -32px
			}
			
			.nc-container .nc_scale .nc-cc-left .nc-cc-arrow-2 {
				border-left-color: #fff;
				right: -30px
			}
		</style>
	</head>

	<body>
<jsp:include page="top.jsp"></jsp:include>
		<div class="position w1000 auto">
			您当前所在的位置：
			<a href="https://www.tuandai.com/">团贷网</a> &gt;
			<a href="https://www.tuandai.com/pages/invest/invest_list">我要投资</a>
			&gt; 借款详情
		</div>
		<div class="bid_invest_inf clearfloat">
			<div class="bid_inf_content clearfloat">
				<div class="bid_inf_main">
					<div class="bid-info-title">
						<div class="l">
							<i class="tao-biao icon zhuan"></i>
							<i class="tao-biao icon bao"></i>
						</div>
						<div class="bid_inf_title l">
							<a style="text-decoration: none;" id="SubscribeId" title="${Titem.tititle }">${Titem.tititle }</a>
						</div>
						<div class="time " style="display:none">
							剩余时间： <span id="timeSet" style="color: #999;" enddate="2018-10-15T23:59:59" startdate="Mon Oct 15 21:29:35 CST 2018" serverdate="Mon Oct 15 21:29:35 CST 2018">
								<span id="day">00</span> 天 <span id="hour">00</span> 时 <span id="mini">00</span> 分 <span id="sec">00</span> 秒</span>
						</div>
					</div>
					<div class="bid_inf_line"></div>
					<ul class="bid-amount-wrap">
						<li class="l bid-amount-col bid-amount-col-1">
							<div  name="userinfo"  hidden="hidden">${Titem.userid }</div>
							<div class="g9 mb5">转让总额</div>
							<div class="c_484848"><b class="c_ff7506">${Titem.timoney }</b>元</div>
						</li>
						<li class="l bid-amount-col bid-amount-col-2">
							<div class="g9 rel mb5 showtips-box">预期年化利率
								<span class="lv-we-showtips-box">
								<span class="lv-we-showtips lv-showtips-prom" style="display: none;">
								本平台所有项目预期年化利率是在参考同类型项目历史数据得出，并不代表实际收益，市场有风险，投资需谨慎。
								<i class="lv-arrow-tip"></i>
								</span>
								</span>
							</div>
							<div class="c_484848"><b class="c_ff7506">${Titem.tiinterest }</b>%</div>
						</li>
						<li class="l bid-amount-col bid-amount-col-3">
							<div class="g9 mb5">剩余期限</div>
							<div class="c_484848"><b class="c_ff7506">${Titem.tireperiod }</b>天(<span><fmt:formatNumber type="number" value="${Titem.tireperiod/29 }" maxFractionDigits="0"/></span><span>期)</span></div>
						</li>
					</ul>
					<ul class="bid-infom-wrap mt5">
						<li class="bid-infom-col-1">
							<span class="g9">起投金额：<span class="text-333">${Titem.tistmoney }</span>元</span>
						</li>
						<li class="bid-infom-col-2">
							<span class="c_999">剩余金额：<span class="text-333" id="residualAmount" attrjin="${Titem.tisurmoney }">${Titem.tisurmoney }元</span>
							<dl class="bid_progress_bar inline-block-debug ml5">
								<dd>
									<div class="rate-bg1">
										<div class="rate-bg2" style="width: 0.0%;">
										</div>
									</div>
								</dd>
								<dt class="fz12">0.0%</dt>
							</dl>
							</span>
						</li>
						<li class="bid-infom-col-1">
							<span class="g9">还款方式：<span class="text-333"><c:if test="${Titem.tiremethod==1 }">每月付息</c:if><c:if test="${Titem.tiremethod==2 }">到期还款</c:if></span></span>
						</li>
						<li class="bid-infom-col-2">
							<span class="g9">投资人条件：</span>风险承受能力“<c:if test="${Titem.tiincondition==1 }">保守型</c:if><c:if test="${Titem.tiincondition==2 }">稳健型</c:if><c:if test="${Titem.tiincondition==3 }">积极型</c:if>”及以上
						</li>
					</ul>

					<!--             分开                            -->
					<div class="primitive-det">
						<h3>原始项目详情</h3>
						<div class="primitive-det-cn clearfloat">
							<p class="fl_l text1">
								<span>年化利率：<span class="text-333">11.00%</span></span>
							</p>
							<p class="fl_l text2">
								<span>期限：<span class="text-333">12个月</span></span>
							</p>
							<p class="fl_l text3">
								<span> 借款总额：<span class="text-333">20.00万</span></span>
							</p>
							<a href="https://www.tuandai.com/pages/invest/zqzrOriginDetail.aspx?&amp;id=E852EDED-B96E-45DC-9926-DE30B1FEEF6A" target="_blank" class="fl_r text-yellow">查看详情&gt;</a>
						</div>
					</div>
				</div>
			</div>
			<div class="bid_inf_right" style="height: auto;">
				<!-- <div id="recharge-art" style="height: auto;">
					<div class="right">
						<p>
							可用余额：
							<span style="color: #a3a3a3">登录后可显示余额</span>
						</p>
						<a href="javascript:fnLogin();" class="charge">确认投资</a>
						<p>
							我可申购：<span class="font-000"></span>
						</p>
						<p>
							申购金额：<span class="font-orange font-bold" id="payamount">0.00</span><span style="color: #ff7800 !important; font-weight: bold !important;">元</span>
						</p>
						<p>
							预期收益：<span class="font-orange font-bold" id="profit">0.00</span><span style="color: #ff7800 !important; font-weight: bold !important;">元</span>
						</p>
						<div class="invent-form">
							<div class="form-box">
								<input id="jiek_Share" value="1" type="text" class="input-text" maxshares="0.00">元
							</div>
							<i class="top" id="jiek_plus"></i><i class="bottom" id="jiek_minus"></i>
							<a id="MaxInvest" href="javascript:void(0);" onclick="MaxInvest()">全额</a>
						</div>
						<div class="money-errmes">
							输入金额只能为起投金额的整数倍，已为您自动调整
						</div>
						<a href="javascript:void(0);" id="btnSubscribe" zqzrid="1" class="invent-btn invent-btn-1" attrid="E702EB95-66F6-41C4-A350-E0FB0674F3EB" istran="true">确认投资</a>
						<div class="agreement">
							<label><input id="ckbAgree" type="checkbox" checked="checked">我已阅读并同意</label>
							<a class="text-yellow" href="https://contract.tuandai.com/P2P/Web/ContractZqzr.html" target="_blank">《债权转让协议》</a>
							<a class="text-yellow" href="https://contract.tuandai.com/P2P/Web/RiskWarningContract.html" target="_blank">《风险揭示书》</a>
						</div>
					</div>
				</div> -->
			 <!--  <div id="recharge-art" style="height: auto;">
					<div class="right">
						<a href="javascript:;" onclick="checkRecharge();" class="charge recharge-flag">去充值</a>
						<p>
							可用余额：<span class="font-000">0</span>
						</p>
						<p>
							我可承接：<span class="font-000">0.00</span>
						</p>
						<p>
							承接金额：<span class="font-orange font-bold" id="payamount">0.00</span><span style="color: #ff7800 !important; font-weight: bold !important;">元</span>
						</p>
						<p>
							预期收益：<span class="font-orange font-bold" id="profit">0.00</span><span style="color: #ff7800 !important; font-weight: bold !important;">元</span>
						</p>
						<div class="invent-form">
							<div class="form-box">
								<input id="jiek_Share" value="1" type="text" class="input-text" maxshares="0.00">元
							</div>
							<i class="top" id="jiek_plus"></i><i class="bottom" id="jiek_minus"></i>
							<a id="MaxInvest" href="javascript:void(0);" onclick="MaxInvest()">全额</a>
						</div>
						<div class="money-errmes">
							输入金额只能为最低承接的整数倍，已为您自动调整
						</div>
						<a href="javascript:void(0);" id="btnSubscribe" zqzrid="1" class="invent-btn invent-btn-1" attrid="E711BFC4-923D-4320-98E9-F9019E297064" istran="true">确认承接</a>
						<div class="agreement">
							<label><input id="ckbAgree" type="checkbox" checked="checked">我已阅读并同意</label>
							<a class="text-yellow" href="//contract.tuandai.com/P2P/Web/ContractZqzr.html" target="_blank">《债权转让协议》</a>
							<a class="text-yellow" href="//contract.tuandai.com/P2P/Web/RiskWarningContract.html" target="_blank">《风险揭示书》</a>
						</div>
					</div>
				</div>   -->
				
				
			</div>
		</div>
		<div class="bid_invest_nav" style="position: static;">
			<ul>
				<li>
					<a class="n1 bid_nav bid_nav2 n1-selected" onclick="getTager(a1);" href="javascript:;">项目介绍</a>
				</li>
				<li>
					<a class="n2 bid_nav bid_nav2" onclick="getTager(a2);" href="javascript:;">转让人信息
					</a>
				</li>
				<li>
					<a class="n3 bid_nav bid_nav2" onclick="getTager(a3);" href="javascript:;">转让记录</a>
				</li>
				<li>
					<a class="n4 bid_nav bid_nav2" onclick="getTager(a4);" href="javascript:;">常见问题</a>
				</li>
			</ul>
		</div>
		<div class="bid_ensure_box clearfloat a1" id="a1" name="a1" style="margin-top: 0px;">
			<dl class="clearfloat">
				<dt class=""></dt>
				<dd class="clearfloat">
					<h4>债权转让介绍</h4>
					<p>
						${Titem.tintroduce.indescribe }
					</p>
				</dd>
			</dl>
			<dl class="clearfloat">
				<dt class=""></dt>
				<dd>
					<h4>资金用途</h4>
					<p>
						${Titem.tintroduce.tistmoney }
					</p>
				</dd>
			</dl>
			<dl class="clearfloat">
				<dt class=""></dt>
				<dd>
					<h4>风险评估</h4>
					<p>
						${Titem.tintroduce.tisurmoney }
					</p>
				</dd>
			</dl>
			<dl class="clearfloat">
				<dt class="ensure_t02"></dt>
				<dd>
					<h4>还款保障措施：</h4>
					<p>
						${Titem.tintroduce.tireperiod }
					</p>
				</dd>
			</dl>
			<dl class="clearfloat" style=" margin: 0;">
				<dt class=""></dt>
				<dd class="clearfloat">
					<h4>风险告知</h4>
					<p>${Titem.tintroduce.tiinterest }
						<a href="https://contract.tuandai.com/P2P/Web/RiskWarningContract.html" style="color: #ffb700;" target="_blank">《风险揭示书》</a>
					</p>
				</dd>
			</dl>
		</div>
		<div class="bid_invest_main clearfloat a2" id="a2" name="a2">
			<!-- <div class="staging_info_box clearfloat">
				<h3>基本信息</h3>
				<ul class="staging_blist clearfloat">
					<li id="nickName">昵称：****xin</li>
					<li id="age">年<span style="padding-left: 28px;"></span>龄：34</li>
					<li id="telNo">手机号：186****8102</li>
					<li id="sex">性别：女</li>
					<li id="registerDate">注册时间：2015-03-06</li>
					<li id="bankCity">所在地：上海市</li>
				</ul>
			</div>
			<div class="staging_info_box clearfloat">
			<h3>审核信息</h3>
				<div class="staging_certifia clearfloat">
					<p class="staging_verify01"><span></span><i>身份认证</i></p>
					<p class="staging_verify02"><span></span><i>手机认证</i></p>
					<p class="staging_verify05"><span></span><i>实地认证</i></p>
					<p class="staging_verify03"><span></span><i>邮箱认证</i></p>
				</div>
			</div> -->
		</div>
		<div class="bid_invest_main clearfloat a3" id="a3" name="a3">
			<table width="100%" align="center" class="bid_records">
				<tbody>
					<tr id="Subscribelist">
						<th>序号
						</th>
						<th>承接人
						</th>
						<th>起投金额
						</th>
						<th>承接总额
						</th>
						<th>承接时年化率
						</th>
						<th>投标方式
						</th>
						<th>投标时间
						</th>
					</tr>

					<tr>
						<td>1</td>
						<td>155****7955</td>
						<td>￥99.83</td>
						<td>
							<div style="color:#f60;">￥199.67</div>
						</td>
						<td>12.77%</td>
						<td><img style="width:48px; height:19px;" alt="" src="../images/auto_0.png"></td>
						<td>2018/11/06 06:25:14</td>
					</tr>

				</tbody>
			</table>
			<div id="divPagination" totalcount="=10"></div>
		</div>
		<div class="bid_content_box a4" id="a4" name="a4">
			<div class="bid_morequetion">
				<h3>常见问题</h3>
				<dl class="bid_quetionSmall clearfloat">
					<dt>1、什么样的债权可以转让？</dt>
					<dd>投资团贷网项目和微团贷并持有债权超过1个月即可进行转让。债权转让发布还受平台其他产品状态的限制，以下状态下不允许转让债权：<br> A.发债权转让时，该转让标处于逾期状态时不允许转让，若转让时没有处于逾期，但在转让中时债权变为逾期状态，系统将会把债权停止转让。
						<br> B.单个债权能分拆进行债权转让，但是不能同时分拆成多笔转让。
					</dd>
				</dl>
				<dl class="bid_quetionSmall clearfloat">
					<dt>2、转让的债权标的有效期多久？</dt>
					<dd>债权标的一个自然日内有效，当天24:00前未成功转让部分，会由系统自动下线。<br> 案例：A君2月2日上午10点时发布债权转让标的，若2月2日24点前有部分债权未转让成功，则24点时系统会自动下线该标的。
					</dd>
				</dl>
				<dl class="bid_quetionSmall clearfloat">
					<dt>3、购买的债权还可以再次转让吗？</dt>
					<dd>可以，购买债权并持有债权超过1个月即可进行再次转让。</dd>
				</dl>
				<dl class="bid_quetionSmall clearfloat">
					<dt>4、债权转让保障方式怎么样？</dt>
					<dd>债权转让适用于第三方担保公司担保。 此外债权转让的标的其他担保保障等与原项目完全相同。</dd>
				</dl>
				<dl class="bid_quetionSmall clearfloat">
					<dt>5、债权转让的预期年化利率怎么计算？</dt>
					<dd>债权转让的预期年化利率计算公式如下：<br> [待收收益+(本金-本金折让后价格)]/（未结算利息+本金折让后价格) /剩余天数*365*100%；<br> 案例：A君投资了一个期限为6个月，预期年化利率为20%，还款方式为到期本息的标的1000元，持有173天后进行债权转让。此时，剩余的期限是11天，转让时选择原价全额转让，则此时的预期年化利率计算如下： (1000元*11天/365天*20%+0)/(1000元*173天/365天*20%+1000)/11天*365天*100%=18.26% （具体年化率利率与小数点精确的位数有关，有可能显示上稍有误差）
					</dd>
				</dl>
				<dl class="bid_quetionSmall clearfloat">
					<dt>6、为什么转让出来的利率有时候比原项目少，有时候比原项目多？</dt>
					<dd>因为承接者承接时所支付的本金是含有先垫付利息部分，所以若债权转让者原价转让时，理论上承接者的利率是低于原有利率的。实际上，承接者所垫付的利息在下一期就会原价归还，所以实际预期年化利率是与原项目一样的。此外，若债权转让者以低于原价的价格转让时，承接者的利率就会高于原有项目的利率。</dd>
				</dl>
				<dl class="bid_quetionSmall clearfloat">
					<dt>7、债权转让服务费怎么收取？</dt>
					<dd>债权转让服务费=转让总额*0.5%，该服务费每成功交易一笔则即时收取，债权转让服务费由发起人支付。</dd>
				</dl>
				<dl class="bid_quetionSmall clearfloat">
					<dt> 8、承接债权转让标有什么规则吗？</dt>
					<dd>用户第一次承接单个转让标时，需要校验短信验证码才能完成承接；短信验证码校验成功后，如再次承接该转让标时无需校验短信验证码即可完成承接。每个账号承接债权转让标时每天最多可获取8条短信验证码；短信验证码60s内不支持重发。</dd>
				</dl>
			</div>
		</div>
		
		<!-- 点击确认承接 -->
		 <div style="display: none;" class="dial-window investorAlert" id="confirm">
			<div class="title rel">温馨提示：<i class="close-x cgt-close-x icon db abs"></i></div>
			<div class="body">
				<div class="" style="text-align: center;">
					<p>该项目投资人条件为<span class="risktypes"><c:if test="${Titem.tiincondition==1 }">保守型</c:if><c:if test="${Titem.tiincondition==2 }">稳健型</c:if><c:if test="${Titem.tiincondition==3 }">积极型</c:if></span>，高于您<br>【<span class="myrisktype">保守型</span>】风险承受能力</p>
				</div>
			</div>
			<div class="bottom">
				<div class="btn-group">
					<a href="javascript:void(0);" id="investorCancel" class="btn gray-btn">放弃</a>
					<a href="javascript:void(0);" id="investorGo" class="btn">继续投资</a>
				</div>
			</div>
		</div>
		
		
		<div style="display: none;" class="dial-window xm-window passwordAlt vipAlter">
			<div class="title1 rel">团贷网提醒您<i class="close-x cgt-close-x icon db abs"></i></div>
			<div class="body" style="width:400px;padding: 35px 0px 0px;">
				<div class=" tc g3 f20" style="color: #f00;">
					抱歉，您暂时未符合申请资格！
				</div>
				<div class=" tc mt20 g3 f16">
					本项目承接人的团贷网会员等级须达到V3等级。
				</div>
			</div>
			<div class="bottom">
				<div class="btn-group">
					<a href="javascript:void(0);" class="cgt-close-x btn w120 f14">我知道了</a>
				</div>
			</div>
		</div>
		<div id="zxNeedRepayAlter" style="display:none;" class="dial-window xm-window passwordAlt">
			<div class="title1 rel">团贷网提醒您<i class="close-x cgt-close-x icon db abs"></i></div>
			<div class="body" style="width:400px;padding: 35px 0px 0px;">
				<div class="tc mt20 g3 f16">
					您需结清当日待结清的智享后，才能正常承接债权
				</div>
			</div>
			<div class="bottom">
				<div class="btn-group">
					<a href="javascript:void(0);" class="cgt-close-x btn w120 f14">我知道了</a>
				</div>
			</div>
		</div>
		<div class="tdw-footer">
			<div class="wth-1200 tdw-footer-container">
				<div class="tdw-footer-t">
					<div class="l col1">
						<dl>
							<dt>新手帮助</dt>
							<dd>
								<a rel="nofollow" href="https://hd.tuandai.com/web/newhand/welfare.aspx">新手指引</a>
							</dd>
							<dd>
								<a rel="nofollow" href="https://info.tuandai.com/help/index.html">帮助中心</a>
							</dd>
							<dd>
								<a rel="nofollow" href="https://info.tuandai.com/help/list.html?mark=70">资费介绍</a>
							</dd>
						</dl>
						<dl>
							<dt>保障体系</dt>
							<dd>
								<a rel="nofollow" href="https://info.tuandai.com/about/laws.html?mark=26">法律法规</a>
							</dd>
							<dd>
								<a rel="nofollow" href="https://info.tuandai.com/about/guarantee.html?mark=1">保障体系</a>
							</dd>
							<dd>
								<a rel="nofollow" href="https://info.tuandai.com/about/partners.html?mark=24">合作机构</a>
							</dd>
						</dl>
						<dl>
							<dt>如何投资</dt>
							<dd>
								<a target="_blank" href="https://www.tuandai.com/article/">投资资讯</a>
							</dd>
							<dd>
								<a target="_blank" href="http://ask.tuandai.com/">团贷问答
								</a>
							</dd>
							<dd>
								<a target="_blank" href="http://baike.tuandai.com/">团贷百科
								</a>
							</dd>
						</dl>
					</div>
					<div class="l col2">
						<div class="app-code">
							<p>手机APP下载</p>
						</div>
						<div class="wechat-code">
							<p>微信服务号</p>
						</div>
						<div class="service-code">
							<p>微信订阅号</p>
						</div>
					</div>
					<div class="r col3">
						<strong>1010-1218</strong>
						<p>客服电话：（服务时间：9:00-22:00）</p>
						<div class="rel">
							<div class="r rel emailbox-wrap">
								<a class="rel emailbox" href="javascript:;"><span class="btn-text">投诉与建议</span></a>
								<div class="abs email-tips">
									<i class="abs tdw-icons i-tips-arrow1"></i>
									<p class="text-333">客服邮箱</p>
									<p>kefu@tuandai.com</p>
								</div>
							</div>
							<a class="r rel custombox" href="http://www.sobot.com/chat/pc/index.html?sysNum=20ab7dce1e3346e8b90b649bd8baf591" target="_blank" title="在线服务" rel="nofollow">
								<span class="btn-text">在线客服</span></a>
						</div>
					</div>
				</div>
				<div class="tdw-footer-supervise">
					<a class="super-img1" rel="external nofollow" href="http://www.miibeian.gov.cn/" target="_blank"></a>
					<a class="super-img2" rel="external nofollow" href="http://www.gddg110.gov.cn/publicfiles/business/htmlfiles/dgjch/index.htm" target="_blank"></a>
					<a class="super-img3" rel="external nofollow" href="https://v.pinpaibao.com.cn/cert/site/?site=www.tuandai.com&amp;at=realname" target="_blank"></a>
					<a class="super-img4" rel="external nofollow" href="https://ss.knet.cn/verifyseal.dll?sn=e12110944190036882000000&amp;ct=df&amp;a=1&amp;pa=0.6580442255885031" target="_blank"></a>
					<a class="super-img5" rel="external nofollow" href="http://www.itrust.org.cn/home/index/itrust_certifi/wm/PJ2018020102" target="_blank"></a>
					<a class="super-img6" rel="external nofollow" id="___szfw_logo___" href="https://credit.szfw.org/CX20180307037573561533.html" target="_blank"></a>
					<a class="super-img8" rel="external nofollow" id="_pingansec_bottomimagesmall_p2p" target="_blank" href="http://si.trustutn.org/info?sn=260150522000147261072"></a>
					<a class="super-img9" target="_blank" href="http://wljg.gdgs.gov.cn/corpsrch.aspx?key=441900002895462" alt="企业名称：东莞团贷网互联网科技服务有限公司法定代表人：唐军标识状态：已激活 粤工商备P191608002336"></a>
				</div>
				<div class="footer-content auto fix cl">
					<div class="address fa f12 tc mt15">
						2010-<span>2018</span> 版权所有 © 团贷网
						<a href="http://www.miibeian.gov.cn/" target="_blank" rel="nofollow">粤ICP备12043601号-1</a> 粤公安网备44190002000538号 东莞团贷网互联网科技服务有限公司
						<br>地址：东莞市南城街道莞太路111号民间金融大厦1号楼28楼
					</div>
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
					<a href="javascript:;" onclick="" target="_blank">
						<i class="tdw-icons i-tool-service"></i>
						<p>在线<br>客服</p>
					</a>
				</li>
				<li>
					<a href="javascript:;" onclick="">
						<i class="tdw-icons i-tool-help"></i>
						<p>帮助<br>中心</p>
					</a>
				</li>
				<li>
					<a href="javascript:;" onclick="">
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
		
		<!-- 继续承接  -->
		<div id="td-art" style="display:none" class="z101">
			<div class="art-body">
				<i class="close icons close-x icon abs" style="top: -30px; right: -32px;"></i>
				<div id="recharge-art" class="recharge-art">
					<div class="left" style="height: 301px;">
						<p id="art_UserName"></p>
						<p id="art_ProjectAmount"></p>
						<p id="art_ReTime"></p>
						<p id="art_Rate"></p>
						<p id="txtLowerUnit"></p>
						<p id="art_ReType"></p>
						<div class="reward" id="art_PublicRate" style="display: none;">
							<p>
								<i class="i-1"></i>发标人投标奖励【无】
							</p>
							<p class="padding-bottom-0">
								<i class="i-2"></i>团贷网投标奖励【无】
							</p>
						</div>
					</div>
					<div class="right">
						<a rel="nofollow" href="javascript:;" onclick="checkRecharge();" class="charge recharge-flag">去充值</a>
						<p>
							<!--  可用余额：<span class="font-000" id="art_UserFund">0元</span>  -->
							可用余额：<span class="font-000" id="art_UserFund"></span>
						</p>
						 <p id="txtMaxUnit1">我可承接：<span class="font-000" id="txtMaxUnit"></span>元</p>
						<p>
							<span id="txtInvestAmountWord">承接金额</span>：<span class="font-orange font-bold" id="txtInvestAmount">0.00</span><span class="font-orange font-bold">元</span>
						</p>
						<p id="p_Expected">
							预期收益：<span class="font-orange font-bold" id="txtExpected">0.00</span><span class="font-orange font-bold">元</span>
							<span id="spPrizeInterest" style="display:none;"><b class="font-orange font-bold">+</b><span class="hongbao-jx font-orange font-bold">0.00</span>元</span>
						</p>
						<div class="invent-form">
							<div class="form-box">
								<input type="text" class="input-text autoinput" id="txtUnit" placeholder="0" maxlength="10" onkeyup="check(this.value)" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false" data-input="true">元
							</div>
							<i class="top" id="btnPlus" attrid="0" rewardamount="0"></i><i class="bottom" id="btnMinus"></i>
							<a href="javascript:void(0)" id="AllInvest">全额</a>
						</div>
						<div class="invent-form" style="margin-top: 15px; margin-bottom: 35px; height: 16px; line-height: 16px; display: none;" id="dCode">
							<input type="text" placeholder="请输入手机验证码" id="MobileCode" style="height: 33px; line-height: 33px; padding-left: 12px; border: 1px solid #d5d5d5; width: 195px; border-radius: 3px; -webkie-border-radius: 3px;">
							<a href="javascript:void(0)" id="GetCode">发送验证码</a>
						</div>
						<div id="redpackform">
							<div class="noselect-redbox"><span>无优惠券可用</span></div>
						</div>
						<div id="jd-ecard" style="display: none">
							<div class="jd-ecard-box">
								<div class="jd-ecard-tit">
									<span class="tdw-icons ecard-icon"></span>
									<span class="ecard-value" id="ecardValue"></span>
									<i class="arrow"></i>
								</div>
								<ul>
								</ul>
							</div>
						</div>
						<div class="money-errmes">输入金额只能为最低承接的整数倍，已为您自动调整</div>
						<a target="_blank" class="invent-btn" id="PostData" style="cursor:pointer;" projectid="60D002A3-04A5-479A-AF91-DDC788F00B02" attr_expected="0" attr_commission="0">确认承接</a>
						<input type="hidden" id="hiDeadline" value="401">
						<input type="hidden" id="hiInterestRate" value="12.77">
						<input type="hidden" id="hiRepaymentType" value="2">
						<input type="hidden" id="hiProjectType" value="34">
						<input type="hidden" id="hiUnit" value="99.9657">
						<input type="hidden" id="txtPublicRate" value="0">
						<input type="hidden" id="txtTuandaiRate" value="0">
						<input type="hidden" id="hiNeedPassWord" value="true">
						<input type="hidden" id="hiTotalInvest ">
						<input type="hidden" id="hiCanGetPackage ">
						<input type="hidden" id="hiNeedInvest ">
						<input type="hidden" id="hiIsNewUser ">
						<input type="hidden" id="hiIsAwardOverdue ">
						<input type="hidden" id="hiAreaInvest ">
						<input type="hidden" id="hiIsScribeTanfer" value="true">
						<input type="hidden" id="hiProjectDeadline" value="401">
						<input type="hidden" id="hiNewHandRate" value="">
						<input type="hidden" id="hiHQBAmount" value="">
						<input type="hidden" id="hiDeadType" value="">
						<div class="agreement f12  font-666" id="AgreeDiv"><label><input type="checkbox" id="ckbInvestAgree" checked="checked">我已阅读并同意</label>
							<a class="font-orange" href="//contract.tuandai.com/P2P/Web/ContractZqzr.html" target="_blank">《债权转让协议》</a>
							<a class="font-orange" href="//contract.tuandai.com/P2P/Web/RiskWarningContract.html" target="_blank">《风险揭示书》</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
			<!-- <div class="title">
				团贷网提醒您 <i class="close close-x icon abs"></i>
			</div>
			<div class="body">
				<img src="../images/loading.gif" alt="加载中">
			</div>
			<div id="dial-window-btns" class="btns tc">
				<a href="javascript:void(0)" class="td-btn-1 td-btn-1-or dete " id="dial-window-okbtn">确定</a>
				<a href="javascript:void(0)" class="td-btn-1 td-btn-1-gar  cancle " id="dial-window-canclebtn">取消</a>
			</div> -->
			
		<!-- 未选在金额提示 -->
			<div id="dial-window" style="display: none;" class="z103">
				<div class="title">团贷网提醒您<i class="close icons close-y ico ab" onclick="colosenewWindow()"></i></div>
				<div class="body">
					<div style="color:gray;line-height:21px;">您的可用资金不足，请充值!</div>
				</div>
				<div id="dial-window-btns" class="btns tc" style="display: block;">
					<a href="javascript:void(0)" class="td-btn-1 td-btn-1-or dete " id="dial-window-okbtn" style="display: none;">确定</a>
					<a href="javascript:void(0)" class="td-btn-1 td-btn-1-gar  cancle " id="dial-window-canclebtn" style="display: none;">取消</a>
				</div>
			</div>
		<a id="tt_link" style="display: none;">bank</a>
		
		<!-- 遮挡层 -->
		<div id="diallayer" style="display: none;"></div>
		
		<div class="stop-taking stop-dialog" id="funcStopService" style="display: none;z-index: 9999999">
			<div id="guan"></div>
			<h2><b class="b1"></b><span class="stop-title">团贷网系统升级公告</span><b class="b2"></b></h2>
			<div class="stop-text" id="funcStopCentent"></div>
			<div class="knob">我知道了</div>
		</div>
		<div id="bankBindAlert" style="display: none; margin-left: -220px;" class="dial-window xm-window bankBindAlert">
			<div class="title rel">温馨提示：
				<a href="https://www.tuandai.com/member/account_default.aspx"><i class="close-x cgt-close-x icon db abs"></i></a>
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
					<a href="https://www.tuandai.com/member/account_default.aspx" id="remind_aa" class="btn">
						<span id="aa_title">绑卡成功</span>
					</a>
				</div>
				<a class="question" href="http://info.tuandai.com/help/index.html" target="_blank">
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
				<a href="https://www.tuandai.com/member/Bank/XM_BankBind.aspx" id="aOpen" class="btn" target="_blank">马上升级</a>
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
								<a target="blank" href="tencent://message/?uin=2880761023&amp;Site=%E4%B8%80%E5%B8%90%E9%80%9A&amp;Menu=yes">
									<span class="qq-bg">
<i class="qq-icon"></i>2880761023</span>
								</a> 为好友。</p>
							<p style="line-height:23px">2、QQ联系客服专员，提交以下申请材料：手持港澳台通行证证件彩色半身照【保证证件号码清晰且
								<br>不能是镜面照】港澳台通行证背面彩色照片,受理时间为：工作日8:30-12:00 13:30-18:00。</p>
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
								<a target="blank" href="tencent://message/?uin=2880761023&amp;Site=%E4%B8%80%E5%B8%90%E9%80%9A&amp;Menu=yes">
									<span class="qq-bg">
<i class="qq-icon"></i>2880761023</span>
								</a>　进行资料核实及修改。</p>
							<a class="td-btn-1 td-btn-1-or btn  cgt-close-x" href="javascript:;">我知道了</a>
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
								<a target="blank" href="tencent://message/?uin=2880761023&amp;Site=%E4%B8%80%E5%B8%90%E9%80%9A&amp;Menu=yes">
									<span class="qq-bg"><i class="qq-icon"></i>2880761023</span>
								</a> 为好友。</p>
							<p style="line-height:23px">2、QQ联系客服专员，提交以下申请材料：手持<span class="bankCheckFaile-tip2">港澳台通行证</span>证件彩色半身照【保证证件号码清晰且
								<br>不能是镜面照】<span class="bankCheckFaile-tip2">港澳台通行证</span>背面彩色照片,受理时间为：工作日8:30-12:00 13:30-18:00</p>
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
		<div id="chongzhiother" style="display: none;" class="dial-window xm-window layer-win">
			<div class="title1 rel">温馨提示：
				<i class="close-x cgt-close-x icon db abs"></i>
			</div>
			<div class="body cgt-box g6">
				<div class=" pl20 mt10">
					<div id="body_dv_bottom" class="bottom">
						<div id="btn_01" class="count tl " style="display:block; line-height:30px;">
							<p class="  ff7301 pb30 mb10">注意：由于您填写的预留手机号与银行预留手机号不符，您暂时不能进行快捷充值操作，请及时到"我的账户—安全中心"进行修改。</p>
							<a id="chongzhiotherbtn" target="_blank" class="td-btn-1 td-btn-1-or btn" href="javascript:;">我要修改预留手机号</a>
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
							<a class="td-btn-1 td-btn-1-or btn cgt-close-x" href="javascript:;">立即关闭</a>
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
		

		<div id="waf_nc_block" style="display: none;">
			<div class="waf-nc-mask"></div>
			<div id="WAF_NC_WRAPPER" class="waf-nc-wrapper"><img class="waf-nc-icon" src="../images/TB1_3FrKVXXXXbdXXXXXXXXXXXX-129-128.png" alt="" height="20" width="20">
				<p class="waf-nc-title">安全验证</p>
				<div class="waf-nc-splitter"></div>
				<p class="waf-nc-description">请完成以下验证后继续操作：</p>
				<div id="nocaptcha"></div>
			</div>
		</div>
	</body>

</html>