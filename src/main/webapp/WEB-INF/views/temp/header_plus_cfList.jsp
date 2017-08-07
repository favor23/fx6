<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header_plus start -->
<div class="header_plus" >
	<div class="plus_d2">
		<div class="plus_d2_list">
			<ul>
				<li class="header_plus_li">
					<select style="width: 200px; height: 30px; border-radius: 4px; border: 1px solid #b8b894;">
						<option>최다 후원순</option>
						<option>최다 금액순</option>
						<option>마감 임박순</option>
						<option>최신순</option>
					</select>
				</li>
			</ul>
		</div>
	</div>
</div>
<!-- header_plus end -->
<script>
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
