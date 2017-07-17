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
		height: 150px;
		margin: 0 auto;
		margin-top: 50px;
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
	}
	
	.carousel {
	    margin-bottom: 0;
	    padding: 0 100px 30px 100px;
	    position: absolute;
	}
	/* The controlsy */
	.carousel-control {
		left: -12px;
	    height: 40px;
		width: 40px;
	    background: none repeat scroll 0 0 #222222;
	    border: 4px solid #FFFFFF;
	    border-radius: 23px 23px 23px 23px;
	    margin-top: 45px;
	}
	.carousel-control.right {
		right: -12px;
	}
	
	.row {
		margin-right: -280px;
	}
</style>
<script type="text/javascript">
	$(function() {
		var curPage = 1;
		
		$(".carousel").carousel({ interval:false });
		
		getList(curPage);
	});
	
	function getList(curPage) {
		$.ajax({
			url:"getDetailList/" + curPage,
			type:"GET",
			data:{
				curPage:curPage
			},
			success:function(data) {
				var result = "";
				var count = 0;
				
				$(data).each(function() {
					count++;
					
					if(count<11) {
						result = result + '<div class="col-md-1"><a href="#" class="thumbnail">';
						result = result + '<img src="<c:url value="/' + this.poster_img + '" />" alt="Image" style="max-width:100%;">';
						result = result + '</a></div>';						
					}
				});
				
				$("#result").html(result);
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
			                		<div id="result"></div>
			                	</div><!--.row-->
			                </div><!--.item-->
			                 
			                <div class="item">
			                	<div class="row">
			                		<c:forEach begin="1" end="10">
			                	    	<div class="col-md-1"><a href="#" class="thumbnail"><img src="<c:url value="/img/movie-img/5.jpg" />" alt="Image" style="max-width:100%;"></a></div>
			                	    </c:forEach>
			                	</div><!--.row-->
			                </div><!--.item-->
			                 
			                </div><!--.carousel-inner-->
			                  <a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>
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
						<c:if test="${stars>0.0 and stars<1.0 or stars==0.0}">
							<img src="<c:url value="/img/reviewimg/star1.JPG"/>">
						</c:if>
						<c:if test="${stars>1.0 and stars<2.0 or stars==1.0}">
							<img src="<c:url value="/img/reviewimg/star2.JPG"/>">			
						</c:if>
						<c:if test="${stars>2.0 and stars<3.0 or stars==2.0}">
							<img src="<c:url value="/img/reviewimg/star3.JPG"/>">			
						</c:if>
						<c:if test="${stars>3.0 and stars<4.0 or stars==3.0}">
							<img src="<c:url value="/img/reviewimg/star4.JPG"/>">			
						</c:if>
						<c:if test="${stars>4.0 and stars<5.0 or stars==4.0}">
							<img src="<c:url value="/img/reviewimg/star5.JPG"/>">			
						</c:if>
					</p>
					<p>
						한줄평별점 : 
					</p>
					<input type="button" value="예매하기" class="btn btn-primary">
					<input type="button" value="보고싶어요" class="btn btn-info">
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
			    <li><a data-toggle="tab" href="#menu3">한줄평</a></li>
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
			      <h3>Menu 3</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
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
	</section>
	
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>