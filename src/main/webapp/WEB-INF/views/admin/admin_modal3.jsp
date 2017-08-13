<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table" width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="3"><label>프로젝트 참여인원</label><span class="badge">${jbAry_count-1}</span><input type="hidden" id="persons_mod" name="persons" value="${str_plus}">
							<input type="hidden" id="persons" name="persons" value="${str_plus}"></td>
							
						</tr>
						<c:forEach items="${admin_list}" var="dto">
							<c:forEach items="${jbAry}" var="strAry">							
								<c:if test="${dto.id eq strAry}">
								<tr>
									<td rowspan="2"><img class="admin_smell_img"
										src="<c:url value="${dto.picture}"/>"></td>
									<td>${dto.name}</td>
									<td>${dto.position}</td>
								</tr>
								<tr>
									<td colspan="2"><c:if test="${member.department ne dto.department}">
										[다른 부서의 인원입니다.]
									</c:if>	
									<c:if test="${member.department eq dto.department}">
										<button class="btn-success">참여 완료 되었습니다.</button>
									</c:if>									
									</td>								
								</tr>
								</c:if>
								</c:forEach>
						</c:forEach>
					</table>