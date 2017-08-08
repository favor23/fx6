<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${list}" var="dto">
	<div class="ct">
		<section class="wrapper cl">
			<div class="pic pic-3d">
				<img src="<c:url value="${dto.poster_img}"/>" class="pic-image" alt="Pic">
				<span class="pic-caption open-right" accesskey="${dto.movie_num}">
					<h1 class="pic-title">${dto.movie_title}</h1>
					<hr>
					<p>감독 : ${dto.director}</p>
					<p>출연 : ${dto.actor}</p>
					<p>등급 : ${dto.restricted}세</p>
					<p>개봉 : ${dto.release_date}</p>
					<p>장르 : ${dto.genre}</p>
					<p>러닝타임 : ${dto.running_time}분</p>
				</span>
			</div>
		</section>
	</div>
</c:forEach>