<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editable TreeGrid - jQuery EasyUI Demo</title>
<link href="<c:url value="/admin_m/themes/default/easyui.css" />"
	rel='stylesheet' />
<link href="<c:url value="/admin_m/themes/icon.css" />" rel='stylesheet' />
<link href="<c:url value="/admin_m/demo/demo.css" />" rel='stylesheet' />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin_m/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin_m/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$(function() {
		var dataSet = {
			"total" : 7,
			"rows" : [ {
				"id" : 1,
				"name" : "All Tasks",
				"begin" : "3/4/2010",
				"end" : "3/20/2010",
				"progress" : 60,
				"iconCls" : "icon-ok"
			}, {
				"id" : 2,
				"name" : "Designing",
				"begin" : "3/4/2010",
				"end" : "3/10/2010",
				"progress" : 100,
				"_parentId" : 1,
				"state" : "closed"
			}, {
				"id" : 21,
				"name" : "Database",
				"persons" : 2,
				"begin" : "3/4/2010",
				"end" : "3/6/2010",
				"progress" : 100,
				"_parentId" : 2
			}, {
				"id" : 22,
				"name" : "UML",
				"persons" : 1,
				"begin" : "3/7/2010",
				"end" : "3/8/2010",
				"progress" : 100,
				"_parentId" : 2
			}, {
				"id" : 23,
				"name" : "Export Document",
				"persons" : 1,
				"begin" : "3/9/2010",
				"end" : "3/10/2010",
				"progress" : 100,
				"_parentId" : 2
			}, {
				"id" : 3,
				"name" : "Coding",
				"persons" : 2,
				"begin" : "3/11/2010",
				"end" : "3/18/2010",
				"progress" : 80
			}, {
				"id" : 4,
				"name" : "Testing",
				"persons" : 1,
				"begin" : "3/19/2010",
				"end" : "3/20/2010",
				"progress" : 20
			} ],
			"footer" : [ {
				"name" : "Total Persons:",
				"persons" : 7,
				"iconCls" : "icon-sum"
			} ]
		}
		$('#tg').treegrid({
			data : dataSet
		});
	});
	function formatProgress(value) {
		if (value) {
			var s = '<div style="width:100%;border:1px solid #ccc">'
					+ '<div style="width:' + value
					+ '%;background:#cc0000;color:#fff">' + value + '%'
					+ '</div>'
			'</div>';
			return s;
		} else {
			return '';
		}
	}
	var editingId;
	function edit() {
		if (editingId != undefined) {
			$('#tg').treegrid('select', editingId);
			return;
		}
		var row = $('#tg').treegrid('getSelected');
		if (row) {
			editingId = row.id
			$('#tg').treegrid('beginEdit', editingId);
		}
	}
	function save() {
		if (editingId != undefined) {
			var t = $('#tg');
			t.treegrid('endEdit', editingId);
			editingId = undefined;
			var persons = 0;
			var rows = t.treegrid('getChildren');
			for (var i = 0; i < rows.length; i++) {
				var p = parseInt(rows[i].persons);
				if (!isNaN(p)) {
					persons += p;
				}
			}
			var frow = t.treegrid('getFooterRows')[0];
			frow.persons = persons;
			t.treegrid('reloadFooter');
		}
	}
	function cancel() {
		if (editingId != undefined) {
			$('#tg').treegrid('cancelEdit', editingId);
			editingId = undefined;
		}
	}
	var idIndex = 100;
	function append() {
		idIndex++;
		var d1 = new Date();
		var d2 = new Date();
		d2.setMonth(d2.getMonth() + 1);
		var node = $('#tg').treegrid('getSelected');
		$('#tg').treegrid('append', {
			parent : node.id,
			data : [ {
				id : idIndex,
				name : 'New Task' + idIndex,
				persons : parseInt(Math.random() * 10),
				begin : $.fn.datebox.defaults.formatter(d1),
				end : $.fn.datebox.defaults.formatter(d2),
				progress : parseInt(Math.random() * 100)
			} ]
		})
	}
	function removeIt() {
		var node = $('#tg').treegrid('getSelected');
		if (node) {
			$('#tg').treegrid('remove', node.id);
		}
	}
</script>
</head>
<body>
	<h2>Editable TreeGrid</h2>
	<p>Select one node and click edit button to perform editing.</p>
	<div style="margin: 20px 0;">
		<a href="javascript:void(0)" class="easyui-linkbutton"onclick="edit()">Edit</a> 
		<a href="javascript:void(0)"class="easyui-linkbutton" onclick="append()">append</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton"	onclick="removeIt()">remove</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()">Save</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton"	onclick="cancel()">Cancel</a> 
	</div>	
	<table id="tg" class="easyui-treegrid" title="Editable TreeGrid" style="width:700px;height:250px"
			data-options="
				iconCls: 'icon-ok',
				rownumbers: true,
				animate: true,
				collapsible: true,
				fitColumns: true,
				url: 'treegrid_data2.json',
				method: 'get',
				idField: 'id',
				treeField: 'name',
				showFooter: true
			">
		<thead>
			<tr>
				<th data-options="field:'name',width:180,editor:'text'">Task Name</th>
				<th data-options="field:'persons',width:60,align:'right',editor:'numberbox'">Persons</th>
				<th data-options="field:'begin',width:80,editor:'datebox'">Begin Date</th>
				<th data-options="field:'end',width:80,editor:'datebox'">End Date</th>
				<th data-options="field:'progress',width:120,formatter:formatProgress,editor:'numberbox'">Progress</th>
			</tr>
		</thead>
	</table>
</body>
</html>

