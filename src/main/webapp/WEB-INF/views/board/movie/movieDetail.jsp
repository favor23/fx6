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
	/* 나눔고딕 font-family: 'Nanum Gothic', sans-serif; */
	@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
	/* 이롭게 바탕체? font-family: 'Iropke Batang', serif; */
	@import url('//cdn.jsdelivr.net/font-iropke-batang/1.2/font-iropke-batang.css');
	
	body {
		font-family: 'Jeju Gothic', sans-serif;
		background-color: #f5f5f0;
	}
	
	header {
		font-family: 'Noto Sans KR';
	}
	
	.main_art1 {
		width: 60%;
		height: 540px;
		float: left;
		margin-top: 80px;
		background-color: white;
		padding: 20px;
		box-shadow: 1px 1px 5px #adad85;
	}
	
	.main_art2 {
		width: 60%;
		margin: 0 auto;
		margin-top: 650px;
		margin-bottom: 100px;
		background-color: white;
		box-shadow: 1px 1px 5px #adad85;
	}
	
	.tab-content {
		padding: 20px;
	}
	
	#home {
		line-height: 35px;
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
		margin-top: 100px;
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
	    margin-top: 75px;
	    color: white;
	}
	
	.row {
		margin-right: -350px;
	}
	
	.btn1 {
		position: absolute;
		bottom: 20px;
		right: 0px;
		right: 0px;
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
	
	.btns {
		float: right;
	}
	
	.menu4_con {
		width: 100%;
	}
	
	.btn1 {
		width: 120px;
	}
	
	.star_rating {font-size:0; letter-spacing:-4px; margin-left: 22px;}
	
	
	.star_rating a {
   		font-size:25px;
    	letter-spacing:0;
    	display:inline-block;
    	margin-left:5px;
   		color:#ccc;
    	text-decoration:none;
	}

	.star_rating a:first-child {margin-left:0;}
	.star_rating a.on {color:#ffd11a;}
	
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
		
		$(document).on("click", ".srDel", function() {
			srDelete($(this).attr("accesskey"));
		});
		
		$("#review").click(function() {
			getRList(1, $(".btn1").attr("accesskey"));
		});
		
		$(document).on("click", ".rotation1", function() {
			getUpList(1, $(".btn1").attr("accesskey"));
		});
		
		$(document).on("click", ".rotation2", function() {
			getRList(1, $(".btn1").attr("accesskey"));
		});
		
		$( ".star_rating a" ).click(function() {
		    $(this).parent().children("a").removeClass("on");
		    $(this).addClass("on").prevAll("a").addClass("on");
		    return false;
		});
		
		$(".vstar").click(function() {
		 	var star = $(this).attr("id");
		 	
		 	$("#stars").val(star);
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
			url : "../../index_movielist/modal_ticket?movie_num="+num,
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
	
	function srDelete(num) {
		$.ajax({
			url : "../simple_review/srDelete?num=" + num,
			type : "GET",
			success : function(data) {
				alert(data.trim());
				getSrList(1, $(".btn1").attr("accesskey"));
			}
		});
	}
	
	function getRList(curPage, movie_num) {
		$.ajax({
			url : "../simple_review/rList?curPage=" + curPage + "&movie_num=" + movie_num,
			type : "GET",
			success : function(data) {
				$(".r_list").html(data.trim());
			}
		});
	}
	
	function getUpList(curPage, movie_num) {
		$.ajax({
			url : "../simple_review/rUpList?curPage=" + curPage + "&movie_num=" + movie_num,
			type : "GET",
			success : function(data) {
				$(".r_list").html(data.trim());
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
						<c:if test="${stars>0.0 and stars<1.0 or stars==0.0 or stars==1.0}">
							<p><img src="<c:url value="/img/reviewimg/sr_stars2.png"/>"></p>
						</c:if>
						<c:if test="${stars>1.0 and stars<2.0 or stars==2.0}">
							<p><img src="<c:url value="/img/reviewimg/sr_stars3.png"/>"></p>		
						</c:if>
						<c:if test="${stars>2.0 and stars<3.0 or stars==3.0}">
							<p><img src="<c:url value="/img/reviewimg/sr_stars4.png"/>"></p>		
						</c:if>
						<c:if test="${stars>3.0 and stars<4.0 or stars==4.0}">
							<p><img src="<c:url value="/img/reviewimg/sr_stars5.png"/>"></p>		
						</c:if>
						<c:if test="${stars>4.0 and stars<5.0 or stars==5.0}">
							<p><img src="<c:url value="/img/reviewimg/sr_stars6.png"/>"></p>		
						</c:if>
					</p>
					<p>
						한줄평별점 : ${srStars}
						<c:if test="${srStars eq null}">
							<h3 style="color: red;">등록된 별점이 없습니다.</h3>
						</c:if>
						<c:if test="${srStars>0.0 and srStars<1.0 or srStars==0.0 or srStars==1.0}">
							<p><img src="<c:url value="/img/reviewimg/sr_stars2.png"/>"></p>
						</c:if>
						<c:if test="${srStars>1.0 and srStars<2.0 or srStars==2.0}">
							<p><img src="<c:url value="/img/reviewimg/sr_stars3.png"/>"></p>		
						</c:if>
						<c:if test="${srStars>2.0 and srStars<3.0 or srStars==3.0}">
							<p><img src="<c:url value="/img/reviewimg/sr_stars4.png"/>"></p>		
						</c:if>
						<c:if test="${srStars>3.0 and srStars<4.0 or srStars==4.0}">
							<p><img src="<c:url value="/img/reviewimg/sr_stars5.png"/>"></p>		
						</c:if>
						<c:if test="${srStars>4.0 and srStars<5.0 or srStars==5.0}">
							<p><img src="<c:url value="/img/reviewimg/sr_stars6.png"/>"></p>		
						</c:if>
					</p>
					<button type="button" class="btn btn-warning list_a modal_crate2 btn1" 
													data-toggle="modal" data-target="#myModal2" accesskey="${dto.movie_num}">구매하기</button>
				</div>
			</div>
			<div class="art1_div2">
				<img style="width: 74%; float: right; margin-top: 15px;" src="<c:url value="${dto.poster_img}"/>">
			</div>
		</article>
		<article class="main_art2">
			  <ul class="nav nav-tabs">
			    <li class="active"><a data-toggle="tab" href="#home">주요정보</a></li>
			    <li><a data-toggle="tab" href="#menu3" id="sr">한줄평</a></li>
			    <li><a data-toggle="tab" href="#menu4" id="review">리뷰</a></li>
			  </ul>
			
			  <div class="tab-content">
			    <div id="home" class="tab-pane fade in active">
			      <h3>줄거리</h3>
			      <p>${dto.synopsis}</p>
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
			      					<p class="star_rating" style="text-align: left;">
									    <a href="#" class="vstar on" id="1">★</a>
									    <a href="#" class="vstar on" id="2">★</a>
									    <a href="#" class="vstar on" id="3">★</a>
									    <a href="#" class="vstar" id="4">★</a>
									    <a href="#" class="vstar" id="5">★</a>
									</p>
									<p style="margin-left: 22px; font-size: 1.5em;">별점주기</p>
			      					<input type="hidden" name="sr_stars" id="stars" value="3">
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
			      <div class="menu4_con">
			      	<div class="r_list">
			      	
			      	</div>
			      </div>
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