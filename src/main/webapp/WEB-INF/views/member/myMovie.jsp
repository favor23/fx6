<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
#my1 {
	border: 1px solid black;
}

#my2 {
border: 1px solid black;
}

#my3 {
border: 1px solid black;
}


</style>
</head>
<body>
	<h2>구매한 영화 내역</h2>
	<div>
		<p>구매 내역</p>
		<div id="my1">
			<c:forEach items="${list}" var="t">
			${t.movie_title }
			</c:forEach>
		</div>
	</div> 
<script type="text/javascript">
	
</script>
</body>
</html>