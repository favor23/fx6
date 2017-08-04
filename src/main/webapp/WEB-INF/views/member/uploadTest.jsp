<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#img {
		border: 1px solid black;
		width:200px;
		height:250px;
	
	}

</style>
</head>
<body>

	
	<h2>단일 파일 업로드</h2>
	<hr>
	<div id="img">
	<c:if test="${!empty file}">
	<img alt="" src="/fx6/upload/${file.fname }" />
	</c:if>
	<c:if test="${empty file}">
	이미지가 없습니다.
	</c:if>
	</div>
	
	<form action="upload" method="post" id="f" enctype="multipart/form-data">
		<input type="text" name="id">
		<input type="file" name="f1">
	</form>
		<button id="up">UPLOAD</button>
		
		<script type="text/javascript">		
		
		$("#up").click(function(){
			$("#f").submit();
		});
		
		
		</script>
</body>
</html>