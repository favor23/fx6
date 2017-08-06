<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<c:if test="${department eq '인사부'}">
			<div id="action" accesskey="인사부" class="select_department">인사부</div>
			<div accesskey="회계부" class="select_department">회계부</div>
			<div accesskey="후원부" class="select_department">후원부</div>
			<div accesskey="매니저" class="select_department">매니저</div>
			</c:if>
			<c:if test="${department eq '회계부'}">
			<div accesskey="인사부" class="select_department">인사부</div>
			<div id="action" accesskey="회계부" class="select_department">회계부</div>
			<div accesskey="후원부" class="select_department">후원부</div>
			<div accesskey="매니저" class="select_department">매니저</div>
			</c:if>
			<c:if test="${department eq '후원부'}">
			<div accesskey="인사부" class="select_department">인사부</div>
			<div accesskey="회계부" class="select_department">회계부</div>
			<div id="action" accesskey="후원부" class="select_department">후원부</div>
			<div accesskey="매니저" class="select_department">매니저</div>
			</c:if>
			<c:if test="${department eq '매니저'}">
			<div accesskey="인사부" class="select_department">인사부</div>
			<div accesskey="회계부" class="select_department">회계부</div>
			<div accesskey="후원부" class="select_department">후원부</div>
			<div id="action" accesskey="매니저" class="select_department">매니저</div>
			</c:if>
			<table class="table">
				<tr><td>부장<div>
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.department eq department}">
						<c:if test="${dto.position eq '부장'}">													
							<img
							id="${dto.id}"title="${dto.name}${dto.id}"data-toggle="modal" data-target="#myModal"
								class="ProfileCard-avatarImage_2 js-action-profile-avatar"
								src="<c:url value="${dto.picture}"/>">				
						</c:if>
						</c:if>			
						</c:forEach></div>
					</td>
				</tr>
				<tr><td>차장<div>
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.department eq department}">
						<c:if test="${dto.position eq '차장'}">													
							<img
							id="${dto.id}"title="${dto.name}${dto.id}"data-toggle="modal" data-target="#myModal"
								class="ProfileCard-avatarImage_2 js-action-profile-avatar"
								src="<c:url value="${dto.picture}"/>">				
						</c:if>
						</c:if>			
						</c:forEach></div>
					</td>
				</tr>
				
				<tr><td>과장<div>
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.department eq department}">
						<c:if test="${dto.position eq '과장'}">													
							<img
							id="${dto.id}"title="${dto.name}${dto.id}"data-toggle="modal" data-target="#myModal"
								class="ProfileCard-avatarImage_2 js-action-profile-avatar"
								src="<c:url value="${dto.picture}"/>">				
						</c:if>
						</c:if>			
						</c:forEach></div>
					</td>
				</tr>
				
				<tr><td>대리<div>
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.department eq department}">
						<c:if test="${dto.position eq '대리'}">													
							<img
							id="${dto.id}"title="${dto.name}${dto.id}"data-toggle="modal" data-target="#myModal"
								class="ProfileCard-avatarImage_2 js-action-profile-avatar"
								src="<c:url value="${dto.picture}"/>">				
						</c:if>
						</c:if>			
						</c:forEach></div>
					</td>
				</tr>
				
				<tr><td>주임<div>
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.department eq department}">
						<c:if test="${dto.position eq '주임'}">													
							<img
							id="${dto.id}"title="${dto.name}${dto.id}"data-toggle="modal" data-target="#myModal"
								class="ProfileCard-avatarImage_2 js-action-profile-avatar"
								src="<c:url value="${dto.picture}"/>">				
						</c:if>
						</c:if>			
						</c:forEach></div>
					</td>
				</tr>
				
				<tr><td>사원<div>
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.department eq department}">
						<c:if test="${dto.position eq '사원'}">													
							<img
							id="${dto.id}"title="${dto.name}${dto.id}"data-toggle="modal" data-target="#myModal"
								class="ProfileCard-avatarImage_2 js-action-profile-avatar"
								src="<c:url value="${dto.picture}"/>">				
						</c:if>
						</c:if>			
						</c:forEach></div>
					</td>
				</tr>
			</table>