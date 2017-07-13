<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<div id="div2_warp">
		<div id="div2_list">
			<ul>
			<c:if test="${num eq 1}">
			<li id="action" class="mouse_action" accesskey="1">박스오피스</li>
						<li class="mouse_action" accesskey="2">최신개봉작</li>
						<li class="mouse_action" accesskey="3">상영예정작</li>
						<li class="mouse_action" accesskey="4">큐레이션</li>
			</c:if>
			<c:if test="${num eq 2}">
				<li  class="mouse_action" accesskey="1">박스오피스</li>
						<li id="action" class="mouse_action" accesskey="2">최신개봉작</li>
						<li class="mouse_action" accesskey="3">상영예정작</li>
						<li class="mouse_action" accesskey="4">큐레이션</li>
			</c:if>
			<c:if test="${num eq 3}">
				<li  class="mouse_action" accesskey="1">박스오피스</li>
						<li class="mouse_action" accesskey="2">최신개봉작</li>
						<li id="action" class="mouse_action" accesskey="3">상영예정작</li>
						<li class="mouse_action" accesskey="4">큐레이션</li>
			</c:if>
			<c:if test="${num eq 4}">
			<li  class="mouse_action" accesskey="1">박스오피스</li>
						<li  class="mouse_action" accesskey="2">최신개봉작</li>
						<li class="mouse_action" accesskey="3">상영예정작</li>
						<li id="action" class="mouse_action" accesskey="4">큐레이션</li>
			</c:if>
			</ul>
		</div>
		<span accesskey="${num}" class="allview_span">+ 전체보기</span>
		<div id="myCarousel2" class="carousel slide">
			<!-- Indicators -->
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">

					<ul class="div2_mvlist" style="padding-left: 150px;">
					<%-- 	<c:forEach items="${list}" var="dto"> --%>
						<c:forEach items="${list}" begin="0" end="3" var="dto" varStatus="status">
								<li>
								<div class="list_img pic pic-3d" >
									<span class="boxoffice n${status.begin+status.count}">0${status.begin+status.count}</span> 
									<img src="<c:url value="${dto.poster_img}"/>" class="pic-image" alt="Pic">
									<span class="pic-caption open-right modal_crate1" data-toggle="modal" data-target="#myModal" accesskey="${dto.movie_num}">
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
										<span class="film_rate age_${dto.restricted}"></span><a class="modal_crate1" accesskey="${dto.movie_num}" data-toggle="modal" data-target="#myModal">${dto.movie_title}</a>
									</div>
									<button type="button" class="btn btn-info btn-lg list_a modal_crate1"
													data-toggle="modal" data-target="#myModal" accesskey="${dto.movie_num}">상세보기</button>
											<button type="button" class="btn btn-info btn-lg list_a modal_crate2"
													data-toggle="modal" data-target="#myModal2" accesskey="${dto.movie_num}">예매하기</button></div>
							</li>
						</c:forEach>
					</ul>
				</div>

				<div class="item">
					<ul class="div2_mvlist" style="padding-left: 150px;">
					<%-- 	<c:forEach items="${list}" var="dto"> --%>
						<c:forEach items="${list}" begin="4" end="7" var="dto" varStatus="status">
							<li>
								<div class="list_img pic pic-3d" >
									<span class="boxoffice n${status.begin+status.count}">0${status.begin+status.count}</span> 
									<img src="<c:url value="${dto.poster_img}"/>" class="pic-image" alt="Pic">
									<span class="pic-caption open-right modal_crate1" data-toggle="modal" data-target="#myModal" accesskey="${dto.movie_num}">
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
										<span class="film_rate age_${dto.restricted}"></span><a class="modal_crate1" accesskey="${dto.movie_num}" data-toggle="modal" data-target="#myModal">${dto.movie_title}</a>
									</div>
									<button type="button" class="btn btn-info btn-lg list_a modal_crate1"
													data-toggle="modal" data-target="#myModal" accesskey="${dto.movie_num}">상세보기</button>
											<button type="button" class="btn btn-info btn-lg list_a modal_crate2"
													data-toggle="modal" data-target="#myModal2" accesskey="${dto.movie_num}">예매하기</button></div>
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