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
			<h2>${member.id}님 안녕하세요.</h2>		
			<div>
			<form action="./admin_mod">
				<table class="table">
										<tr>
						<td class="td3" rowspan="5" ><img src="<c:url value="${member.picture}"/>"></td>
						<td>이름</td>
						<td>${member.name}</td>
						<td></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>${member.id}</td>
						<td></td>
					</tr>					
					<tr>
						<td>비밀번호</td>
						<td><input name="pw" type="password"></td>
						<td></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password"></td>
						<td></td>
					</tr>
					<tr>
						<td>부서</td>
						<td>${member.department}</td>
						<td></td>
					</tr>
					<tr>
						<td><button class="btn-info">사진바꾸기</button></td>
						<td>직책</td>
						<td>${member.position}</td>
						<td></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="phone" value="${member.phone}"></td>
						<td>이메일</td>						
						<td><input type="email" name="email" value="${member.email}"></td>
					</tr>					
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>					
				</table>
				<input type="button" class="btn-success" value="수정완료">
				</form>
			</div>
		</div>
		</div>	
	<c:import url="../temp/footer.jsp" />
</body>
</html>