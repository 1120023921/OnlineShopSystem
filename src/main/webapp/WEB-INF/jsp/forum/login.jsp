<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录</title>
 <meta name="viewport" content="width=device-width, initial-scale=1" />
 <link rel="Shortcut Icon" href="http://www.sunshinelin.club/static/images/title.jpg" type="image/x-icon">
    <link href="http://www.sunshinelin.club/static/css/cssReset.css" rel="stylesheet">
    <link href="http://www.sunshinelin.club/static/css/login.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/MD5.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
<div class="message">
    <img src="${pageContext.request.contextPath }/static/img/forum/logo2.png">
    <p class="p2">走马塘</p>
    <p class="p1">ZOUMATANG</p>
</div>
<div class="navs-slider">
    <a href="#" onclick="_login()" id="nav_login">登录</a>
    <a href="#" onclick="register()" id="nav_register">注册</a>
</div>
<p class="error_message"></p>
<div class="_login"  id="choseLogin">
    <form id="fm" method="post">
        <div class="div1">
            <input type="text" name="username" id="username" placeholder="用户名">
        </div>
        <div class="div2">
            <input type="password"  name="password" id="password" placeholder="密码">
        </div>

    </form>
    <input type="button" value="登录" class="submit1" onclick="login()">
</div>
<div class="_register" style="display: none" id="choseRegister">
    <form id="register_form" method="post">
        <div class="div1">
            <input type="text" name="uid" id="r_username" placeholder="用户名">
        </div>
        <div class="div1">
            <input type="text" name="name"  id="r_nickname" placeholder="昵称">
        </div>
        <div class="div1">
            <input type="password" name="password" id="r_password" placeholder="密码(密码不小于6位)">
        </div>
		<div class="div1">
            <input type="text" name="tel" id="r_mobile" placeholder="手机号">
        </div>

    </form>
    <input type="button" value="注册" class="submit1" onclick="register_button()">
</div>

</body>
<script src="http://www.sunshinelin.club/static/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="http://www.sunshinelin.club/static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script>
    //登录选择
    function _login(){
    	$(".error_message").text("");
          $("#choseLogin").show();
          $("#choseRegister").hide();
          $("#nav_login").css("color","#eb283e");
          $("#nav_register").css("color","#666");
    }
    //注册选择
    function register(){
    	$(".error_message").text("");
        $("#choseLogin").hide();
        $("#choseRegister").show();
        $("#nav_login").css("color","#666");
        $("#nav_register").css("color","#eb283e");

    }
    
    var loginUrl = '${pageContext.request.contextPath}/login.do';
	var successUrl = '${pageContext.request.contextPath}/forum/index.do';
	
	function login() {
   /*  var username=$("#username");
    var password=$("#password");
	   $.ajax({
		   type:'post',
		   data:{'username':username,'password':password},
		   url:loginUrl,
		   dataType:'json',
		   success:function(result){
			   var result = eval('(' + result + ')');
			   if(result.success){
				   window.location = successUrl;
			   }else{
				   
				   alert("登陆失败");
			   }
		   },
		   error:function(){
			   alert("请求失败");
		   }
	   }) */
		$('#fm').form('submit', {
			url : loginUrl,
			onSubmit : function() {
				$("#password")[0].value = b64_md5($("#password")[0].value);
				return $(this).form('validate');
			},
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.success) {
					if(result.role=='管理员'){
						successUrl = '${pageContext.request.contextPath}/admin/index.do'
					}
					window.location.href = successUrl;
				} else {
					$(".error_message").text(result.msg);
				}
			}
		});
	}   
	//注册
	function register_button(){
		var username = $("#r_username").val();
		var password = $("#r_password").val();
		var nickname = $("#r_nickname").val();
		var mobile = $("#r_mobile").val();
		var reg = /^[0-9A-Za-z]{6,}$/;
	
		if(!username.match("\\d+")){
			$(".error_message").text("账号必须为数字！");
			return;
		}
		if(!reg.test(password)){
			$(".error_message").text("密码长度不小于六位！");
			return;
		}
		
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/register.do',
			data:$("#register_form").serialize(),
			dataType:'json',
			success:function(result){
				if (result.msg=='注册成功') {
					$("#username").val(username);
					$("#password").val(password);
					_login();
					
					
				} else {			
					$(".error_message").text(result.msg);
				}
				
			},
			error:function(){
				$(".error_message").text("出现未知错误！");
			}
		});
	}

	

</script>
</html>