<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* 기본서체 font-family: 'Noto Sans KR'; */
   @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
   /* 숫자에 이쁨 font-family: 'Hanna', sans-serif; */
   @import url(//fonts.googleapis.com/earlyaccess/hanna.css);
   /* 토속적인 느낌 font-family: 'Jeju Hallasan', cursive; */
   @import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
   /* 손글씨 font-family: 'Nanum Pen Script', cursive; */
   @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
   /* 본문말고 다른데 써 font-family: 'Jeju Gothic', sans-serif; */
   @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
   /* 할아버지 주판 느낌 font-family: 'Jeju Myeongjo', serif; */
   @import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
body{
	font-family: 'Jeju Hallasan', cursive;
}
#tap {
	width: 100%;
	height: 50px;
}

#main_session_default {
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

.btn_div{
	width: 30%;
	height: 100%;
	float: right;
	display: inline-block;
}

.btn_div > button{
	width: 100%;
	height: 50%;
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

.modal-body, .modal-header, .modal-footer, .modal-content {
	width: 800px;
	height: auto;
}	

.modal-div2 {
	width: 380px;
	height: 400px;
	float: left;
}

#pay_btn{
 margin:5px 0 13px 400px;
 width:47%;
 height: 50px;	
}

#close_location{
	margin: 10px 5px 0 0;
	float: right;
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
					
					<div class="btn_div">
						<button class="btn-success ticket_li modal_crate2" data-toggle="modal" data-target="#myModal2" accesskey="${dto.movie_num}">티켓 구매 </button>
						<button class="btn-primary huwon" id="${dto.movie_num}">후원페이지</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
		<div id="main_div2"></div>

	<c:import url="../../temp/footer.jsp" />
</body>
<script type="text/javascript">
$(".ticket_li").mouseenter(function() {
	var num = $(this).attr("accesskey");
	$.ajax({
		url : "${pageContext.request.contextPath}/index_movielist/modal_ticket?movie_num="+num+"&man=/board/cinema/cinema_scheduleList",
		type : "GET",
		success : function(data) {
			$("#main_div2").html(data);
		}
	});
});

$(".ticket_li").click(function() {
	if(${member==null}){
		alert("로그인이 필요한 서비스입니다.");
		setTimeout(function() {
			document.querySelector('.cont_form_login').style.opacity = "1";
		}, 100);
	}else{
		
	
	}
});

$(".huwon").click(function() {
	var id = $(this).attr("id");
	if(${member==null}){
		alert("로그인이 필요한 서비스입니다.");
		setTimeout(function() {
			document.querySelector('.cont_form_login').style.opacity = "1";
		}, 100);
	}else{
		location.href="${pageContext.request.contextPath}/crowd_funding/campaign/campaignView?campaign_num="+id;
	}
});
</script>
</html>