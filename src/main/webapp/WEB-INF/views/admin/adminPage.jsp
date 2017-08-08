<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#tap {
	width: 100%;
	height: 50px;
}

#main_session_default {
	height: 1520px;
	width: 1000px;
	margin: 0 auto;
}

.d1_a {
	height: 300px;
	width: 100%;
	margin-top: 50px;
}

.d2_a {
	border: 1px solid gray;
	height: 990px;
	width: 100%;
	margin: 50px 0 50px 0;
}
td{
	width: 25%;
}
.td3 img{
	margin: 0 auto;
	height: 160px;
	width: 120px;
}

td{
	font-weight: 900;
}
td>div{
height:auto;
width:800px;
 margin-left: 30px; 
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
			<div id="action" accesskey="인사부" class="select_department">인사부</div>
			<div accesskey="회계부" class="select_department">회계부</div>
			<div accesskey="후원부" class="select_department">후원부</div>
			<div accesskey="매니저" class="select_department">매니저</div>
			</c:if>
			<c:if test="${member.department eq '회계부'}">
			<div accesskey="인사부" class="select_department">인사부</div>
			<div id="action" accesskey="회계부" class="select_department">회계부</div>
			<div accesskey="후원부" class="select_department">후원부</div>
			<div accesskey="매니저" class="select_department">매니저</div>
			</c:if>
			<c:if test="${member.department eq '후원부'}">
			<div accesskey="인사부" class="select_department">인사부</div>
			<div accesskey="회계부" class="select_department">회계부</div>
			<div id="action" accesskey="후원부" class="select_department">후원부</div>
			<div accesskey="매니저" class="select_department">매니저</div>
			</c:if>
			<c:if test="${member.department eq '매니저'}">
			<div accesskey="인사부" class="select_department">인사부</div>
			<div accesskey="회계부" class="select_department">회계부</div>
			<div accesskey="후원부" class="select_department">후원부</div>
			<div id="action" accesskey="매니저" class="select_department">매니저</div>
			</c:if>
			<table class="table">
				<tr><td>부장<div>
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.department eq member.department}">
						<c:if test="${dto.position eq '부장'}">													
							<img
							id="${dto.id}"title="${dto.name}" data-toggle="modal" data-target="#myModal"
								class="ProfileCard-avatarImage_2 js-action-profile-avatar"
								src="<c:url value="${dto.picture}"/>">				
						</c:if>
						</c:if>			
						</c:forEach></div>
					</td>
				</tr>
				<tr><td>차장<div>
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.department eq member.department}">
						<c:if test="${dto.position eq '차장'}">													
								<img
							id="${dto.id}"title="${dto.name}" data-toggle="modal" data-target="#myModal"
								class="ProfileCard-avatarImage_2 js-action-profile-avatar"
								src="<c:url value="${dto.picture}"/>">				
						</c:if>
						</c:if>			
						</c:forEach></div>
					</td>
				</tr>
				
				<tr><td>과장<div>
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.department eq member.department}">
						<c:if test="${dto.position eq '과장'}">													
							<img
							id="${dto.id}"title="${dto.name}" data-toggle="modal" data-target="#myModal"
								class="ProfileCard-avatarImage_2 js-action-profile-avatar"
								src="<c:url value="${dto.picture}"/>">				
						</c:if>
						</c:if>			
						</c:forEach></div>
					</td>
				</tr>
				
				<tr><td>대리<div>
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.department eq member.department}">
						<c:if test="${dto.position eq '대리'}">													
								<img
							id="${dto.id}" title="${dto.name}" data-toggle="modal" data-target="#myModal"
								class="ProfileCard-avatarImage_2 js-action-profile-avatar"
								src="<c:url value="${dto.picture}"/>">				
						</c:if>
						</c:if>			
						</c:forEach></div>
					</td>
				</tr>
				
				<tr><td>주임<div>
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.department eq member.department}">
						<c:if test="${dto.position eq '주임'}">													
							<img
							id="${dto.id}" title="${dto.name}" data-toggle="modal" data-target="#myModal"
								class="ProfileCard-avatarImage_2 js-action-profile-avatar"
								src="<c:url value="${dto.picture}"/>">				
						</c:if>
						</c:if>			
						</c:forEach></div>
					</td>
				</tr>
				
				<tr><td>사원<div>
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.department eq member.department}">
						<c:if test="${dto.position eq '사원'}">													
							<img type="button"
							id="${dto.id}" title="${dto.name}" data-toggle="modal" data-target="#myModal"
								class="ProfileCard-avatarImage_2 js-action-profile-avatar"
								src="<c:url value="${dto.picture}"/>">				
						</c:if>
						</c:if>			
						</c:forEach></div>
					</td>
				</tr>
			</table>
		</div>	
		<div id="modal_1"></div>
	</div>
	<c:import url="../temp/footer.jsp" />
</body>
<script type="text/javascript">
$(".d2_a").on("mousemove", ".select_department", function() {
		$(this).attr("class", "select_department action_gray");
});
$(".d2_a").on("mouseleave", ".select_department", function() {
		$(this).attr("class", "select_department");
});
$(".d2_a").on("click", ".select_department", function() {
	var department = $(this).attr("accesskey");
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/admin_list?department="+department,
		type : "GET",
		success : function(data) {
			$(".d2_a").html(data);
		}
	});
});
/* */
$(".d2_a").on("mouseenter",".ProfileCard-avatarImage_2",function(){
	var id = $(this).attr("id");			
	modal_crate(id);
});

function modal_crate(id) {
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/admin_modal?id="+ id,
		type : "GET",
		success : function(data) {
			$("#modal_1").html(data);
		}
	});
}	
</script>
</html>