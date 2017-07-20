<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../temp/bootStrap.jsp"></c:import>
<script type="text/javascript">
	$(function() {
		var count = 0;
		var curPage = 0;
		
		//스크롤 이벤트 발생 시
		$(document).scroll(function() {
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentHeight = $(document).height();
			
			if (documentHeight <= scrollHeight + 1) {
				if(count<'${totalCount}'||count!='${totalCount}') {
					curPage++;
					
					getList(curPage);
					
					count = count + 10;
				}
			}
		});
		
		$(document).on("click", ".pic-caption", function() {
			location.href = "movieDetail?movie_num=" + $(this).attr("accesskey");
		});
		
		$(document).on("click", "#mod", function() {
			$("body").attr("style", "background-color: #595959;");
			$("#modli").html('<a href="#" id="mod_cancel" onclick="return false;">수정취소</a>');
			$("#delli").html('<a href="#" id="del" onclick="return false;">삭제</a>');
			
			$(document).on("click", ".pic-caption", function() {
				location.href = "movieWriteForm?path=Update&movie_num=" + $(this).attr("accesskey");
			});
		});
		
		$(document).on("click" ,"#mod_cancel", function() {
			$("body").removeAttr("style");
			$("#modli").html('<a href="#" id="mod" onclick="return false;">수정</a>');
			
			$(document).on("click", ".pic-caption", function() {
				location.href = "movieDetail?movie_num=" + $(this).attr("accesskey");
			});
		});
		
		$(document).on("click", "#del", function() {
			$("body").attr("style", "background-color: #595959;");
			$("#delli").html('<a href="#" id="del_cancel" onclick="return false;">삭제취소</a>');
			$("#modli").html('<a href="#" id="mod" onclick="return false;">수정</a>');
			
			$(document).on("click", ".pic-caption", function() {
				if(confirm('정말 삭제하시겠습니까?')) {
					location.href = "movieDelete?movie_num=" + $(this).attr("accesskey");					
				} else {
					location.href = "movieList";
				}
			});
		});
		
		$(document).on("click", "#del_cancel", function() {
			$("body").removeAttr("style");
			$("#delli").html('<a href="#" id="del" onclick="return false;">삭제</a>');
			
			$(document).on("click", ".pic-caption", function() {
				location.href = "movieDetail?movie_num=" + $(this).attr("accesskey");
			});
		});
	});
	
	function getList(curPage) {
		$.ajax({
			url:"getMovieList",
			type:"GET",
			data:{
				curPage:curPage
			},
			success:function(data) {
				if(data!="") {
					$(".art").append(data.trim());
				}
			}
		});
	}
