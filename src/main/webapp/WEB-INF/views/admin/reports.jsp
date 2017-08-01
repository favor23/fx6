<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Reports using TreeGrid - jQuery EasyUI Demo</title>
	<link href="<c:url value="/admin_m/themes/default/easyui.css" />" rel='stylesheet'/>
	<link href="<c:url value="/admin_m/themes/icon.css" />" rel='stylesheet'/>
	<link href="<c:url value="/admin_m/demo/demo.css" />" rel='stylesheet'/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin_m/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin_m/jquery.easyui.min.js"></script>
</head>




<body>
	<h2>Reports using TreeGrid</h2>
	<p>Using TreeGrid to show complex reports.</p>
	<div style="margin:20px 0;"></div>
	<table title="Reports using TreeGrid" class="easyui-treegrid" style="width:700px;height:250px"
			data-options="
				url: 'treegrid_data3.json',
				method: 'get',
				rownumbers: true,
				showFooter: true,
				idField: 'id',
				treeField: 'region'
			">
		<thead frozen="true">
			<tr>
				<th field="region" width="200">Region</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th colspan="4">2009</th>
				<th colspan="4">2010</th>
			</tr>
			<tr>
				<th field="f1" width="60" align="right">1st qrt.</th>
				<th field="f2" width="60" align="right">2st qrt.</th>
				<th field="f3" width="60" align="right">3st qrt.</th>
				<th field="f4" width="60" align="right">4st qrt.</th>
				<th field="f5" width="60" align="right">1st qrt.</th>
				<th field="f6" width="60" align="right">2st qrt.</th>
				<th field="f7" width="60" align="right">3st qrt.</th>
				<th field="f8" width="60" align="right">4st qrt.</th>
			</tr>
		</thead>
	</table>

</body>
</html>