<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header_plus start -->
<div class="header_plus" >
	<div class="plus_d1"></div>
	<div class="plus_d2">
		<div class="plus_d2_list">
		<ul>
		<li id="${pageContext.request.contextPath}/admin/adminPage" class="header_plus_li">
				사내조직도
		</li>
		<li id="${pageContext.request.contextPath}/admin/adminBusiness" class="header_plus_li">
				업무관리 
		</li>	
		<li id="${pageContext.request.contextPath}/admin/adminSchedule" class="header_plus_li">
				스케줄관리 
		</li>
		<li id="${pageContext.request.contextPath}/admin/adminRequest_hi" class="header_plus_li">
				요청관리 
		</li>
		<%-- <li id="${pageContext.request.contextPath}/admin/adminManager" class="header_plus_li">
				조직도
		</li> --%>			
		<li id="${pageContext.request.contextPath}/admin/adminManager" class="header_plus_li">
				관리자메뉴
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
