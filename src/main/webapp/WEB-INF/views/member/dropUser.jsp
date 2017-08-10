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

</style>
<c:import url="../temp/bootStrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_member.jsp" />
<div id="main_session_default">
	<div class="dropBox">
	<p>회원 확인을 위해 비밀번호를 입력해주세요</p>
	<input type="password" id="pw" onkeypress="keycheck(event)">
	<button class="btn btn-success" id="next">확인</button>
	</div>



</div>
<c:import url="../temp/footer.jsp" />
</body>
<script type="text/javascript">
function keycheck(evt){
    var keyCode = evt.which?evt.which:event.keyCode;
    if(keyCode==13){
    	
    }
}


function active(){
	var pw=$("#pw").val();
}


</script>
</html>