<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${list}" var="srList">
<div class="list">
	<div class="list_left">
		<h3>${srList.sr_stars}</h3><span>별점</span>
	</div>
	<div class="list_right">
		<p>${srList.contents}</p>
		<span style="margin-right: 15px;">${srList.writer}</span>
		<span style="margin-right: 15px;">${srList.reg_date}</span>
		<div class="btns btns2">
		<!-- 
			<c:if test="${srList.writer eq member.id or member.grade eq 'admin'}">
				<span><a href="#" onclick="return false;" class="srDel" accesskey="${srList.num}">삭제</a></span>
			</c:if>
		 -->
			<span><a href="#" onclick="return false;" class="srDel" accesskey="${srList.num}">삭제</a></span>
		</div>
		<div class="btns">
			<span><input type="button" class="good" value="공감" accesskey="${srList.num}">${srList.good}</span>
			<span><input type="button" class="bad" value="비공감" accesskey="${srList.num}">${srList.bad}</span>
		</div>
	</div>
</div>
</c:forEach>
<c:if test="${empty list}">
	<h1>등록된 한줄평이 없습니다.</h1>
</c:if>