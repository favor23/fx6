<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<table class="table table-hover" id="bpl_table">
	<thead>
			<tr>
				<th>신고번호</th>
				<th>대상</th>
				<th>사유</th>
				<th>처리시간</th>
				<th>밴부여</th>
				<th>담당자</th>
			</tr>
		</thead>
		<tbody>
		<!-- //targetId,reason,senderId,roomNum,proccess,num,adminId,reg_date,ban -->
		<c:forEach items="${banList }" var="l">
			<tr>
				<td>${l.num }</td>
				<td>${l.targetId }</td>
				<td>${l.reason }</td>
				<td>${l.reg_date }</td>
				<td>${l.ban }</td>
				<td>${l.adminId }</td>	
			</tr>
		</c:forEach>
		</tbody>
	</table>
<div id="pageing">
<c:if test="${verf eq 'all'}">
			<c:if test="${listInfo.curBlock>1}">
				<%-- <span class="go" id="${listInfo.startNum-1}">[이전]</span> --%>
				<a href="${pageContext.request.contextPath}/admin/banProccessListAll?curPage=${listInfo.startNum-1}&id=n">[이전]</a>
			</c:if>
			<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
				 <span class="go" id="${i}">${i}</span>
				<%--<a href="${pageContext.request.contextPath}/admin/banProccessListAll?curPage=${i}&id=n">${i}</a> --%>
			</c:forEach>
			<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
				<%-- <span class="go" id="${listInfo.lastNum+1}">[다음]</span> --%>
				<a href="${pageContext.request.contextPath}/admin/banProccessListAll?curPage=${listInfo.lastNum+1}&id=n">[다음]</a>
			</c:if>
</c:if>
<c:if test="${verf ne 'all'}">
			<c:if test="${listInfo.curBlock>1}">
				<%-- <span class="go" id="${listInfo.startNum-1}">[이전]</span> --%>
				<a href="${pageContext.request.contextPath}/admin/banProccessListAll?curPage=${listInfo.startNum-1}&id=${verf}">[이전]</a>
			</c:if>
			<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
				 <span class="go2" id="${i}" dropzone="${verf}">${i}</span>
				<%--<a href="${pageContext.request.contextPath}/admin/banProccessListAll?curPage=${i}&id=n">${i}</a> --%>
			</c:forEach>
			<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
				<%-- <span class="go" id="${listInfo.lastNum+1}">[다음]</span> --%>
				<a href="${pageContext.request.contextPath}/admin/banProccessListAll?curPage=${listInfo.lastNum+1}&id=${verf}">[다음]</a>
			</c:if>
</c:if>
		</div>
		
		
		
		
		
