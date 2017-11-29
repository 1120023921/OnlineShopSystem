<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script>
	function selectRole() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			var url = '${pageContext.request.contextPath}/role/roleSelect.do?userId='
					+ row.id;
			var dialog = $('#role').dialog({
				title : '选择',
				href : url
			})
			$('#role').dialog('open');
		}else{
			$.messager.show({ // show error message
				title : 'msg',
				msg : '请选择要操作的记录'
			});
		}
	}
	function saveUserRoles() {
		var row = $('#dg').datagrid('getSelected');
		var roleRows = $('#sdg').datagrid('getRows');
		var data = {};
		if (row) {
			data.id = row.id;
			for (var i = 0; i < roleRows.length; i++) {
				var attr = "roles[" + i + "].id";
				data[attr] = roleRows[i].id;
			}
			$.post('saveUserRoles.do', data, function(result) {
				if (result.success) {
					$('#role').dialog('close');
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
	<div id="role" class="easyui-dialog"
		style="width: 700px; height: 500px; padding: 10px 20px" closed="true"
		buttons="#role-buttons"></div>
	<div id="role-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveUserRoles()">保存</a> <a href="#"
			class="easyui-linkbutton" iconCls="icon-cancel"
			onclick="javascript:$('#role').dialog('close')">取消</a>
	</div>
</body>