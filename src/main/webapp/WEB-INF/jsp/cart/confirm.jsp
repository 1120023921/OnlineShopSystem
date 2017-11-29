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
	getPrice();
});

function getPrice() {
	var price = '${orderVo.price }';
	$("#price").html("总价："+parseFloat(price).toFixed(2));
}
function submit() {
	window.location.href='${pageContext.request.contextPath}/orders/submit.do?remark='+$("#remark").val();
}
</script>
</head>
<body>
	<div class="page slideIn home">
		<div>
			<br>
			<h1 class="page_title">用户订单确认</h1>
			<p class="page_desc">LA LUNA</p>
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
							<c:forEach var="map" items="${orderVo.map }">
								<tr>
									<td>${map.value.goods_name }</td>
									<td>${map.value.num }</td>
									<td>${map.value.price }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="weui_cells">
			<p id="price">总价：${orderVo.price }</p>
		</div>
		<div class="weui_cells weui_cells_form">
            <div class="weui_cell">
                <div class="weui_cell_bd weui_cell_primary">
                    <textarea class="weui_textarea" id="remark" placeholder="备注" rows="3"></textarea>
                    <div class="weui_textarea_counter"><span>0</span>/200</div>
                </div>
            </div>
        </div>
		<div class="weui_cells">
		<a href="javascript:void(0)" onclick="submit();" class="weui_btn weui_btn_primary">提交订单</a>
			<a href="${pageContext.request.contextPath}/cart.do"
				class="weui_btn weui_btn_default">返回</a>
		</div>
	</div>
</body>

<script
	src="${pageContext.request.contextPath}/static/js/cart/example.js"></script>
</html>