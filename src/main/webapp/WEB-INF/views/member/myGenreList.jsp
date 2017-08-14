<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap_black.jsp"/><!-- 다 짜고나서 블랙으로 바꿔라 -->
<title>Insert title here</title>
<style type="text/css">

.tbl{
border: 1px solid black;
}
.mb1 {
width: 800px;
height: 35px;
display: inline-block;


}
.me {
border:1px solid black;
float: left;
margin-right: 10px;
padding: 5px;
text-align: center;
}
.m1 {
width: 250px;
}

.m5 {
	width: 290px;
	margin-right: 0px;
	float: right;

}

.mb2 {
width: 300px;
height: 350px;
display: inline-block;
float: left;
}

.mb3 {
width: 500px;
display: inline-block;
height: 350px;
overflow: auto;
padding: 10px;
}
.mb4 {
width: 300px;
height: 40px;
display: inline-block;
padding: 10px;
}
.mb5{
 width: 500px;
 height: 40px;
display: inline-block;
float: left;
padding: 10px;
 }
#mag {
 margin: 0 auto;
 width: 800px;

}
.age12 {
	color: navy;
	font-weight: bold;
}
.age15 {
	color: white;
	font-weight: bold;
	background-color: green;
}
.age19 {
	color: white;
	font-weight: bold;
	background-color: red;
}

</style>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_member.jsp" />
<div id="main_session_default" class="member_css">
<p class="mv_title">${member.id } 님께 추천하는 영화목록입니다.</p>
<div id="mag">
	<span>포스터 이미지를 누르면 자세한 정보를 확인할 수 있습니다.</span>
	<c:forEach items="${taste}" var="t">			
		<div class="mb1">
		<span class="m1 me">${t.movie_title }</span>
		<span class="m2 me age${t.restricted}">${t.restricted}</span>
		<span class="m3 me">${t.running_time}분</span> 
		<span class="m4 me"><strong>개봉일 : </strong>${t.release_date}</span>
		<span class="m5 me"><strong>장르 : </strong>${t.genre}</span>
		</div>
		<div class="mb2 tbl poster"><img id="${t.movie_num }" class="poster" src="<c:url value='${t.poster_img}'/>"></div>
		<div class="mb3 tbl">${t.synopsis}</div>
		<div class="mb4 tbl"><strong>감독 : </strong>${t.director}</div>		
		<div class="mb5 tbl"><strong>출연진 : </strong>${t.actor}</div>	
	</c:forEach>
</div>
</div>
<c:import url="../temp/footer.jsp" />

<form action="myGenre" method="post" id="frm">
<input type="hidden" name="num" value="" id="movie_num">

</form>

</body>
	<script type="text/javascript">
	
	
	$(".poster").click(function(){
		var num = $(this).attr("id");
		$("#movie_num").val(num);
		$("#frm").submit();
	});
	
	
	</script>
</html>