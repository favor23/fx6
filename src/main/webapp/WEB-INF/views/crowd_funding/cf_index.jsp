<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootStrap.jsp"></c:import>
<style type="text/css">
	.main_top {
		width: 100%;
		height: 250px;
		margin-top: 50px;
		background-color: #0052cc;
	}
	
	.main_middle {
		width: 100%;
		height: 250px;
		margin-top: 50px;
		background-color: #0052cc;
		display: inline-block;
	}
	
	.top1 {
		width: 100%;
		height: 30%;
		text-align: center;
		line-height: 100px;
		font-size: 3.0em;
		color: white;
		font-weight: bold;
	}
	
	.top2 {
		width: 100%;
		height: 20%;
		text-align: center;
		font-size: 1.2em;
		color: #b3d9ff;
		margin-top: 45px;
	}
	
	.top3 {
		width: 100%;
		height: 30%;
		text-align: center;
		font-size: 1.2em;
		color: white;
	}

	.carousel1 {
		width: 60%;
		height: 500px;
		float: left;
		overflow: hidden;
	}
	
	.carousel2 {
		width: 60%;
		float: left;
	}
	
	.nav_left,
	.nav_right {
		float: left;
		width: 20%;
		height: 1300px;
	}
	
	.nav_right {
		float: right;
		display: none;
	}
	
	.nav_left2 {
		float: left;
		width: 20%;
		height: 500px;
	}
	
	footer {
		display: inline-block;
	}
	
	.main_side1,
	.main_side2 {
		width: 60%;
		height: 90px;
		float: left;
		margin-top: 100px;
		background-image: url("../img/cf-img/banner.png");
		background-color: #0052cc;
	}
	
	.main_side1 {
		margin-bottom: 30px;
	}
	
	.main_side2 {
		margin-bottom: 20px;
	}
	
	.main_side1 p,
	.main_side2 p {
		color: white;
		text-align: center;
	}
	
	.main_side1 p:first-child,
	.main_side2 p:first-child {
		font-size: 1.8em;
		font-weight: bold;
		margin-top: 13px;
	}
	
	/* carousel2 */
	.thumbnails a img { max-width:100%; }

	.thumbnails a,
	.caption a {
	    -webkit-transition: all 150ms ease;
		-moz-transition: all 150ms ease;
		-ms-transition: all 150ms ease;
		-o-transition: all 150ms ease;
		transition: all 150ms ease; 
		}
	    
	.thumbnails a:hover,
	.caption a:hover {
	    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; /* IE 8 */
	    filter: alpha(opacity=50); /* IE7 */
	    text-decoration: none;
	}
	
	.thumbnails li> .fff .caption { 
	    background:#fff !important; 
	    padding:10px
	}
	
	/* Thumbnail Box */
	.caption h4 {
	    color: #444;
	}
	
	.caption p {  
	    color: #999;
	}
	
	/* Carousel Control */
	.control-box {
	    text-align: right;
	    width: 100%;
	}
	.carousel-control{
	    background: #666;
	    border: 0px;
	    border-radius: 0px;
	    display: inline-block;
	    font-size: 34px;
	    font-weight: 200;
	    line-height: 18px;
	    opacity: 0.5;
	    padding: 4px 10px 0px;
	    position: static;
	    height: 30px;
	    width: 15px;
	}
	
	.col-sm-3 {
		padding-left: 0;
		padding-right: 0;
	}
	
	.carousel-caption {
		width: 100%;
		bottom: 350px;
		opacity: 0.9;
		left: 0;
	}
	
	.carousel-caption p,
	.carousel-caption h3 {
		background-color: #ff1a8c;
	}
	
	.carousel-caption h3 {
		font-size: 4.0em;
	}
	
	.carousel-caption p {
		font-size: 1.2em;
	}
	
	.main4_wrap {
		width: 100%;
		height: 228px;
	}
	
	.main4_1,
	.main4_2 {
		width: 60%;
		height: 100%;
		float: left;
		border: 1px solid #e0e0d1;
		background-color: #f5f5f0;
	}
	
	.main4_1 {
		margin-top: 50px;
	}
	
	.main4_1 p {
		text-align: center;
		color: #8a8a5c;
	}
	
	.main4_1 p:first-child {
		font-size: 1.4em;
		color: black;
		margin-top: 30px;
		margin-bottom: 20px;
	}
	
	.main4_1 input {
		width: 150px;
		height: 40px;
		margin-left: auto; 
		margin-right: auto;
		margin-top: 20px;
		display: block;
	}
	
	.main4_2 {
		cursor: pointer;
		font-size: 1.4em;
		text-align: center;
		line-height: 228px;
		margin-top: 20px;
		margin-bottom: 100px;
	}
	
	.main4_2:hover {
		border: 2px solid #0052cc;
		font-size: 1.5em;
	}
