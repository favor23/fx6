<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header start -->
<header>
	<div id="header_bar">
		<ui>
		<li id="bar_logo"><img src="<c:url value="/img/index/영화를 찍으시조.PNG"/>"></li>
		<li class="header_li">영화</li>
		<li class="header_li">큐레이션</li>
		<li class="header_li">영화관</li>
		<li class="header_li">특별관</li>
		<li class="header_li">스토어</li>   
		<li class="header_li">이벤트</li>
		<c:if test="${empty member}">
				<li id="bar_login">로그인</li>
			
		</c:if> 
		<c:if test="${!empty member}">
			<div class="dropdown" style="height: 50px;">
				<li id="bar_login" class="dropdown-toggle" type="button"
					data-toggle="dropdown">${member.name}님 반갑습니다.</li> <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li class="admin_li"><img src="<c:url value="/img/index/로그아웃.PNG"/>"></li>
					<li class="admin_li"><img src="<c:url value="/img/index/마이페이지.PNG"/>"></li>
					<c:if test="${!empty member.id}">
						<li class="admin_li"><img src="<c:url value="/img/index/쪽지.PNG"/>"></li>
						<li class="admin_li"><img src="<c:url value="/img/index/영화가곧시작됩니다.PNG"/>"></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		</ui>
	</div>
</header>
<!-- header end -->