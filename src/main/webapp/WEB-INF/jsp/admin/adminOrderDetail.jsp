<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详细详细</title>
<link
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/static/css/forum/reply.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<h1 style="text-align: center;">订单详细信息</h1>
		</div>
		<div class="row">
			<h2>订单号：${orders.id }</h2>
			<h3>客户：${user.name }&nbsp;&nbsp;&nbsp;&nbsp;联系方式：${user.tel }</h3>
			<h3>送货地址：${user.address }</h3>
		</div>
		<div class="row">
			<div class="col-xs-12 col-lg-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>水果</th>
							<th>数量</th>
							<th>单价</th>
							<th>总价 </th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${items }">
							<tr>
								<td>${item.goods_name }</td>
								<td>${item.num }</td>
								<td>${item.eachprice }</td>
								<td>${item.price }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div style="float: right;">
				<h1>订单总价：${orders.price }</h1>
			</div>
		</div>
		<div class="row">
			<div>
				<h3>备注：${orders.remark }</h3>
			</div>
		</div>
	</div>


	<script
		src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>