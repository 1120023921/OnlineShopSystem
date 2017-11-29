<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/list.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/select.js"></script>
<script>
	$(function() {
		//initGrid($('#sdg'));
		initGrid($('#usdg'))
	})
	function doSearch() {
		var data = {};
		var key = $('#key').val();
		data[key] = $('#data').val();
		$('#usdg').datagrid('load', data);
	}
</script>
<div class="easyui-layout" data-options="fit:true">
	<div region="west" style="width: 45%" title="已选人员" collapsible="false">
		<table id="sdg" class="easyui-datagrid"
			style="width: 100%; height: 370px;"
			url="${pageContext.request.contextPath}/user/getUsersByRoleId.do?roleId=${roleId}"
			pagination="true" rownumbers="true" fitColumns="true"
			buttons="#dg-buttons">
			<thead>
				<tr>
					<th field="uid" width="50">编码</th>
					<th field="name" width="50">名称</th>
				</tr>
			</thead>
		</table>
	</div>
	<div region="center" style="width: 10%">
		<div region="north" style="height: 30%"></div>
		<div region="center" style="height: 33%; padding-left: 8px">
			<a href="#" class="easyui-linkbutton" onclick="R2L()"><<&nbsp;<<</a>
		</div>
		<div region="south" style="height: 33%; padding-left: 8px">
			<a href="#" class="easyui-linkbutton" onclick="L2R()">>>&nbsp;>></a>
		</div>
	</div>
	<div region="east" style="width: 45%" title="可选人员" collapsible="false">
		<table id="usdg" class="easyui-datagrid"
			style="width: 100%; height: 370px;"
			url="${pageContext.request.contextPath}/user/list.do"
			pagination="true" rownumbers="true" fitColumns="true"
			buttons="#dg-buttons" toolbar="#usdgtb">
			<thead>
				<tr>
					<th field="uid" width="50">编码</th>
					<th field="name" width="50">名称</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="usdgtb">
		<div id="tb" style="padding: 3px">
			<select id="key"><option value="uid">编码</option>
				<option value="name">名称</option></select>：<input id="data"
				style="width: 100px; border: 1px solid #ccc"><a href="#"
				class="easyui-linkbutton" iconCls="icon-search" plain="true"
				onclick="doSearch()">查询</a>
		</div>
	</div>
</div>
