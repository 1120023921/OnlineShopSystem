<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>走马塘 &mdash; 中国进士第一村</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/forum/replyframe.css">



</head>
<body>
	<div class="row">
		<div class="nav-header">
			<h1 id="">
				<a href="${pageContext.request.contextPath }"><img
					style="width: 75px;"
					src="${pageContext.request.contextPath}/static/img/introduce/logo.png"
					alt=""/></a>
			</h1>
			<ul>
				<li><a href="${pageContext.request.contextPath }/introduce.do">走进走马塘</a></li>
				<li><a href="${pageContext.request.contextPath }/dictionary.do">进士字典</a></li>
				<li><a href="${pageContext.request.contextPath }/scenery.do">风光古迹</a></li>
				<li><a href="${pageContext.request.contextPath }/plan.do">展望未来</a></li>
				<li><a class="active" style="color:white;" href="${pageContext.request.contextPath }/forum/index.do">游客日记</a></li>
				<c:choose>
					<c:when test="${empty user}">
						<li><a
							href="${pageContext.request.contextPath }/forum/render.do">登录</a></li>
					</c:when>
					<c:otherwise>
						<li><a
							href="${pageContext.request.contextPath }/logout.do">${user.name }</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</body>
</html>