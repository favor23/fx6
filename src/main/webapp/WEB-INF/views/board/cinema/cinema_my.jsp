<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<c:import url="../../temp/bootStrap_black.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../../temp/header_plus.jsp" />
<div id="main_session_default"></div>
<c:import url="../../temp/footer.jsp" />
</body>
</html>