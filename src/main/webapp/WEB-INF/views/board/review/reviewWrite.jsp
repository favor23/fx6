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

$( document ).ready(function() {
    
	$( ".star_rating a" ).click(function() {
	    $(this).parent().children("a").removeClass("on");
	    $(this).addClass("on").prevAll("a").addClass("on");
	    return false;
	});
});

$(function(){
    //전역변수선언
   
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
     
        //폼 submit
        $("#frm").submit();
    });

    
    
    $(".vstar").click(function() {
 
 	  var star = $(this).attr("id");
 	 	$("#stars").val(star);
	});
    
});



</script>
<style type="text/css">
	.star_rating {font-size:0; letter-spacing:-4px;}
	
	
	.star_rating a {
   		font-size:22px;
    	letter-spacing:0;
    	display:inline-block;
    	margin-left:5px;
   		color:#ccc;
    	text-decoration:none;
	}

.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#ffd11a;}


</style>
</head>
<body>

	<form action="review${path}" method="POST" id="frm" >
		
		<c:if test="${path eq 'Update'}">
		<p><input type="hidden" name="num" value="${dto.num}"></p>
		</c:if>
		<p>WRITER : <input type="text"  name="writer" value="${dto.writer}"></p>
		<p>TITLE : <input type="text"  name="title" value="${dto.title}"></p>
		<textarea rows="" cols="65"  name="contents" id="smarteditor" >${dto.contents}</textarea>
		<input type="hidden" name="stars" id="stars" value="3">
		
		<p class="star_rating">
		    <a href="#" class="vstar on" id="1">★</a>
		    <a href="#" class="vstar on" id="2">★</a>
		    <a href="#" class="vstar on" id="3">★</a>
		    <a href="#" class="vstar" id="4">★</a>
		    <a href="#" class="vstar" id="5">★</a>
		</p>


		<p><input type="hidden" value="125" name="movie_num"></p>
		<input type="button" value="button" id="savebutton">
		
		
	
	
	
	</form>                                                                                        



</body>
</html>