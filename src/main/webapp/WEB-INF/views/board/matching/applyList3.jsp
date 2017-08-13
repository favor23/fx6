<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<c:forEach items="${list}" var="apply">
							
							
							
							<c:if test="${apply.apply_roll eq '스텝'}">
							<div class="media">
    						<div class="media-left">
      						<img src="../../img/matching-img/img_avatar1.png" class="media-object" style="width:60px">
    							</div>
    						<div class="media-body">
      						<h4 class="media-heading">${apply.name}(${apply.id})</h4>
      						
      						<p>${apply.towriter}</p>
   							 </div>
  								</div>
  								<hr>
  								</c:if>
							</c:forEach>
