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
		<table>
			<tr>
				<td>${srList.writer}</td>
				<td>${srList.reg_date}</td>
			</tr>
		</table>
		<button class="good good${srList.num}">공감</button>${srList.good}
		<button class="bad bad${srList.num}">비공감</button>${srList.bad}
	</div>
</div>
</c:forEach>
<c:if test="${empty list}">
	<h1>등록된 한줄평이 없습니다.</h1>
</c:if>