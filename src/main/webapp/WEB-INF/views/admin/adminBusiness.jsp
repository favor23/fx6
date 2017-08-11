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
.modal_d1 , .modal_d2, .modal_d3, .modal_d4_mod, .modal_view{
	width: 300px;
	height: 400px;
	float: left;
}

.easyui-linkbutton{
	height:50px;
	width: 100%;
}
.admin_smell_img{
	height: 50px;
	width: 40px;
}

</style>
<link href="<c:url value="/css/admin_one.css" />" type="text/css" rel="stylesheet">
<link href="<c:url value="/admin_m/themes/default/easyui.css" />"
	rel='stylesheet' />
<link href="<c:url value="/admin_m/themes/icon.css" />" rel='stylesheet' />
<link href="<c:url value="/admin_m/demo/demo.css" />" rel='stylesheet' />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin_m/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin_m/jquery.easyui.min.js"></script>
<style type="text/css">
.datagrid .panel-body{
	padding: 0px 0px 0px 0px;"
}
</style>
<link href="<c:url value="/css/admin_one.css" />" type="text/css" rel="stylesheet">
<c:import url="../temp/bootStrap_api_crash_black.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화를 찍으시조</title>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_admin.jsp" />
<div id="main_session_default">
<c:import url="./admin_one.jsp" />
	<div id="Manager_table">	
	<h2>${member.department}</h2>
	<p>부서내 사원들에게 업무 확인가능</p>	
	<div style="margin: 20px 0;">
		<!-- <a href="javascript:void(0)" class="easyui-linkbutton"onclick="edit()">수정</a>  -->
		<!-- <a href="javascript:void(0)"class="easyui-linkbutton" onclick="append()">추가</a> -->
		<!-- <button type="button" class="btn btn-info btn-lg btn_insert" data-toggle="modal" data-target="#myModal_ins">업무추가</button> -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal_mod" onclick="edit()">업무수정</button>
		<button type="button" class="btn btn-info btn-lg view_re" data-toggle="modal" data-target="#myModal_view" onclick="view()">업무정보</button>
		<button type="button" class="btn btn-info btn-lg" onclick="start()">새로고침</button>
		<!-- <button type="button" class="btn btn-info btn-lg" onclick="removeIt()">업무삭제</button> -->
		<!-- <a href="javascript:void(0)" class="easyui-linkbutton"	onclick="removeIt()">삭제</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="dbupdatesave()">저장</a> -->
	<!-- 	<a href="javascript:void(0)" class="easyui-linkbutton"	onclick="cancel()">취소</a>  -->
	</div>	
	<table id="tg" class="easyui-treegrid" title="업무 분담표" style="width:1000px;height:500px"
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
				<th data-options="field:'persons',width:60,align:'right',editor:'numberbox'">아이디명</th>
				<th data-options="field:'begin',width:80,editor:'text'">시작 날짜</th>
				<th data-options="field:'end',width:80,editor:'text'">마감 날짜</th>
				<th data-options="field:'progress',width:120,formatter:formatProgress,editor:'numberbox'">진행 정도</th>
			</tr>
		</thead>
	</table>
	</div>
</div>
<!-- =======================================================추가========================================================== -->
<div id="insert_modal"></div>
<!-- =======================================================수정========================================================== -->
<div id="myModal_mod" class="modal fade" role="dialog">
	<div class="modal-dialog" style="width: 950px">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" onclick="start()">&times;</button>
				<h4 class="modal-title well">${member.department}업무 수정</h4>
			</div>
			<div class="modal-body">
				<input	type="hidden" id="id_mod" value="">
				<input type="hidden" id="iconcls_mod" value="icon-ok">
				<div class="modal_d1 well">
					프로젝트명<input type="text" id="name_mod" value=""> <br> 
					시작날짜<input 	type="date" id="begin_mod" value=""> <br>~<br> 
						끝 날짜<input	type="date" id="end_mod" value="">						
				퍼센트<input type="number" id="progress_mod"	value="">
				</div>
				<!-- div2 div3 ajax로 가져오기 -->
				<div class="modal_mod_tt">	
				<button id="list_list">인원추가하기</button>			
				</div>
								
				<button href="javascript:void(0)" class="easyui-linkbutton"
					onclick="dbupdatesave()" data-dismiss="modal">수정</button>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="start()">Close</button>
			</div>
		</div>

	</div>	
