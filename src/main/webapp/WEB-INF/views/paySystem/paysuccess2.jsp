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
	height: 345px;
	width: 700px;
	margin: 0 auto;
}


</style>
<c:import url="../temp/bootStrap_black.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화를 찍으시조</title>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus.jsp" />
<div id="main_session_default">
<img src="<c:url value="/img/index/결제완료_영.PNG"/>">


</div>
<c:import url="../temp/footer.jsp" />
</body>
</html>