<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/><!-- 다 짜고나서 블랙으로 바꿔라 -->
<title>Insert title here</title>

<style type="text/css">
.poster {
	width: 100px;
	height: 80px;
	background-color: green;
}
</style>
</head>
<body>
<table>
	<c:forEach items="${taste }" var="list">
	
	<tr>
		<td>${list.movie_title }(${list.restricted })</td><td>${list.release_date }</td>
	</tr>
	<tr>
		<td class="poster" id="${list.movie_num }">포스터</td><td>${list.synopsis }</td>
	</tr>
	<tr>
		<td>감독</td><td>${list.director }</td>	
	</tr>
	<tr>
		<td>배우</td><td>${list.actor }</td>	
	</tr>
	<tr>
		<td>러닝타임</td><td>${list.running_time}</td>	
	</tr>
	<tr>
		<td>장르</td><td>${list.genre }</td>	
	</tr>
	<tr>
		<td colspan="2">------------------구분선 -----------------------</td>
	</tr>
	</c:forEach>
</table>
<form action="myGenre" method="post" id="frm">
<input type="hidden" name="num" value="" id="movie_num">

</form>

	<script type="text/javascript">
	
	
	$(".poster").click(function(){
		var num = $(this).attr("id");
		$("#movie_num").val(num);
		$("#frm").submit();
	});
	
	
	</script>
</body>
</html>