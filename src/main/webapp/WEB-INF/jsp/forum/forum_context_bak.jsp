<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帖子信息</title>
<link
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
<!-- <script>
	var tieZiId = '${tieZi.id }';
	$.ajax({
		'url':'/mis/tieZi/getTieZiByIdJson.do',
		'data':{
			id:tieZiId
		},
		'type':'POST',
		'success': function(data) {
			showAllTieZi(data.followTieZi);
		},
		'error' : function() {
			alert("服务器繁忙，请稍后重试");
		},
		'dataType' : 'json'
	});
	
	function showAllTieZi(obj) {
		for(var i=0;i<obj.length;i++){
			
			showTieZi(obj[i]);
			
		}
	}
	
	function showTieZi(obj) {
		
		if(obj.followTieZi.length>0){
			$("#reply").html($("#reply").html()+'<div style="" class="col-md-6">'+
					'<h1 style="display: inline;">'+obj.title+'&nbsp;&nbsp;</h1>'+
					'<h3 style="display: inline;">'+obj.username+'</h3>'+
					'<h5>'+obj.time+'</h5>'+
					'<p>'+obj.context+'</p>'+
				'</div>');
			showAllTieZi(obj.followTieZi);
		}else {
			$("#reply").html($("#reply").html()+'<div style="" class="col-md-6">'+
					'<h1 style="display: inline;">'+obj.title+'&nbsp;&nbsp;</h1>'+
					'<h3 style="display: inline;">'+obj.username+'</h3>'+
					'<h5>'+obj.time+'</h5>'+
					'<p>'+obj.context+'</p>'+
				'</div>');
		}
		
	}
</script> -->


<script>

var tieZiId = '${tieZi.id}';

$(document).ready(function() {
	getTieZiInfo(1,tieZiId);
});

function deleteReply(obj) {
	var res=confirm("确认删除吗？");
	if(res==false){
		return;
	}
	$.ajax({
		'url':'/mis/tieZi/deleteReply.do',
		'data':{
			id:$(obj).attr("replyId"),
		},
		'type':'POST',
		'success': function(data) {
			alert(data);
			getTieZiInfo(currentPage,tieZiId);
		},
		'error' : function() {
			alert("服务器繁忙，请稍后重试");
		},
	  	'dataType' : 'json'
	});
}

function getTieZiInfo(pages,tieZiId) {

	$.ajax({
				"url" : '/mis/tieZi/adminTieZiJson.do',
				data : {
					id:tieZiId,
					pages : pages,
					rows : 10
				},
				"type" : "POST",
				"success" : function(data) {
					$("#reply").html("");
					$("#pageBar").html("");
					for (var i =0;i<data.size;i++) {
						$("#reply").html($("#reply").html()+'<div class="row">'
								+'<div class="panel panel-success">'
								+'<div class="panel-heading">'
								+'<h3 style="display: inline;">'+data.list[i].title+'&nbsp;&nbsp;'
								+'<h4 style="display: inline;">'+data.list[i].username+'</h4>'
								+'</h3>'
								+'<h5>'+data.list[i].time+'</h5>'
								+'</div>'
								+'<div class="panel-body">'
								+'<div class="row">'
								+data.list[i].context
								+'</div>'
								+'<div class="row">'
								+'</div>'
								+'</div>'
								+'</div>'
								+'</div>');
					}

					if(data.pageNum>1){
						$("#pageBar").html('<li onclick="getTieZiInfo('+(data.pageNum-1)+','+tieZiId+')"><a href="#">&laquo;</a></li>');
					}
					
					var firstPage=0;
					var lastPage=0;
					if(data.pageNum-2<=0){
						if(data.pageNum-1<=0){
							firstPage = data.pageNum;
						}else {
							firstPage = data.pageNum-1;
						}
					}else {
						firstPage = data.pageNum-2;
					}
					
					if(data.pageNum+data.pageNum-firstPage>data.pages){
						lastPage = data.pages;
					}else {
						if(firstPage+4<=data.pages){
							lastPage = firstPage+4;
						}else {
							lastPage = data.pages;
						}
					}
					
					for(var i = firstPage;i<=lastPage;i++){
						if(i==data.pageNum){
							$("#pageBar").html($("#pageBar").html()+'<li onclick="getTieZiInfo('+i+','+tieZiId+')" class="active"><a href="#">'+i+'</a></li>');
						}else {
							$("#pageBar").html($("#pageBar").html()+'<li onclick="getTieZiInfo('+i+','+tieZiId+')"><a href="#">'+i+'</a></li>');
						}
					}
					
					if(data.pageNum<data.pages){
						$("#pageBar").html($("#pageBar").html()+'<li onclick="getTieZiInfo('+(data.pageNum+1)+','+tieZiId+')"><a href="#">&raquo;</a></li>');
					}
					
					currentPage = data.pageNum;
				},
				"error" : function() {
					alert("服务器繁忙，请稍后重试");
				},
				"dataType" : "json"
			});
}
</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 style="display: inline;">${tieZi.title }&nbsp;&nbsp;</h3>
					<h4 style="display: inline;">${tieZi.username }</h4>
					<h5>${tieZi.time }</h5>
				</div>
				<div class="panel-body">${tieZi.context }</div>
			</div>
		</div>

		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h5>回复</h5>
				</div>
				<div class="panel-body" id="reply">
				
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-4 col-xs-offset-4">
				<ul class="pagination" id="pageBar">
					
				</ul>
			</div>
		</div>
	</div>


	<script
		src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>