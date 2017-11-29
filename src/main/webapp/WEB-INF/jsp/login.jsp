<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
       <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/supersized.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/stylee.css">
    <script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery-easyui-1.4.4/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script type="text/javascript">
	var loginUrl = 'login.do';
	var successUrl = 'index.do';
	function login() {
		$('#fm').form('submit', {
			url : loginUrl,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.success) {
					window.location = successUrl;
				} else {
					$("#err").html(result.msg);
				}
			}
		});
	}
	
</script>
</head>

<body>
<%-- <jsp:include page="head.jsp"></jsp:include> --%>
<div class="page-container">
            <h1>登录</h1>
            <form id="fm" method="post">
                <input type="text" name="username" id="usernamee" class="username" placeholder="用户名">
                <input type="password" name="password" class="password" placeholder="密码">
                <button type="button" onclick="login();">提交</button>
                <div class="error"><span>+</span></div> 
                <div style="width:50%;height:50%;margin:15px 70px;"><span id="err"></span></div>
            </form>
            <div class="connect">
                <p>Or connect with:</p>
                <p>
                    <a class="facebook" href=""></a>
                    <a class="twitter" href=""></a>
                </p>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/supersized.3.2.7.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/supersized-init.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/scripts.js"></script>
		</body>
<script type="text/javascript">
  var path = "${pageContext.request.contextPath}";
</script>
</html>