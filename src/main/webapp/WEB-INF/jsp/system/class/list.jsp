<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教室管理</title>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<%@ include file="/WEB-INF/jsp/system/class/form.jsp"%>

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
			cid : $('#cid').val(),
	
		});
	}
</script>
</head>
<body>
	<table id="dg" class="easyui-datagrid"
		style="width: 100%; height: 515px;"
		url="${pageContext.request.contextPath}/class/listBy.do"
		toolbar="#toolbar" pagination="true" rownumbers="true"
		fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="cid" width="50">教室编号</th>
				<th field="sit" width="50">座位数</th>
				<th field="zjbrand" width="50">主机品牌</th>
				<th field="zjtype" width="50">主机型号</th>
				<th field="zjinstrumentnum" width="50">主机仪器号</th>
				<th field="zjstartdate" width="50">主机启用日期</th>
				<th field="protect" width="50">保护方式</th>
				<th field="attention" width="50">注意事项</th>
				<th field="tybrand" width="50">投影机品牌</th>
				<th field="tytype" width="50">投影机型号</th>
				<th field="tyinstrumentnum" width="50">投影机仪器号</th>
				<th field="tystartdate" width="50">投影机启用日期</th>
				<th field="bulbstartdate" width="50">灯泡启用日期</th>
				<th field="addup" width="50">累计</th>			
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<div id="tb" style="padding: 3px">
			<span>教室编号:</span> <input id="cid"
				style="line-height: 20px; border: 1px solid #ccc"> 
													 <a
				href="#" class="easyui-linkbutton" iconCls="icon-search"
				plain="true" onclick="doSearch()">查询</a>
		</div>
		<a href="#" id="add" class="easyui-linkbutton" iconCls="icon-add"
			plain="true">新增</a> <a href="#" id="update" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改</a> <a href="#" id="remove"
			class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a> 
	</div>
</body>
</html>