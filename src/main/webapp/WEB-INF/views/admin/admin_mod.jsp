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
	height: 1200px;
	width: 1000px;
	margin: 0 auto;
}

.d1_a {
	height: 300px;
	width: 100%;
	margin-top: 50px;
}

.d2_a {
	height: 700px;
	width: 100%;
	background-color: gray;
	margin-top: 50px;
}

td {
	width: 25%;
}

.td3 img {
	margin: 0 auto;
	height: 160px;
	width: 120px;
}

.admin_mod {
	width: 100%;
	height: 100%;
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
	background-position: 0 50%;
	background-size: 100%;
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
	border: 1px solid #e6ecf0;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	text-align: left;
	height: 500px;
}

div {
	display: block;
}

.ProfileCard-content {
	margin: 13px 15px;
	position: relative;
}

#table_div {
	width: 600px;
	height: auto;
	float: right;
	position: relative;
	top: -100px;
}

/* css */
form{
position: relative;
  display: inline-block;
  max-width: 700px;
  min-width: 500px;
  box-sizing: border-box;
  padding: 30px 25px;
  background-color: white;
  border-radius: 40px;
  margin: 40px 0;
  float: right;
}
h1{
	color:#6799FF;
}
button{
 margin-top: 35px;
    background-color: #6799FF;
    border: 1px solid #6799FF;
    line-height: 0;
    font-size: 17px;
    display: inline-block;
    box-sizing: border-box;
    padding: 20px 15px ;
    border-radius: 60px;
    color: white;
    font-weight: 100;
    letter-spacing: 0.01em;
    position: relative;
    z-index: 1;
}
    label{
    transform-origin: left center;
      color: #6799FF;
      font-weight: 100;
      letter-spacing: 0.01em;
      font-size: 17px;
      box-sizing: border-box;
      padding: 10px 15px;
      display: block;
      position: absolute;
      margin-top: -40px;
      z-index: 2;
      pointer-events: none;
      }
      input{
      @extend .transition
      appearance: none;
      background-color: none;
      border: 1px solid #6799FF;
      line-height: 0;
      font-size: 17px;
      width: 100%;
      display: block;
      box-sizing: border-box;
      padding: 10px 15px;
      border-radius: 60px;
      color: #6799FF;
      font-weight: 100;
      letter-spacing: 0.01em;
      position: relative;
      z-index: 1;
      }
      focus{
        outline: none;
        background: #6799FF;
        color: white;
        margin-top: 30px;
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
					<div
						class="ProfileCard js-actionable-user
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
									<li class="ProfileCardStats-stat Arrange-sizeFit"><span
										class="ProfileCardStats-statLabel u-block">이름</span> <span
										class="ProfileCardStats-statValue" data-is-compact="false">&emsp;${member.name}</span>
									</li>
									<li class="ProfileCardStats-stat Arrange-sizeFit"><span
										class="ProfileCardStats-statLabel u-block">부서</span> <span
										class="ProfileCardStats-statValue" data-is-compact="false">&emsp;${member.department}</span>
									</li>
									<li class="ProfileCardStats-stat Arrange-sizeFit"><span
										class="ProfileCardStats-statLabel u-block">직책</span> <span
										class="ProfileCardStats-statValue" data-is-compact="false">&emsp;${member.position}</span>
									</li>
								</ul>
							</div>
							<div id="table_div">
								<form>
									<div class="question">
										<label>ID</label><input type="text" value="${member.id}" readonly="readonly" /> 
									</div>
									<div class="question">
										<label>PW</label><input class="pw_1" name="pw" type="password">
									</div>
									<div class="question">
										<label>PW Confirm</label><input class="pw_1" name="pw" type="password">
									</div>
									<div class="question">
										<label>Phone</label><input type="text" name="" value="${member.phone}">
									</div>
									<div class="question">
										<label>Email</label><input type="email" name="" value="${member.email}"> 
									</div>
									<input type="button" id="picture_mod"  class="btn-info font-white" value="사진변경">
									<input type="button" id="admin_mod_go" class="btn-info font-white" value="수정하기">
									<input type="hidden" name="picture" value="${member.picture}"> 
								</form>								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../temp/footer.jsp" />
</body>
</html>