<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<div id="div2_warp">
		<div id="div2_list">
			<ul>
					<li  class="mouse_action" accesskey="1">박스오피스</li>
						<li class="mouse_action" accesskey="2">최신개봉작</li>
						<li id="action" class="mouse_action" accesskey="3">상영예정작</li>
						<li class="mouse_action" accesskey="4">큐레이션</li>
			</ul>
		</div>
		<span accesskey="3" class="allview_span">+ 전체보기</span>
		<div id="myCarousel2" class="carousel slide">
			<!-- Indicators -->
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">

					<ul class="div2_mvlist" style="padding-left: 150px;">
						<c:forEach begin="1" end="4" var="i">
							<li>
								<div class="list_img">
									<span class="boxoffice n${i}">0${i}</span> <img
										src="<c:url value="/img/index/list박열.jpg"/>">
								</div>
								<div class="list_div">
									<div class="list_div_name">
										<span class="film_rate age_15"></span><a href="#">박열</a>
									</div>
									<button class="btn-info list_a">상세보기</button>
									<button class="btn-info list_a">예매하기</button>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>

				<div class="item">
					<ul class="div2_mvlist" style="padding-left: 150px;">
						<c:forEach begin="5" end="8" var="i">
							<li>
								<div class="list_img">
									<span class="boxoffice n${i}">0${i}</span> <img
										src="<c:url value="/img/index/list박열.jpg"/>">
								</div>
								<div class="list_div">
									<div class="list_div_name">
										<span class="film_rate age_15"></span><a href="#">박열</a>
									</div>
									<button class="btn-info list_a">상세보기</button>
									<button class="btn-info list_a">예매하기</button>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel2"
					data-slide="prev" style="width: 0; margin-left: 50px;"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel2"
					data-slide="next" style="width: 0; margin-right: 50px;"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
