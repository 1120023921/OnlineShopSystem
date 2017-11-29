<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>商品信息管理</title>
<script>
	var path = '${pageContext.request.contextPath }';
</script>
<!-- head 中 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/cart/weui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/cart/example.css">
<link
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/static/js/cart/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/MD5.js"></script>
<script>

$(document).ready(function() {
	getAllGoods(1);
})

//获得年月日      得到日期oTime  
function getMyDate(str){  
    var oDate = new Date(str),  
    oYear = oDate.getFullYear(),  
    oMonth = oDate.getMonth()+1,  
    oDay = oDate.getDate(),  
    oHour = oDate.getHours(),  
    oMin = oDate.getMinutes(),  
    oSen = oDate.getSeconds(),  
    oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间  
    return oTime;  
};  
//补0操作  
function getzf(num){  
    if(parseInt(num) < 10){  
        num = '0'+num;  
    }  
    return num;  
}  


function getAllGoods(pages) {

	$.ajax({
				"url" : path+'/goods/getAllGoods.do',
				data : {
					pages : pages,
					rows : 5
				},
				"type" : "POST",
				"success" : function(data) {
					$("#goodsList").html("");
					$("#pageBar").html("");
					for (var i =0;i<data.size;i++) {
						$("#goodsList").html($("#goodsList").html()+'<a class="weui_cell" href="${pageContext.request.contextPath}/goodsUpdate.do?id='+data.list[i].id+'">'
				                +'<div class="weui_cell_bd weui_cell_primary">'
				                +'<p>'+data.list[i].fruit+'</p>'
				                +'</div>'
				                +'<div class="weui_cell_ft">'
				                +'</div>'
				                +'</a>');
					}

					if(data.pageNum>1){
						$("#pageBar").html('<li onclick="getAllGoods('+(data.pageNum-1)+')"><a href="#">&laquo;</a></li>');
					}
					
					var firstPage=0;
					var lastPage=0;
					if(data.pageNum-2<=0){
						if(data.pageNum-1<=0){
							firstPage = data.pageNum;
						}else {
							firstPage = data.pageNum-1;
						}
					}else {
						firstPage = data.pageNum-2;
					}
					
					if(data.pageNum+data.pageNum-firstPage>data.pages){
						lastPage = data.pages;
						if(lastPage-1>0){
							if(lastPage-2>0){
								if(lastPage-3>0){
									if(lastPage-4>0){
										firstPage = lastPage - 4;
									}else {
										firstPage = lastPage - 3;
									}
								}else {
									firstPage = lastPage - 2;
								}
							}else {
								firstPage = lastPage - 1;
							}
						}
					}else {
						if(firstPage+4<=data.pages){
							lastPage = firstPage+4;
						}else {
							lastPage = data.pages;
						}
					}
					
					for(var i = firstPage;i<=lastPage;i++){
						if(i==data.pageNum){
							$("#pageBar").html($("#pageBar").html()+'<li onclick="getAllGoods('+i+')" class="active"><a href="#">'+i+'</a></li>');
						}else {
							$("#pageBar").html($("#pageBar").html()+'<li onclick="getAllGoods('+i+')"><a href="#">'+i+'</a></li>');
						}
					}
					
					if(data.pageNum<data.pages){
						$("#pageBar").html($("#pageBar").html()+'<li onclick="getAllGoods('+(data.pageNum+1)+')"><a href="#">&raquo;</a></li>');
					}
					
					currentPage = data.pageNum;
				},
				"error" : function() {
					alert("服务器繁忙，请稍后重试");
				},
				"dataType" : "json"
			});
}
</script>
</head>
<body>
	<div class="page slideIn home">
		<div>
			<br>
			<h1 class="page_title">商品信息管理</h1>
			<p class="page_desc">LA LUNA</p>
		</div>
		<div class="weui_cells weui_cells_access" id="goodsList">
            <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>cell standard</p>
                </div>
                <div class="weui_cell_ft">
                </div>
            </a>
        </div>

        <div class="text-center">
			<ul class="pagination" id="pageBar">
					
			</ul>
		</div>
		<a href="${pageContext.request.contextPath}/goodsAdd.do" class="weui_btn weui_btn_primary">新增商品</a>
		<a href="${pageContext.request.contextPath}/index.do"
				class="weui_btn weui_btn_default">返回</a>
	</div>
</body>

<script
	src="${pageContext.request.contextPath}/static/js/cart/example.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/cart/userOrdersList.js"></script>
</html>