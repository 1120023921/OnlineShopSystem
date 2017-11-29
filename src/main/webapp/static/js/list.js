function initGrid(obj, treeGrid) {
	if (treeGrid) {
		obj.treegrid({
			loadFilter : function(data) {
				var result = {};
				for (var i = 0; i < data.length; i++) {
					data[i]._parentId = data[i].pid
				}
				result.total = data.length;
				result.rows = data;
				return result;
			},
			onLoadError:function(data){
				$.messager.show({
					title : 'msg',
					msg : data.responseText
				});
			}
		})
	} else {
		obj.datagrid({
			loadFilter : function(data) {
				data.rows = data.list;
				data.page = data.pageNum;
				data.list = null;
				return data;
			},
			onLoadError:function(data){
				$.messager.show({
					title : 'msg',
					msg : data.responseText
				});
			}
		})
	}
}