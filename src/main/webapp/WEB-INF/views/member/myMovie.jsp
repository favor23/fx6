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
	height: 1200px;
	width: 1000px;
	margin: 0 auto;
}
.mv_title {
	border-bottom: 2px solid green;
	width: 150px;
	margin-left: 15%;
    margin-top: 50px;
    font-weight: bold;
    font-size: large;
    border-bottom: 2px solid green;
}

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
height: 430px;
display: inline-block;
float: left;
}

.mb2 img {
	width: 300px;

}

.mb3 {
width: 500px;
display: inline-block;
height: 430px;
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
<c:import url="../temp/bootStrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_member.jsp" />
<div id="main_session_default" class="member_css">
<p class="mv_title">구매한 영화 내역</p>
<div id="mag">
<c:if test="${list ne '[]'}">
	<c:forEach items="${list}" var="t">			
		<div class="mb1">
		<span class="m1 me">${t.movie_title }</span>
		<span class="m2 me age${t.restricted}">${t.restricted}</span>
		<span class="m3 me">${t.running_time}분</span> 
		<span class="m4 me"><strong>개봉일 : </strong>${t.release_date}</span>
		<span class="m5 me"><strong>장르 : </strong>${t.genre}</span>
		</div>
		<div class="mb2 tbl"><img src="<c:url value='${t.poster_img}'/>"></div>
		<div class="mb3 tbl">${t.synopsis}</div>
		<div class="mb4 tbl"><strong>감독 : </strong>${t.director}</div>		
		<div class="mb5 tbl"><strong>출연진 : </strong>${t.actor}</div>	
	</c:forEach>
	</c:if>
	<c:if test="${list eq '[]'}">
		<h2 style="text-align: center;margin-top: 15px;">구매한 영화가 없습니다.</h2>
	</c:if>
</div>
</div>
<c:import url="../temp/footer.jsp" />
</body>
</html>