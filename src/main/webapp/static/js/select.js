$('#sdg').datagrid({
	onDblClickRow:function (index, data) {
		$('#sdg').datagrid('deleteRow',index);
		$('#usdg').datagrid('appendRow',data);
	}
});

$('#usdg').datagrid({
	onDblClickRow:function (index, data) {
		$('#usdg').datagrid('deleteRow',index);
		$('#sdg').datagrid('appendRow',data);
	}
});
function L2R(){
	var rows = $('#sdg').datagrid('getSelections');
	for(var i=0;i<rows.length;i++){
		var index = $('#sdg').datagrid('getRowIndex',rows[i]);
		$('#usdg').datagrid('appendRow',rows[i]);
		$('#sdg').datagrid('deleteRow',index);
	}
	
}
function R2L(){
	var rows = $('#usdg').datagrid('getSelections');
	for(var i=0;i<rows.length;i++){
		var index = $('#usdg').datagrid('getRowIndex',rows[i]);
		$('#sdg').datagrid('appendRow',rows[i]);
		$('#usdg').datagrid('deleteRow',index);
	}
}