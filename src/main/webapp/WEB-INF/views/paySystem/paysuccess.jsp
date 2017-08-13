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


</style>
<c:import url="temp/bootStrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화를 찍으시조</title>
</head>
<body>
<c:import url="temp/header.jsp" />
<div id="tap"></div>
<c:import url="temp/header_plus.jsp" />
<div id="main_session_default">
주문/결제
<div>
<hr>
주문이 정상적으로 완료되었습니다.
<table class="table">
<tr>
<td>주문번호</td><td colspan="2"></td>
</tr>
<tr>
<td>결제정보</td><td colspan="2"></td>
</tr>
</table>
</div>

</div>
<c:import url="temp/footer.jsp" />
</body>
</html>