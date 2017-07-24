<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../temp/bootStrap.jsp"></c:import>
<style type="text/css">
	.nav_left,
	.nav_right {
		width: 20%;
		height: 550px;
		float: left;
	}
	
	.nav_left {
		background-color: lime;
	}
	
	.nav_right {
		float: right;
		background-color: red;
	}
	
	.main_art {
		width: 60%;
		height: 550px;
		float: left;
		background-color: blue;
	}
</style>
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	
	<section id="main_section">
		<nav class="nav_left">
			
		</nav>
		
		<article class="main_art">
		
		</article>
		
		<nav class="nav_right">
			
		</nav>
	</section>
	
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>