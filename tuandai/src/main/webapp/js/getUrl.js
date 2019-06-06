
$(document).ready(function(){
	var windowUrl=window.location.href;
	//alert(windowUrl+"windowUrl");
	
	//获取url中"?"符后的字串
	var url =  encodeURI(url);//对url中文进行转码
	var theRequest = new Object();
	if (url.indexOf("?") != -1) {
	var str = url.substr(1);
	strs = str.split("&");
	//alert(strs+"srts");
	for(var i = 0; i < strs.length; i ++) {
	    theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
	   alert(theRequest[strs[i].split("=")[0]]+"lo");
	}
	}
});

