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
<title>用户订单信息</title>
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
	var time = '${orders.time }';
	$("#orderTime").html(getTaskTime(time));
	var orderStatus = '${orders.status}';
	$("#orderStatus").html(getOrderStatus(orderStatus));
})

function getOrderStatus(status) {
	if(status==0){
		return "待发货";
	}else if (status==1) {
		return "已发货";
	}else if(status==2) {
		return "已收货";
	}else {
		return "订单状态异常";
	}
}

//获得年月日      得到日期oTime  
// function getMyDate(str){  
//     var oDate = new Date(str),  
//     oYear = oDate.getFullYear(),  
//     oMonth = oDate.getMonth()+1,  
//     oDay = oDate.getDate(),  
//     oHour = oDate.getHours(),  
//     oMin = oDate.getMinutes(),  
//     oSen = oDate.getSeconds(),  
//     oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间  
//     return oTime;  
// };  
//补0操作  
// function getzf(num){  
//     if(parseInt(num) < 10){  
//         num = '0'+num;  
//     }  
//     return num;  
// }  


//Thu Aug 18 20:38:54 CST 2016，时间格式转换  
//输出格式：yyyy-MM-dd HH:mm:ss  
//Thu Aug 18 2016 20:38:54 GMT+0800  
function getTaskTime(strDate) {   
    if(null==strDate || ""==strDate){  
        return "";  
    }  
    var dateStr=strDate.trim().split(" ");  
    var strGMT = dateStr[0]+" "+dateStr[1]+" "+dateStr[2]+" "+dateStr[5]+" "+dateStr[3]+" GMT+0800";  
    var date = new Date(Date.parse(strGMT));  
    var y = date.getFullYear();  
    var m = date.getMonth() + 1;    
    m = m < 10 ? ('0' + m) : m;  
    var d = date.getDate();    
    d = d < 10 ? ('0' + d) : d;  
    var h = date.getHours();  
    var minute = date.getMinutes();    
    minute = minute < 10 ? ('0' + minute) : minute;  
    var second = date.getSeconds();  
    second = second < 10 ? ('0' + second) : second;  
      
    return y+"-"+m+"-"+d+" "+h+":"+minute+":"+second;  
};  


</script>
</head>
<body>
	<div class="page slideIn home">
		<div>
			<br>
			<h1 class="page_title">用户订单信息</h1>
			<p class="page_desc">LA LUNA</p>
		</div>
		<div class="weui_cells">
			<div class="weui_cell">
				<div class="weui_cell_bd weui_cell_primary">
					<p>订单号</p>
				</div>
				<div class="weui_cell_ft">${orders.id }</div>
			</div>
		</div>
		<div class="weui_cells">
			<div class="weui_cell">
				<div class="weui_cell_bd weui_cell_primary">
					<p>订单时间</p>
				</div>
				<div class="weui_cell_ft" id="orderTime"></div>
			</div>
		</div>
		<div class="weui_cells">
			<div class="weui_cell">
				<div class="weui_cell_bd weui_cell_primary">
					<p>订单状态</p>
				</div>
				<div class="weui_cell_ft" id="orderStatus"></div>
			</div>
		</div>
		<div class="weui_cells">
			<div class="weui_cell">
				<div class="weui_cell_primary">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>水果</th>
								<th>数量</th>
								<th>价格</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${items }">
								<tr>
									<td>${item.goods_name }</td>
									<td>${item.num }</td>
									<td>${item.price }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="weui_cells">
			<p>总价：${orders.price }</p>
			<p>备注：${orders.remark }</p>
		</div>
		<div class="weui_cells">
			<a href="${pageContext.request.contextPath}/userOrdersList.do"
				class="weui_btn weui_btn_default">返回</a>
		</div>
	</div>
</body>

<script
	src="${pageContext.request.contextPath}/static/js/cart/example.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/cart/userOrdersList.js"></script>
</html>