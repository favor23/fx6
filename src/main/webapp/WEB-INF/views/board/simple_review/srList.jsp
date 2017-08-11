<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${list}" var="srList">
<div class="list">
	<div class="list_left">
		<span style="font-size: 1.5em;">${srList.sr_stars}
						<c:if test="${srList.sr_stars>0.0 and srList.sr_stars<1.0 or srList.sr_stars==0.0 or srList.sr_stars==1.0}">
							<img src="<c:url value="/img/reviewimg/star1.jpg"/>">
						</c:if>
						<c:if test="${srList.sr_stars>1.0 and srList.sr_stars<2.0 or srList.sr_stars==2.0}">
							<img src="<c:url value="/img/reviewimg/star2.jpg"/>">	
						</c:if>
						<c:if test="${srList.sr_stars>2.0 and srList.sr_stars<3.0 or srList.sr_stars==3.0}">
							<img src="<c:url value="/img/reviewimg/star3.jpg"/>">		
						</c:if>
						<c:if test="${srList.sr_stars>3.0 and srList.sr_stars<4.0 or srList.sr_stars==4.0}">
							<img src="<c:url value="/img/reviewimg/star4.jpg"/>">	
						</c:if>
						<c:if test="${srList.sr_stars>4.0 and srList.sr_stars<5.0 or srList.sr_stars==5.0}">
							<img src="<c:url value="/img/reviewimg/star5.jpg"/>">		
						</c:if>
		</span>
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
			<span><a href="#" onclick="return false;" class="srDel btn btn-danger" accesskey="${srList.num}" style="margin-left: 3px;">삭제</a></span>
		</div>
		<div class="btns">
			<span><button type="button" class="good btn btn-info" accesskey="${srList.num}">공감&nbsp;<span class="badge">${srList.good}</span></button></span>
			<span><button type="button" class="bad btn btn-warning" accesskey="${srList.num}">비공감&nbsp;<span class="badge">${srList.bad}</span></button></span>
		</div>
	</div>
</div>
</c:forEach>
<c:if test="${empty list}">
	<h1>등록된 한줄평이 없습니다.</h1>
</c:if>