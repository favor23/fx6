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
.dropBox p{
	font-size: 20px;
	font-weight: bold;
	margin-top: 50px;
	margin-bottom: 50px;
}

.dropBox #pw {
	width: 180px;
	height: 35px;
	border:1px solid black;
	border-radius: 6px;
	font-size: 27px;
}

.dropBox #next {
	vertical-align: 3px;
	width: 70px;
	height: 35px;
	font-size: 15px; 
}

.member_css {
	margin: 0px auto;
	padding: 0px;
	text-align: center;
	font-family: 'Open Sans', sans-serif;
}

</style>
<c:import url="../temp/bootStrap_black.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_member.jsp" />
<div id="main_session_default" class="member_css">
	<div class="dropBox">
	<c:if test="${val eq 0}">
	<p>회원 정보 수정을 위해 비밀번호를 입력해주세요</p>
	</c:if>
	<c:if test="${val eq 1}">
	<p>회원 탈퇴를 위해 비밀번호를 입력해주세요</p>	
	</c:if>
	<input type="password" id="pw" onkeypress="keycheck(event)">
	<button class="btn btn-success" id="next" onclick="active()">확인</button>
	</div>

<form action="" method="post" id="findPw" style="">
</form>

</div>
<c:import url="../temp/footer.jsp" />
</body>
<script type="text/javascript">
var val=${val};

function keycheck(evt){
    var keyCode = evt.which?evt.which:event.keyCode;
    if(keyCode==13){
    	active();
    }
}


function active(){
	var pw=$("#pw").val();
	var id='${member.id}';
	$.post("${pageContext.request.contextPath}/member/findPw2",{
		id:id,
		pw:pw
	},function(data){
		if(data==1){
			if(val==1){
				$("#findPw").attr("action","${pageContext.request.contextPath}/member/dropUserForm");
			}else {
				$("#findPw").attr("action","${pageContext.request.contextPath}/member/memberUpdate");
			}
			$("#findPw").submit();
		}else {
			alert("비밀번호가 일치하지않습니다.");
		}
	});	
}


</script>
</html>