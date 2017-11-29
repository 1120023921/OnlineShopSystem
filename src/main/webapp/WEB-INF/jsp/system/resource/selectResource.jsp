<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script>
	function selectResource() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			var url = '${pageContext.request.contextPath}/resource/resourceSelect.do?roleId='
					+ row.id;
			var dialog = $('#resource').dialog({
				title : '选择',
				href : url
			})
			$('#resource').dialog('open');
		}else{
			$.messager.show({ // show error message
				title : 'msg',
				msg : '请选择要操作的记录'
			});
		}
	}
	function saveRoleResources() {
		var row = $('#dg').datagrid('getSelected');
		var resources = $('#resourceTree').tree('getChecked');
		var data = {};
		if (row) {
			data.id = row.id;
			for (var i = 0; i < resources.length; i++) {
				var attr = "resources[" + i + "].id";
				data[attr] = resources[i].id;
			}
			$
					.post(
							'${pageContext.request.contextPath}/role/saveRoleResources.do',
							data, function(result) {
								if (result.success) {
									$('#resource').dialog('close');
									$('#dg').datagrid('reload'); // reload the data
									$.messager.show({ // show error message
										title : 'success',
										msg : '保存成功'
									});
								} else {
									$.messager.show({ // show error message
										title : 'Error',
										msg : result.msg
									});
								}
							}, 'json');
		}
	}
</script>
<body>
	<div id="resource" class="easyui-dialog"
		style="width: 300px; height: 500px; padding: 10px 20px" closed="true"
		buttons="#resource-buttons"></div>
	<div id="resource-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveRoleResources()">保存</a> <a href="#"
			class="easyui-linkbutton" iconCls="icon-cancel"
			onclick="javascript:$('#resource').dialog('close')">取消</a>
	</div>
</body>