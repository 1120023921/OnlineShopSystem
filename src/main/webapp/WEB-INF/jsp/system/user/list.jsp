<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<%@ include file="/WEB-INF/jsp/system/user/form.jsp"%>
<%@ include file="/WEB-INF/jsp/system/user/selectRole.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/format.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/list.js"></script>
<script>
	$(function(){
		initGrid($('#dg'));	
	})
	function doSearch() {
		$('#dg').datagrid('load', {
			uid : $('#uid').val(),
			name : $('#name').val()
		});
	}
	function formatSex(val, row) {
		if (val == 0) {
			return '男';
		} else if (val == 1) {
			return '女';
		} else {
			return '未知';
		}
	}
</script>
</head>
<body>
	<table id="dg" class="easyui-datagrid"
		style="width: 100%; height: 515px;"
		url="${pageContext.request.contextPath}/user/list.do"
		toolbar="#toolbar" pagination="true" rownumbers="true"
		fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="uid" width="50">登录名</th>
				<th field="name" width="50">中文名</th>
				<th field="tel" width="50">电话</th>
				<th field="enabled" width="50" formatter="formatStatus">状态</th>
<!-- 				<th field="password" width="50">密码</th> -->
<!-- 				<th field="createBy" width="50">创建者</th> -->
<!-- 				<th field="updateBy" width="50">修改者</th> -->
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<div id="tb" style="padding: 3px">
			<span>登录名:</span> <input id="uid"
				style="line-height: 20px; border: 1px solid #ccc"> <span>
				中文名:</span> <input id="name"
				style="line-height: 20px; border: 1px solid #ccc"> <a
				href="#" class="easyui-linkbutton" iconCls="icon-search"
				plain="true" onclick="doSearch()">查询</a>
		</div>
		<a href="#" id="add" class="easyui-linkbutton" iconCls="icon-add"
			plain="true">新增</a> <a href="#" id="update" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改</a> <a href="#" id="remove"
			class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a> <a
			href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
			onclick="selectRole()">角色</a>
	</div>
</body>
</html>