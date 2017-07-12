<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href=".css" />
<!-- header start -->
	<header>
		<div id="header_bar">
			<ui>
			<li id="bar_logo">이미지로그</li>
			<li class="header_li">영화</li>
			<li class="header_li">큐레이션</li>
			<li class="header_li">영화관</li>
			<li class="header_li">특별관</li>
			<li class="header_li">스토어</li>
			<li class="header_li">이벤트</li>
			<c:if test="${empty member}">
			<li id="bar_login">로그인</li>
			</c:if>
			<%-- <c:if test="${!empty member}">
			<li id="bar_login"><img alt="" src=""> ${member.name}님<a href="#">로그아웃</a></li>
			</c:if> --%>
			
			</ui>
			
		</div>
	</header>
<!-- header end -->