<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>LA LUNA</title>
<script>
var path='${pageContext.request.contextPath }';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/cart/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/cart/jquerySession.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/cart/shopping.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/cart/base.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/cart/module.css"  />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/MD5.js"></script>

</head>
<body>

<!--头部开始-->
<div class="header">
	<h1>购物车</h1>
	<a href="#" class="back"><span></span></a>
	<a href="#" class=""></a>
</div>
<!--头部结束-->
<div class="shopping">
	<div class="shop-group-item">
		<div class="shop-name">
<!-- 			<input type="checkbox" class="check goods-check shopCheck"> -->
			<h4><a href="#">LA LUNA</a></h4>
			<div class="coupons" id="log">
				<c:choose>
					<c:when test="${user==null }">
						<a href="#" data-toggle="modal" data-target="#login_m">登录</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath }/personCenter.do">${user.name }</a>|<a href="${pageContext.request.contextPath }/logout.do">注销</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<ul id="items">
<!-- 			<li> -->
<!-- 				<div class="shop-info"> -->
<!-- 					<input type="checkbox" class="check goods-check goodsCheck" checked="checked" style="display: none;"> -->
<%-- 					<div class="shop-info-img"><a href="#"><img src="${pageContext.request.contextPath }/static/img/cart/computer.jpg" /></a></div> --%>
<!-- 					<div class="shop-info-text"> -->
<!-- 						<h4>苹果</h4> -->
<!-- 						<div class="shop-brief"><span>	单位：每斤</span></div> -->
<!-- 						<div class="shop-price"> -->
<!-- 							<div class="shop-pices">￥<b class="price">2.55</b></div> -->
<!-- 							<div class="shop-arithmetic"> -->
<!-- 								<a href="javascript:;" class="minus">-</a> -->
<!-- 								<span class="num" >0</span> -->
<!-- 								<a href="javascript:;" class="plus">+</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</li> -->
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
	<a href="javascript:void(0)" onclick="submit();" class="settlement">结算</a>
</div>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>售后群：479904471</p>
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
                <button type="button" class="btn btn-default" id="login_m_register" onclick="register_m();">注册</button>
                <button type="button" class="btn btn-primary" onclick="login();">登录</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="register_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">LA LUNA|注册</h4>
            </div>
            <div class="modal-body">
            	<div class="input-group">
		            <span class="input-group-addon">用户名</span>
		            <input type="text" id="uid" name="uid" class="form-control" required="required" placeholder="用户名">
		        </div>
		        <br>
		        <div class="input-group">
		            <span class="input-group-addon">密&nbsp;&nbsp;码</span>
		            <input type="password" id="register_password" name="password" required="required" class="form-control" placeholder="密&nbsp;&nbsp;码">
		        </div>
		        <br>
		        <div class="input-group">
		            <span class="input-group-addon">重复密码</span>
		            <input type="password" id="register_password_reply" required="required" name="password" class="form-control" placeholder="重复密码">
		        </div>
		        <br>
		        <div class="input-group">
		            <span class="input-group-addon">称&nbsp;&nbsp;呼</span>
		            <input type="text" id="name" name="name" class="form-control" required="required" placeholder="称&nbsp;&nbsp;呼">
		        </div>
		        <br>
		        <div class="input-group">
		            <span class="input-group-addon">联系方式</span>
		            <input type="text" id="tel" name="tel" class="form-control" required="required" placeholder="联系方式">
		        </div>
		        <br>
		        <div class="input-group">
		            <span class="input-group-addon">收货地址</span>
		            <input type="text" id="address" name="address" required="required" class="form-control" placeholder="收货地址">
		        </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="register();">注册</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</html>