//var portalWebsiteUrl = "http://192.168.8.111:9001";
//var imageWebsiteUrl = "http://192.168.8.111:9003";
//var niwoWebsiteUrl = "http://192.168.8.111:8008";
//var ActivityWebsiteUrl = "http://192.168.8.111:9006";

var portalWebsiteUrl = "#";
var imageWebsiteUrl = "#";
var niwoWebsiteUrl = "#";
var PassportWebUrl = "#";
var ActivityWebsiteUrl = "#";
var DQWebsiteUrl = "#";


function login() {
    var returnUrl = jQuery.getUrlParam("ReturnUrl");
    if (returnUrl == null || returnUrl == "") {
        returnUrl = document.URL;
        if (returnUrl.toLowerCase().indexOf("/user/") > -1 || returnUrl.toLowerCase().indexOf("/member/resetpwd") > -1) {
            return location.href = portalWebsiteUrl + "/u/login", !1
        }
    }

    return location.href = portalWebsiteUrl + "/u/login?ReturnUrl=" + returnUrl,
    !1
}
function register() {
    return location.href = PassportWebUrl + "/2register",
        !1
}
function logout() {
    var returnUrl = jQuery.getUrlParam("ReturnUrl");
    if (returnUrl == null || returnUrl == "") {
        returnUrl = document.URL;
        if (returnUrl.toLowerCase().indexOf("/user/") > -1 || returnUrl.toLowerCase().indexOf("/member/resetpwd") > -1) {
            return location.href = portalWebsiteUrl + "/u/logout", !1
        }
    }

    return location.href = portalWebsiteUrl + "/u/logout?ReturnUrl=" + returnUrl,
    !1
}
function addToFavorite() {

}

(function (jQuery) {
    jQuery.getUrlParam = function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
})(jQuery);