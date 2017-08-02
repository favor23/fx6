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
.AdaptiveSearchTimeline-separationModule {
	margin-bottom: 15px;
}

li {
	text-align: inherit;
}

.ProfileCard {
	background-color: #fff;
	border: 1px solid #e6ecf0;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	text-align: left;
}

.Grid-cell {
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	display: inline-block;
	font-size: 14px;
	margin: 0;
	padding: 0;
	text-align: left;
	vertical-align: top;
	width: 100%;
}

.Grid {
	display: block;
	font-size: 0;
	margin: 0;
	padding: 0;
	text-align: left;
}

.ProfileCard--wide .ProfileCard-bg {
	height: 160px;
}

.ProfileCard a, .ProfileCard a:hover, .ProfileCard a:focus, .ProfileCard a:active,
	.ProfileCard .pretty-link, .ProfileCard .pretty-link:hover,
	.ProfileCard .pretty-link:focus, .ProfileCard .pretty-link:active {
	color: #1c94e0;
}

.ProfileCard-bg {
	background-position: 0 10%;
	display: block;
	height: 90px;
}

img {
	border: 0;
}

.ProfileCard-avatarImage {
	border-radius: 50%;
	display: block;
	height: 200px;
	width: 200px;
	float: left;
	position: relative;
	top: -70px;
}
.ProfileCard-avatarImage_2 {
	border-radius: 50%;
	display: block;
	height: 120px;
	width: 120px;
	float: left;
}

.ProfileCardStats-statLabel {
	color: #657786;
	font-size: 12px;
	font-weight: bold;
	letter-spacing: .02em;
	overflow: hidden;
	transition: color .15s ease-in-out;
	float: left;
	margin-left: 10px;
}

.ProfileCardStats-statValue {
	display: block;
	font-size: 18px;
	font-weight: bold;
	padding-top: 3px;
	transition: color .15s ease-in-out;
	margin-left: 20px;
}

.ProfileCard--wide .ProfileNameTruncated-link {
	font-size: 21px;
	line-height: 28px;
	font-weight: bold;
}

a:hover, a:focus, a:active {
	text-decoration: underline;
}

a:active, a:hover {
	outline: 0;
}

.ProfileNameTruncated-link {
	color: #14171a;
	font-size: 18px;
	font-weight: bold;
	padding-right: 2px;
}

.u-textInheritColor {
	color: inherit !important;
}

a {
	background: transparent;
}

.u-textTruncate {
	max-width: 100%;
	overflow: hidden !important;
	text-overflow: ellipsis !important;
	white-space: nowrap !important;
	word-wrap: normal !important;
}

.ProfileNameTruncated {
	height: 22px;
	line-height: 1.3;
	margin-top: -2px;
}

.ProfileCard-userFields {
	color: #14171a;
	margin-top: 8px;
	width: 100%;
}

.ProfileCard {
	background-color: #fff;
	border: 1px solid gray;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	text-align: left;
}

div {
	display: block;
}

.ProfileCard-content {
	margin: 13px 15px;
	position: relative;
}


