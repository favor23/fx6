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
#black_div{
	width: 100%;
	height: 350px;
	background-color: #1b1b1b;
	
	
}
#black_video{
	width: 1350px;
	height: 350px;
	margin: 0 auto;
}
.item_ul{
	width: 100%;
	height: 280px;
	margin-top: 50px;
}
.item_size{
	margin-right: 15px;
	float: left;
}
.item_size > img{
		width: 150px;
	height: 213px;
}
#movie_time{
	width: 950px;
	height: auto;
	margin: 0 auto;
}
#movie_time_title{
	width: 100%;
	height: 100px;
	margin: 100px 0 30px 0;
	background-color: gray;
}
#preview{
	width: 100%;
	height: 200px;
	background-color: green;
}
#timetable_of_movies{
	width: 100%;
	height: 800px;
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
		<div id="black_div">
			<div id="black_video">
				<section id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>				
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<ul class="item_ul">
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>	
				</ul>	
				</div>

				<div class="item">
				<ul class="item_ul">
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>
					<li class="item_size"><img src="<c:url value="/img/index/스파이더맨2.jpg"/>"></li>	
				</ul>					
				</div>
			</div>
			
		</section>	
				
			</div>
		</div>
		<div id="movie_time">
			<div id="movie_time_title"></div>
			<div id="preview"></div>
			<div id="timetable_of_movies"></div>
		</div>
	</section>

	<c:import url="../../temp/footer.jsp" />
</body>
</html>