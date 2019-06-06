//广告位页面数据埋点
function postBankData(postdataUrl, platformId, platformUserNo, userId, cellPhone, currentPage, requestKey) {
    //1业务渠道ID	channel_id	数据来源渠道代码，直销银行APP、营销页面等等
    //3客户端时区	usr_time_zone	用户的设备时间所属时区
    //4客户端时间	usr_time	用户的设备时间，格式：YYYY-MM-DD hh:mm:ss
    //5IP	ip	xxx.xxx.xxx.xxx
    //7用户ID	user_id	用户唯一ID
    //13User Agent	user_agent	User Agent  navigator.userAgent
    //14交互事件	ine_event	记录交互事件中的参数信息，neo.bak1=platformId,neo.bak2=platformUserNo
    //18当前页面	current_page	按钮所属页面英文名
    //19当前页面链接	current_page_link	当前页面的链接
    //27cookie_id	cookie_id
    //28session_id	session_id	requestKey
    var postdata = "LANMAOLY|@||@|";
    //3当前时区
    postdata += new Date().getTimezoneOffset() / 60 + "|@|";
    //4客户端时间
    postdata += getCurrentTime() + "|@|";
    //5IP
    if (typeof(returnCitySN) == "undefined") {
        postdata += "|@||@|";
    } else {
        postdata += returnCitySN["cip"] + "|@||@|";
    }
    //7用户ID
    postdata += userId + "|@|";
    //8用户手机号
    postdata += cellPhone + "|@||@||@||@||@|";
    //13User Agent
    postdata += navigator.userAgent + "|@|";
    //14交互事件
    postdata += "NQ.bak1=" + platformId + "|&|NQ.bak2=" + platformUserNo + "|@||@||@||@|";
    //18当前页面
    postdata += currentPage + "|@|";
    //19当前页面链接
    postdata += window.location.pathname + "|@||@||@||@||@||@||@||@|";
    //27cookie_id	cookie_id
    postdata += requestKey + "|@|";
    //28session_id	session_id	requestKey
    postdata += requestKey;

    $.ajax({
        type: "POST",
        url: "/bha-neo-app/bankHttp/buriedPoint",
        data: {postdata: postdata},
        datatype: "text",
        //contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        success: function (data) {
            console.log(data);
        },
        error: function (e) {
            //请求出错处理
            console.log(e);
        }
    });

}

//获取客户端当前时间
function getCurrentTime() {
    var myDate = new Date();
    var year = myDate.getFullYear();   //获取完整的年份(4位,1970-????)
    var month = myDate.getMonth() + 1;      //获取当前月份(0-11,0代表1月)
    if (month < 10) {
        month = "0" + month;
    }
    var day = myDate.getDate();       //获取当前日(1-31)
    if (day < 10) {
        day = "0" + day;
    }
    var hour = myDate.getHours();      //获取当前小时数(0-23)
    if (hour < 10) {
        hour = "0" + hour;
    }
    var minute = myDate.getMinutes();    //获取当前分钟数(0-59)
    if (minute < 10) {
        minute = "0" + minute;
    }
    var seconds = myDate.getSeconds();    //获取当前秒数(0-59)
    if (seconds < 10) {
        seconds = "0" + seconds;
    }
    var currentTime = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + seconds;
    return currentTime;
}
