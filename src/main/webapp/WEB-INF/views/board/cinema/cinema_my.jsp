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
	min-height: 900px;
	max-height: 2770px;
	height: auto;
	width: 100%;	
	padding-bottom: 100px;
}
.video_list{
	height: auto;
	width: 1350px;
	margin: 0 auto;
	margin-top: 50px;
}
.list{
	width: 900px;
	height: 250px;
	margin: 0 auto;
	margin-bottom: 30px;
	background-color: gray;
}

.list_poster{
	width: 17%;
	height: 100%;
	float: left;
	display: inline-block;
}

.list_poster>img{
	width: 100%;
	height: 100%;
	float: left;
	display: inline-block;
}

#info{
	width: 53%;
	height: 100%;
	float: left;
	display: inline-block;
}

#btn_div{
	width: 30%;
	height: 100%;
	float: right;
	display: inline-block;
}

#btn_div > button{
	width: 100%;
	height: 33%;
	display: inline-block;
}

ul > li {
	float: left;
}

ul{
	clear: both;
}

#info_1{
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

#info_1 li{
	margin-left: 10px;
	font-size: large;
	color: black;
}

#release{
	color: black;
	font-size: large;
	text-decoration: none !important;
	margin: 0 auto;
	
}

#info_1 span{
	color: black;
	font-size: large;
	margin: 0 auto;
}

#pageing {
	width: 100%;
	height: 50px;
	margin: 0 auto;
	text-align: center;
	color: black;
	padding-bottom: 0;
	font-size: medium;
}

#pageing > a{
	text-decoration: none;
}



</style>
<c:import url="../../temp/bootStrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../../temp/header.jsp" />
	<div id="tap"></div>
	<c:import url="../../temp/header_plus_cinema.jsp" />
	<section id="main_session_default">		
	
		<div class="video_list">
			<c:forEach items="${list}" var="dto">
				<div class="list">
					<div class="list_poster"><img src="<c:url value="${dto.poster_img}"/>" class="pic-image" alt="Pic"> </div>
					
					<div id="info">
						<nav>
							<div id="info_1">
								<div>
									<span>상영기간	[${dto.release_date} ~ ${dto.release_end}]</span>
								</div>
								<ul>
									<li>일</li>
									<li>10:00</li>
									<li> 16:00</li>
									<li> 20:00</li>
									<li> 24:00</li>
								</ul>
								<ul>
									<li> 월</li>
									<li> 10:00</li>
									<li> 16:00</li>
									<li> 20:00</li>
									<li> 24:00</li>
								</ul>
								<ul >
									<li class="active"> 화</li>
									<li> 10:00</li>
									<li> 16:00</li>
									<li> 20:00</li>
									<li> 24:00</li>
								</ul>
								<ul >
									<li class="active"> 수</li>
									<li> 10:00</li>
									<li> 16:00</li>
									<li> 20:00</li>
									<li> 24:00</li>
								</ul>
								<ul >
									<li class="active"> 목</li>
									<li> 10:00</li>
									<li> 16:00</li>
									<li> 20:00</li>
									<li> 24:00</li>
								</ul>
								<ul >
									<li class="active"> 금 </li>
									<li> 10:00</li>
									<li> 16:00</li>
									<li> 20:00</li>
									<li> 24:00</li>
								</ul>
								<ul >
									<li class="active"> 토</li>
									<li> 10:00</li>
									<li> 16:00</li>
									<li> 20:00</li>
									<li> 24:00</li>
								</ul>
							</div>
						</nav>
					</div>
					
					<div id="btn_div">
						<button class="btn-success">ticket </button>
						<button class="btn-primary">후원페이지</button>
						<button class="btn-danger chat">영화시청</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="pageing">
			<c:if test="${listInfo.curBlock>1}">
				<%-- <span class="go" id="${listInfo.startNum-1}">[이전]</span> --%>
				<a href="cinema_my?curPage=${listInfo.startNum-1}">[이전]</a>
			</c:if>
			<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
				<%-- <span class="go" id="${i}">${i}</span> --%>
				<a href="cinema_my?curPage=${i}">${i}</a>
			</c:forEach>
			<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
				<%-- <span class="go" id="${listInfo.lastNum+1}">[다음]</span> --%>
				<a href="cinema_my?curPage=${listInfo.lastNum+1}">[다음]</a>
			</c:if>
		</div>
		
	</section>

	<c:import url="../../temp/footer.jsp" />
</body>
<script type="text/javascript">
	$(".chat").click(function() {
		window.open("../../chatting/bbb", "", "width=1600 height=900 scrollbars=no toolbar=no resizable=no");
	});
</script>
</html>