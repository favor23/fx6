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
	<table>
		<thead>
			<tr>
				<th>신고번호</th>
				<th>대상</th>
				<th>사유</th>
				<th>처리시간</th>
				<th>밴부여</th>
				<th>담당자</th>
			</tr>
		</thead>
		<tbody>
		<!-- //targetId,reason,senderId,roomNum,proccess,num,adminId,reg_date,ban -->
		<c:forEach items="${banList }" var="l">
			<tr>
				<td>${l.num }</td>
				<td>${l.targetId }</td>
				<td>${l.reason }</td>
				<td>${l.reg_date }</td>
				<td>${l.ban }</td>
				<td>${l.adminId }</td>	
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<button id="closePlz">닫기(혹은 이전)</button>
	
	<script type="text/javascript">
	$("#closePlz").click(function(){
		alert("닫기버튼임");
	});
	
	</script>
</body>
</html>