</div>
<!-- ==================================모달뷰================================================== -->
<div id="myModal_view" class="modal fade" role="dialog">
	<div class="modal-dialog" style="width: 650px">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" onclick="start()">&times;</button>
				<h4 class="modal-title well">${member.department}업무 수정</h4>
			</div>
			<div class="modal-body">
				<input	type="hidden" id="id_view" value="">
				<input type="hidden" id="iconcls_view" value="icon-ok">
				<div class="modal_d1 well">
					프로젝트명<input type="text" id="name_view" value="" readonly="readonly"> <br> 
					시작날짜<input 	type="date" id="begin_view" value="" readonly="readonly"> <br>~<br> 
						끝 날짜<input	type="date" id="end_view" value="" readonly="readonly">						
				퍼센트<input type="number" id="progress_view"	value="" readonly="readonly">
				</div>
				<!-- div2 div3 ajax로 가져오기 -->
				<div class="modal_view well" style="overflow: auto">
					<button class="btn_view">참여인원 보기</button>											
				</div>				
			</div>
			<div class="modal-footer">
			</div>
		</div>

	</div>	
</div>
<c:import url="../temp/footer.jsp" />
</body>
<script type="text/javascript">
	/* var keynum=0; */
	start();
	var jbAry = new Array();
	var delAry = new Array();
	var content=0;
	var content2=0;
	var del="del";
	var persons2="";
	/* ======================================== 모달뷰 =============================================================  */
	function viewview() {
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/admin_modal3?jbAry="+jbAry+"&delAry="+delAry,
			type : "GET",
			success : function(data) {
				$(".modal_view").html(data);
			}
		});	
	}	
	
	
	/* ===============================================모달수정======================================================  */
	$("#list_list").click(function(){		
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/admin_modal4?jbAry='1'&delAry='1'",
			type : "GET",
			success : function(data) {
				$(".modal_mod_tt").html(data);
			}
		});
	})
	
	$(".modal_mod_tt").on("click","#modmodmod",function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/admin_modal3?jbAry="+jbAry+"&delAry="+delAry,
			type : "GET",
			success : function(data) {
				$(".modal_d4_mod").html(data);
			}
		});
	});
	$(".modal_mod_tt").on("click",".insert_gogo2",function(){		
		var str=$(this).attr('id');
		var key=0;
		for(var i=0;i<jbAry.length;i++){
			if(jbAry[i]==str){
				jbAry[i]='del';
				key=1;
			}
		}		
		if(key==0){
			jbAry[jbAry.length+1]=str;
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/admin_modal3?jbAry="+jbAry+"&delAry="+delAry,
			type : "GET",
			success : function(data) {
				$(".modal_d4_mod").html(data);
			}
		});
		
	})
	function modal4_mod(jbAry,persons2) {
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/admin_modal4?jbAry="+jbAry+"&delAry="+delAry,
			type : "GET",
			success : function(data) {
				$(".modal_mod_tt").html(data);
			}
		});	
	}	
	
	/* ==========================================모달추가====================================================== */
	$(".btn_insert").mouseenter(function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/admin_modal2",
			type : "GET",
			success : function(data) {
				$("#insert_modal").html(data);
			}
		});	
	})
	
	$("#insert_modal").on("click",".insert_gogo",function(){		
		var str=$(this).attr('id');	
		/* if($(this).val()=='참여'){
			$(this).attr("value","참여취소");
		}else{
			$(this).attr("value","참여");
		} */
		jbAry[content]=str;
		content++;
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/admin_modal5?jbAry="+jbAry+"&delAry="+delAry,
			type : "GET",
			success : function(data) {
				$(".modal_d3").html(data);
			}
		});
		
	})
	
	
	/* $(".modal_d3").on("click",".select_one_x",function(){
		var str=$(this).attr('id');
		delAry[content2]=str;
		content2++;
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/admin_modal3?jbAry="+jbAry+"&delAry="+delAry,
			type : "GET",
			success : function(data) {
				$(".modal_d3").html(data);
			}
		});
	}); */
	
	
	function start(){		
		$.post("./work_list",function(data){
			/* 날짜 형식 변경 */
			/* var cut,begin,cut2,end;
			for(var i=0;i<100;i++){
				if(data.worklist[i]!=null){
					keynum=i+1;
					cut=data.worklist[i].begin.split('-');
					begin=cut[2]+'/'+cut[1]+'/'+cut[0];
					data.worklist[i].begin=begin;
					cut2=data.worklist[i].end.split('-');
					end=cut[2]+'/'+cut[1]+'/'+cut[0];
					data.worklist[i].end=end;
				}else{
					break;
				}
			} */
			/* 제이슨 짜르기  */
			var str=JSON.stringify(data);			
			var str=str.substring(str.indexOf('['),str.indexOf(']')+1);			
			/* 다시 제이슨 오브젝트화 */
			str=JSON.parse(str);
		var dataSet = {
			"total" : 7,
			"rows" : str			
			}		
		$('#tg').treegrid({
			data : dataSet
		});	
		setting();
	})
	}
	
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
	var row;
	function edit() {
		var key=0;
		if (editingId != undefined) {
			$('#tg').treegrid('select', editingId);
			return;
		}
		row = $('#tg').treegrid('getSelected');		
		if (row) {
			editingId = row.id
			$('#tg').treegrid('beginEdit', editingId);
		}		
		$("#id_mod").attr("value",row.id);
		$("#name_mod").attr("value",row.name);
		$("#persons_mod").attr("value",row.persons);
		$("#begin_mod").attr("value",row.begin);
		$("#end_mod").attr("value",row.end);
		$("#progress_mod").attr("value",row.progress);
		$("#iconcls_mod").attr("value",row.iconcls);		
		persons2=row.persons;
		jbAry=persons2.split("/");		
		modal4_mod(jbAry,persons2);
		save();		
	}
	function view() {
		if (editingId != undefined) {
			$('#tg').treegrid('select', editingId);
			return;
		}
		row = $('#tg').treegrid('getSelected');		
		if (row) {
			editingId = row.id
			$('#tg').treegrid('beginEdit', editingId);
		}		
		$("#id_view").attr("value",row.id);
		$("#name_view").attr("value",row.name);
		$("#persons_view").attr("value",row.persons);
		$("#begin_view").attr("value",row.begin);
		$("#end_view").attr("value",row.end);
		$("#progress_view").attr("value",row.progress);
		$("#iconcls_view").attr("value",row.iconcls);
		persons2=row.persons;
		jbAry=persons2.split("/");
		viewview(jbAry,persons2);
		save();		
	}
	function dbupdatesave(){
		$.post("./work_update",{ 
			id : $("#id_mod").val(),		
			name : $("#name_mod").val(),		
			persons : $("#persons_mod").val(),
			begin : $("#begin_mod").val(),
			end : $("#end_mod").val(),
			progress : $("#progress_mod").val(),
			iconcls : $("#iconcls_mod").val()
		});	
		setTimeout("start()", 500);
		setting();
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
	/* 디비 insert */
	function dbsave(idIndex) {
		
		$.post("./work_insert",{ 
			id : idIndex,		
			name : $('#name').val(),		
			persons : $('#persons').val(),
			begin : $('#begin').val(),
			end : $('#end').val(),
			progress : $('#progress').val(),
			iconcls : $('#iconcls').val()
		});
		start();
		
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
		var parentid = null;
		var node = $('#tg').treegrid('getSelected');
		if (node)
		{
			parentid = node.id;
		}
		dbsave(idIndex);	
		setTimeout("start()", 500);
		$('#tg').treegrid('append', {
			parent : parentid,
			data : [ {
				id : idIndex,
				name : $('#name').val(),
				persons : $('#persons').val(),
				begin : $('#begin').val(),
				end : $('#end').val(),
				progress : $('#progress').val()
			} ]
		})
	
		setting();
	}
	function removeIt() {
		var node = $('#tg').treegrid('getSelected');
		if (node) {
			$('#tg').treegrid('remove', node.id);
		}
		$.post("./work_delete",{ 
			id : node.id	
		});
	}
	function setting(){
		jbAry=new Array();
		delAry=new Array();
		content=0;
		content2=0;
		del="del";
		persons2="";
	}

</script>
</html>