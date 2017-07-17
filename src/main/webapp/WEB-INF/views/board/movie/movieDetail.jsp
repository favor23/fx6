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
	.main_art1 {
		width: 60%;
		height: 500px;
		float: left;
	}
	
	.art1_div1 {
		width: 60%;
		height: 100%;
		float: left;
	}
	
	.art1_div2 {
		width: 40%;
		height: 100%;
		background-color: red;
		float: right;
	}
	
	.nav_left,
	.nav_right {
		width: 20%;
		height: 500px;
		float: left;
		background-color: gray;
	}
	
	.nav_left {
		margin-top: 100px;
	}
	
	.nav_right {
		float: right;
	}
	
	.main_top {
		width: 60%;
		height: 100px;
		background-color: black;
		margin: 0 auto;
		margin-top: 50px;
	}
	
	.film_rate {
		display: inline-block;
		overflow: hidden;
		text-indent: -9999px;
		margin: -3px 10px 0 0;
		width: 20px;
		height: 21px;
		vertical-align: middle;
		background: url("/fx6/img/index/btn_movie.png") 0 -200px no-repeat;
	}
	
	.age_12 {
		background-position: -60px -200px;
	}
	
	.age_15 {
		background-position: -90px -200px;
	}
	
	.age_19 {
		background-position: -30px -200px;
	}
	
	footer {
		display: flow-root;
	}
</style>
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	
	<section id="main_section">
		<nav class="nav_left">
			
		</nav>
		<article class="main_top">
		
		</article>
		<article class="main_art1">
			<div class="art1_div1">
				<div style="width: 100%; height: 70px; border-bottom: 1px solid black; background-color: yellow;">
					<span class="film_rate age_${dto.restricted}"></span>${dto.movie_title}
				</div>
				<div style="width: 100%; height: 430px; background-color: lime;">
					<p>개봉일 : ${dto.release_date}</p>
					<p>감독 : ${dto.director}</p>
					<p>출연 : ${dto.actor}</p>
					<p>장르 : ${dto.genre}</p>
					<p>러닝타임 : ${dto.running_time}분</p>
					<hr>
					<p>${dto.synopsis}</p>
				</div>
			</div>
			<div class="art1_div2">
				<img style="width: 90%; float: right;" src="<c:url value="${dto.poster_img}"/>">
			</div>
		</article>
		<nav class="nav_right">
			
		</nav>
	</section>
	
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>