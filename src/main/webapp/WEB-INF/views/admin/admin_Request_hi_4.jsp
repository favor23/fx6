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
#action{
	background-image: url(/fx6/img/index/짙은회색.PNG);
}
.action_gray{
	background-image: url(/fx6/img/index/짙은회색.PNG);
	color: white;
	font-weight: 900;
}
</style>
<link href="<c:url value="/css/table_1.css" />" type="text/css" rel="stylesheet">
<link href="<c:url value="/css/admin_one.css" />" type="text/css" rel="stylesheet">
<c:import url="../temp/bootStrap_black.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화를 찍으시조</title>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_admin.jsp" />
<div id="main_session_default">
<c:import url="./admin_one.jsp" />
	<div class="d2_a">		
			<div accesskey="${pageContext.request.contextPath}/admin/admin_Request_hi_1?curPage=1" class="select_department">펀딩목록</div>
			<div accesskey="${pageContext.request.contextPath}/admin/admin_Request_hi_2?curPage=1" class="select_department">물품 대여요청 목록</div>
			<div accesskey="${pageContext.request.contextPath}/admin/admin_Request_hi_3?curPage=1" class="select_department">티켓구매 목록</div>
			<div accesskey="${pageContext.request.contextPath}/admin/admin_Request_hi_5?curPage=1" class="select_department">펀딩상품구매 목록</div>
			<div  id="action" accesskey="${pageContext.request.contextPath}/admin/admin_Request_hi_4?curPage=1" class="select_department">상영방 목록</div>
			
<table class="table">
			 <tr><td>방번호</td><td>영화시간</td><td>영화시작시간</td><td>끝나는 시간</td><td>상영상황</td></tr>    
            <c:forEach items="${list}" var="list">
            <tr>
            <td>${list.num}</td>
            <td>${list.play_Time}</td>
            <td>${list.startTime}</td>
            <td>${list.lastTime}</td>
            <c:if test="${work_m.persons ne member.id }">      
            <td>근무자만 볼수있습니다.</td>  
            </c:if>  
            <c:if test="${work_m.persons eq member.id }"> 
            <td><input id="${list.num}" type="button" class="btn-warning" onclick="cambiar_login()" value="상영관 들어가기"></td>            
            </c:if>
            </tr>
			
			</c:forEach>	
</table>
   <input type="hidden" id="input_id" value="admin" >
            <input type="hidden" id="input_pw" value="tkrlzoflr1" >
              
			<div class="bottom" style="width: 100%; height: 30px; overflow: hidden;">
				<ul class="pagination pagination-sm" style="margin-top: -1px;">
			
			<li>
			<c:if test="${listInfo.curBlock>1}">
				<%-- <span class="go" id="${listInfo.startNum-1}">[이전]</span> --%>
				<a href="${pageContext.request.contextPath}/admin/admin_Request_hi_4?curPage=${listInfo.startNum-1}">[이전]</a>
			</c:if>
			</li>
			
			<li>
			<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}"
				var="i">
				<%-- <span class="go" id="${i}">${i}</span> --%>
				<a href="${pageContext.request.contextPath}/admin/admin_Request_hi_4?curPage=${i}">${i}</a>
			</c:forEach>
			</li>
			
			<li>
			<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
				<%-- <span class="go" id="${listInfo.lastNum+1}">[다음]</span> --%>
				<a href="${pageContext.request.contextPath}/admin/admin_Request_hi_4?curPage=${listInfo.lastNum+1}">[다음]</a>
			</c:if>
			</li>

			</ul>				
			</div>
	</div>				
</div>
<c:import url="../temp/footer.jsp" />
</body>
<script type="text/javascript">
$(".select_department").mousemove(function() {
	$(this).attr("class", "select_department action_gray");
})
$(".select_department").mouseleave(function() {
	$(this).attr("class", "select_department");
})
$(".select_department").click(function() {	
	location.href=$(this).attr("accesskey");
});
</script>
</html>