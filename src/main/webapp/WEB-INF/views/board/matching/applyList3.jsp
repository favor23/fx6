<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<h3>스텝 지원 현황</h3>
					
						<table>
						<c:forEach items="${list}" var="apply">
							<c:if test="${apply.apply_roll eq '스텝'}">
							<tr>
								<td>${apply.apply_num}</td>
								<td>${apply.id}</td>
								<td>${apply.name}</td>						
													
							</tr>
							<tr>
								<td colspan="3">${apply.towriter}</td>						
							</tr>
							</c:if>
						</c:forEach>
					</table>
