<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<div accesskey="1" class="select_department">펀딩목록</div>
			<div accesskey="2" class="select_department">물품 대여요청 목록</div>
			<div accesskey="3" class="select_department">티켓구매 목록</div>
			<div id="action" accesskey="4" class="select_department">상영방 목록</div>
			
<table class="table">
			<tr><td>방번호</td><td>영화시간</td><td>영화시작시간</td><td>끝나는 시간</td><td>상영상황</td></tr>	
			<c:forEach items="${list}" var="list">
			<tr>
			<td>${list.num}</td>
			<td>${list.play_Time}</td>
			<td>${list.startTime}</td>
			<td>${list.lastTime}</td>
			<td></td>			
			</tr>
			
			</c:forEach>	
</table>
			<div class="bottom" style="width: 100%; height: 30px; overflow: hidden;">
				<ul class="pagination pagination-sm" style="margin-top: -1px;">
			
			<li>
			<c:if test="${listInfo.curBlock>1}">
				<%-- <span class="go" id="${listInfo.startNum-1}">[이전]</span> --%>
				<a href="${pageContext.request.contextPath}/admin/adminRequest_hi4?curPage=${listInfo.startNum-1}">[이전]</a>
			</c:if>
			</li>
			
			<li>
			<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}"
				var="i">
				<%-- <span class="go" id="${i}">${i}</span> --%>
				<a href="${pageContext.request.contextPath}/admin/adminRequest_hi4?curPage=${i}">${i}</a>
			</c:forEach>
			</li>
			
			<li>
			<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
				<%-- <span class="go" id="${listInfo.lastNum+1}">[다음]</span> --%>
				<a href="${pageContext.request.contextPath}/admin/adminRequest_hi4?curPage=${listInfo.lastNum+1}">[다음]</a>
			</c:if>
			</li>

			</ul>				
			</div>