</script>
<style type="text/css">
	body {
		margin: 0%;
	}	
	#hd {
		width: 100%;
		height: 80px;
		position: fixed;
		opacity: 0.8;
		z-index: 999;
		background-color: black;
	}
	
	#main_section {
		width: 100%;
	}
	
	#ft {
		width: 100%;
		height: 230px;
		background-color: lime;
	}
	
	.art {
		width: 70%;
		margin: 0 auto;
		display: table;
		margin-bottom: 80px;
	}
	
	.ct {
		width: 230px;
		height: 336px;
		float: left;
		margin-top: 80px;
		margin-left: 2.7%;
	}
	
	hr {
		background-color: white;
	}
	
	* {
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    -o-box-sizing: border-box;
	    -ms-box-sizing: border-box;
	    box-sizing: border-box
	}
	
	img {
	    max-width: 100%;
	}

	h1 {
	    font-size: 3.0em;
	    line-height: 40px;
	}
	
	.wrapper {
	    max-width: 100%;
	    margin: 0 auto;
	}
	
	.wrapper:before,
	.wrapper:after {
	    content: '';
	    display: table;
	    clear: both;
	}
	
	@keyframes anima {
	    from {
	        margin-top: 0px;
	        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	        filter: alpha(opacity=0);
	        -moz-opacity: 0;
	        -khtml-opacity: 0;
	        opacity: 0
	    }
	    to {
	        margin: auto;
	        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	        filter: alpha(opacity=100);
	        -moz-opacity: 1;
	        -khtml-opacity: 1;
	        opacity: 1
	    }
	}
	
	@-webkit-keyframes anima {
	    from {
	        margin-left: 0px;
	        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	        filter: alpha(opacity=0);
	        -moz-opacity: 0;
	        -khtml-opacity: 0;
	        opacity: 0
	    }
	    to {
	        margin-left: 0px;
	        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	        filter: alpha(opacity=100);
	        -moz-opacity: 1;
	        -khtml-opacity: 1;
	        opacity: 1
	    }
	}
	
	.pic {
	    max-width: 100%;
	    max-height: 100%;
	    position: relative;
	    overflow: hidden;
	    margin: 0px;
	    display: inline-block;
	    -webkit-animation: anima 2s;
	    -moz-animation: anima 2s;
	    -o-animation: anima 2s;
	    -ms-animation: anima 2s;
	    animation: anima 2s;
	    -webkit-backface-visibility: hidden;
	    -moz-backface-visibility: hidden;
	    -o-backface-visibility: hidden;
	    -ms-backface-visibility: hidden;
	    backface-visibility: hidden;
	    
	
	}
	
	.pic-3d {
	    -webkit-perspective: 500;
	    -moz-perspective: 500;
	    -o-perspective: 500;
	    -ms-perspective: 500;
	    perspective: 500;
	    -webkit-transform-style: preserve-3d;
	    -moz-transform-style: preserve-3d;
	    -o-transform-style: preserve-3d;
	    -ms-transform-style: preserve-3d;
	    transform-style: preserve-3d
	}
	
	.pic-caption {
	    cursor: pointer;
	    position: absolute;
	    width: 100%;
	    height: 100%;
	    background: rgba(44, 62, 80, 0.5);
	    padding: 10px;
	    text-align: center;
	    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	    filter: alpha(opacity=0);
	    -moz-opacity: 0;
	    -khtml-opacity: 0;
	    opacity: 0;
	    color: white;
	}
	
	.pic-image {
	    -webkit-transform: scale(1.1);
	    -moz-transform: scale(1.1);
	    -o-transform: scale(1.1);
	    -ms-transform: scale(1.1);
	    transform: scale(1.1)
	}
	
	.pic:hover .pic-image {
	    -webkit-transform: scale(1);
	    -moz-transform: scale(1);
	    -o-transform: scale(1);
	    -ms-transform: scale(1);
	    transform: scale(1)
	}
	
	.pic-title {
	    font-size: 1.8em;
	}
	
	.pic .pic-image,
	.pic-caption,
	.pic:hover .pic-caption,
	.pic:hover img {
	    -webkit-transition: all 0.5s ease;
	    -moz-transition: all 0.5s ease;
	    -o-transition: all 0.5s ease;
	    -ms-transition: all 0.5s ease;
	    transition: all 0.5s ease
	}
	
	.pic:hover .open-right {
	    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	    filter: alpha(opacity=100);
	    -moz-opacity: 1;
	    -khtml-opacity: 1;
	    opacity: 1;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -o-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	    -webkit-touch-callout: none;
	    -moz-touch-callout: none;
	    -o-touch-callout: none;
	    -ms-touch-callout: none;
	    touch-callout: none;
	    -webkit-tap-highlight-color: transparent;
	    -moz-tap-highlight-color: transparent;
	    -o-tap-highlight-color: transparent;
	    -ms-tap-highlight-color: transparent;
	    tap-highlight-color: transparent
	}
	
	.open-right {
	    -webkit-transform: rotateY(-180deg);
	    -moz-transform: rotateY(-180deg);
	    -o-transform: rotateY(-180deg);
	    -ms-transform: rotateY(-180deg);
	    transform: rotateY(-180deg);
	    left: 0;
	    top: 0
	}
	
	.pic:hover .open-right {
	    -webkit-transform: rotateY(0deg);
	    -moz-transform: rotateY(0deg);
	    -o-transform: rotateY(0deg);
	    -ms-transform: rotateY(0deg);
	    transform: rotateY(0deg)
	}
	
	@media screen and (max-width: 560px) {
	    .pic {
	        max-width: 100%;
	        max-height: 100%;
	        display: block;
	        -webkit-animation: none;
	        -moz-animation: none;
	        -o-animation: none;
	        -ms-animation: none;
	        animation: none;
	        margin: 10px auto;
	    }
	}
	
	#myCarousel {
		height: 600px;
		overflow: hidden;
	}
	
	.carousel-caption {
		padding-bottom: 20%;
	}
	
	.art2 {
		width: 100%;
		height: 80px;
	}
	
	.sub_wrap {
		width: 100%;
		height: 100%;
		position: relative;
	}
	
	.sub1 {
		width: 60%;
		height: 50px;
		position: absolute;
		bottom: 0px;
		background-color: #e6ccff;
		font-weight: bold;
		font-size: 1.1em;
	}
	
	.sub2 {
		width: 40%;
		height: 50px;
		position: absolute;
		bottom: 0px;
		left: 60%;
		background-color: #e6ccff;
		font-size: 0.9em;
	}
	
	.sub1_con {
		width: 72%;
		height: 100%;
		position: absolute;
		bottom: 0px;
		left: 28%;
	}
	
	.sub2_con {
		width: 58%;
		height: 100%;
		position: absolute;
		bottom: 0px;
	}
	
	.sub1_con ul li {
		position: relative;
		float: left;
		margin-right: 10%;
		line-height: 50px;
	}
	
	.sub2_con ul li {
		position: relative;
		float: right;
		margin-left: 10%;
		line-height: 50px;
	}
