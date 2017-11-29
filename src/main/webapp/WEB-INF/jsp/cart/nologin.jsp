<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>LA LUNA|登录</title>
<script>
var path='${pageContext.request.contextPath }';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/cart/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/cart/jquerySession.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/cart/shopping.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/cart/base.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/cart/module.css"  />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/MD5.js"></script>
<script>
$(document).ready(function(){
	$('#login_m').modal('show');
});

function login2(){
	$("#login_password").val(b64_md5($("#login_password").val()));
	$.ajax({
		url : path+'/login.do',
		type : 'post',
		data : {
			username:$("#login_username").val(),
			password:$("#login_password").val()
		},
		dataType : 'json',
		success : function(data) {
			if(data.success==true){
				window.location.href='${pageContext.request.contextPath}/orders/submit.do?remark=${remark}'
			}else {
				alert(data.msg);
			}
		},
		error : function() {
			alert("请求失败");
		}
	})
}
</script>
</head>
<body>

<!--头部开始-->
<div class="header">
	<h1>购物车</h1>
	<a href="${pageContext.request.contextPath}/cart.do" class="back"><span></span></a>
	<a href="${pageContext.request.contextPath}/cart.do" class=""></a>
</div>
<!--头部结束-->
<div class="shopping">
	<div class="shop-group-item">
		<div class="shop-name">
<!-- 			<input type="checkbox" class="check goods-check shopCheck"> -->
			<h4><a href="#">LA LUNA</a></h4>
			<div class="coupons" id="log"><a href="#" data-toggle="modal" data-target="#login_m">登录</a></div>
		</div>
		<ul id="items">
			<li>
				<h1 style="text-align: center;">请先登录</h1>
			</li>
		</ul>
<!-- 		<div class="shopPrice">本店总计：￥<span class="shop-total-amount ShopTotal">0.00</span></div> -->
	</div>
</div>

<div class="payment-bar">
<!-- 	<div class="all-checkbox"><input type="checkbox" class="check goods-check" id="AllCheck">全选</div> -->
	<div class="shop-total">
		<strong>总价：<i class="total" id="AllTotal">0.00</i></strong>
		<span>减免：0.00</span>
	</div>
	<a href="${pageContext.request.contextPath }/orders/submit.do" class="settlement">结算</a>
</div>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p></p>
<p>LA LUNA</p>
</div>
</body>
<!-- 模态框（Modal） -->
<div class="modal fade" id="login_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">LA LUNA|登录</h4>
            </div>
            <div class="modal-body">
            	<div class="input-group">
		            <span class="input-group-addon">用户名</span>
		            <input type="text" id="login_username" name="username" class="form-control" placeholder="用户名">
		        </div>
		        <br>
		        <div class="input-group">
		            <span class="input-group-addon">密&nbsp;&nbsp;码</span>
		            <input type="password" id="login_password" name="password" class="form-control" placeholder="密&nbsp;&nbsp;码">
		        </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="login2();">登录</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</html>