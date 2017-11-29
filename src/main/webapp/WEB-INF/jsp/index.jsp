<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>系统首页</title>
    <link href="${pageContext.request.contextPath}/insadmin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/insadmin/font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- Gritter -->
   <link href="${pageContext.request.contextPath}/insadmin/css/style.css" rel="stylesheet">
</head>

<body>
<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/insadmin/img/profile_small.jpg" />
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="${pageContext.request.contextPath}/index.do#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${user.name}</strong>
                             </span> <span class="text-muted text-xs block">我的资料<b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="#">文件</a></li>
                            <li><a href="#">联系</a></li>
                            <li><a href="#">邮件</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/logout.do" onclick="login()">登出</a></li>
                        </ul>

                    </div>
                    <div class="logo-element">
                        ZW+
                    </div>
                </li>

                <li class="active">
                    <a href="${pageContext.request.contextPath}/index.do#"><i class="fa fa-th-large"></i> <span class="nav-label">系统首页</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="#" onclick="menuClick('${pageContext.request.contextPath}/druid')">系统监控</a></li>
                        <li><a href="#" onclick="menuClick('${pageContext.request.contextPath}/resource/render.do')">资源管理</a></li>
                        <li><a href="#" onclick="menuClick('${pageContext.request.contextPath}/role/render.do')">角色管理</a></li>
                        <li><a href="#" onclick="menuClick('${pageContext.request.contextPath}/user/render.do')">用户管理</a></li>
                   </ul>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/index.do#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">订单管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="#" onclick="menuClick('${pageContext.request.contextPath}/backOrders.do')">待发货订单管理</a></li>
                        <li><a href="#" onclick="menuClick('${pageContext.request.contextPath}/sendOrders.do')">已发货订单管理</a></li>
                        <li><a href="#" onclick="menuClick('${pageContext.request.contextPath}/completeOrders.do')">已完成订单管理</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/index.do#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">商品管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="#" onclick="menuClick('${pageContext.request.contextPath}/goodsList.do')">商品管理</a></li>
                    </ul>
                </li>
            </ul>

        </div>
    </nav>

        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="${pageContext.request.contextPath}/index.do#"><i class="fa fa-bars"></i> </a>
             <form role="search" class="navbar-form-custom" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>
            </form> 
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <span class="m-r-sm text-muted welcome-message">欢迎登陆本系统</span>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/logout.do" onclick="login()">
                        <i class="fa fa-sign-out"></i>登出
                    </a>
                </li>
            </ul>
        </nav>
        </div>
            <div class="wrapper wrapper-content">
                <div class="row">
            <iframe id="iframe" name = "frame" src="${pageContext.request.contextPath}/user/render.do" width="100%"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
               </div>
            <div class="footer">
            <div class="pull-right">
                                   最终<strong>解释权</strong>叔果联盟
            </div>
            <div>
                <strong>版权</strong>DoubleH &copy; 2017-2018
            </div>
        </div>
        </div>
      </div>

    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/insadmin/js/jquery-2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/insadmin/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/insadmin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/insadmin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <!-- Custom and plugin javascript -->
    <script src="${pageContext.request.contextPath}/insadmin/js/inspinia.js"></script>
    <script src="${pageContext.request.contextPath}/insadmin/js/plugins/pace/pace.min.js"></script>
    <!-- jQuery UI -->
    <script src="${pageContext.request.contextPath}/insadmin/js/plugins/jquery-ui/jquery-ui.min.js"></script>

<script type="text/javascript">
        $(function() {
            var height=document.documentElement.clientHeight;
            document.getElementById('iframe').style.height=height+'px';
        });

        var menuClick = function(menuUrl) {
            $("#iframe").attr('src',menuUrl);
        };
</script>

</body>
</html>



