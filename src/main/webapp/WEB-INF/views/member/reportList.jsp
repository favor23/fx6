<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin_reportList</title>
<c:import url="../temp/bootStrap.jsp"/>
<!-- 800x600 -->
<style type="text/css">
#list {
	width: 98%;
	margin-left: 1%;
	margin-top: 10px;
	overflow: auto;
}

#list th {
	text-align: center;
}

#list td {
	border: 1px solid black;
	max-height: 200px;
	vertical-align: middle;
	padding: 5px;
}

#list .center {
	text-align: center;
}

#headLine {
	margin-left: 20px;
	margin-top: 10px;
	width: 150px;
	border-bottom: 1px solid red;
}

#t1 {
	width: 12%;
}

#t2 {
	width: 16%;
}

#t3 {
	width: 10%;
}

#t4 {
	width: 6%;
}

#t5 {
	width: 46%;
}

.btn {
	width: 100%;
	border: none;
	border-radius: 5px;
}

.a {
	text-align: center;
}

.logTd {
	overflow: auto;
}
</style>
</head>
<body>
<p id="headLine">채팅 신고 내역</p>
<table class="table table-hover" id="list">
<thead>
	<tr>
	<th id="t1">신고대상</th>
	<th id="t2">사유</th>
	<th id="t3">선택</th>
	<th id="t4"></th>
	<th id="t5">로그띄울곳</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${banList }" var="list"><!-- ${list.targetId}  -->
	<tr>
		<td class="a">${list.targetId }</td>
		<td class="a">${list.reason }</td>
		<td class="a">
			<select class="justice ${list.num }" name="${list.targetId }" style="width: 100%;height: 60%;">
				<option value="w">무고</option>
				<option value="1">1회</option>
				<option value="2">2회</option>
				<option value="3">3회</option>
			</select>
		</td>
		<td class="a"><input type="button" class="btn" name="${list.num}" value="진행"></td>
		<td id="${list.num}" class="logTd"><button class="log" dropzone="${list.targetId }" name="${list.num }">로그 보기</button></td>
	</tr>
</c:forEach>
</tbody>
</table>
<script type="text/javascript">
$(".btn").click(function(){
	
	var num = $(this).attr("name");	//이 신고의 처리번호
	var tid = $("."+num).attr("name"); //밴먹을놈 아이디
	var ban = $("."+num).val();//몇 밴짜린가 w는 무고.
	var id='${member.id}'; //어드민 아이디
	if(ban=='w'){
		$.get("../chatting/proccess?num="+num+"&id="+id,function(data){
			data=data.trim();
			alert(data);
		});
	}else if(ban>0){
		$.get("../chatting/addBan?num="+num+"&ban="+ban+"&id="+tid+"&tid="+id,function(data){
			data=data.trim();
			alert(data);
		});
	}
	$(this).parent().parent().remove();
});

$(".log").click(function(){
	var num=$(this).attr("name");
	var targetId=$(this).attr("dropzone");
	$.get("../member/log?id="+targetId,function(data){
		$("#"+num).html(data);
		
	});
});


</script>

</body>
</html>