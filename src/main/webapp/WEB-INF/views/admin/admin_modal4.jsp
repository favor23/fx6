<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="modal_d2 well" style="overflow: auto">
	<table class="table" width="100%" border="0" cellspacing="0"
		cellpadding="0">
		<tr>
			<td colspan="3">${member.department}명단 리스트</td>
		</tr>
		<tr>
			<td></td>
			<td>이름</td>
			<td>직책</td>
		</tr>
		
		<c:forEach items="${admin_list}" var="dto">
			<c:if test="${dto.department eq member.department}">
				<tr>
					<td rowspan="2"><img class="admin_smell_img"
						src="<c:url value="${dto.picture}"/>"></td>
					<td>${dto.name}</td>
					<td>${dto.position}</td>
				</tr>
				<tr>			
					<td colspan="2">						
					<input id="${dto.id}" type="button"	class="btn-default insert_gogo2" value="클릭">				
						</td>
						
				</tr>
			</c:if>
		</c:forEach>
	</table>
</div>
<div class="modal_d4_mod well" style="overflow: auto">
	<button id="modmodmod">현재 참여인원</button>
</div>