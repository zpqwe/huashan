var downloadPdfdialog;
var pdfurl = ""; 
function downloadPdf(type, contractNo, tranId) {
    if (isExitsFunction("showDialWindows")) {
        downloadPdfdialog = showDialWindows("团贷网提醒您", "<div style='padding:20px 10px;'><img src=\"../images/loading24.gif\" />&nbsp;<span style='color:gray;font-size:13px;line-height:24px;'>正在生成合同，请稍候....</span></div>")
    } else {
        downloadPdfdialog = art.dialog({
            id: 'N1589' + Math.random(),
            width: 300,
            content: "<div style='padding:20px 10px;'><img src=\"../images/loading24.gif\" />&nbsp;<span style='color:gray;font-size:13px;line-height:24px;'>正在生成合同，请稍候....</span></div>",
            fixed: false,
            lock: true,
            showborder: true,
            zIndex: 9999999,
            drag: true,
            padding: 0,
            background: '#fff'
        });
    }

    //$.ajax({
    //    url: "/member/contract/PdfDownload.aspx", 
    //    type: "POST",
    //    dataType: "text",
    //    data: {
    //        "type": type,
    //        "key": contractNo,
    //        "tranId": tranId
    //    },
    //    success: function (data) {
    //        if (data.length > 0) {
    //            pdfurl = data;
    //            setTimeout("fnDownloadPdf()", 6000);
    //        }
    //        else {
    //            if (isExitsFunction("showDialWindows")) {
    //                showDialWindows("团贷网提醒您", "<div style='margin:10px 0 4px 0;font-size:13px;line-height:22px;'>生成PDF失败，请重试，或者联系客服。</div>")
    //            } else {
    //                downloadPdfdialog.content("<div style='margin:10px 0 4px 0;font-size:13px;line-height:22px;'>生成PDF失败，请重试，或者联系客服。</div>");
    //            }
    //        }
    //    },
    //    error: function (XMLHttpRequest, textStatus, errorThrown) {
    //        if (isExitsFunction("showDialWindows")) {
    //            showDialWindows("团贷网提醒您", "<div style='margin:10px 0 4px 0;font-size:13px;line-height:22px;'>对不起，下载合同失败，请联系客服。</div>")
    //        } else {
    //            downloadPdfdialog.content("<div style='margin:10px 0 4px 0;font-size:13px;line-height:22px;'>对不起，下载合同失败，请联系客服。</div>");
    //        }
    //    }
    //});
    if (contractViewUrl == undefined || contractViewUrl == "") {
        contractViewUrl = "";
    }
    /**$.ajax({ 
        url: contractViewUrl+"/p2p/PdfDownload.aspx",
        type: "get",
        dataType: 'jsonp',
        async: false,
        jsonp: "jsoncallback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)  
        jsonpCallback: "AsyncDown",
        data: {
            type: type,
            key: contractNo,
            tranId: tranId
        },
        timeout: 8000,
        success: function (json) {

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) { 
            if (XMLHttpRequest.status != 200) {
                if (isExitsFunction("showDialWindows")) {
                    showDialWindows("团贷网提醒您", "<div style='margin:10px 0 4px 0;font-size:13px;line-height:22px;'>对不起，下载合同失败，请联系客服。</div>")
                } else {
                    downloadPdfdialog.content("<div style='margin:10px 0 4px 0;font-size:13px;line-height:22px;'>对不起，下载合同失败，请联系客服。</div>");
                }
            }
        }
    });
}*/
function AsyncDown(data) {
    if (data.result == "1") {
        pdfurl = data.msg;
        setTimeout("fnDownloadPdf()", 5000);
    } else {
        if (isExitsFunction("showDialWindows")) {
            showDialWindows("团贷网提醒您", "<div style='margin:10px 0 4px 0;font-size:13px;line-height:22px;'>生成PDF失败，请重试，或者联系客服。</div>")
        } else {
            downloadPdfdialog.content("<div style='margin:10px 0 4px 0;font-size:13px;line-height:22px;'>生成PDF失败，请重试，或者联系客服。</div>");
        }
    }
}

function fnDownloadPdf() {
    if (isExitsFunction("showDialWindows")) {
        showDialWindows("团贷网提醒您", "<div style='margin:10px 0 4px 0;color:gray;font-size:13px;line-height:22px;'>已经生成合同，<a target='_blank' style='text-decoration:underline;font-size:13px;line-height:22px;color:orange;' href='" + pdfurl + "'>点击下载合同</a></div><div style='margin:10px 0 4px 0;color:gray;font-size:13px;line-height:22px;'>温馨提示：合同查看密码为您的手机号码</div>")
    } else {
        downloadPdfdialog.content("<div style='margin:10px 0 4px 0;color:gray;font-size:13px;line-height:22px;'>已经生成合同，<a target='_blank' style='text-decoration:underline;font-size:13px;line-height:22px;color:orange;' href='" + pdfurl + "'>点击下载合同</a></div><div style='margin:10px 0 4px 0;color:gray;font-size:13px;line-height:22px;'>温馨提示：合同查看密码为您的手机号码</div>");
    }
}

function isExitsFunction(funcName) {
    try {
        if (typeof (eval(funcName)) == "function") {
            return true;
        }
    } catch (e) { }
    return false;
}