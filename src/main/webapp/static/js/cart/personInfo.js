function updatePersonInfo(){
	$.ajax({
		url : path+'/personInfo/updatePersonInfo.do',
		type : 'post',
		data : {
			'name':$("#name").val(),'address':$("#address").val(),'tel':$("#tel").val()
		},
		dataType : 'json',
		success : function(data) {
			if(data==1){
				alert("修改成功");
			}else if (data==-1) {
				alert("请先登录");
			}else {
				alert("修改失败");
			}
		},
		error : function() {
			alert("请求失败");
		}
	});
}

function initInfo() {
	$.ajax({
		url : path+'/personInfo/getUserInfo.do',
		type : 'post',
		data : {
			
		},
		dataType : 'json',
		success : function(data) {
			$("#name").val(data.name);
			$("#address").val(data.address);
			$("#tel").val(data.tel);
		},
		error : function() {
			alert("请求失败");
		}
	});
}

$(document).ready(function() {
	initInfo();
});