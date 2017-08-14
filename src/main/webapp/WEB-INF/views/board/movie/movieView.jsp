<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Modal 상세정보 -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
				
					<div class="modal-header">
						<h4 class="modal-title">
							<nav class="navbar navbar-inverse">
								<div class="container-fluid">
									<div class="navbar-header c_white">
										<a class="navbar-brand c_white">영화 상세보기</a>									
									</div>	
									<button type="button" class="btn btn-default" data-dismiss="modal" style="margin: 10px 5px 0 0; float: right;">Close</button>																				
								</div>
							</nav>
						</h4>
					</div>
					<div id="mf" class="modal-footer">
						<div class="modal-div2" style="width: 325px;">
							<img style="width: 260px; height: 390px; float: right;" src="<c:url value="${dto.poster_img}"/>">
						</div>
						<div class="modal-div2">
							<nav class="navbar navbar-inverse" style="height: 390px;">
								<div class="container-fluid">
									<div class="navbar-header" style="width: 100%; border-bottom: 1px solid white;">
										<a class="navbar-brand"><span class="film_rate age_${dto.restricted}"></span>${dto.movie_title}</a>
									</div>
									<div id="con">
										<p>개봉일 : ${dto.release_date}</p>
										<p>감독 : ${dto.director}</p>
										<p>출연 : ${dto.actor}</p>
										<p>장르 : ${dto.genre}</p>
										<p>러닝타임 : ${dto.running_time}분</p>
										<hr>
										<p><div style="height:100px; width:330px; overflow:hidden;  text-overflow:ellipsis; color: white;">${dto.synopsis}</div></p>
									</div>
								</div>
							</nav>
						</div>
					</div>
				</div>

			</div>
		</div>
	