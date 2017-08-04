<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header_plus start -->
<div class="header_plus" >
	<div class="plus_d2">
		<div class="plus_d2_list">
			<ul>
				<li id="../movie/movieList" class="header_plus_li">
						전체
				</li>
				<li id="../movie/movieList2" class="header_plus_li">
						현재상영작
				</li>
				<li id="../movie/movieList3" class="header_plus_li">
						개봉예정작
				</li>
				<li id="../movie/movieList4" class="header_plus_li">
						지난영화
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
