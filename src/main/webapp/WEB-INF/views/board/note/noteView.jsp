<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.main_section{
	
		width: 250px;
		height: 300px;
		/* background-color: red; */
		margin: 0 auto;
		margin-top: 20px;	
	}
	
	.top_section{
		width: 150px;
		height: 40px;
		/* background-color: yellow; */
		float: left;
	}
	
	
	.top_section2{
		width: 100px;
		height: 40px;
		/* background-color: gray; */
		float: right;
	}
	
	.info_section{
		width: 250px;
		height: 200px;
		/* background-color: blue; */
		margin: 0 auto;
		overflow: auto;
	}
	
</style>
</head>
<body>
	<div class="main_section">
		<div class="top_section">
			${view.sender}
		</div>
		<div class="top_section2">
			${view.reg_date }
		</div>
		<br>
		<div class="info_section">
			${view.contents}		
		</div>
	
	
	</div>
	<a href ="noteDelete?num=${view.num}">삭제하기</a> 

</body>
</html>