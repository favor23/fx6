<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="temp/bootStrap.jsp" />
<link href="<c:url value="/css/index.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
					<img src="<c:url value="/img/index/스파이더맨1.jpg"/>">
					<div class="carousel-caption">
						<h3>Los Angeles</h3>
						<p>LA is always so much fun!</p>
					</div>
				</div>

				<div class="item">
					<img src="<c:url value="/img/index/스파이더맨2.jpg"/>">
					<div class="carousel-caption">
						<h3>Chicago</h3>
						<p>Thank you, Chicago!</p>
					</div>
				</div>

				<div class="item">
					<img src="<c:url value="/img/index/박열.jpg"/>">
					<div class="carousel-caption">
						<h3>Chicago</h3>
						<p>Thank you, Chicago!</p>
					</div>
				</div>

				<div class="item">
					<img src="<c:url value="/img/index/스페인소.jpg"/>">
					<div class="carousel-caption">
						<h3>Chicago</h3>
						<p>Thank you, Chicago!</p>
					</div>
				</div>

				<div class="item">
					<img src="<c:url value="/img/index/스포츠카.jpg"/>">
					<div class="carousel-caption">
						<h3>Chicago</h3>
						<p>Thank you, Chicago!</p>
					</div>
				</div>

				<div class="item">
					<img src="<c:url value="/img/index/광고.jpg"/>">
					<div class="carousel-caption">
						<h3>New York</h3>
						<p>We love the Big Apple!</p>
					</div>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</section>

		<section id="main_div2">
		
		</section>
		
		
		
			<section id="main_div3">
			<div id="div3_d1">
				<div id="div3_title">
					<h3>새로운 펀딩 정보</h3>
				</div>
				<div id="div3_d2">
					<div class="div3_d2list">
						<div id="myCarousel3" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<ul class="div2_mvlist" style="padding-left: 150px;">
										1
										<%-- <c:forEach begin="1" end="4" var="i">
									<li>
										<div class="list_img">
											<span class="boxoffice n${i}">0${i}</span> <img
												src="<c:url value="/img/index/list스파이더맨.jpg"/>">
										</div>
										<div class="list_div">
											<div class="list_div_name">
												<img src=""><a href="#">스파이더맨</a>
											</div>
											<button class="btn-info list_a">상세보기</button>
											<button class="btn-info list_a">예매하기</button>
										</div>
									</li>
								</c:forEach> --%>
									</ul>
								</div>
								<c:forEach begin="2" end="5" var="i">
									<div class="item">
										<ul class="div2_mvlist" style="padding-left: 150px;">
											${i}

										</ul>
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
						<div class="div3_d2list_2"></div>
						<div class="div3_d2list_2"></div>
					</div>
				</div>
				<div id="div3_d3"></div>
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
			url : "./index_movielist/m1?num=1",
			type : "GET",
			success : function(data) {
				$("#main_div2").html(data);
			}
		})
	
		$("#main_div2").on("click", ".mouse_action", function() {
			var num = $(this).attr("accesskey");
			$.ajax({
				url : "./index_movielist/m1?num="+num,
				type : "GET",
				success : function(data) {
					$("#main_div2").html(data);
				}
			})

		});
		$("#main_div2").on("mousemove", ".mouse_action", function() {
			$(this).attr("class", "mouse_action action_on");
		});
		$("#main_div2").on("mouseleave", ".mouse_action", function() {
			$(this).attr("class", "mouse_action");
		});
		
		/* 예매하기 */
		$("#main_div2").on("mouseenter",".modal_crate2",function(){
			var num = $(this).attr("accesskey");			
			modal_ticket_crate(num);
		})
		
		function modal_ticket_crate(num) {
			$.ajax({
				url : "./index_movielist/modal_ticket?num="+num,
				type : "GET",
				success : function(data) {
					$("#modal_div2").html(data);
				}
			})	
		}

		/* 상영정보 */
		$("#main_div2").on("mouseenter",".modal_crate1",function(){
			var num = $(this).attr("accesskey");			
			modal_view_crate(num);
		})
		
		function modal_view_crate(num) {
			$.ajax({
				url : "./index_movielist/modal_view?num="+num,
				type : "GET",
				success : function(data) {
					$("#modal_div2").html(data);
				}
			})	
		}
		</script>
</body>
</html>