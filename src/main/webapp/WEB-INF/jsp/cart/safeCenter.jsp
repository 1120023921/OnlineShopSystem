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
			<div class="weui_cell">
				<div class="weui_cell_hd">
					<label class="weui_label">旧密码</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input id="oldPassword" class="weui_input" placeholder="旧密码" type="password">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd">
					<label class="weui_label">新密码</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" id="newPassword" type="password"
						placeholder="新密码">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd">
					<label class="weui_label">重复密码</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" id="newPasswordReply" type="password"
						placeholder="重复密码">
				</div>
			</div>
		</div>
		<br>
		<a href="javascript:;" class="weui_btn weui_btn_primary" onclick="checkOldPassword();">修改密码</a>
		<a href="${pageContext.request.contextPath }/personCenter.do" class="weui_btn weui_btn_default">返回</a>
	</div>
</body>
<script
	src="${pageContext.request.contextPath}/static/js/cart/jquery-2.1.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/cart/example.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/cart/safeCenter.js"></script>
</html>