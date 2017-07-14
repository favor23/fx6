<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/reset.css">
<title>MyPage</title>
<style type="text/css">
ol, ul {
	list-style: none;
}

#container {
	width: 80%;
	margin-left: 10%;
	min-width: 1000px;
	height: 800px;
	width: 80%;
}
/************* controllBox **************/
#controlBox {
	margin-top: 50px;
	width: 100%;
	height: 100px;
	border-bottom: 2px solid black;
	display: inline-block;
	width: 100%;
}
/*
 id="update">회원 정보 수정</li>
				<li id="m1">구매한 영화</li>
				<li id="m2">관람한 영화</li>
				<li id="r1"

*/
#update {
	background-image:
		url("${pageContext.request.contextPath}/img/icon/user-2.png");
	background-size: 50px 50px;
	background-position-x: center;
	background-position-y: 10px;
	line-height: 9;
}

#m1 {
	background-image:
		url("${pageContext.request.contextPath}/img/icon/wallet.png");
	background-size: 50px 50px;
	background-position-x: center;
	background-position-y: 10px;
	line-height: 9;
	line-height: 9;
}

#m2 {
	background-image:
		url("${pageContext.request.contextPath}/img/icon/play-button.png");
	background-size: 50px 50px;
	background-position-x: center;
	background-position-y: 10px;
	line-height: 9;
}

#r1 {
	background-image:
		url("${pageContext.request.contextPath}/img/icon/speech-bubble-1.png");
	background-size: 50px 50px;
	background-position-x: center;
	background-position-y: 10px;
	line-height: 9;
}

/*********************************************/
#shj_ul {
	width: 100%;
	height: 100px;
	display: inline-block;
}

#shj_ul li {
	text-align: center;
	float: left;
	cursor: pointer;
	font-size: 12pt;
	width: 20%;
	height: 100px;
	background-repeat: no-repeat;
	background-position-y: 3px;
}

#shj_ul li:HOVER {
	background-color: #8080ff;
}

.hd {
	font-weight: bold;
	font-size: large;
}

#main_box {
	padding: 20px 20px 20px 20px;
	border: 1px solid black;
	width: 100%;
	height: 650px;
	display: inline-block;
}
</style>
</head>
<body>
	<c:import url="../temp/bootStrap_black.jsp" />
	<c:import url="../temp/header.jsp" />

	<div id="controlBox">
		<ul id="shj_ul">
			<li id="update">회원 정보 수정</li>
			<li id="m1">구매한 영화</li>
			<li id="m2">관람한 영화</li>
			<li id="r1">나의 리뷰</li>
			<li id="r1">test</li>
		</ul>
	</div>
	<section id="container">
		<div id="main_box"></div>
		<!-- ghhghg -->
		<form action="delete" method="post" id="frm">
			<input type="hidden" id="id" name="id" value="${member.id }">
			<input type="hidden" id="pw" name="pw" value="">
		</form>
	</section>
	<script type="text/javascript">
		var id = '${member.id}';
		$("#delete_btn").click(function() {
			var ppt = prompt("탈퇴하시려면 비밀번호를 입력해주세요");
			if (ppt != null) {
				$("#pw").val(ppt);
				$("#frm").submit();
			}
		});
		
		$("#update").click(function(){
			$.get("memberUpdate",function(data){
				$("#main_box").html(data);				
			});
		});
		
		$("#m1").click(function(){
			$.get("myMovie",function(data){
				$("#main_box").html(data);				
			});
		});
		
		
			$.get("memberInfo",function(data){
				$("#main_box").html(data);				
			});
	
		
				
			
		 
		
		
	</script>

	<c:import url="../temp/footer.jsp" />
</body>
</html>