</style>
</head>
<body>
	<c:import url="../../temp/header.jsp"/>
	
	<section id="main_section">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner">
	
	      <div class="item active">
	        <img src="<c:url value="/img/movie-img/test5.jpg" />" alt="Los Angeles" style="width:100%;">
	        <div class="carousel-caption">
	          <h3>Los Angeles</h3>
	          <p>LA is always so much fun!</p>
	        </div>
	      </div>
	
	      <div class="item">
	        <img src="<c:url value="/img/movie-img/test6.jpg" />" alt="Chicago" style="width:100%;">
	        <div class="carousel-caption">
	          <h3>Chicago</h3>
	          <p>Thank you, Chicago!</p>
	        </div>
	      </div>
	    
	      <div class="item">
	        <img src="<c:url value="/img/movie-img/test7.jpg" />" alt="New York" style="width:100%;">
	        <div class="carousel-caption">
	          <h3>New York</h3>
	          <p>We love the Big Apple!</p>
	        </div>
	      </div>
	  
	    </div>
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right"></span>
	      <span class="sr-only">Next</span>
	    </a>
	  </div>
	  <article class="art2">
	  	<div class="sub_wrap">
	  		<div class="sub1">
	  			<div class="sub1_con">
		  			<ul class="sub1_ul">
		  				<li>
		  					<a href="#">현재상영작</a>
		  				</li>
		  				<li>
		  					<a href="#">개봉예정작</a>
		  				</li>
		  				<li>
		  					<a href="#">보고싶어요</a>
		  				</li>
		  			</ul>
		  		</div>
	  		</div>
	  		<div class="sub2">
	  			<div class="sub2_con">
	  				<ul class="sub2_ul">
	  					<li id="delli">
	  						<a href="#" id="del" onclick="return false;">삭제</a>
	  					</li>
	  					<li id="modli">
	  						<a href="#" id="mod" onclick="return false;">수정</a>
	  					</li>
	  					<li>
	  						<a href="movieWriteForm?path=Write">추가</a>
	  					</li>
	  				</ul>
	  			</div>
	  		</div>
	  	</div>
	  </article>
	  <article class="art">
	  
	  </article>
	  <div id="modal_div2"></div>
	</section>
	
	<c:import url="../../temp/footer.jsp"/>
</body>
</html>