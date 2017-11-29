<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/form.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/form.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(function() {
		var f = new Form();
		f.dlgObj = $('#dlg');
		f.dgObj = $('#dg');
		f.formObj = $('#fm');
		f.saveUrl = '${pageContext.request.contextPath}/class/save.do';
		f.updateUrl = '${pageContext.request.contextPath}/class/update.do?id=';
		f.deleteUrl = '${pageContext.request.contextPath}/class/delete.do';
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
	})
	function formatDate(date){
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		var h = date.getHours();
		var mn = date.getMinutes();
		var s = date.getSeconds();
		return y+'-'+m+'-'+d+' '+h+':'+mn+':'+s;
	}
	function parseDate(value){
		var date = new Date();
		date.setTime(value);
		return date;
	}
</script>
<div id="dlg" class="easyui-dialog"
	style="width: 500px; height: 400px; padding: 10px 20px" closed="true"
	buttons="#dlg-buttons">
	<div class="ftitle">详细信息</div>
	<form id="fm" method="post" novalidate>
		<div class="fitem">
			<label>教室编号:</label> <input name="cid" class="easyui-validatebox"
				required="true">
		</div>
		<div class="fitem">
			<label>座位数:</label> <input name="sit">
		</div>
		<div class="fitem">
			<label>主机品牌:</label> <input name="zjbrand">		
		</div>
		<div class="fitem">
			<label>主机型号:</label> <input name="zjtype">
		</div>
		<div class="fitem">
			<label>主机仪器号:</label> <input name="zjinstrumentnum">
		</div>
		<div class="fitem">
			<label>主机启用日期:</label> <input name="zjstartdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})">
		</div>
		<div class="fitem">
			<label>保护方式:</label> <input name="protect">
		</div>
		<div class="fitem">
			<label>注意事项:</label> <input name="attention">		
		</div>
		<div class="fitem">
			<label>投影机品牌:</label> <input name="tybrand">
		</div>
		<div class="fitem">
			<label>投影机型号:</label> <input name="tytype">
		</div>
		<div class="fitem">
			<label>投影机仪器号:</label> <input name="tyinstrumentnum">
		</div>
		<div class="fitem">
			<label>投影机启用日期:</label> <input name="tystartdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})">
		</div>
		<div class="fitem">
			<label>灯泡启用日期:</label> <input name="bulbstartdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})">
		</div>
		<div class="fitem">
			<label>累计:</label> <input name="addup" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})">
		</div>

	</form>
</div>
<div id="dlg-buttons">
	<a href="#" id="save" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="#" id="cancel" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
