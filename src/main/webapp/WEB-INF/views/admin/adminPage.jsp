<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#tap {
	width: 100%;
	height: 50px;
}

#main_session_default {
	height: 1200px;
	width: 1000px;
	margin: 0 auto;
}

.d1_a {
	height: 300px;
	width: 100%;
	margin-top: 50px;
}

.d2_a {
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
			<div>
				<img src="/img/admin/라이언.PNG">
			</div>
			<div>
				<table class="table">
					<tr>
						<td rowspan="3"></td>
						<td>이름</td>
						<td>김지수</td>
					</tr>
					<tr>
						<td>부서</td>
						<td>인사부</td>
					</tr>
					<tr>
						<td>직책</td>
						<td>부장</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>

		<div class="d2_a">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
	<c:import url="../temp/footer.jsp" />
</body>
</html>