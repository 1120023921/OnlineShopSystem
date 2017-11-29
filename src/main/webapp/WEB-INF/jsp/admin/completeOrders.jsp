<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已完成订单管理</title>
<link
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
	
<script>
var path='${pageContext.request.contextPath}';
$(document).ready(function() {
	getAllBackOrders(1);
});

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



function getAllBackOrders(pages) {

	$.ajax({
				"url" : path+'/orders/getAllCompleteOrders.do',
				data : {
					pages : pages,
					rows : 10
				},
				"type" : "POST",
				"success" : function(data) {
					$("#tableData").html("");
					$("#pageBar").html("");
					for (var i =0;i<data.size;i++) {
						$("#tableData").html($("#tableData").html()
												+ "<tr><td><a href='${pageContext.request.contextPath}/adminOrderDetail.do?order_id="+data.list[i].id+"'>"
												+ "<p>"+data.list[i].id+"</p>"
												+ "</a></td><td>"
												+ data.list[i].uid
												+ "</td><td>"
												+  getMyDate(data.list[i].time)
												+"</td><td>"
												+ data.list[i].status
												+ "</td></tr>");
					}

					if(data.pageNum>1){
						$("#pageBar").html('<li onclick="getAllBackOrders('+(data.pageNum-1)+')"><a href="#">&laquo;</a></li>');
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
							$("#pageBar").html($("#pageBar").html()+'<li onclick="getAllBackOrders('+i+')" class="active"><a href="#">'+i+'</a></li>');
						}else {
							$("#pageBar").html($("#pageBar").html()+'<li onclick="getAllBackOrders('+i+')"><a href="#">'+i+'</a></li>');
						}
					}
					
					if(data.pageNum<data.pages){
						$("#pageBar").html($("#pageBar").html()+'<li onclick="getAllBackOrders('+(data.pageNum+1)+')"><a href="#">&raquo;</a></li>');
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
	<div class="container">
		<div class="row">
			<h1 style="text-align: center;">已完成订单管理</h1>
		</div>
		<div class="row">
			<div class="">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>订单id</th>
							<th>客户</th>
							<th>下单时间</th>
							<th>订单状态</th>
						</tr>
					</thead>
					<tbody id="tableData">
						
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="row">
			<div class="text-center">
				<ul class="pagination" id="pageBar">
					
				</ul>
			</div>
		</div>
	</div>


	<script
		src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>