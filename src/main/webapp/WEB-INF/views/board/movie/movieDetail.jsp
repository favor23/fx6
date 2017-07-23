<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../temp/bootStrap.jsp"></c:import>
<style type="text/css">
	.main_art1 {
		width: 60%;
		height: 500px;
		float: left;
	}
	
	.main_art2 {
		width: 60%;
		height: 50px;
		display: table;
	}
	
	.art1_div1 {
		width: 60%;
		height: 100%;
		float: left;
	}
	
	.art1_div2 {
		width: 40%;
		height: 100%;
		float: right;
	}
	
	.nav_left,
	.nav_right {
		width: 20%;
		height: 550px;
		float: left;
	}
	
	.nav_left {
		margin-top: 150px;
	}
	
	.nav_right {
		float: right;
		display: none;
	}
	
	.main_top {
		width: 100%;
		height: 160px;
		margin: 0 auto;
		margin-top: 80px;
	}
	
	.film_rate {
		display: inline-block;
		overflow: hidden;
		text-indent: -9999px;
		margin: -3px 10px 0 0;
		width: 20px;
		height: 21px;
		vertical-align: middle;
		background: url("/fx6/img/index/btn_movie.png") 0 -200px no-repeat;
	}
	
	.age_12 {
		background-position: -60px -200px;
	}
	
	.age_15 {
		background-position: -90px -200px;
	}
	
	.age_19 {
		background-position: -30px -200px;
	}
	
	footer {
		display: flow-root;
	}
	
	.div1_1 {
		width: 100%; 
		height: 70px; 
		border-bottom: 1px solid black;
		font-size: 2em;
		line-height: 70px;
	}
	
	.div1_2 {
		width: 100%; 
		height: 430px;
		padding: 20px;
		position: relative;
	}
	
	.carousel {
	    margin-bottom: 0;
	    padding: 0 100px 30px 100px;
	    position: absolute;
	}
	/* The controlsy */
	.carousel-control {
	    height: 40px;
		width: 40px;
	    background: none repeat scroll 0 0 #222222;
	    border: 4px solid #FFFFFF;
	    border-radius: 23px 23px 23px 23px;
	    margin-top: 45px;
	}
	
	.row {
		margin-right: -280px;
	}
	
	.btn {
		position: absolute;
		bottom: 20px;
		right: 0px;
	}
	
	.btn1 {
		right: 100px;
	}
	
	.menu3_con,
	.menu3_wrap {
		width: 100%;
	}
	
	.menu3_con {
		margin-bottom: 50px;
	}
	
	.sr_write {
		width: 100%;
		height: 80px;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	.sr_list {
		width: 100%;
		height: 100%;
	}
	
	.write_left,
	.write_middle,
	.write_right {
		height: 100%;
		float: left;
	}
	
	.write_left {
		width: 20%;
	}
	
	.write_middle {
		width: 70%;
	}
	
	.write_right {
		width: 10%;
		position: relative;
	}
	
	.write_right input {
		width: 100%;
		height: 100%;
		bottom: 0px;
	}
	
	.list {
		width: 100%;
		display: inline-flex;
		margin-top: 20px;
	}
	
	.list_left,
	.list_right {
		float: left;
	}
	
	.list_left {
		width: 20%;
	}
	
	.list_right {
		width: 80%;
		position: relative;
	}
	
	.btns span:last-child {
		position: absolute;
		right: 0px;
	}
	
	.btns span:first-child {
		position: absolute;
		right: 80px;
	}
</style>
<script type="text/javascript">
	$(function() {
		var curPage = 1;
		var count = 10;
		
		$(".carousel").carousel({ interval:false });
		
		getList(curPage);
		
		$(".left").click(function() {
			curPage--;
			count -= 10;
			
			if(curPage==1) {
				$(".left").attr("style", "display: none;");
			}
			if(count<'${totalCount}'||count!='${totalCount}') {
				$(".right").removeAttr("style");
			}
			
			getList(curPage);
		});
		
		$(".right").click(function() {
			curPage++;
			count += 10;

			if(curPage==2) {
				$(".left").removeAttr("style");				
			}
			if(count>'${totalCount}'||count=='${totalCount}') {
				$(".right").attr("style", "display: none;");
			}
			
			getList(curPage);
		});
		
		$(".modal_crate2").on("mouseenter",function(){
			var num = $(this).attr("accesskey");			
			modal_ticket_crate(num);
		});
		
		$(document).on("click", ".pic", function() {
			location.href = "movieDetail?movie_num=" + $(this).attr("accesskey");
		});
		
		$(".sr_btn").click(function() {
			$("#frm").submit();
		});
		
		$("#sr").click(function() {
			getSrList(1, $(".btn1").attr("accesskey"));
		});
		
		$(document).on("click", ".good", function() {
			srGood($(this).attr("accesskey"));
		});
		
		$(document).on("click", ".bad", function() {
			srBad($(this).attr("accesskey"));
		});
	});
	
	function getList(curPage) {
		$.ajax({
			url:"getDetailList/" + curPage,
			type:"GET",
			success:function(data) {
				var result = "";
				var num = 0;
				
				$(data).each(function() {
					num++;
					
					result = result + '<div class="col-md-1"><a href="#" class="thumbnail">';
					result = result + '<img src="<c:url value="/' + this.poster_img + '" />" alt="Image" style="max-width:100%;" class="pic" accesskey="' + this.movie_num + '">';
					result = result + '</a></div>';
				});
				
				if(num%10!=0) {
					for(var i=0; i<10-num; i++) {
						result = result + '<div class="col-md-1"></div>';				
					}
				}
				
				if(curPage%2==1) {
					$("#result1").html(result);					
				} else {
					$("#result2").html(result);
				}
			}
		});
	}
	
	function modal_ticket_crate(num) {
		$.ajax({
			url : "../../index_movielist/modal_ticket?num="+num,
			type : "GET",
			success : function(data) {
				$("#modal_div2").html(data);
			}
		});
	}
	
	function getSrList(curPage, movie_num) {
		$.ajax({
			url : "../simple_review/srList?curPage=" + curPage + "&movie_num=" + movie_num,
			type : "GET",
			success : function(data) {
				$(".sr_list").html(data.trim());
			}
		});
	}
	
	function srGood(num) {
		$.ajax({
			url : "../simple_review/srGood?num=" + num,
			type : "GET",
			success : function(data) {
				alert(data.trim());
				getSrList(1, $(".btn1").attr("accesskey"));
			}
		});
	}
	
	function srBad(num) {
		$.ajax({
			url : "../simple_review/srBad?num=" + num,
			type : "GET",
			success : function(data) {
				alert(data.trim());
				getSrList(1, $(".btn1").attr("accesskey"));
			}
		});
	}
</script>
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	
	<section id="main_section">
		<nav class="nav_left">
			
		</nav>
		<article class="main_top">
			<div id="Carousel" class="carousel slide">
			                 
			    <!-- Carousel items -->
			    <div class="carousel-inner">
			                    
			      <div class="item active">
			         <div class="row">
			            <div id="result1"></div>
			         </div><!--.row-->
			      </div><!--.item-->
			                
			      <div class="item">
			         <div class="row">
			            <div id="result2"></div>
			         </div>
			      </div>
			                
				</div><!--.carousel-inner-->
			    <a data-slide="prev" href="#Carousel" class="left carousel-control" style="display: none;">‹</a>
			    <a data-slide="next" href="#Carousel" class="right carousel-control">›</a>
			</div><!--.Carousel-->
			                 
		</article>
		<article class="main_art1">
			<div class="art1_div1">
				<div class="div1_1">
					<span class="film_rate age_${dto.restricted}"></span>${dto.movie_title}
				</div>
				<div class="div1_2">
					<p>개봉일 : ${dto.release_date}</p>
					<p>감독 : ${dto.director}</p>
					<p>출연 : ${dto.actor}</p>
					<p>장르 : ${dto.genre}</p>
					<p>러닝타임 : ${dto.running_time}분</p>
					<hr>
					<p>
						리뷰어별점 : ${stars}
						<c:if test="${stars eq null}">
							<h3 style="color: red;">등록된 별점이 없습니다.</h3>
						</c:if>
						<c:if test="${stars>0.0 and stars<1.0 or stars==0.0}">
							<p><img src="<c:url value="/img/reviewimg/star1.JPG"/>"></p>
						</c:if>
						<c:if test="${stars>1.0 and stars<2.0 or stars==1.0}">
							<p><img src="<c:url value="/img/reviewimg/star2.JPG"/>"></p>		
						</c:if>
						<c:if test="${stars>2.0 and stars<3.0 or stars==2.0}">
							<p><img src="<c:url value="/img/reviewimg/star3.JPG"/>"></p>		
						</c:if>
						<c:if test="${stars>3.0 and stars<4.0 or stars==3.0}">
							<p><img src="<c:url value="/img/reviewimg/star4.JPG"/>"></p>		
						</c:if>
						<c:if test="${stars>4.0 and stars<5.0 or stars==4.0}">
							<p><img src="<c:url value="/img/reviewimg/star5.JPG"/>"></p>		
						</c:if>
					</p>
					<p>
						한줄평별점 : 
					</p>
					<button type="button" class="btn btn-primary list_a modal_crate2 btn1"
													data-toggle="modal" data-target="#myModal2" accesskey="${dto.movie_num}">예매하기</button>
					<input type="button" value="보고싶어요" class="btn btn-info btn2">
				</div>
			</div>
			<div class="art1_div2">
				<img style="width: 90%; float: right; margin-top: 15px;" src="<c:url value="${dto.poster_img}"/>">
			</div>
		</article>
		<article class="main_art2">
			  <ul class="nav nav-tabs">
			    <li class="active"><a data-toggle="tab" href="#home">주요정보</a></li>
			    <li><a data-toggle="tab" href="#menu1">포토</a></li>
			    <li><a data-toggle="tab" href="#menu2">동영상</a></li>
			    <li><a data-toggle="tab" href="#menu3" id="sr">한줄평</a></li>
			    <li><a data-toggle="tab" href="#menu4">리뷰</a></li>
			    <li><a data-toggle="tab" href="#menu5">연관영화</a></li>
			  </ul>
			
			  <div class="tab-content">
			    <div id="home" class="tab-pane fade in active">
			      <h3>줄거리</h3>
			      <p>${dto.synopsis}</p>
			    </div>
			    <div id="menu1" class="tab-pane fade">
			      <h3>Menu 1</h3>
			      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			    </div>
			    <div id="menu2" class="tab-pane fade">
			      <h3>Menu 2</h3>
			      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
			    </div>
			    <div id="menu3" class="tab-pane fade">
			      <form action="../simple_review/srWrite" id="frm" method="post">
			      	<input type="hidden" name="movie_num" value="${dto.movie_num}">
			      	
			      	<!-- 나중에 세션의 member에서 id를 작성자로 보내시오. -->
			      	<input type="hidden" name="writer" value="${member.id}">
			      	
			      	<div class="menu3_con">
			      		<div class="menu3_wrap">
			      			<div class="sr_write">
			      				<div class="write_left">
			      					<input type="number" name="sr_stars" placeholder="별점(1~5)" min="1" max="5" step="1" style="width: 99%; height: 20px;">
			      				</div>
			      				<div class="write_middle">
			      					<textarea rows="" cols="" name="contents" placeholder="스포일러성 한줄평은 삭제될 수 있습니다." style="width: 100%; height: 100%;"></textarea>
			      				</div>
			      				<div class="write_right">
			      					<input type="button" class="btn btn-danger sr_btn" value="등록">
			      				</div>
			      			</div>
			      			<div class="sr_list">
			      				
			      			</div>
			      		</div>
			      	</div>
			      </form>
			    </div>
			    <div id="menu4" class="tab-pane fade">
			      <h3>Menu 4</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
			    <div id="menu5" class="tab-pane fade">
			      <h3>Menu 5</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
			  </div>
		</article>
		<nav class="nav_right">
			
		</nav>
		<div id="modal_div2"></div>
	</section>
	
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>