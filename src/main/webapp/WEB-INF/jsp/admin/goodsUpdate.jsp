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
	var id='${goodId}';
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
			<h1 class="page_title">商品信息修改</h1>
			<p class="page_desc">LA LUNA</p>
		</div>
		<div class="weui_cells">
			<div class="weui_cell">
				<div class="weui_cell_hd">
					<label class="weui_label">名称</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input id="fruit" class="weui_input" placeholder="名称" type="text">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd">
					<label class="weui_label">价格</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" id="price" type="text"
						placeholder="价格">
				</div>
			</div>
			<form id="upload_pic" action="${pageContext.request.contextPath}/upload/addPhoto.do" method="post" enctype="multipart/form-data" class="weui_cell weui_cells_form">
                <div class="weui_cell_bd weui_cell_primary">
                    <div class="weui_uploader">
                        <div class="weui_uploader_hd weui_cell">
                            <div class="weui_cell_bd weui_cell_primary">图片上传</div>
                            <div class="weui_cell_ft">0/2</div>
                        </div>
                        <div class="weui_uploader_bd">
                            <ul class="weui_uploader_files">
                                <li class="weui_uploader_file" id="picReload" style="background-image:url(http://shp.qpic.cn/weixinsrc_pic/pScBR7sbqjOBJomcuvVJ6iacVrbMJaoJZkFUIq4nzQZUIqzTKziam7ibg/)"></li>
                            </ul>
                            <input type="hidden" name="id" value="${goodId }">
                            <div class="weui_uploader_input_wrp">
                                <input name="imgfile" class="weui_uploader_input" type="file" onchange="upload_pic(this)" accept="image/jpg,image/jpeg,image/png,image/gif" multiple="">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
		</div>
		<br>
		<a href="javascript:;" class="weui_btn weui_btn_primary" onclick="updateGoods();">修改信息</a>
		<a href="${pageContext.request.contextPath }/goods/deleteGoods.do?id=${goodId}" class="weui_btn weui_btn_warn">删除</a>
		<a href="${pageContext.request.contextPath }/goodsList.do" class="weui_btn weui_btn_default">返回</a>
	</div>
</body>
<script
	src="${pageContext.request.contextPath}/static/js/cart/jquery-2.1.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/cart/example.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/admin/goodsUpdate.js"></script>
</html>