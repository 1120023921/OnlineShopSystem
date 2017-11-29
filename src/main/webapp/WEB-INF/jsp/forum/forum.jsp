<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- Dropdown Menu -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/forum/superfish.css">
<!-- Owl Slider -->
<!-- <link rel="stylesheet" href="css/owl.carousel.css"> -->
<!-- <link rel="stylesheet" href="css/owl.theme.default.min.css"> -->
<!-- Date Picker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/forum/bootstrap-datepicker.min.css">
<!-- CS Select -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/forum/cs-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/forum/cs-skin-border.css">

<!-- Themify Icons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/forum/themify-icons.css">
<!-- Flat Icon -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/forum/flaticon.css">
<!-- Icomoon -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/forum/icomoon.css">
<!-- Flexslider  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/forum/flexslider.css">

<!-- Style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/forum/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/forum/reply.css">

<!-- Modernizr JS -->
<script
	src="${pageContext.request.contextPath}/static/js/forum/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<script
	src="${pageContext.request.contextPath}/static/js/forum/jquery-2.1.4.min.js"></script>

<script>
        function GetQueryString(name)
        {
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)return  unescape(r[2]);
            return null;
        }
        
        $(document).ready(function() {
        	getTieZiInfo(1);
        });
        
        function getTieZiInfo(pages) {

        	$.ajax({
        				"url" : '/mis/tieZi/adminGetTieZiList.do',
        				data : {
        					pages : pages,
        					rows : 10
        				},
        				"type" : "POST",
        				"success" : function(data) {
        					$("#tableData").html("");
        					$("#pageBar").html("");
        					for (var i =0;i<data.size;i++) {
        						$("#tableData").html($("#tableData").html()+'<tr>'
        								+'<td><a href="${pageContext.request.contextPath}/tieZi/userTieZi.do?pages=1&rows=10&id='+data.list[i].id+'">'+data.list[i].title+'</a></td>'
        								+'<td><span style="float: right;">'+data.list[i].username+'</span></td>'
        								+'</tr>');
        					}

        					if(data.pageNum>1){
        						$("#pageBar").html('<li onclick="getTieZiInfo('+(data.pageNum-1)+')"><a style="height: 40px;" href="#">&laquo;</a></li>');
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
        						if(lastPage-1>0){
        							if(lastPage-2>0){
        								if(lastPage-3>0){
        									if(lastPage-4>0){
        										firstPage = lastPage - 4;
        									}else {
        										firstPage = lastPage - 3;
        									}
        								}else {
        									firstPage = lastPage - 2;
        								}
        							}else {
        								firstPage = lastPage - 1;
        							}
        						}
        					}else {
        						if(firstPage+4<=data.pages){
        							lastPage = firstPage+4;
        						}else {
        							lastPage = data.pages;
        						}
        					}
        					
        					for(var i = firstPage;i<=lastPage;i++){
        						if(i==data.pageNum){
        							$("#pageBar").html($("#pageBar").html()+'<li onclick="getTieZiInfo('+i+')" class="active"><a style="height: 40px;" href="#">'+i+'</a></li>');
        						}else {
        							$("#pageBar").html($("#pageBar").html()+'<li onclick="getTieZiInfo('+i+')"><a style="height: 40px;" href="#">'+i+'</a></li>');
        						}
        					}
        					
        					if(data.pageNum<data.pages){
        						$("#pageBar").html($("#pageBar").html()+'<li onclick="getTieZiInfo('+(data.pageNum+1)+')"><a style="height: 40px;" href="#">&raquo;</a></li>');
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
<body class="container-fluid">
	<div class="container-fluid"
		style="background-image: url('${pageContext.request.contextPath}/static/img/forum/nav_bg.jpg');">

		<div class="container">
			<div class="row">
				<div class="nav-header">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>

					<h1 id="fh5co-logo">
						<a href="../../index.html"><img
							src="${pageContext.request.contextPath}/static/img/forum/zt.png"
							alt="" /></a>
					</h1>
					<nav id="fh5co-menu-wrap" role="navigation">
						<ul class="sf-menu" id="fh5co-primary-menu">
							<li><a class="active" href="../Introduce/introduce.html">走进走马塘</a></li>
							<li><a href="../Dictionaries/dictionary.html">进士字典</a></li>
							<li><a href="../Scenery/scenery.html">风光古迹</a></li>
							<li><a href="../Plan/plan.html">展望未来</a></li>
							<li><a href="../Forum/forum.html">游客日记</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="">
		<div class="row">
			<div class="col-xs-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>标题</th>
							<th><span style="float: right;">用户</span></th>
						</tr>
					</thead>
					<tbody id="tableData">
						
					</tbody>
				</table>
			</div>
		</div>

		<div class="row">
			<div id="qq" style="opacity: 0.95;">
				<p>有什么新鲜事想告诉大家?</p>
				<div class="message" contenteditable="true"></div>

				<div class="But">
					<span class="submit">发表</span>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-5 col-xs-offset-5">
				<ul class="pagination" id="pageBar">

				</ul>
			</div>
		</div>
	</div>


	<!-- Javascripts -->
	<script
		src="${pageContext.request.contextPath}/static/js/forum/jquery-2.1.4.min.js"></script>

	<script>
    var res =GetQueryString("id");
    if(res==1){
        $("#zm1").addClass("active");
    }else if(res==2){
        $("#zm2").addClass("active");
    }else if(res==3){
        $("#zm3").addClass("active");
    }else if(res==4){
        $("#zm4").addClass("active");
    }else if(res==5){
        $("#zm5").addClass("active");
    }else if(res==6){
        $("#zm6").addClass("active");
    }

    if(res==1){
        $("#zjz1").addClass("tab-content active show");
    }else if(res==2){
        $("#zjz2").addClass("tab-content active show");
    }else if(res==3){
        $("#zjz3").addClass("tab-content active show");
    }else if(res==4){
        $("#zjz4").addClass("tab-content active show");
    }else if(res==5){
        $("#zjz5").addClass("tab-content active show");
    }else if(res==6){
        $("#zjz6").addClass("tab-content active show");
    }

</script>

	<!-- Dropdown Menu -->
	<script
		src="${pageContext.request.contextPath}/static/js/forum/hoverIntent.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/forum/superfish.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/static/js/forum/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script
		src="${pageContext.request.contextPath}/static/js/forum/jquery.waypoints.min.js"></script>
	<!-- Counters -->
	<script
		src="${pageContext.request.contextPath}/static/js/forum/jquery.countTo.js"></script>
	<!-- Stellar Parallax -->
	<script
		src="${pageContext.request.contextPath}/static/js/forum/jquery.stellar.min.js"></script>
	<!-- Owl Slider -->
	<!-- // <script src="js/owl.carousel.min.js"></script> -->
	<!-- Date Picker -->
	<script
		src="${pageContext.request.contextPath}/static/js/forum/bootstrap-datepicker.min.js"></script>
	<!-- CS Select -->
	<script
		src="${pageContext.request.contextPath}/static/js/forum/classie.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/forum/selectFx.js"></script>
	<!-- Flexslider -->
	<script
		src="${pageContext.request.contextPath}/static/js/forum/jquery.flexslider-min.js"></script>

	<script
		src="${pageContext.request.contextPath}/static/js/forum/custom.js"></script>

	<script
		src="${pageContext.request.contextPath}/static/js/forum/reply.js"></script>

</body>
</html>