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
<c:import url="../../temp/bootStrap.jsp"></c:import>
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
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
		
		body{
			
			font-family: 'Noto Sans KR';
		
		}
		
		
		.star_rating {font-size:0; letter-spacing:-4px;}
	
	
	.star_rating a {
   		font-size:25px;
    	letter-spacing:0;
    	display:inline-block;
    	margin-left:5px;
   		color:#ccc;
    	text-decoration:none;
	}

.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#ffd11a;}
		
		
		
	.main{
		
		width: 100%;
		height: 650px;
		margin-top : 60px;
		
	
	}
	

	
	.main2{
		
		width: 60%;
		height: 650px;
		margin:  0 auto;
		background-color: white;
		border-top: 2px #503396 solid;
		padding-top: 10px;
		
		
	
	}
	
	
	

	
	
	.text1{
		
		width: 20%;
		height : 34px;
		text-align: center;
		 vertical-align: middle; 
		 line-height: 33px; 
		font-size: 16px;
		float: left;
		margin-top: 18px;
	
	}
	
	.text2{
		width: 80%;
		float: right;
		margin-bottom: 20px;
		margin-top: 20px;
	}
	
	
	.form-control{
		text-align: left;
	}
	
	
	#savebutton{
	
		margin-top: 30px;
		width: 130px;
		height: 50px;
		background-color: #503396;
		border: 1px black solid;
		color: white;
		font-size: 18px;
		margin-bottom: 50px;
	}
	
	#savebutton:HOVER {
	background-color: white;
	color: #503396;
}



</style>

</head>
<body>
	<c:import url="../../temp/header.jsp"/>

	<div class="main">
		<div style="width: 60%; height : 20px;margin : 0 auto;  margin-top: 80px;">
		<p style="float: right;"> 게시판  > 리뷰게시판 </p>
		
		</div>
		<div class="main2">
	<form action="review${path}" method="POST" id="frm" >
		
		<c:if test="${path eq 'Update'}">
			<p><input type="hidden" name="num" value="${dto.num}"></p>
		</c:if>
		
			<input type="hidden" value="${member.id}" name="writer">
			<div class="text1">제 목</div><div class="text2"><input type="text"  name="title" class="form-control" value="${dto.title}" style="width: 100%; "></div>
			<div class="text1">별 점</div>			
			<div class="text3" style="width: 80%; height: 34px; float: left;margin-bottom: 20px; margin-top: -9px;">
			<input type="hidden" name="stars" id="stars" value="3">
			<p class="star_rating" style="text-align: left;">
			    <a href="#" class="vstar on" id="1">★</a>
			    <a href="#" class="vstar on" id="2">★</a>
			    <a href="#" class="vstar on" id="3">★</a>
			    <a href="#" class="vstar" id="4">★</a>
			    <a href="#" class="vstar" id="5">★</a>
			</p>
			</div>
			<p><input type="hidden" value="125" name="movie_num"></p>
		<textarea rows="18" cols="65"  name="contents" id="smarteditor" class="form-control" style="overflow: auto; resize: none;" >${dto.contents}</textarea>
		
		<input type="button" value="작성 완료" id="savebutton">
		
	</form>                                                                                        
	
		</div>
		</div>
	


<c:import url="../../temp/footer.jsp"/>
</body>
</html>