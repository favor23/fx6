<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#tap{
	width: 100%;
	height: 50px;
}
#main_session_default{
	height: auto;
	width: 1000px;
	margin: 0 auto;
}
.d1_a{
	height: 800px;
	width: 100%;
}
.d1_b{
	height: 700px;
	width: 100%;
}
</style>
<link href="<c:url value="/css/admin_one.css" />" type="text/css" rel="stylesheet">
<c:import url="../temp/bootStrap_black.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_admin.jsp" />
<div id="main_session_default">
<c:import url="./admin_one.jsp" />
<div class="d2_a">
		<c:if test="${member.department eq '인사부'}">
			<div id="action" accesskey="인사부" class="select_department">펀딩목록</div>
			<div accesskey="물품 대여요청 목록" class="select_department">물품 대여요청 목록</div>
			<div accesskey="티켓구매 목록" class="select_department">티켓구매 목록</div>
			<div accesskey="상영방 목록" class="select_department">상영방 목록</div>
			</c:if>
			<c:if test="${member.department eq '회계부'}">
			<div accesskey="인사부" class="select_department">펀딩목록</div>
			<div id="action" accesskey="물품 대여요청 목록" class="select_department">물품 대여요청 목록</div>
			<div accesskey="티켓구매 목록" class="select_department">티켓구매 목록</div>
			<div accesskey="상영방 목록" class="select_department">상영방 목록</div>
			</c:if>
			<c:if test="${member.department eq '후원부'}">
			<div accesskey="인사부" class="select_department">펀딩목록</div>
			<div accesskey="물품 대여요청 목록" class="select_department">물품 대여요청 목록</div>
			<div id="action" accesskey="티켓구매 목록" class="select_department">티켓구매 목록</div>
			<div accesskey="상영방 목록" class="select_department">상영방 목록</div>
			</c:if>
			<c:if test="${member.department eq '매니저'}">
			<div accesskey="인사부" class="select_department">펀딩목록</div>
			<div accesskey="물품 대여요청 목록" class="select_department">물품 대여요청 목록</div>
			<div accesskey="티켓구매 목록" class="select_department">티켓구매 목록</div>
			<div id="action" accesskey="상영방 목록" class="select_department">상영방 목록</div>
			</c:if>			
		</div>	
		<div class="d1_b">
			<table class="table">
			<tr>
			<td>번호</td><td>아이디</td><td>시작날짜</td><td>반납날짜</td><td>현재상황</td></tr>
			<c:forEach items="${list}" var="dto">
				<tr><td>${dto.num}</td><td>${dto.id }</td><td>${dto.start_date}</td>
				<td>${dto.end_date}</td>
				<c:if test="${dto.permission eq 'approved'}">
					<td>승인 완료</td>
				</c:if>
				<c:if test="${dto.permission eq 'unapproved'}">
					<td>승인 대기중</td>
				</c:if>				
			</tr>
			</c:forEach>			
			</table>
			<div class="bottom" style="width: 100%; height: 30px; overflow: hidden;">
				<ul class="pagination pagination-sm" style="margin-top: -1px;">
			
			<li>
			<c:if test="${listInfo.curBlock>1}">
				<%-- <span class="go" id="${listInfo.startNum-1}">[이전]</span> --%>
				<a href="${pageContext.request.contextPath}/admin/adminRequest_hi?curPage=${listInfo.startNum-1}&search=${listInfo.search}&find=${listInfo.find}">[이전]</a>
			</c:if>
			</li>
			
			<li>
			<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}"
				var="i">
				<%-- <span class="go" id="${i}">${i}</span> --%>
				<a href="${pageContext.request.contextPath}/admin/adminRequest_hi?curPage=${i}&search=${listInfo.search}&find=${listInfo.find}" class="active">${i}</a>
			</c:forEach>
			</li>
			
			<li>
			<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
				<%-- <span class="go" id="${listInfo.lastNum+1}">[다음]</span> --%>
				<a href="${pageContext.request.contextPath}/admin/adminRequest_hi?curPage=${listInfo.lastNum+1}&search=${listInfo.search}&find=${listInfo.find}">[다음]</a>
			</c:if>
			</li>

			</ul>
				<span>
					<button type="button" id="wr_bt" class="reviewWrite" >글작성</button>
				</span>
			</div>
		</div>			
	</div>
<c:import url="../temp/footer.jsp" />
</body>
</html>