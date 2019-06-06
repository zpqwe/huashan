$(document).ready(function(){
	$.ajax({
		"url":"${pageContext.request.contextPath}/account_default_profit",
		"type":"get",
		"data":"",
		"dataType":"json",
		"success":function(data){
			var recAmount=0.00;
			var dueAmount=data.ucinterest;
			$("#recAmount").html("￥"+recAmount);
			alert(dueAmount)
			$("#dueAmount").html("￥"+dueAmount);
		},
		"error":function(){
			
		},
	})
})