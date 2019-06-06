/*var fathersip;//用于比较两个输入框的对象

var encryptPasswordInput;//加密密码输入框
var clientRandomInput;//客户端随机数输入框
var serverRandomInput;//服务器随机数输入框
var serverRandom;//客戶端随机数
*/var sip_map = {};//创建的CFCA输入框
var sourceInput;//源输入框
function inputChangeCallback(sipBoxId, type, length) {
	var operator = type === CFCA_KEYBOARD_INSERT ? "INSERT" : (type === CFCA_KEYBOARD_DELETE ? "DELETE" : "CLEAR");
	var sip = getSipInput(sipBoxId);
	if(sip["sourceInput"]!=undefined){
	$("#"+sip["clientRandomInput"]).val(getClientRandom(sip["sourceInput"]));
//	$("#"+sip["serverRandomInput"]).val(serverRandom)
	$("#"+sip["encryptPasswordInput"]).val(getEncrypt(sip["sourceInput"]));
	}
}

function initInput(sipboxId) {
	var sip1;
	sip1 = new CFCASIPInput(sipboxId, SIP_TYPE_SYSTEM_KEYBOARD);
	sip1.setServerRandom(sipboxId, "MTIzNDU2Nzg5MDk4NzY1NA==");
	sip1.setInputChangeCallback(sipboxId, inputChangeCallback);
	return sip1;
}

function getSipInput(sipboxId) {
	return sip_map[sipboxId];
}

function setProperty(array) {
	var sip;
	for (var i = 0; i < array.length; i++) {
		var sipboxId = array.get(i).id;
		var sipInput = initInput(sipboxId);
		var outputType = OUTPUT_TYPE_ORIGINAL;//OUTPUT_TYPE_HASH;
		var cipherType = CIPHER_TYPE_RSA;//CIPHER_TYPE_SM2
		var minLength = 6;
		var maxLength = 18;
		var matchRegex = /\S{0,18}/;
		var inputRegex = /\S/;
		var randomType = RANDOM_NONE;
		if (CFCA_OK != sipInput.setMinLength(sipboxId, minLength)) alert("设置最小长度错误");
		if (CFCA_OK != sipInput.setMaxLength(sipboxId, maxLength)) alert("设置最大长度错误");
		if (CFCA_OK != sipInput.setOutputType(sipboxId, outputType)) alert("设置输出类型错误");
		if (CFCA_OK != sipInput.setServerRandom(sipboxId, serverRandom)) alert("设置服务器随机数错误");
		if (CFCA_OK != sipInput.setCipherType(sipboxId, cipherType)) alert("设置解密类型错误");
		if (CFCA_OK != sipInput.setMatchRegex(sipboxId, matchRegex)) alert("设置验证正则错误");
		if (CFCA_OK != sipInput.setInputRegex(sipboxId, inputRegex)) alert("设置输入正则错误");
		if ($(array.get(i)).attr("cfcabind")!=undefined) {
			var param = $(array.get(i)).attr("cfcabind").split(",");
			if(param.length>=3){
				sip_map[sipboxId] = {"sourceInput": sipboxId,"encryptPasswordInput":param[0],"clientRandomInput":param[1],"serverRandomInput":param[2],"sipInput":sipInput};
			}else{
				sip_map[sipboxId] = {"sipInput":sipInput};
			}
		} else {
			sip_map[sipboxId] = {"sipInput":sipInput};
		}
	}
}

function getClientRandom(sipboxId) {
	var sip = getSipInput(sipboxId)["sipInput"];
	var encryptedClientRandom = sip.getEncryptedClientRandom(sipboxId);
    var clientErrorCode = sip.getErrorCode(sipboxId).toString(16);
	if (clientErrorCode != CFCA_OK) {
		return null;
	} else {
		return encryptedClientRandom;
	}
}

function getEncrypt(sipboxId) {
	var sip = getSipInput(sipboxId)["sipInput"];
	var encryptedInputValue = sip.getEncryptedInputValue(sipboxId);
	var errorCode = sip.getErrorCode(sipboxId).toString(16);
	if (errorCode != CFCA_OK) {
		return null;
	} else {
		return encryptedInputValue;
	}
}

function checkEqual(sipboxId1, sipboxId2) {
	var sip = getSipInput(sipboxId1)["sipInput"];
	if (sip.checkInputValueMatch(sipboxId1, sipboxId2)) {
		return true;
	} else {
		return false;
	}
}

function setRandom(random) {
	serverRandom = random;
}

/*function bindParam(password,encryptPassword,clientRandom,serverRandom){
	this.sourceInput = password;
	this.encryptPasswordInput = encryptPassword;
	this.clientRandomInput = clientRandom;
	this.serverRandomInput = serverRandom;
}*/

function init(array){
	
	setRandom("MTIzNDU2Nzg5MDk4NzY1NA==");
	setProperty(array)
}

$(document).ready(function (){
	var list = $('input[cfca="true"]')
	init(list)
})
