<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#tap{
	width: 100%;
	height: 50px;
}
#main_session_default{
	height: 1200px;
	width: 1000px;
	margin: 0 auto;
}
#Manager_table{
	
}
</style>
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
	$('#tg').treegrid({
        data: dataSet,
        onDblClickCell : function(field, row) {
                edit();
        }                    
    });

</script>
<style type="text/css">
.datagrid .panel-body{
	padding: 0px 0px 0px 0px;"
}
</style>
<c:import url="../temp/bootStrap_api_crash.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_admin.jsp" />
<div id="main_session_default">
	<div id="Manager_table">
	<h2>Editable TreeGrid</h2>
	<p>Select one node and click edit button to perform editing.</p>
	<div style="margin: 20px 0;">
		<a href="javascript:void(0)" class="easyui-linkbutton"onclick="edit()">수정</a> 
		<a href="javascript:void(0)"class="easyui-linkbutton" onclick="append()">추가</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton"	onclick="removeIt()">삭제</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()">저장</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton"	onclick="cancel()">취소</a> 
	</div>	
	<table id="tg" class="easyui-treegrid" title="업무 분담표" style="width:1000px;height:900px"
			data-options="
				iconCls: 'icon-ok',
				rownumbers: true,
				animate: true,
				collapsible: true,
				fitColumns: true,				
				method: 'get',
				idField: 'id',
				treeField: 'name',
				showFooter: true
			">
		<thead>
			<tr>
				<th data-options="field:'name',width:180,editor:'text'">업무명</th>
				<th data-options="field:'persons',width:60,align:'right',editor:'numberbox'">사원명</th>
				<th data-options="field:'begin',width:80,editor:'datebox'">시작 날짜</th>
				<th data-options="field:'end',width:80,editor:'datebox'">마감 날짜</th>
				<th data-options="field:'progress',width:120,formatter:formatProgress,editor:'numberbox'">진행 정도</th>
			</tr>
		</thead>
	</table>
	</div>
</div>
<c:import url="../temp/footer.jsp" />
</body>
</html>