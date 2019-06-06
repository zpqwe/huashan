var timeout = 1;
var timecount = 0; //秒差
var type = 0;
var begintime = new Date();
var endtime = new Date();
var servertime = new Date();
//倒计时
function funTimeDown() {
    var futureDate = Date.UTC(begintime.getFullYear(), begintime.getMonth(), begintime.getDate(), begintime.getHours(), begintime.getMinutes(), begintime.getSeconds());
    var endDate = Date.UTC(endtime.getFullYear(), endtime.getMonth(), endtime.getDate(), endtime.getHours(), endtime.getMinutes(), endtime.getSeconds());
    var serverDate = Date.UTC(servertime.getFullYear(), servertime.getMonth(), servertime.getDate(), servertime.getHours(), servertime.getMinutes(), servertime.getSeconds());
    fnTimeCountDown(futureDate, endDate, serverDate);
}
$(window).ready(function () {
    //begintime = new Date(Date.parse($(".timeSet").attr("startDate").replace(/-/g, "/"))); //开始时间
    //endtime = new Date(Date.parse($(".timeSet").attr("endDate").replace(/-/g, "/"))); //结束时间
    //servertime = new Date(Date.parse($(".timeSet").attr("serverDate").replace(/-/g, "/"))); //服务器时间
    begintime = new Date(Date.parse($("#timeSet").attr("startDate"))); //开始时间
    endtime = new Date(Date.parse($("#timeSet").attr("endDate"))); //结束时间
    servertime = new Date(Date.parse($("#timeSet").attr("serverDate"))); //服务器时间
    if (endtime > servertime) {
        funTimeDown();
    }
});

/* 
* 倒计时
*/
var fnTimeCountDown = function (d, e, s) {
    var nowtemp = s;
    if (e > nowtemp) {
        d = e || Date.UTC(2013, 6, 27, 12); //如果未定义时间，则我们设定倒计时日期
        timecount = (e - s) / 1000;
    }
    var future = new Date(d);
    var f = {
        zero: function (n) {
            var n = parseInt(n, 10);
            if (n > 0) {
                if (n <= 9) {
                    n = "0" + n;
                }
                return String(n);
            } else {
                return "00";
            }
        },
        dv: function () {
            var dur = timecount;
            var pms = {
                sec: "00",
                mini: "00",
                hour: "00",
                day: "00",
                month: "00",
                year: "0"
            };
            if (dur > 0) {
                pms.sec = f.zero(dur % 60);
                pms.mini = Math.floor((dur / 60)) > 0 ? f.zero(Math.floor((dur / 60)) % 60) : "00";
                pms.hour = Math.floor((dur / 3600)) > 0 ? parseInt(dur / 3600) % 24 : "00";
                pms.day = Math.floor((dur / 86400)) > 0 ? parseInt(Math.floor((dur / 86400))) : "00";
            }
            return pms;
        },
        ui: function () {
            var result=f.dv();
            $("#sec").html(result.sec);
            $("#mini").html(result.mini);
            $("#hour").html(result.hour);
            $("#day").html(result.day);
            timecount = timecount - 1;
            setTimeout(f.ui, 1000);
        }
    };
    f.ui();
};