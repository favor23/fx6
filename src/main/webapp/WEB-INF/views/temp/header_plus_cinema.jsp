<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header_plus start -->
<div class="header_plus" >
	<div class="plus_d1"></div>
	<div class="plus_d2">
		<div class="plus_d2_list">
		<ul>
		<li id="${pageContext.request.contextPath}/board/cinema/cinema_list" class="header_plus_li"> 
				모든 상영관
		</li>
		<li id="${pageContext.request.contextPath}/board/cinema/cinema_hotList" class="header_plus_li">
				추천 상영관
		</li>
		<li id="${pageContext.request.contextPath}/board/cinema/cinema_time" class="header_plus_li">
				상영시간표
		</li>		
		<li id="${pageContext.request.contextPath}/board/cinema/cinema_my" class="header_plus_li">
				마이 시네마
		</li>
		<li id="${pageContext.request.contextPath}/board/cinema/cinema_scheduleList" class="header_plus_li">
				오픈예정 시네마
		</li>
		</ul>
		</div>
	</div>
</div>
<!-- header_plus end -->
<script>
$(".header_plus_li").click(function() {
	location.href=$(this).attr("id");
})
</script>

<!-- 필요한곳에  사용
header_plus.jsp
=header_plus_board.jsp, header_plus_mypage.jsp
바꿔서 저장해 아래 목록만들어서 사용하기바람

			<li id="${pageContext.request.contextPath}/board/movie/movieList" class="header_plus_li">
				영화
				</li> 
				id값에 보내고 싶은곳 경로 쓰면됌
	-->
