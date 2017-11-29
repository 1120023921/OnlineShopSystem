<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script>
	function selectRole() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			var url = '${pageContext.request.contextPath}/user/userSelect.do?roleId='
					+ row.id;
			var dialog = $('#user').dialog({
				title : '选择',
				href : url
			})
			$('#user').dialog('open');
		}else{
			$.messager.show({ // show error message
				title : 'msg',
				msg : '请选择要操作的记录'
			});
		}
	}
	function saveRoleUsers() {
		var row = $('#dg').datagrid('getSelected');
		var userRows = $('#sdg').datagrid('getRows');
		var data = {};
		if (row) {
			data.id = row.id;
			for (var i = 0; i < userRows.length; i++) {
				var attr = "users[" + i + "].id";
				data[attr] = userRows[i].id;
			}
			$.post('saveRoleUsers.do', data, function(result) {
				if (result.success) {
					$('#user').dialog('close');
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
	<div id="user" class="easyui-dialog"
		style="width: 700px; height: 500px; padding: 10px 20px" closed="true"
		buttons="#user-buttons"></div>
	<div id="user-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveRoleUsers()">保存</a> <a href="#"
			class="easyui-linkbutton" iconCls="icon-cancel"
			onclick="javascript:$('#user').dialog('close')">取消</a>
	</div>
</body>