.select_department{

	height: 50px;
	line-height:50px;
	width: 25%;
	text-align:center;
	background-color:#BDBDBD;
	border: 1px solid gray; 
	color: white;
	font-weight: 900;
	float: left;
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
<c:import url="../temp/bootStrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp" />
	<div id="tap"></div>
	<c:import url="../temp/header_plus_admin.jsp" />
	<div id="main_session_default">
		<div class="Grid Grid--withGutter" role="presentation">
			<div class="Grid-cell">
				<div class="AdaptiveStreamUserGallery-user js-stream-item"
					data-item-type="user" role="listitem" data-item-id="3259624118"
					id="stream-item-user-3259624118" data-item-type="user">
					<div		class="ProfileCard js-actionable-user
    ProfileCard--wide
    
    "
						data-screen-name="dia_official" data-user-id="3259624118"
						data-feedback-token="" data-impression-id="">
						<c:if test="${member.department eq '회계부'}">
						<a class="ProfileCard-bg js-nav" href="/dia_official"
							tabindex="-1" aria-hidden="true"
							style="background-color: #3B94D9; background-image: url(http://imgnews.naver.com/image/032/2017/02/19/l_2017021801002475800202941_99_20170219094306.jpg);">
						</a>
						</c:if>
						<c:if test="${member.department eq '인사부'}">
						<a class="ProfileCard-bg js-nav" href="/dia_official"
							tabindex="-1" aria-hidden="true"
							style="background-color: #3B94D9; background-image: url(http://imgnews.naver.com/image/011/2017/01/23/1OAXIEPZQJ_1_99_20170123085603.jpg);">
						</a></c:if>
						<c:if test="${member.department eq '후원부'}">
						<a class="ProfileCard-bg js-nav" href="/dia_official"
							tabindex="-1" aria-hidden="true"
							style="background-color: #3B94D9; background-image: url(https://search.pstatic.net/common/?src=http%3A%2F%2Fpost.phinf.naver.net%2FMjAxNzAzMzBfMTc3%2FMDAxNDkwODUyNTUyOTcw.Z3yjstF8B7sS77FulE_ntjki4AqolkU59F62JkixxyAg.Qted81nFoHw7bGjWE_wTzZ2rTqSbAnb3iEM-qTUsOf8g.JPEG%2FIMVJYeyxt0PZpm7ntRVLRI4vvzBo.jpg&type=b400);">
						</a></c:if>
						<c:if test="${member.department eq '매니저'}">
						<a class="ProfileCard-bg js-nav" href="/dia_official"
							tabindex="-1" aria-hidden="true"
							style="background-color: #3B94D9; background-image: url(http://blogfiles2.naver.net/20160309_61/peokim99_1457486730065Tew3q_JPEG/%C5%C2%BE%E7%C0%C7%C8%C4%BF%B9%C3%D4%BF%B5%C1%F6_%286%29.JPG);">
						</a>
						</c:if>

						<div class="ProfileCard-content">
							<a class="ProfileCard-avatarLink js-nav js-tooltip"
								href="/dia_official" tabindex="-1" aria-hidden="true"> <img
								class="ProfileCard-avatarImage js-action-profile-avatar"
								src="<c:url value="${member.picture}"/>"
								alt="">
							</a>
							<div class="ProfileCardStats">
								<ul
									class="ProfileCardStats-statList Arrange Arrange--bottom Arrange--equal">
									<li class="ProfileCardStats-stat Arrange-sizeFit"> <span
											class="ProfileCardStats-statLabel u-block">이름</span> <span
											class="ProfileCardStats-statValue" 
											data-is-compact="false">&emsp;${member.name}</span>
									</li>
									<li class="ProfileCardStats-stat Arrange-sizeFit"> <span
											class="ProfileCardStats-statLabel u-block">부서</span> <span
											class="ProfileCardStats-statValue" 
											data-is-compact="false">&emsp;${member.department}</span>
									</li>
									<li class="ProfileCardStats-stat Arrange-sizeFit"> <span
											class="ProfileCardStats-statLabel u-block">직책</span> <span
											class="ProfileCardStats-statValue" 
											data-is-compact="false">&emsp;${member.position}</span>
									</li>
								</ul>
							</div>
							<div class="ProfileCard-actions">
								<div
									class="ProfileCard-userActions with-rightCaret js-userActions">
									<div class="UserActions   u-textLeft">
										<div class="user-actions btn-group not-following "
											data-user-id="3259624118" data-screen-name="dia_official"
											data-name="DIA 다이아" data-protected="false">
											<span class="UserActions-moreActions u-inlineBlock">
												<button type="button"
													class="js-tooltip unmute-button btn small plain-btn"
													data-placement="top">
													<span class="Icon Icon--muted Icon--medium"><span
														class="visuallyhidden"><span class="username u-dir"
															dir="ltr"></span>전화번호 : </span><b>${member.phone}</b></span>
												</button>
												<button type="button"
													class="first-load js-tooltip mute-button btn small plain-btn"
													data-placement="top">
													<span class="Icon Icon--unmuted Icon--medium"><span
														class="visuallyhidden"><span class="username u-dir"
															dir="ltr"></span>이메일 : </span><b>${member.email}</b></span>
												</button>
												
												<button type="button"
													class="btn_mod first-load js-tooltip mute-button btn small plain-btn"
													data-placement="top">
													<span class="Icon Icon--unmuted Icon--medium"><span id="${pageContext.request.contextPath}/admin/admin_mod"
														class="visuallyhidden"><span class="username u-dir"
															dir="ltr"></span>정보수정을 원하십니까?</span>
												</button>
											</span>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>

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
							id="${dto.id}"title="${dto.name}"
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
							id="${dto.id}"title="${dto.name}"
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
							id="${dto.id}"title="${dto.name}"
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
							id="${dto.id}"title="${dto.name}"
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
							id="${dto.id}"title="${dto.name}"
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
							<img
							id="${dto.id}"title="${dto.name}"
								class="ProfileCard-avatarImage_2 js-action-profile-avatar"
								src="<c:url value="${dto.picture}"/>">				
						</c:if>
						</c:if>			
						</c:forEach></div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<c:import url="../temp/footer.jsp" />
</body>
<script type="text/javascript">
$(".visuallyhidden").click(function() {
	location.href=$(this).attr("id");
})
$(".d2_a").on("mousemove", ".select_department", function() {
		$(this).attr("class", "select_department action_gray");
});
$(".d2_a").on("mouseleave", ".select_department", function() {
		$(this).attr("class", "select_department");
});
$(".d2_a").on("click", ".select_department", function() {
	var department = $(this).attr("accesskey");
	alert(department);
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/admin_list?department="+department,
		type : "GET",
		success : function(data) {
			$(".d2_a").html(data);
		}
	});
});
</script>
</html>