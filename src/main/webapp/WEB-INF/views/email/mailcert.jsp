<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>Insert title here</title>
</head>
<body>
<h2>이메일 인증하기 테스트 페이지임</h2>
<form action="" method="post" id="f">
</form>

<p>이메일 입력 : <input type="email" name="email" id="email"></p>

<button id="b">인증번호 발급</button>
<span id="sp"></span>
<p>인증번호 입력 : <input type="text" id="te"></p>

<script type="text/javascript">
$("#b").click(function(){
	var email=$("#email").val();
	$.post("${pageContext.request.contextPath}/sendMail/auth",{
		email:email
	},function(data){
		$("#sp").html(data);
	});
});


</script>

</body>
</html>