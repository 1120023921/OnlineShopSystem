<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>角色管理</title>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<%@ include file="/WEB-INF/jsp/system/role/form.jsp"%>
<%@ include file="/WEB-INF/jsp/system/role/selectUser.jsp"%>
<jsp:include page="/WEB-INF/jsp/system/resource/selectResource.jsp" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/format.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/list.js"></script>
</head>
<script>
$(function(){
	initGrid($('#dg'));	
})
</script>
<body>
	<table id="dg" class="easyui-datagrid"
		style="width: 100%; height: 515px;" url="${pageContext.request.contextPath}/role/list.do" toolbar="#toolbar"
		pagination="true" rownumbers="true" fitColumns="true"
		singleSelect="true">
		<thead>
			<tr>
				<th field="roid" width="50">角色ID</th>
				<th field="name" width="50">中文名</th>
				<th field="enabled" width="50" formatter="formatStatus">状态</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="#" id="add" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a> <a href="#" id="update" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改</a> <a
			href="#" id="remove" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="selectRole()">人员</a><a href="#" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="selectResource()">资源</a>
	</div>
</body>
</html>