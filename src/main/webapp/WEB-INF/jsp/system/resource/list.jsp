<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>资源管理</title>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<%@ include file="/WEB-INF/jsp/system/resource/form.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/format.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/list.js"></script>
<script>
$(function(){
	initGrid($('#dg'),true);	
})
function formatType(val, row) {
		if (val == 0) {
			return '菜单';
		} else if (val == 1) {
			return '后台';
		} else {
			return '未知';
		}
	}
</script>
</head>
<body>
	<table id="dg" class="easyui-treegrid"
		style="width: 100%; height: 515px;" url="${pageContext.request.contextPath}/resource/list.do" toolbar="#toolbar" rownumbers="true" fitColumns="true"
		singleSelect="true" idField="id" treeField="name">
		<thead>
			<tr>
				<th field="reid" width="50">资源ID</th>
				<th field="name" width="50">中文名</th>
				<th field="type" width="50" formatter="formatType">类型</th>
				<th field="value" width="50">值</th>
				<th field="enabled" width="50" formatter="formatStatus">状态</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="#" id="add" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a> <a href="#" id="update" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改</a> <a href="#" id="remove" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
</body>
</html>