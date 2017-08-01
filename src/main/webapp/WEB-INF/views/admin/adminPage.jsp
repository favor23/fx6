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
td{
	width: 25%;
}
.td3 img{
	margin: 0 auto;
	height: 160px;
	width: 120px;
}
.admin_mod{
	width: 100%;
	height: 100%;	
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
			<h2>사내 조직원 정보</h2>		
			<div>
				<table class="table">
					<tr>
						<td class="td3" rowspan="5" ><img src="<c:url value="/img/admin/라이언.PNG"/>"></td>
						<td>이름</td>
						<td>김지수</td>
						<td></td>
					</tr>
					<tr>
						<td>부서</td>
						<td>인사부</td>
						<td></td>
					</tr>
					<tr>
						<td>직책</td>
						<td>부장</td>
						<td></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>01087786076</td>
						<td></td>
					</tr>
					<tr>
						<td>이메일</td>						
						<td>favor23@naver.com</td>
						<td><button class="admin_mod btn-danger">회원정보 수정</button></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>					
				</table>
			</div>
		</div>

		<div class="d2_a">
			<h2>부</h2>
			<table>
				<tr>
					<td>부장</td>
					<td colspan="5">
						<c:forEach items="">
						<div>
							<img src="<c:url value="/img/admin/라이언.PNG"/>">
							<p></p>
						</div>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>차장</td>
					<td colspan="5">
						<c:forEach items="">
						<div>
							<img src="<c:url value="/img/admin/라이언.PNG"/>">
							<p></p>
						</div>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>대리</td>
					<td colspan="5">
						<c:forEach items="">
						<div>
							<img src="<c:url value="/img/admin/라이언.PNG"/>">
							<p></p>
						</div>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>주임</td>
					<td colspan="5">
						<c:forEach items="">
						<div>
							<img src="<c:url value="/img/admin/라이언.PNG"/>">
							<p></p>
						</div>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>사원</td>
					<td colspan="5">
						<c:forEach items="">
						<div>
							<img src="<c:url value="/img/admin/라이언.PNG"/>">
							<p></p>
						</div>
						</c:forEach>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<c:import url="../temp/footer.jsp" />
</body>
</html>