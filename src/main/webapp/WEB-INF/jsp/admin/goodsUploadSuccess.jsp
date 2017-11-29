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
		<div class="page slideIn msg">
    <div class="weui_msg">
        <div class="weui_icon_area"><i class="weui_icon_msg weui_icon_success"></i></div>
        <div class="weui_text_area">
            <h2 class="weui_msg_title">商品信息修改成功</h2>
            <p class="weui_msg_desc">商品信息更新</p>
        </div>
        <div class="weui_opr_area">
            <p class="weui_btn_area">
                <a href="${pageContext.request.contextPath }/goodsList.do" class="weui_btn weui_btn_default">返回</a>
            </p>
        </div>
        <div class="weui_extra_area">
            <a href="">查看详情</a>
        </div>
    </div>
</div>
	</div>
</body>
<script
	src="${pageContext.request.contextPath}/static/js/cart/jquery-2.1.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/cart/example.js"></script>
</html>