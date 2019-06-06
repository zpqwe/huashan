/**
 * Created by lijiabin on 2018/11/14.
 */
;
(function (window, $) {
    return tdwToolBar = {
            //显示右侧工具栏
            showRightSlider: function (params) {
                var _this = this;
                $(window).bind('scroll', function () {
                    var scrollTop = $(window).scrollTop();
                    if (scrollTop > 500) {
                        $('#commonBacktop').fadeIn(300);
                    } else {
                        $('#commonBacktop').fadeOut(300);
                    }
                });
                $('#commonToolRisk').hover(function () {
                    $(this).parent().find('.risk-tips').stop().fadeIn();
                }, function () {
                    $(this).parent().find('.risk-tips').stop().fadeOut();
                });
                //显示返回顶部
                _this.toTop();
            },
            //显示返回顶部
            toTop: function () {
                $('#commonBacktop').on('click', function () {
                    $('html,body').stop().animate({
                        scrollTop: 0
                    }, 500);
                });
            }
        }
})(window, jQuery);
$(function () {
    //显示右侧工具栏
    tdwToolBar.showRightSlider();

});

