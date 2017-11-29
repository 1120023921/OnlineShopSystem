var total=0;
function minus(obj){
	// 数量减
	if(parseInt($("#num_"+$(obj).attr("fruit_id")).html())<=0){
		return;
	}
	$("#num_"+$(obj).attr("fruit_id")).html(parseInt($("#num_"+$(obj).attr("fruit_id")).html())-1);
	total-=parseFloat($("#price_"+$(obj).attr("fruit_id")).html());
	if(total==0){
		$("#AllTotal").html(total);
	}else {
		$("#AllTotal").html(total.toFixed(2));
	}
	subtractSession($(obj).attr("fruit_id"));
}

function plus(obj){
	// 数量加
	$("#num_"+$(obj).attr("fruit_id")).html(parseInt($("#num_"+$(obj).attr("fruit_id")).html())+1);
	total+=parseFloat($("#price_"+$(obj).attr("fruit_id")).html());
	if(total==0){
		$("#AllTotal").html(total);
	}else {
		$("#AllTotal").html(total.toFixed(2));
	}
	addSession($(obj).attr("fruit_id"));
}

function addSession(fruit_id){
	$.ajax({
		url : path+'/items/add.do',
		type : 'post',
		data : {
			id:fruit_id
		},
		dataType : 'json',
		success : function(data) {
//			alert(data);
		},
		error : function() {
			alert("请求失败");
		}
	})
}

function subtractSession(fruit_id){
	$.ajax({
		url : path+'/items/subtract.do',
		type : 'post',
		data : {
			id:fruit_id
		},
		dataType : 'json',
		success : function(data) {
//			alert(data);
		},
		error : function() {
			alert("请求失败");
		}
	})
}

function submit() {
	if(total==0){
		alert("您还未购买商品");
		return;
	}else {
		window.location.href=path+'/confirm.do';
	}
}

function login(){
	$("#login_password").val(b64_md5($("#login_password").val()));
	$.ajax({
		url : path+'/login.do',
		type : 'post',
		data : {
			username:$("#login_username").val(),
			password:$("#login_password").val()
		},
		dataType : 'json',
		success : function(data) {
			if(data.success==true){
				if(data.role=='管理员'){
					window.location.href=path+'/index.do';
					return;
				}
				$("#log").html('<a href="'+path+'/personCenter.do">'+data.user.name+'</a>'+'|<a href="'+path+'/logout.do">注销</a>');
				$('#login_m').modal('hide');
			}else {
				alert(data.msg);
			}
		},
		error : function() {
			alert("请求失败");
		}
	})
}

function register_m() {
	$('#login_m').modal('hide');
	$('#register_m').modal('show');
};

function register(){
	var uid = $("#uid").val();
	var password = $("#register_password").val();
	var password2 = $("#register_password_reply").val();
	var name = $("#name").val();
	var tel = $("#tel").val();
	var address = $("#address").val();
	var reg = /^[0-9A-Za-z]{6,}$/;

	if(uid.trim()==""||password.trim()==""||password2.trim()==""||name.trim()==""||tel.trim()==""||address.trim()==""){
		alert("以上所有信息必填");
		return;
	}
	
//	if(!uid.match("\\d+")){
//		alert("账号必须为数字！");
//		return;
//	}
//	if(!reg.test(password)){
//		alert("密码长度不小于六位！");
//		return;
//	}
	
	if(password!=password2){
		alert("两次密码不一致");
		return;
	}
	
	$.ajax({
		type:'post',
		url:path+'/register.do',
		data:{'uid':uid,'password':password,'name':name,'tel':tel,'address':address},
		dataType:'json',
		success:function(result){
			if (result.success==true) {
				alert(result.msg);
				$('#register_m').modal('hide');
				$('#login_m').modal('show');
			} else {			
				alert(result.msg);
			}
			
		},
		error:function(){
			$(".error_message").text("出现未知错误！");
		}
	});
}

function init(){
	$.ajax({
		type : 'post',
		data : {
			
		},
		url : path+'/goods/getAll.do',
		dataType : 'json',
		success : function(data) {
			for(var i in data){
				$("#items").html($("#items").html()+'<li>'
						+'<div class="shop-info">'
						+'<input type="checkbox" class="check goods-check goodsCheck" checked="checked" style="display: none;">'
						+'<div class="shop-info-img"><a href="#"><img src="'+path+'/static/upload/'+data[i].pic+'" /></a></div>'
						+'<div class="shop-info-text">'
						+'<h4>'+data[i].fruit+'</h4>'
						+'<div class="shop-brief"><span>单位：每斤</span></div>'
						+'<div class="shop-price">'
						+'<div class="shop-pices">￥<b class="price" id="price_'+data[i].id+'">'+data[i].price+'</b></div>'
						+'<div class="shop-arithmetic">'
						+'<a href="javascript:void(0)" class="minus" fruit_id='+data[i].id+' onclick="minus(this);">-</a>'
						+'<span class="num" id="num_'+data[i].id+'">0</span>'
						+'<a href="javascript:void(0)" class="plus" fruit_id='+data[i].id+' onclick="plus(this);">+</a>'
						+'</div>'
						+'</div>'
						+'</div>'
						+'</div>'
						+'</li>');
			}
		},
		error : function() {
			alert("请求失败");
		}
	})
}

$(document).ready(function(){
	  init();
	});