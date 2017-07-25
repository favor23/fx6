<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
											<a class="navbar-brand" style="    position: absolute;">${dto.movie_title}</a>
										</div>
										<img style="width: auto; height: 300px; float: right; margin: 10px 10px 0 0;"
								src="<c:url value="${dto.poster_img}"/>">
										<ul class="nav navbar-nav">
											<li class="active"><a>설명</a></li>
											<li><a>${dto.genre} ${dto.restricted} 세 ${dto.running_time} 분</a></li>	
											<li><a>${dto.synopsis}</a></li>											
										</ul>
									</div>
								</nav>
							
						</div>
						<div class="modal-div2">
							<div>
								<nav class="navbar navbar-inverse">
									<div class="container-fluid">
										<div class="navbar-header">
											<a class="navbar-brand" href="#">상영기간	[${dto.release_date} ~ ${dto.release_end}]</a>
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
					<form action="${pageContext.request.contextPath}/paySystem/pay24" method="post" style=" margin-bottom: 10px;">
							<input type="hidden" name="movie_num" value="${dto.movie_num}">
							<button id="pay_btn" class="btn btn-warning" style="height: 63.988636px;">예매하기 [<%-- ${dto.movie_price} --%>]</button>
					</form>


				</div>

			</div>
		</div>