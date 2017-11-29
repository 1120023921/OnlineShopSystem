
$(document).ready(function() {
	reloadPic();
	getGoodInfo();
})

function upload_pic(obj){
	$("#upload_pic").submit();
}

function getGoodInfo(){
	$.ajax({
		url : path+'/goods/getGoodsById.do',
		type : 'post',
		data : {
			'id':id
		},
		dataType : 'json',
		success : function(data) {
			if(data!=null){
				$("#fruit").val(data.fruit);
				$("#price").val(data.price);
			}
		},
		error : function() {
			alert("请求失败");
		}
	});
}

function updateGoods(){
	$.ajax({
		url : path+'/goods/updateGoods.do',
		type : 'post',
		data : {
			'id':id,
			'fruit':$("#fruit").val(),
			'price':$("#price").val()
		},
		dataType : 'json',
		success : function(data) {
			if(data>0){
				window.location.href=path+'/goodsUploadSuccess.do';
			}else {
				window.location.href=path+'/goodsUploadFail.do';
			}
		},
		error : function() {
			alert("请求失败");
		}
	});
}


function reloadPic() {
	$.ajax({
		url : path+'/goods/getGoodsById.do',
		type : 'post',
		data : {
			'id':id
		},
		dataType : 'json',
		success : function(data) {
			if(data!=null){
				$("#picReload").css("background-image","url("+path+"/static/upload/"+data.pic+")");
			}
		},
		error : function() {
			return 0;
			alert("请求失败");
		}
	});
}
