<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header start -->
<header>
	<div id="header_bar">
		<ui>
		<li id="bar_logo" class="${pageContext.request.contextPath}/index"><img id="bar_logo" class="${pageContext.request.contextPath}/index" style="cursor: pointer;" src="<c:url value="/img/index/영화를 찍으시조.PNG"/>"></li>
		<li id="${pageContext.request.contextPath}/board/movie/movieList" class="header_li">영화</li>
		<li id="${pageContext.request.contextPath}/" class="header_li">상영관</li>
		<div class="dropdown">
			<li id="header_board" class="dropdown-toggle" data-toggle="dropdown" style="line-height: 49px;
	text-align: center;
	border-right: 1px solid #e5e5e5;
	float: left;
	font-weight: bold;
	height: 49px;
	width: 107px;
	cursor: pointer;
			">
			게시판</li>
			<ul class="dropdown-menu" style="    position: absolute;
    top: 48px;
    right: 430px;
    background-color: white;">
				<li><a href="board/required/requiredList">요청게시판</a></li>
				<li><a href="board/review/reviewList">리뷰게시판</a></li>
				<li><a href="#">매칭게시판</a></li>
			</ul>
		</div>
		</li>		
		<li id="${pageContext.request.contextPath}/" class="header_li">펀딩</li>
		<li id="${pageContext.request.contextPath}/" class="header_li">매칭시스템</li>
		<li id="${pageContext.request.contextPath}/" class="header_li">시나리오</li>
		<c:if test="${empty member}">
			<li id="bar_login"><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>

		</c:if> 
		<c:if test="${!empty member}">
			<div class="dropdown" style="height: 50px; width: 150px; float: right;">
				<li id="bar_login" class="dropdown-toggle" type="button"
					data-toggle="dropdown">${member.name}님반갑습니다.</li> 			
				<ul class="dropdown-menu" style="margin-top: 0px;    padding-top: 0px;      -webkit-box-shadow: 0 0px 0px rgba(0,0,0,.0); 
    box-shadow: 0 0px 0px rgba(0,0,0,.0); ">
					<li id="${pageContext.request.contextPath}/member/logOut" class="admin_li">
					<img	id="${pageContext.request.contextPath}/member/logOut" class="admin_li"	src="<c:url value="/img/index/로그아웃.PNG"/>"></li>
					<li id="${pageContext.request.contextPath}/member/myPage" class="admin_li">
					<c:if test="${member.grade eq 'admin'}">
					<img	id="${pageContext.request.contextPath}/admin/adminPage" class="admin_li"	src="<c:url value="/img/index/마이페이지.PNG"/>"></li>
					</c:if>
					<c:if test="${!member.grade eq 'admin'}">
					<img	id="${pageContext.request.contextPath}/member/logOut" class="admin_li"	src="<c:url value="/img/index/마이페이지.PNG"/>"></li>
					</c:if>
					<%-- <c:if test="${!empty member}">
						<li class="admin_li"><img
							src="<c:url value="/img/index/쪽지.PNG"/>"></li>
					</c:if> --%>
					<c:if test="${!empty member.ticket}">	
						<li class="admin_li"><img
							src="<c:url value="/img/index/영화가곧시작됩니다.PNG"/>"></li>
					</c:if>
				</ul>
			</div>
		</c:if> </ui>
	</div>
</header>
<!-- header end -->
<script>
$("#bar_logo").click(function() {
	location.href=$(this).attr("class");
})
$(".admin_li").click(function() {
	location.href=$(this).attr("id");
})
$(".header_li").click(function() {
	location.href=$(this).attr("id");
})
</script>
