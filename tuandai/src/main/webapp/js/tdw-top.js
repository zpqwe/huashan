/**
 * Created by lijiabin on 2018/11/14.
 */
;
(function (window, $) {
    return tdwTopOpt = {
            portalWebsiteUrl : "//www.tuandai.com",
            imageWebsiteUrl : "//image.tuandai.com",
            niwoWebsiteUrl : "http://www.niwo.com",
            ActivityWebsiteUrl : "//hd.tuandai.com",
            DQWebsiteUrl : "//dq.tdw.cn",
            PassportWebUrl : "//passport.tuandai.com",
            contractViewUrl : "//contract.tuandai.com"
        },
        tdwTopLogin = {
            getUrlParam: function (name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"),
                    r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]);
                return null;
            },
            //登录
            login: function () {
                var returnUrl = this.getUrlParam("ReturnUrl");
                if (returnUrl == null || returnUrl == "") {
                    returnUrl = document.URL;
                    if (returnUrl.toLowerCase().indexOf("/user/") > -1 || returnUrl.toLowerCase().indexOf("/user/ResetPwd_Telno.aspx") > -1) {
                        return location.href = tdwTopOpt.portalWebsiteUrl + "/u/login", !1
                    }
                }
                return location.href =  tdwTopOpt.PassportWebUrl + "/2login?ret=" + encodeURIComponent(returnUrl), !1
            },
            //跳到注册
            register: function () {
                return location.href = tdwTopOpt.PassportWebUrl + "/2register", !1
            },
            //退出
            logout: function () {
                var _this = this,
                    url = tdwTopOpt.portalWebsiteUrl + "/home/clearUserCookie";
                if ("https:" == document.location.protocol)
                    url = url.replace("http://", "https://");
                $.ajax({
                    dataType: "jsonp",
                    url: url,
                    success: function () {
                        var returnUrl = _this.getUrlParam("ReturnUrl");
                        if (returnUrl == null || returnUrl == "") {
                            returnUrl = document.URL;
                            if (returnUrl.toLowerCase().indexOf("/user/") > -1 || returnUrl.toLowerCase().indexOf("/user/ResetPwd_Telno.aspx") > -1) {
                                return location.href = tdwTopOpt.portalWebsiteUrl + "/u/logout";
                            }
                        }
                        return location.href = tdwTopOpt.portalWebsiteUrl + "/u/logout?ReturnUrl=" + returnUrl;
                    },
                    cache: false
                });
            }
        }
})(window, jQuery);
