<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header start -->
<header>
	<div id="header_bar">
		<ui>
		<li id="bar_logo"><a
			href="${pageContext.request.contextPath}/index"><img
				src="<c:url value="/img/index/영화를 찍으시조.PNG"/>"></a></li>
		<li class="header_li"><a
			href="${pageContext.request.contextPath}/board/movie/movieList">영화</a></li>
		<li class="header_li"><a
			href="${pageContext.request.contextPath}/">상영관</a></li>
		<div class="dropdown">
			<li class="header_li dropdown-toggle" data-toggle="dropdown">
			게시판</li>
			<ul class="dropdown-menu">
				<li><a href="#">요청게시판</a></li>
				<li><a href="#">리뷰게시판</a></li>
				<li><a href="#">매칭게시판</a></li>
			</ul>
		</div>
		</li>		
		<li class="header_li"><a
			href="${pageContext.request.contextPath}/">펀딩</a></li>
		<li class="header_li"><a
			href="${pageContext.request.contextPath}/">이벤트</a></li>
		<li class="header_li"><a
			href="${pageContext.request.contextPath}/">시나리오</a></li>
		<c:if test="${empty member}">
			<li id="bar_login"><a
				href="${pageContext.request.contextPath}/member/login">로그인</a></li>

		</c:if> <c:if test="${!empty member}">
			<div class="dropdown" style="height: 50px;">
				<li id="bar_login" class="dropdown-toggle" type="button"
					data-toggle="dropdown">${member.name}님반갑습니다.</li> <span
					class="caret"></span>				
				<ul class="dropdown-menu">
					<li class="admin_li"><img
						src="<c:url value="/img/index/로그아웃.PNG"/>"></li>
					<li class="admin_li"><img
						src="<c:url value="/img/index/마이페이지.PNG"/>"></li>
					<c:if test="${!empty member.id}">
						<li class="admin_li"><img
							src="<c:url value="/img/index/쪽지.PNG"/>"></li>
						<li class="admin_li"><img
							src="<c:url value="/img/index/영화가곧시작됩니다.PNG"/>"></li>
					</c:if>
				</ul>
			</div>
		</c:if> </ui>
	</div>
</header>
<!-- header end -->