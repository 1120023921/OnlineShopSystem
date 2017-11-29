var url;
function Form(){
	
}
Form.prototype.openAdd=function(){
	this.dlgObj.dialog('open').dialog('setTitle', '新增');
	this.formObj.form('clear');
	this.formObj.attr('action',this.saveUrl);
};
Form.prototype.openUpdate=function(){
	var row = this.dgObj.datagrid('getSelected');
	if (row) {
		this.dlgObj.dialog('open').dialog('setTitle', '修改');
		this.formObj.form('clear');
		this.formObj.form('load', row);
		this.formObj.attr('action',this.updateUrl+row.id);
	}else{
		$.messager.show({
			title : 'msg',
			msg : '请选择要修改的记录'
		});
	}
};
Form.prototype.save=function(){
	var dlgObj = this.dlgObj;
	var dgObj = this.dgObj;
	var treeGrid = this.treeGrid;
	var reloadNav = this.reloadNav;
	var parentObj = parent;
	this.formObj.form('submit', {
		onSubmit : function() {
			return $(this).form('validate');
		},
		success : function(result) {
			var result = eval("("+result+")");
			if (result.success) {
				dlgObj.dialog('close'); // close the dialog
				if(treeGrid){
					dgObj.treegrid('reload');
				}else{
					dgObj.datagrid('reload');
				}
				if(reloadNav){
					parentObj.reloadSelectedNav();
				}
				$.messager.show({
					title : 'Success',
					msg : '保存成功'
				});
			} else {
				var msg ='';
				if(result.msg){
					msg = result.msg;
				}else{
					msg = result;
				}
				$.messager.show({
					title : 'Error',
					msg : msg
				});
			}
		}
	});
};
Form.prototype.remove=function(){
	var dlgObj = this.dlgObj;
	var dgObj = this.dgObj;
	var treeGrid = this.treeGrid;
	var reloadNav = this.reloadNav;
	var deleteUrl = this.deleteUrl
	var parentObj = parent;
	var row = dgObj.datagrid('getSelected');
	if (row) {
		$.messager.confirm('Confirm', '确认删除?', function(r) {
			if (r) {
				$.post(deleteUrl, {
					id : row.id
				}, function(result) {
					if (result.success) {
						if(treeGrid){
							dgObj.treegrid('reload');
						}else{
							dgObj.datagrid('reload');
						} // reload the data
						if(reloadNav){
							parentObj.reloadSelectedNav();
						}
						$.messager.show({ // show error message
							title : 'Success',
							msg : '删除成功'
						});
					} else {
						$.messager.show({ // show error message
							title : 'Error',
							msg : result.msg
						});
					}
				}, 'json');
			}
		});
	}else{
		$.messager.show({
			title : 'msg',
			msg : '请选择要删除的记录'
		});
	}
};
Form.prototype.cancel=function(){
	this.dlgObj.dialog('close');
};
function initComboTree(obj,url){
	obj.combotree({
		url : url,
		onBeforeExpand : function(node, param) {
			obj.combotree('tree').tree('options').url = url + node.id;
		},
		loadFilter : function(data) {
			if (data.msg) {
				return data.msg;
			} else {
				for(var i=0;i<data.length;i++){
					data[i].text=data[i].name
					if(data[i].leaf=='N'){
						data[i].state='closed';
					}
					var attributes={};
					attributes.url=data[i].value
					data[i].attributes=attributes;
				}
				return data;
			}
		},
		lines : true,
	}
	);
}