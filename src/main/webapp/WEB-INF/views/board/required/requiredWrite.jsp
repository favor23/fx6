<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>Insert title here</title>
<!-- <script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script type="text/javascript">



$(function(){
    //전역변수선언
   
    
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
     
        //폼 submit
        $("#frm").submit();
       
        
    });

    
    
    
});



</script>

</head>
<body>

	<form action="required${path}" method="POST" id="frm" >
		
		<c:if test="${path eq 'Update'}">
			<p><input type="hidden" name="num" value="${dto.num}"></p>
		</c:if>
		 
		<c:if test="${path eq 'Reply'}">
			<p><input type="hidden" name="num" value="${reply}"></p>
		</c:if>
		<p>WRITER : <input type="text"  name="writer" value="${dto.writer}"></p>
		<p>TITLE : <input type="text"  name="title" value="${dto.title}"></p>
		<textarea rows="" cols="65"  name="contents" id="smarteditor" >${dto.contents}</textarea>
		
		
	
		<input type="button" value="button" id="savebutton">

	</form>                                                                                        

</body>
</html>