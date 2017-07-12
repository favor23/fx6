<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<div id="div2_warp">
		<div id="div2_list">
			<ul>
			<li id="action" class="mouse_action" accesskey="1">박스오피스</li>
						<li class="mouse_action" accesskey="2">최신개봉작</li>
						<li class="mouse_action" accesskey="3">상영예정작</li>
						<li class="mouse_action" accesskey="4">큐레이션</li>
			</ul>
		</div>
		<span accesskey="1" class="allview_span">+ 전체보기</span>
		<div id="myCarousel2" class="carousel slide">
			<!-- Indicators -->
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">

					<ul class="div2_mvlist" style="padding-left: 150px;">
					<%-- 	<c:forEach items="${list}" var="dto"> --%>
						<c:forEach items="${list}" begin="1" end="4" var="dto" varStatus="status">
							<li>
								<div class="list_img pic pic-3d">
									<span class="boxoffice n${status.begin+status.count-1}">0${status.begin+status.count-1}</span> 
									<img src="<c:url value="${dto.poster_img}"/>" class="pic-image" alt="Pic">
									<span class="pic-caption open-right" data-toggle="modal" data-target="#myModal">
									<p class="pic-title">${dto.movie_title}</p>
									
									<hr>
									<p>감독 : ${dto.director}</p>
									<p>감독 : ${dto.actor}</p>
									<p>감독 : ${dto.restricted} 세</p>
									<p>감독 : ${dto.release_date}</p>
									<p>감독 : ${dto.genre}</p>
									<p>감독 : ${dto.running_time} 분</p>
									</span>
								</div>
								<div class="list_div">
									<div class="list_div_name">
										<span class="film_rate age_${dto.restricted}"></span><a data-toggle="modal" data-target="#myModal">${dto.movie_title}</a>
									</div>
									<button type="button" class="btn btn-info btn-lg list_a"
													data-toggle="modal" data-target="#myModal">상세보기</button>
												<button type="button" class="btn btn-info btn-lg list_a"
													data-toggle="modal" data-target="#myModal2">예매하기</button>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>

				<div class="item">
					<ul class="div2_mvlist" style="padding-left: 150px;">
					<%-- 	<c:forEach items="${list}" var="dto"> --%>
						<c:forEach items="${list}" begin="5" end="8" var="dto" varStatus="status">
							<li>
								<div class="list_img pic pic-3d">
									<span class="boxoffice n${status.begin+status.count-1}">0${status.begin+status.count-1}</span> 
									<img src="<c:url value="${dto.poster_img}"/>" class="pic-image" alt="Pic">
									<span class="pic-caption open-right" data-toggle="modal" data-target="#myModal">
									<p class="pic-title">${dto.movie_title}</p><hr>
									<p>감독 : ${dto.director}</p>
									<p>감독 : ${dto.actor}</p>
									<p>감독 : ${dto.restricted} 세</p>
									<p>감독 : ${dto.release_date}</p>
									<p>감독 : ${dto.genre}</p>
									<p>감독 : ${dto.running_time} 분</p>
									</span>
								</div>
								<div class="list_div">
									<div class="list_div_name">
										<span class="film_rate age_${dto.restricted}"></span><a data-toggle="modal" data-target="#myModal">${dto.movie_title}</a>
									</div>
									<button type="button" class="btn btn-info btn-lg list_a"
													data-toggle="modal" data-target="#myModal">상세보기</button>
												<button type="button" class="btn btn-info btn-lg list_a"
													data-toggle="modal" data-target="#myModal2">예매하기</button>
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
	<!-- Modal 예약하기 --><!-- Modal 예약하기 --><!-- Modal 예약하기 --><!-- Modal 예약하기 --><!-- Modal 예약하기 --><!-- Modal 예약하기 -->
		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">						
						<h4 class="modal-title">
						<nav class="navbar navbar-inverse">
									<div class="container-fluid">
										<div class="navbar-header c_white">
											<a class="navbar-brand c_white">영화 예매하기</a>											
										</div>	
										<button id="close_location"type="button" class="btn btn-default" data-dismiss="modal">Close</button>																				
									</div>
								</nav></h4>
					</div>
					<div class="modal-body">
						<div class="modal-div2">
							<nav class="navbar navbar-inverse">
									<div class="container-fluid">
										<div class="navbar-header">
											<a class="navbar-brand" href="#">영화제목</a>
										</div>
										<img style="width: auto; height: 300px; float: right; margin: 10px 10px 0 0;"
								src="<c:url value="/img/index/list스파이더맨.jpg"/>">
										<ul class="nav navbar-nav">
											<li class="active"><a href="#">설명</a></li>
											<li><a href="#">액션, 모험, SF  미국  133분  2017 .07.05 개봉  [국내] 12세 관람가  예매율 1위 
누적관객누적관객 도움말
3,562,905명(07.09 기준)</a></li>											
										</ul>
									</div>
								</nav>
							
						</div>
						<div class="modal-div2">
							<div>
								<nav class="navbar navbar-inverse">
									<div class="container-fluid">
										<div class="navbar-header">
											<a class="navbar-brand" href="#">상영기간	[17.07.10 ~ 17.08.14]</a>
										</div>
										<ul class="nav navbar-nav">
											<li class="active"><a href="#">일</a></li>
											<li><a href="#">10:00</a></li>
											<li><a href="#">16:00</a></li>
											<li><a href="#">20:00</a></li>
											<li><a href="#">24:00</a></li>
										</ul>
										<ul class="nav navbar-nav">
											<li class="active"><a href="#">월</a></li>
											<li><a href="#">10:00</a></li>
											<li><a href="#">16:00</a></li>
											<li><a href="#">20:00</a></li>
											<li><a href="#">24:00</a></li>
										</ul>
										<ul class="nav navbar-nav">
											<li class="active"><a href="#">화</a></li>
											<li><a href="#">10:00</a></li>
											<li><a href="#">16:00</a></li>
											<li><a href="#">20:00</a></li>
											<li><a href="#">24:00</a></li>
										</ul>
										<ul class="nav navbar-nav">
											<li class="active"><a href="#">수</a></li>
											<li><a href="#">10:00</a></li>
											<li><a href="#">16:00</a></li>
											<li><a href="#">20:00</a></li>
											<li><a href="#">24:00</a></li>
										</ul>
										<ul class="nav navbar-nav">
											<li class="active"><a href="#">목</a></li>
											<li><a href="#">10:00</a></li>
											<li><a href="#">16:00</a></li>
											<li><a href="#">20:00</a></li>
											<li><a href="#">24:00</a></li>
										</ul>
										<ul class="nav navbar-nav">
											<li class="active"><a href="#">금 </a></li>
											<li><a href="#">10:00</a></li>
											<li><a href="#">16:00</a></li>
											<li><a href="#">20:00</a></li>
											<li><a href="#">24:00</a></li>
										</ul>
										<ul class="nav navbar-nav">
											<li class="active"><a href="#">토</a></li>
											<li><a href="#">10:00</a></li>
											<li><a href="#">16:00</a></li>
											<li><a href="#">20:00</a></li>
											<li><a href="#">24:00</a></li>
										</ul>
									</div>
								</nav>
							</div>														
						</div>
					</div>
					<form action="paySystem/pay24" method="get">
							<input type="hidden" name="num" value="152">
							<a href="paySystem/pay24">aaaa</a>
							<button id="pay_btn" class="btn btn-warning">예매하기 [무료]</button>
					</form>


				</div>

			</div>
		</div>