</style>
<script type="text/javascript">
	$(function() {
		$(".main4_2").click(function() {
			location.href = "campaign/campaignCreate";
		});
	});
</script>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	<section id="main_section">
		<article class="main_top">
			<div class="top1">
				크라우드 펀딩
			</div>
			<hr style="width: 20%; position: absolute; left: 20%;">
			<span style="position: absolute; left: 44%; top: 130px; color: white; font-size: 1.7em;">꿈을 가진 영화인들</span>
			<hr style="width: 20%; position: absolute; left: 60%;">
			<div class="top2">
				우리의 캠페인을 통해 그 기회를 만들어 보세요!
			</div>
			<div class="top3">
				<p>꿈과 아이디어를 가지고 본인의 영화를 실현시키고자 행동하는 사람들을 뜻합니다.</p>
				<p>당신의 소중한 꿈과 톡톡튀는 아이디어를 영화로 만들어 드립니다.</p>
			</div>
		</article>
		
		<nav class="nav_left">
			
		</nav>
		
		<article class="main_side1">
			<p>새로 올라온 프로젝트</p>
			<p>NEW PICK</p>
		</article>
		
		<div id="myCarousel" class="carousel slide carousel1" data-ride="carousel">
			<!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		      <li data-target="#myCarousel" data-slide-to="3"></li>
		    </ol>
		    
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner">
		
		      <div class="item active">
		        <img src="<c:url value="/img/movie-img/test5.jpg" />" alt="Los Angeles" style="width:100%;">
		      </div>
		      
		      <c:forEach items="${newList}" var="newList">
		      	  <div class="item">
			        <img src="<c:url value="${newList.campaign_img}" />" alt="Chicago" style="width:100%;">
			        <div class="carousel-caption">
			          <h3>${newList.campaign_title}</h3>
			          <p>${newList.simple_story}</p>
			        </div>
			      </div>
		      </c:forEach>
		  
		    </div>
		
		</div>
		
		<article class="main_side2">
			<p>인기 프로젝트</p>
			<p>BEST PICK</p>
		</article>
		
		<div class="carousel slide carousel2" id="myCarousel2">
	        <div class="carousel-inner">
	            <div class="item active">
	                    <ul class="thumbnails">
	                        <li class="col-sm-3">
	    						<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
	                            </div>
	                        </li>
	                        <li class="col-sm-3">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
	                            </div>
	                        </li>
	                        <li class="col-sm-3">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
	                            </div>
	                        </li>
	                        <li class="col-sm-3">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
	                            </div>
	                        </li>
	                    </ul>
	              </div><!-- /Slide1 --> 
	            <div class="item">
	                    <ul class="thumbnails">
	                        <li class="col-sm-3">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
	                            </div>
	                        </li>
	                        <li class="col-sm-3">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
	                            </div>
	                        </li>
	                        <li class="col-sm-3">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
	                            </div>
	                        </li>
	                        <li class="col-sm-3">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
	                            </div>
	                        </li>
	                    </ul>
	              </div><!-- /Slide2 --> 
	            <div class="item">
	                    <ul class="thumbnails">
	                        <li class="col-sm-3">	
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
	                            </div>
	                        </li>
	                        <li class="col-sm-3">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
	                            </div>
	                        </li>
	                        <li class="col-sm-3">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
	                            </div>
	                        </li>
	                        <li class="col-sm-3">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
	                            </div>
	                        </li>
	                    </ul>
	              </div><!-- /Slide3 --> 
	        </div>
	       
		   <nav>
				<ul class="control-box pager">
					<li><a data-slide="prev" href="#myCarousel2" class=""><i class="glyphicon glyphicon-chevron-left"></i></a></li>
					<li><a data-slide="next" href="#myCarousel2" class=""><i class="glyphicon glyphicon-chevron-right"></i></a></li>
				</ul>
			</nav>
		   <!-- /.control-box -->   
	                              
	    </div><!-- /#myCarousel -->
	    
	    <article class="main_middle">
			
		</article>
		
		<nav class="nav_left2">
		
		</nav>
	    
	    <div class="main4_wrap">
	    	<div class="main4_1">
	    		<p>캠페인 둘러보기</p>
				<p>수많은 영화인들의 꿈과 아이디어가 담긴</p>
				<p>다양한 프로젝트들을 만나보세요.</p>
				<input type="button" class="btn btn-warning list_btn" value="자세히 보기">
	    	</div>
	    	<div class="main4_2">
				캠페인 만들기.
			</div>
	    </div>
		
		<nav class="nav_right">
			
		</nav>
	</section>
	
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>