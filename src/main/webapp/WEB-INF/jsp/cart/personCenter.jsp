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
<title>个人中心</title>
<script>
	var path = '${pageContext.request.contextPath }';
</script>
<!-- head 中 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/cart/weui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/cart/example.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/MD5.js"></script>
</head>
<body>
	<div class="container js_container">
		<div class="hd">
			<h1 class="page_title">个人中心</h1>
			<p class="page_desc">LA LUNA</p>
		</div>
		<div class="bd">
			<div class="weui_grids">
				<a href="${pageContext.request.contextPath}/receiveInfo.do" class="weui_grid js_grid" data-id="button">
					<div class="weui_grid_icon">
						<img src="${pageContext.request.contextPath}/static/img/cart/receive.png" alt="">
					</div>
					<p class="weui_grid_label">收货信息</p>
				</a> 
				<a href="${pageContext.request.contextPath}/userOrdersList.do" class="weui_grid js_grid" data-id="cell">
					<div class="weui_grid_icon">
						<img src="${pageContext.request.contextPath}/static/img/cart/orders.png" alt="">
					</div>
					<p class="weui_grid_label">订单信息</p>
				</a> 
				<a href="${pageContext.request.contextPath}/safeCenter.do" class="weui_grid js_grid" data-id="toast">
					<div class="weui_grid_icon">
						<img src="${pageContext.request.contextPath}/static/img/cart/safe.png" alt="">
					</div>
					<p class="weui_grid_label">安全中心</p>
				</a>
				<a href="${pageContext.request.contextPath}/cart.do" class="weui_grid js_grid" data-id="toast">
					<div class="weui_grid_icon">
						<img src="${pageContext.request.contextPath}/static/img/cart/cart.png" alt="">
					</div>
					<p class="weui_grid_label">返回商城</p>
				</a>
				<a href="${pageContext.request.contextPath}/logout.do" class="weui_grid js_grid" data-id="toast">
					<div class="weui_grid_icon">
						<img src="${pageContext.request.contextPath}/static/img/cart/logout.png" alt="">
					</div>
					<p class="weui_grid_label">注销</p>
				</a>
			</div>
		</div>
	</div>
</body>
<script
	src="${pageContext.request.contextPath}/static/js/cart/jquery-2.1.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/cart/example.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/cart/personInfo.js"></script>
</html>