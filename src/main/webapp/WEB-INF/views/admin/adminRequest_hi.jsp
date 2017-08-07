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
	height: auto;
	width: 1000px;
	margin: 0 auto;
}
.d1_a{
	height: 800px;
	width: 100%;
	background-color: gray;
	margin-top: 50px;
}
.d1_b{
	height: 700px;
	width: 100%;
	background-color: gray;
	margin-top: 50px;
}
</style>
<c:import url="../temp/bootStrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_admin.jsp" />
<div id="main_session_default">
		<div class="d1_a">
			<table class="table">
			<tr>
			<td>번호</td><td>아이디</td><td>시작날짜</td><td>현재상황</td></tr>
			<c:forEach items="${list}" var="dto">
				<tr><td>${dto.num}</td><td>${dto.id }</td><td>${dto.start_date}</td><td>${dto.permission}</td>
			</tr>
			</c:forEach>
			
			</table>
		</div>			
	</div>
<c:import url="../temp/footer.jsp" />
</body>
</html>