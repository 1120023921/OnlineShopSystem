<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/form.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/form.js"></script>
<script type="text/javascript">
$(function() {
	var f = new Form();
	f.dlgObj = $('#dlg');
	f.dgObj = $('#dg');
	f.formObj = $('#fm');
	f.treeGrid=true;
	f.reloadNav=true;
	f.saveUrl = '${pageContext.request.contextPath}/resource/save.do';
	f.updateUrl = '${pageContext.request.contextPath}/resource/update.do?id=';
	f.deleteUrl = '${pageContext.request.contextPath}/resource/delete.do';
	$('#add').click(function() {
		f.openAdd();
	});
	$('#update').click(function() {
		f.openUpdate();
	});
	$('#remove').click(function() {
		f.remove();
	});
	$('#save').click(function() {
		f.save();
	});
	$('#cancel').click(function() {
		f.cancel();
	});
	var treeUrl = '${pageContext.request.contextPath}/resource/getResourcesByPidAndType.do?pid=';
	initComboTree($('#pid'),treeUrl);
	});
</script>
<div id="dlg" class="easyui-dialog"
	style="width: 500px; height: 400px; padding: 10px 20px" closed="true"
	buttons="#dlg-buttons">
	<div class="ftitle">详细信息</div>
	<form id="fm" method="post" novalidate>
		<div class="fitem">
			<label>资源ID:</label> <input name="reid" class="easyui-validatebox"
				required="true">
		</div>
		<div class="fitem">
			<label>资源名:</label> <input name="name">
		</div>
		<div class="fitem">
			<label>值:</label> <input name="value">
		</div>
		<div class="fitem">
			<label>类型:</label> <select name="type">
				<option value="0">菜单</option>
				<option value="1">后台</option>
			</select>
		</div>
		<div class="fitem">
			<label>上级:</label> <input id="pid" name="pid" style="width:150px;">
		</div>
		<div class="fitem">
			<label>状&nbsp;态:</label> <select name="enabled">
				<option value="Y">启用</option>
				<option value="N">禁用</option>
			</select>
		</div>
		<div class="fitem">
			<label>创建时间:</label> <input name="createDate" disabled="disabled">
		</div>
		<div class="fitem">
			<label>创建者:</label> <input name="createBy" disabled="disabled">
		</div>
		<div class="fitem">
			<label>修改时间:</label> <input name="updateDate" disabled="disabled">
		</div>
		<div class="fitem">
			<label>修改者:</label> <input name="updateBy" disabled="disabled">
		</div>
	</form>
</div>
<div id="dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		id="save">保存</a> <a href="#" id="cancel" class="easyui-linkbutton"
		iconCls="icon-cancel">取消</a>
</div>
