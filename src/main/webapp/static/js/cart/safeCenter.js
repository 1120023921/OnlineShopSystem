function checkOldPassword() {
	$.ajax({
		url : path+'/personCenter/checkOldPassword.do',
		type : 'post',
		data : {
			'password':$("#oldPassword").val()
		},
		dataType : 'json',
		success : function(data) {
			if(data==1){
				changePassword();
			}else {
				alert("原密码错误");
				return 0;
			}
		},
		error : function() {
			return 0;
			alert("请求失败");
		}
	});
}

function changePassword(){
	
	var password1 = $("#newPassword").val();
	var password2 = $("#newPasswordReply").val();
	if(password1!=password2){
		alert("两次密码不一致");
		return;
	}
	
	$.ajax({
		url : path+'/personCenter/updatePassword.do',
		type : 'post',
		data : {
			'password':password1
		},
		dataType : 'json',
		success : function(data) {
			if(data==1){
				alert("修改成功");
			}else {
				alert("修改失败");
			}
		},
		error : function() {
			alert("请求失败");
		}
	});
}