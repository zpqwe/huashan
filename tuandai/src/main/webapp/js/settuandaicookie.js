﻿$(function () {
    var portalWebsiteUrl = /* "//www.tuandai.com" */;
    if (":" == document.location.protocol)
        portalWebsiteUrl = portalWebsiteUrl.replace("http://", "://");
    var tdfrom = getUrlParam("tdfrom");
    if (tdfrom == "" || tdfrom == undefined) {
        tdfrom = getcookie("tdfrom");
    }
    if (tdfrom != "" && tdfrom != undefined) {
        var _frm = document.createElement("img");
        _frm.style.display = "none";
        _frm.src = portalWebsiteUrl + /* "/ajaxCross/SingleLogin.ashx?Cmd=SetTdfrom&tdfrom= "  */+ tdfrom;
        document.body.appendChild(_frm);
    }

    function getcookie(name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg))
            return unescape(arr[2]);
        else
            return null;
    };
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
});