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
	height: auto;
	width: 100%;	
	padding-bottom: 100px;
}
.video_list{
	height: auto;
	width: 1350px;
	margin: 0 auto;
	margin-top: 50px;
}
.list{
	width: 1138px;
	height: 250px;
	margin: 0 auto;
	margin-bottom: 30px;
	background-color: gray;
}
</style>
<c:import url="../../temp/bootStrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../../temp/header.jsp" />
	<div id="tap"></div>
	<c:import url="../../temp/header_plus_cinema.jsp" />
	<section id="main_session_default">		
		<div class="video_list">
			<div class="list"></div>
			<div class="list"></div>
			<div class="list"></div>
			<div class="list"></div>
			<div class="list"></div>
		</div>
	</section>

	<c:import url="../../temp/footer.jsp" />
</body>
</html>