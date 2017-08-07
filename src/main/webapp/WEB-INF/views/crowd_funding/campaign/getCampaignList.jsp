<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${list}" var="dto">
	<div class="ct">
		<div class="ct_wrap">
			<section class="wrapper cl">
				<div class="pic pic-3d">
					<img src="<c:url value="${dto.campaign_img}"/>" class="pic-image" alt="Pic">
				</div>
			</section>
			<section class="bot">
				<div class="cam_title">
					<h5>${dto.campaign_title}</h5>
				</div>
				<div class="cam_name">
					<p>${dto.register_name}</p>
				</div>
				<div class="progress-box progress-box-default">
				<!-- Default panel contents -->
					<div class="progress-heading">
						<c:if test="${dto.until_end<0}">
							<span style="color: #d9534f; font-size: 0.9em;">마감</span>
						</c:if>
						<c:if test="${dto.until_end>=0}">
							<span style="font-size: 0.9em;">앞으로 <span style="font-weight: bold; font-size: 1.2em;">${dto.until_end}</span>일</span>						
						</c:if>
						<span style="font-size: 0.9em; float: right;"><span style="font-size: 1.1em; font-weight: bold;"><fmt:formatNumber value="${dto.support_price}" pattern="#,###"></fmt:formatNumber></span>원 &nbsp;${dto.per}%</span>
					</div>
					<div class="progress-small">
						<div role="progressbar" aria-valuenow="10" aria-valuemin="0" class="progress-bar-small progress-bar-s-danger" style="WIDTH: ${dto.per}%" aria-valuemax="100">
							<span class="sr-only">60% Complete</span>
						</div><!-- Complete -->
					</div>
				</div>
			</section>
		</div>
	</div>
</c:forEach>