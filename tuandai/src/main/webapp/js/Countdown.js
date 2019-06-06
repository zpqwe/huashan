var count = 60;
//短信倒计时
var sh;
function sho() {
	var doc = document
			.getElementById("sendSmsVerify");//获取按钮对象
	doc.disabled = true;
	doc.value = "重新发送" + count + "s"; //改变对象value值			
	if (count > 0) { //判断count>=0的时候才自身减1
		count--;
	} else {
		doc.value = "点击获取"; //倒计时完成重新修改value的值
		doc.disabled = false; //按钮设为可以点击
		clearInterval(sh); //清除定时函数
	}
}
function start() {
	count = 60; //每次点击重新赋值count
	var doc = document
			.getElementById("sendSmsVerify"); //获取按钮对象
	doc.disabled = true; //每次点击倒计时中按钮设为禁用
	sh = setInterval("sho()", 1000); //设置定时函数，每秒执行一次
}