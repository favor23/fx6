<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table" width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="3">프로젝트 참여인원<input type="text" id="persons_mod" name="persons" value="${str_plus}"></td>
							
						</tr>
						<c:forEach items="${admin_list}" var="dto">
							<c:if test="${dto.department eq member.department}">
							<c:forEach items="${jbAry}" var="strAry">
								<c:if test="${dto.id eq strAry}">
								<tr>
									<td rowspan="2"><img class="admin_smell_img"
										src="<c:url value="${dto.picture}"/>"></td>
									<td>${dto.name}</td>
									<td>${dto.position}</td>
								</tr>
								<tr>
									<%-- <td colspan="2"><input id="${dto.id}" type="button"
										class="btn-default select_one_x" value="참여취소"></td> --%>
									
								</tr>
								</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</table>