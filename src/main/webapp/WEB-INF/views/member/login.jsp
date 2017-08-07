<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">

<title>Insert title here</title>
<style type="text/css">
label {
	color: red;
	position: fixed;
	margin-left: 10px;
}

#l1_box {
	border-radius: 7px;
	margin-top: 20px;
	border: 3px solid gray;
	background-color:#f2f2f2;
	width: 20%;
	margin-left: 40%;
	min-width: 200px;
	height: 240px;
	display: inline-block;
	padding: 20px;
}

#loginTable td {
	padding-top: 10px;
	padding-bottom: 10px;
}

.text1 {
	text-align: right;
	padding: 10px;
}

.text2 {
	margin-top: 20px;
}

.span1 {
	float: left;
	margin-left: 30px;
}

.span2 {
	float: right;
	margin-right: 30px;
	vertical-align: middle;
}

.a {
	width: 150px;
	border: 0.5px solid gray;
	border-radius: 5px;
	height: 25px;
	margin-left: 20px;
}

#loginBtn {
	width: 90%;
	height: 40px;
	margin-top: 30px;
	margin-left: 5%;
	border: 0.5px solid gray;
	border-radius: 7px;
	background-color: #ccffcc;
	font-size: large;
	font-weight: bold;
} 

#loginBtn:HOVER {
	background-color: #66ff66;
}

.b {
	width: 20px;
	height: 20px;
	margin-top: 0px;
	vertical-align: middle;
}
#frm {
	padding-top: 20px;
	
}


</style>
</head>
<body>
	<div id="l1_box">
			<label>${message }</label>

		<form action="customerLogin" method="post" id="frm">
			<table id="loginTable">
				<tr>
					<td class="text1">아이디</td>

					<td><input type="text" name="id" autocomplete="off" class="a"></td>
				</tr>
				<tr>
					<td class="text1">비밀번호</td>
					<td><input type="password" name="pw" autocomplete="off"
						class="a">
				</tr>
			</table>
			<div id="nid">
				<input type="button" id="nlogin" value="네이버아이디로로그인">
			</div>
		</form>

		<button id="loginBtn">로그인</button>


	</div>
	<script type="text/javascript">
		$("#loginBtn").click(function() {
			var st = $(":input:radio[name=member]:checked").val();
			if (st == 'user') {
				$("#frm").attr("action", "customerLogin");
			} else {
				$("#frm").attr("action", "adminLogin");
			}

			$("#frm").submit(); 
		});
		
		//네이버 로그인 인증url불러오는 ajax
		
		
		$("#nlogin").click(function(){
			var path;
			$.get("${pageContext.request.contextPath}/nlogin",function(data){
				location.href=data;		
			});
		});
	</script>

</body>
</html>