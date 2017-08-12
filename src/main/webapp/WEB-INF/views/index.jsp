<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="temp/bootStrap.jsp" />
<link href="<c:url value="/css/index.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화를 찍으시조</title>
</head>
<body>
	<c:import url="temp/header.jsp" />
	<!-- main start -->
	<section id="main_section">
		<section id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
				<li data-target="#myCarousel" data-slide-to="5"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="<c:url value="/img/index/경찰.jpg"/>">
					<div class="carousel-caption main_setting" >
						<h1>청년경찰</h1>
						<p>Midnight Runners</p>
						<hr class="carousel-caption_hr" >
						<p>파릇파릇한 놈들의 혈기왕성 실전수사</p>
					</div>
				</div>
				<div class="item">
					<img src="<c:url value="/img/index/독립영화들1.jpg"/>">
					<div class="carousel-caption main_setting">
					</div>
				</div>					
				<div class="item">
					<img src="<c:url value="/img/index/독립영화들4.jpg"/>">
					<div class="carousel-caption main_setting">
					</div>
				</div>
				<div class="item">
					<img src="<c:url value="/img/index/독립영화들5.jpg"/>">
					<div class="carousel-caption main_setting">
					</div>
				</div>
				<div class="item">
					<img src="<c:url value="/img/index/박열2.jpg"/>">
					<div class="carousel-caption main_setting" >
						<h1>박열</h1>
						<hr class="carousel-caption_hr" >
						<p>조선최고의 불량 청년</p>
						<p>일본 제국을 가지고 놀다</p>
					</div>
				</div>
				<div class="item">
					<img src="<c:url value="/img/index/택시기사.jpg"/>">
					<div class="carousel-caption main_setting">
						<h1>택시운전사</h1>
						<hr class="carousel-caption_hr" >
						<p>송강호/유해진/류준열이 그리는</p>
						<p>1980년 5월의 광주</p>
					</div>
				</div>
							
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">

			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> </a>
		</section>

		<section id="main_div2"></section>



		<section id="main_div3">
			<div id="div3_d1">				
				<div id="div3_d2">
					<div class="div3_d2list">
						<div id="myCarousel3" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<img src="<c:url value="/img/movie-img/test5.jpg" />" style="width: 100%; height:300px;">
								</div>

								<c:forEach items="${newList}" var="newList">
								
									<div class="item main_div_href" id="">
										<img src="<c:url value="${newList.campaign_img}" />"
											alt="Chicago" class="go_view"
											style="width: 100%; height:300px; cursor: pointer;"
											accesskey="${newList.campaign_num}">
											<c:if test="${newList.campaign_num ne '8'}">
										<div class="carousel-caption">
											<h3>${newList.campaign_title}</h3>
											<p>${newList.simple_story}</p>
										</div>
										</c:if>
									</div>
								</c:forEach>
								<!-- Left and right controls -->
								<a class="left carousel-control" href="#myCarousel3"
									data-slide="prev" style="width: 0; margin-left: 50px;"> <span
									class="glyphicon glyphicon-chevron-left"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="right carousel-control" href="#myCarousel3"
									data-slide="next" style="width: 0; margin-right: 50px;"> <span
									class="glyphicon glyphicon-chevron-right"></span> <span
									class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
					<div class="div3_d2list">
						<div class="div3_d2list_2">
							<div id="${pageContext.request.contextPath}/board/matching/matchingList" class="main_div_href">
								<img src="<c:url value="/img/index/writer1.jpg" />" style="width:100%">
							</div>
						</div>
						<div class="div3_d2list_2">
							<div id="${pageContext.request.contextPath}/crowd_funding/cf_index" class="main_div_href">
								<img src="<c:url value="/img/index/actor1.jpg" />" style="width: 100%">
							</div>
						
							</div>
					</div>
				</div>
				<div id="div3_d3"><img src="<c:url value="/img/index/예술은.jpg" />" style="width: 100%; height: 615px;"></div>
			</div>
		</section>
		<div id="modal_div2"></div>
	</section>

	<!-- main end -->
	<!-- footer start -->
	<c:import url="temp/footer.jsp" />
	<!-- footer end -->


	<script type="text/javascript">
			
		$.ajax({
			url : "${pageContext.request.contextPath}/index_movielist/m1?num=1",
			type : "GET",
			success : function(data) {
				$("#main_div2").html(data);
			}
		});
		
		//경로이동
		$(".main_div_href").click(function() {			
			location.href=$(this).attr("id");
		})
		
		$("#main_div2").on("click", ".mouse_action", function() {
			var num = $(this).attr("accesskey");
			$.ajax({
				url : "${pageContext.request.contextPath}/index_movielist/m1?num="+num,
				type : "GET",
				success : function(data) {
					$("#main_div2").html(data);
				}
			});

		});
		
		$("#main_div2").on("mousemove", ".mouse_action", function() {
			$(this).attr("class", "mouse_action action_on");
		});
		$("#main_div2").on("mouseleave", ".mouse_action", function() {
			$(this).attr("class", "mouse_action");
		});
		
		/* 예매하기 */
		$("#main_div2").on("mouseenter",".modal_crate2",function(){
			var movie_num = $(this).attr("accesskey");			
			modal_ticket_crate(movie_num);
		});
		
		function modal_ticket_crate(movie_num) {
			$.ajax({
				url : "${pageContext.request.contextPath}/index_movielist/modal_ticket?movie_num="+movie_num+"&man=/index",
				type : "GET",
				success : function(data) {
					$("#modal_div2").html(data);
				}
			});
		}

		/* 상영정보 */
		$("#main_div2").on("mouseenter",".modal_crate1",function(){
			var movie_num = $(this).attr("accesskey");			
			modal_view_crate(movie_num);
		});
		
		function modal_view_crate(movie_num) {
			$.ajax({
				url : "${pageContext.request.contextPath}/board/movie/movieView?movie_num="+movie_num,
				type : "GET",
				success : function(data) {
					$("#modal_div2").html(data);
				}
			});
		}
		</script>
</body>
</html>