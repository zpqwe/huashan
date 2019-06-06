
var AreaOpt = function() {
	return{
		_divHTML: "<div class='areaopt_div' style='position:absolute'><div class='areaopt'><div class='areaopt_province'><span class='areaopt_close' ></span><div class='areaopt_con'>省份选择</div></div><div class='clear'></div><div class='areaopt_city'><div class='areaopt_con'>城市选择</div> <div class='clear'></div> </div><div class='clear'></div> <div class='areaopt_zone'><div class='areaopt_con'>地区选择</div> <div class='clear'></div> </div><div class='clear'></div> <div class='areaopt_tools'> <span class='areaopt_info'></span> <span class='areaopt_tip'>要选择此位置请点\"确定\"</span> <input type=button value='确定' rel='confirm' class='areaopt_btn' /> <input type=button rel='close' value='关闭' class='areaopt_btn' /><div class='clear'></div></div> </div> <iframe frameborder=0 class='areaopt_back' height=40></iframe></div>",
		_hiddenHTML: "<input type='hidden'/>",
		_showDiv: null,
		init: function($dom, options){
			var hideName = $dom.attr('name');
			if(hideName == '') {
				hideName = $dom.attr('id');
			}
			if(options.click) {
				var $hidden = $(AreaOpt._hiddenHTML).attr('name', hideName).val($dom.val());
				$dom.removeAttr('name').before($hidden);
				var $div = $(AreaOpt._divHTML);
				$div.data("dom", $dom);
				$div.data("hidden", $hidden);
				$dom.data("div", $div);
				AreaOpt._initProvince($div);
				if(options.zone) {
					/*AreaOpt._initZone($div); 鍚庢湡瀹炵幇*/
				}
				$dom.after($div);
				AreaOpt._bind($dom);
				$div.find(":button[rel='close']").click(function(){
					AreaOpt._close($(this).parents(".areaopt_div"));
				});
				$div.find("span.areaopt_close").click(function(){
					AreaOpt._close($(this).parents(".areaopt_div"));
				});
				$div.find(":button[rel='confirm']").click(function(){
					AreaOpt._confirm($(this).parents(".areaopt_div"));
				});
			}
			if (options.ajaxData) {
				AreaOpt.ajaxData = options.ajaxData;
			} else {
				throw new error("options.ajaxData必传");
			}
			if (options.afterChange) {
				AreaOpt.afterChange = options.afterChange;
			}
			AreaOpt._parseCode($dom);
		},
		afterChange: function($dom, city) {

		},
		ajaxData: function(obj) {

		},
		_bind: function($dom){
			$dom.attr('readonly', 'readonly').click(function(){
				$div = $(this).data('div');
				if(!$div.is(":visible")) {
					if(AreaOpt._showDiv) {
						AreaOpt._close(AreaOpt._showDiv);
					}
					AreaOpt._setframe($div);
					$div.css("display", "inline");
					AreaOpt._showDiv = $div;
				}
			});
		},
		_parseCode: function($dom) {
			if($dom.is('input')){
				var v = AreaOpt._codeToString($dom.val());
				if(v) {
					$dom.val(v);
				}
			}else {
				var v = AreaOpt._codeToString($dom.text());
				if(v) {
					$dom.text(v);
				}
			}
		},
		_codeToString: function(val) {
			if(val && $.trim(val).length == 4 && /^\d+$/.test($.trim(val))) {
				val = $.trim(val);
				var p = areaoptProvince[val.substring(0, 2)];
				var c;
				var cObject = areaoptCity[val.substring(0, 2)];
				if(cObject && cObject != "undefined") {
					c = cObject[val.substring(2)];
				}
				if(p && p != 'undefined' && c && c != "undefined") {
					return p + " " + c;
				}
			}
			return null;
		},
		_initProvince: function($div) {
			var pdatas = '';
			/*
			 for(var p in areaoptProvince) {
			 pdatas += "<a href='' code='" + p + "' title='" + areaoptProvince[p] + "'>" + areaoptProvince[p] + "</a>";
			 }*/
			for(var i = 1; i <= 34; i++) {
				var p = i;
				if(i < 10) {
					p = "0" + i;
				}
				pdatas += "<a href='' code='" + p + "' title='" + areaoptProvince[p] + "'>" + areaoptProvince[p] + "</a>";
			}
			$div.find(".areaopt_province .areaopt_con").html(pdatas);
			AreaOpt._setframe($div);
			$div.find(".areaopt_province a").click(function(){
				var $areaoptDiv = $(this).parents(".areaopt_div");
				$areaoptDiv.find('.areaopt_province .areaopt_mouseon').removeClass('areaopt_mouseon');
				$(this).addClass('areaopt_mouseon');
				$areaoptDiv.find("span.areaopt_info").text(' '+$(this).text());
				$areaoptDiv.find(".areaopt_city").show();
				AreaOpt._setframe($areaoptDiv);
				AreaOpt._initCity($areaoptDiv, $(this).attr('code'));
				return false;
			});
		},
		_initCity: function($div, code){
			var cdatas = '';
			var city = areaoptCity[code];
			var i = 0;
			/*
			 for(var c in city) {
			 i++;
			 cdatas += "<a href='' code='" + c + "' rel='" + code + "' title='" + city[c] + "'>" + city[c] + "</a> ";
			 }*/
			for(var c in city) {
				i++;
			}
			for(var ii = 0; ii <= i; ii++) {
				var cc = ii;
				if(ii < 10) {
					cc = "0" + ii;
				}
				if(city[cc]) {
					cdatas += "<a href='' code='" + cc + "' rel='" + code + "' title='" + city[cc] + "'>" + city[cc] + "</a> ";
				}
			}
			$div.find(".areaopt_city .areaopt_con").html(cdatas);
			$div.find(".areaopt_back").css({width : AreaOpt._getFullWidth($div.find('.areaopt')[0]), height: AreaOpt._getFullHeight($div.find('.areaopt')[0])});
			$div.find(".areaopt_city a").click(function() {
				var $areaoptDiv = $(this).parents(".areaopt_div");
				$(this).parent().find('.areaopt_mouseon').removeClass('areaopt_mouseon');
				$(this).addClass('areaopt_mouseon');
				var $infoSpan = $areaoptDiv.find("span.areaopt_info");
				$infoSpan.html(' ' + $infoSpan.text() + ' &raquo; ' + $(this).text());
				AreaOpt._confirm($areaoptDiv);
				return false;
			});
			if(i == 1) {
				$div.find(".areaopt_city a").click();
			}
		},
		_close: function($div){
			$div.hide();
			$div.find(".areaopt_city").hide();
			$div.find('.areaopt_mouseon').removeClass('areaopt_mouseon');
			$div.find("span.areaopt_info").text('');
		},
		_confirm: function($div){
			var cityA = $div.find(".areaopt_city .areaopt_mouseon");

			if(cityA.get(0)) {
				var $dom = $div.data("dom");
				$dom.val(areaoptProvince[cityA.attr('rel')] + " " + cityA.attr('title'));
				var $hidden = $div.data('hidden');
				if($hidden && $hidden.get(0)) {
					$hidden.val(cityA.attr('rel') + cityA.attr('code'));
				}
				AreaOpt._close($div);
				AreaOpt.afterChange($dom, cityA);
				AreaOpt.ajaxData($hidden);
			}
		},
		_setframe: function($div) {
			var $dom = $div.data('dom');
			var dom = $dom[0];
			$div.find(".areaopt_back").css({width : AreaOpt._getFullWidth($div.find('.areaopt')[0]), height : AreaOpt._getFullHeight($div.find('.areaopt')[0])});
			dx = AreaOpt._pageX($dom);
			dy = AreaOpt._pageY($dom);
			dw = AreaOpt._getFullWidth(dom);
			dh = AreaOpt._getFullHeight(dom);
			aw = $div.find(".areaopt").width();
			ah = $div.find(".areaopt").height();
			ww = AreaOpt._windowWidth();
			wh = AreaOpt._windowHeight();
			var l = dx;
			if(dx + dw + aw > ww){
				l = dx - aw - 15;
			}else {
				l = dx + dw + 1;
			}
			$div.offset({top: dy + "px", left: l + "px"});
			/*if(dy+dh+ah>wh){
			 $('#areaopt_div').css('top',dy-ah-1);
			 }else{
			 $('#areaopt_div').css('top',dy);
			 }*/
		},
		_pageX: function($dom){
			var elem = $dom[0];
			return $dom.offset().left;
//			return elem.offsetParent ? (elem.offsetLeft + AreaOpt._pageX($(elem.offsetParent))) : elem.offsetLeft;
		},
		_pageY: function($dom){
			var elem = $dom[0];
			return $dom.offset().top;
//			return elem.offsetParent ? (elem.offsetTop + AreaOpt._pageY($(elem.offsetParent))) : elem.offsetTop;
		},
		_getStyle: function(elem, name){
			if(elem.style[name]){
				return elem.style[name];
			}else if(elem.currentStyle){
				return elem.currentStyle[name];
			}else if(document.defaultView && document.defaultView.getComputedStyle){
				name = name.replace(/([A-Z])/g,"-$1");
				name = name.toLowerCase();
				var s = document.defaultView.getComputedStyle(elem, "");
				return s && s.getPropertyValue(name);
			}else{
				return null;
			}
		},
		_getFullHeight: function(elem){
			if(AreaOpt._getStyle(elem, "display") != "none") {
				return AreaOpt._getHeight(elem) || elem.offsetHeight;
			}else{
				var old = AreaOpt._resetCss(elem, {display:"inline", visibility:"hidden", position:"absolute"});
				var h = elem.clientHeight || AreaOpt._getHeight(elem);
				AreaOpt_restoreCss(elem, old);
				return h;
			}
		},
		_getFullWidth: function(elem){
			if(AreaOpt._getStyle(elem, "display") != "none"){
				return AreaOpt._getWidth(elem) || elem.offsetWidth;
			}else{
				var old = AreaOpt._resetCss(elem, {display:"inline", visibility:"hidden", position:"absolute"});
				var w = elem.clientWidth || AreaOpt_getWidth(elem);
				AreaOpt._restoreCss(elem, old);
				return w;
			}
		},
		_resetCss: function(elem, prop){
			var old={};
			for(var i in prop){
				old[i] = elem.style[i];
				elem.style[i] = prop[i];
			}
			return old;
		},
		_restoreCss: function(elem, prop){
			for(var i in prop){
				elem.style[i] = prop[i];
			}
		},
		_getHeight: function(elem){
			return parseInt(AreaOpt._getStyle(elem,"height"));
		},
		_getWidth: function(elem){
			return parseInt(AreaOpt._getStyle(elem,"width"));
		},
		_windowHeight: function(){
			var de = document.documentthisent;
			return self.innerHeight||(de && de.offsetHeight) || document.body.offsetHeight;
		},
		_windowWidth: function(){
			var de = document.documentthisent;
			return self.innerWidth||( de && de.offsetWidth ) || document.body.offsetWidth;
		},
		_cascade: function(obj){
		}

	};
}();

$.fn.areaopt = function(options){
	options = jQuery.extend({click: true, zone: false}, options || {});
	var $this = $(this);
	$this.each(function(){
		AreaOpt.init($(this), options);
	});
};