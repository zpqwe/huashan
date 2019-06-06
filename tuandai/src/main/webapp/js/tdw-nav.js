/**
 * Created by lijiabin on 2018/11/14.
 */
;
(function (window, $) {
    return tdwNavOpt = {
            portalWebsiteUrl : "//www.tuandai.com",
            imageWebsiteUrl : "//image.tuandai.com",
            niwoWebsiteUrl : "http://www.niwo.com",
            ActivityWebsiteUrl : "//hd.tuandai.com",
            DQWebsiteUrl : "//dq.tdw.cn",
            PassportWebUrl : "//passport.tuandai.com",
            contractViewUrl : "//contract.tuandai.com"
        },
        tdwNav = {
            /*导航下拉菜单登录方法*/
            initLogin: function () {
                var getVersion = $('.tdw-top').attr('version');
                if(!(getVersion === 'interface-data')){
                    this.GetLocalLoginStatus();
                }

            },
            /*获取登录状态*/
            GetLocalLoginStatus: function () {
                var url = tdwNavOpt.portalWebsiteUrl + "/user/services/AccountNewHandler.ashx";
                if ("https:" == document.location.protocol)
                    url = url.replace("http://", "https://");
                $.ajax({
                    url: url,
                    dataType: "jsonp",
                    scriptCharset: "gb2312",
                    success: function (data) {
                        $("#topinfo").html(data.topinfo);
                        $("#myAccount").html(data.accountinfo);
                        $("#myAccountDefault").html(data.accountinfo);
                        $("#myTransfer").html(data.zxInfo);
                        if (data && data.sso) {
                            $.each(data.sso, function (i, val) {
                                $.ajax({
                                    url: this,
                                    type: "GET",
                                    dataType: "text",
                                    success: function (data) {
                                        jQuery.ajax({
                                            url: data,
                                            dataType: "jsonp"
                                        });
                                    }
                                });
                            });
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        //  alert(textStatus);
                    }
                });
            },
            //未登录 隐藏我的账户下拉菜单
            subMenuShow: function () {
                if ($('.tdw-nav .my-account').length == 0) {
                    $('.my-account-default').next('.sonmenu').css({
                        'display': 'none'
                    });
                }
            }
        }
})(window, jQuery);
$(function () {
    //未登录 隐藏我的账户下拉菜单
    tdwNav.subMenuShow();
    // 导航下拉菜单初始化登录状态
    tdwNav.initLogin();
});