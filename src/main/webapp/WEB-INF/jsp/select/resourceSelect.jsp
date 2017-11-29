<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/list.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/select.js"></script>
<script>
	$(function() {
		var url = '${pageContext.request.contextPath}/resource/getResourcesByPidAndType.do?pid=';
		var surl = '${pageContext.request.contextPath}/resource/getResourcesByRoleId.do';
		var resources = [];
		var obj = $('#resourceTree');
		$.post(surl, {
			roleId : "${roleId}"
		}, function(result) {
			if (result) {
				for (var i = 0; i < result.length; i++) {
					resources[i] = result[i].id
				}
				obj.tree({
					checkbox : true,
					url : url,
					onBeforeExpand : function(node, param) {
						obj.tree('options').url = url + node.id;
					},
					loadFilter : function(data) {
						if (data.msg) {
							return data.msg;
						} else {
							for (var i = 0; i < data.length; i++) {
								data[i].text = data[i].name
								if (data[i].leaf == 'N') {
									data[i].state = 'closed';
								}

								for (var j = 0; j < resources.length; j++) {
									if (data[i].id == resources[j]) {
										data[i].checked = true;
										break;
									}
								}

								var attributes = {};
								attributes.url = data[i].value
								data[i].attributes = attributes;
							}
							return data;
						}
					},
					lines : true,
					onLoadSuccess : function(node, data) {
						var roots = obj.tree('getRoots');
						for (var i = 0; i < roots.length; i++) {
							obj.tree('expandAll', roots[i].target);
						}
					}
				});
			}
		}, 'json');
	})
	function selectAll() {
		var roots = obj.tree('getRoots');//返回tree的所有根节点数组
		for (var i = 0; i < roots.length; i++) {
			var node = obj.tree('find', roots[i].id);//查找节点
			obj.tree('check', node.target);//将得到的节点选中
		}
	}
	function unSelectAll() {
		var roots = obj.tree('getRoots');
		for (var i = 0; i < roots.length; i++) {
			var node = obj.tree('find', roots[i].id);
			obj.tree('uncheck', node.target);
		}
	}
</script>
<div class="easyui-layout" data-options="fit:true">
	<div region="center" style="height: 10%" split="false">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true"
			onclick="selectAll()">全选</a><a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" plain="true" onclick="unSelectAll()">反选</a>
		<div id="resourceTree" class="easyui-tree"></div>
	</div>
</div>