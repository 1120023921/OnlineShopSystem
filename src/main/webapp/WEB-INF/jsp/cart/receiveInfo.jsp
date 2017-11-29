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
	<div class="container js_container page slideIn home">
		<div>
			<br>
			<h1 class="page_title">收货信息</h1>
			<p class="page_desc">LA LUNA</p>
		</div>
		<div class="weui_cells weui_cells_form">
			<input id=uid type="hidden" value="${user.uid }">
			<div class="weui_cell">
				<div class="weui_cell_hd">
					<label class="weui_label">称呼</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input id=name class="weui_input" placeholder="称呼">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd">
					<label class="weui_label">手机</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input id="tel" class="weui_input" type="number" pattern="[0-9]*"
						placeholder="手机">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd">
					<label class="weui_label">地址</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input id="address" class="weui_input"
						placeholder="地址">
				</div>
			</div>
		</div>
		<br>
		<a href="javascript:void(0)" class="weui_btn weui_btn_primary" onclick="updatePersonInfo();">修改收货信息</a>
		<a href="${pageContext.request.contextPath }/personCenter.do" class="weui_btn weui_btn_default">返回</a>
	</div>
</body>
<script
	src="${pageContext.request.contextPath}/static/js/cart/jquery-2.1.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/cart/example.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/cart/personInfo.js"></script>
</html>