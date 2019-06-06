/*
* fastsoft.iframe.js
* iframe 弹出插件，iframe的页面会根据自身大小调整整个弹出层大小
* 作者：甘天伟，QQ:53621787
*/

var mask = { isOpen: !1, isIe6: $.browser.msie && $.browser.version < 7, zIndex: 10000000, on: function () { if (mask.isOpen) return !1; mask.isOpen = !0; var a = $("#theMask"); a[0] || (a = $('<div id="theMask"></div>').css({ position: "absolute", top: 0, left: 0, width: "100%", background: "#000", opacity: .3, display: "none" }), a.appendTo($(document.body))), a.css({ width: $(document).width(), height: $(document).height(), zIndex: mask.zIndex }), mask.isIe6 && $("select").hide(), a.show() }, off: function () { var a = $("#theMask"); if (!a[0]) return !1; mask.isOpen = !1, mask.isIe6 && $("select").show(), a.hide() } }; (function (a) { a.centerSize = function (b) { var c = { width: a(window).width(), height: a(window).height() }, d = a(window).scrollTop(); return { top: Math.max(d + (c.height - b.height) / 2, 0), left: Math.max((c.width - b.width) / 2, 0)} }, a.center = function (b) { b = a(b), b.css("position", "absolute").css(a.centerSize({ width: b.outerWidth(), height: b.outerHeight() })) } })(jQuery);

var PopLayer = function (a) {
    a = a || {};
    var b = this,
    c = function () {
        return !0
    };
    b.options = $.extend({
        beforeOpen: c,
        beforeClose: c,
        afterClose: c,
        ok: c,
        cancel: c,
        iframe: !1
    },
    a),
    a.trigger && (b.trigger = $(a.trigger)),
    a.target && (b.target = $(a.target)),
    b.init()
};
$.extend(PopLayer.prototype, {
    init: function () {
        this._initEvent()
    },
    _initEvent: function () {
        var a = this,
        b = a.options,
        c, d;
        a.trigger && a.trigger.click(function (b) {
            a.open(),
            b.preventDefault()
        });
        if (a.target) {
            d = b.iframe && a.target[0].tagName.toLowerCase() == "iframe";
            if (d) return;
            function e() {
                c = a.target,
                c.find(".close, .cancel").click(function (c) {
                    b.cancel(),
                    a.close(),
                    c.preventDefault()
                }),
                c.find(".ok").click(function (c) {
                    b.ok(),
                    a.close(),
                    c.preventDefault()
                })
            }
            e()
        }
    },
    open: function () {
        var a = this,
        b = a.options;
        b.beforeOpen() && a.update()
    },
    close: function () {
        var a = this,
        b = a.options;
        if (b.beforeClose()) {
            mask.off(),
            a.target.hide();
            var c = a.target.get(0);
            c && c.tagName && c.tagName.toUpperCase() == "IFRAME" && a.target.remove(),
            b.afterClose(),
            a.loading.remove(),
            PopLayer.current = null
        }
    },
    update: function () {
        PopLayer.current = this,
        mask.on(),
        this.target.show(),
        $.center(this.target)
    }
}),
PopLayer.iframe = function (a) {
    var b, c = $('<img width="48" src="../images/loading.gif">').css("zIndex", mask.zIndex + 1),
    d = $('<iframe class="dialog" frameborder="0" scrolling="no"></iframe>').css({
        position: "absolute",
        left: -9999,
        top: -9999,
        zIndex: 20000000,
        width: 1,
        height: 1
    }).appendTo(document.body).attr("src", a);
    return b = new PopLayer({
        target: d,
        iframe: !0
    }),
    b.open(),
    $.center(c.appendTo(document.body)),
    PopLayer.current.loading = c,
    b
},
PopLayer.close = function () {
    PopLayer.current && PopLayer.current.close()
},
PopLayer.resize = function (a) {
    PopLayer.current && (PopLayer.current.target.animate($.extend(a, $.centerSize(a)), {
        duration: 200
    }), PopLayer.current.loading.remove())
}