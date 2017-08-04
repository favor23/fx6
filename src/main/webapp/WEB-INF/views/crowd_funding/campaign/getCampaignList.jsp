<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${list}" var="dto">
	<div class="ct">
		<section class="wrapper cl">
			<div class="pic pic-3d">
				<img src="<c:url value="${dto.campaign_img}"/>" class="pic-image" alt="Pic">
			</div>
		</section>
	</div>
</c:forEach>