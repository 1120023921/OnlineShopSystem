<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="${pageContext.request.contextPath }/static/css/forum/cssReset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/forum/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/forum/liuyan.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/static/js/forum/jquery-2.1.4.min.js"></script>
    <title>留言</title>
</head>
<body id="body">
<%@include file="forum_context.jsp" %>
<div class="liuyan">
    <p class="p1">写下你要留言的话</p>

        <textarea class="neirong" name="str" id="neirong"></textarea>
        <a href="#" onclick="submitMessage()">
        <div class="submit1">
            <p>发布</p>
        </div>
        </a>
</div>
<div class="daohang">
    <ul>
        <li><a href="#">全部</a></li>
        <!-- <li><a href="#">我的留言</a></li> -->
    </ul>

</div>
<div class="box" id="box">
  <p class="p1">内容</p>
  
</div>

<div class="loading" id="load1">
<div class="div1">
  <img src="http://www.sunshinelin.club/static/images/load.gif">
  <div style="float:left;margin:3px;">正在加载中，请稍后...</div>
</div>  
</div>

<div class="loading" id="load2" style="display:none;">
<div class="div1">
  <div style="float:left;margin:3px;"> &nbsp;&nbsp;&nbsp;&nbsp;已全部加载</div>
</div>  
</div>
</body>
<script>
 $(document).ready(function(){
	 initMessage(1,10);
	 
	
 });
 var page =1;
 var rows =10;
 $(window).scroll(function () {
	    if ($(document).scrollTop() + $(window).height() >= $(document).height()) {
	    	page++;	       
	        initMessage(page,rows);
	        
	    }
	});
 
 //展示消息列表
 function initMessage(page,rows){
	 var str;
	 $.ajax({
		type:'post',
		url:'${pageContext.request.contextPath }/tieZi/getAllPage.do',
		data:{'pages':page,'rows':rows},
		dataType:'json',
		success:function(data){
			if(data.size==0){
				$("#load1").hide();
				$("#load2").show();
			}
			$.each(data.list,function(i,item){
				$("#box").append('<div class="center">'+
					      '<img src="http://www.sunshinelin.club/static/images/za9_img.jpg">'+
					      '<div class="wenzi">'+
					          '<p class="name">'+item.nickname+'</p>'+
					          '<p class="time">'+item.time+'</p>'+
					          '<p class="text">'+item.context+'</p>'+
					      '</div>'+

					  '</div>'+
					      '<div class="pinglun">'+
				        '<button class="pinglun_button" ></button>'+
				        '<div class="text"></div>'+
				    '</div>'
						);
			});
		},
		error:function(){
		   alert("请求失败");
		},
		 
	 });
	 
	 
 }
 
 
 function submitMessage(){
	 var str = $("#neirong").val();
	if(str==""){
		alert("留言不能为空！");
		return;
	}
	 $.ajax({
			type:'post',
			url:'${pageContext.request.contextPath }/tieZi/faTie.do',
			data:{'context':str},
			dataType:'json',
			success:function(data){
				alert(data);
				window.location.reload(); 
			},
			error:function(){
			   alert("请求失败");
			},
			 
		 });
		 
	
 }

</script>
</html>