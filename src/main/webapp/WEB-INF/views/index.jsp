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

		<!-- Modal 상세정보 -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">상세정보</h4>
					</div>
					<div class="modal-body">
						<div class="modal-div2"></div>
						<div class="modal-div2"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- main end -->
	<!-- footer start -->
	<c:import url="temp/footer.jsp" />
	<!-- footer end -->


	<script type="text/javascript">
			
		$.ajax({
			url : "./index_movielist/m1",
			type : "GET",
			success : function(data) {
				$("#main_div2").html(data);
			}
		})
	
		$("#main_div2").on("click", ".mouse_action", function() {
			var num = $(this).attr("accesskey");
			$.ajax({
				url : "./index_movielist/m" + num,
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

		/* $("#main_div2").on("mousemove", ".list_img", function() {
			$(this).attr("class", "list_img list_img_action_on");
			class="pic-caption open-right"
		});
		$("#main_div2").on("mouseleave", ".list_img", function() {
			$(this).attr("class", "list_img");
		});  */
		</script>
</body>
</html>