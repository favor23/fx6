<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

/* Demo purposes only */
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);



</script>
<style type="text/css">
	
	/* css */
	
				@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);
				figure.snip1436 {
				  font-family: 'Raleway', Arial, sans-serif;
				  position: relative;
				  float: left;
				  overflow: hidden;
				  margin: 10px 1%;
				  min-width: 300px;
				  max-width: 300px;
				  max-height: 300px;
				  width: 100%;
				  color: black;
				  text-align: left;
				  background-color: #fff; /* 여기가 배경 바뀌는 부분 */ 
				  font-size: 16px;
				}
				figure.snip1436 * {
				  -webkit-box-sizing: border-box;
				  box-sizing: border-box;
				  -webkit-transition: all 0.35s ease;
				  transition: all 0.35s ease;
				}
				figure.snip1436 img {
				  max-width: 100%;
				  -webkit-transition-delay: 0.2s;
				  transition-delay: 0.2s;
				  backface-visibility: hidden;
				}
				figure.snip1436 figcaption {
				  position: absolute;
				  top: 50%;
				  left: 0;
				  width: 100%;
				  -webkit-transform: scale(0.5) translate(0%, -50%);
				  transform: scale(0.5) translate(0%, -50%);
				  -webkit-transform-origin: 50% 0%;
				  -ms-transform-origin: 50% 0%;
				  transform-origin: 50% 0%;
				  z-index: 1;
				  opacity: 0;
				  padding: 0 30px;
				}
				figure.snip1436 h3,
				figure.snip1436 p {
				  line-height: 1.5em;
				}
				figure.snip1436 h3 {
				  margin: 0;
				  font-weight: 800;
				  text-transform: uppercase;
				}
				figure.snip1436 p {
				  font-size: 0.8em;
				  font-weight: 500;
				  margin: 0 0 15px;
				}
				figure.snip1436 .read-more {
				  border: 2px solid black;
				  padding: 0.5em 1em;
				  font-size: 0.8em;
				  text-decoration: none;
				  color: black;
				  display: inline-block;
				}
				figure.snip1436 .read-more:hover {
				  background-color: black;
				  color: white;
				}
				figure.snip1436:hover img,
				figure.snip1436.hover img {
				  -webkit-animation: snip1436 0.45s linear forwards;
				  animation: snip1436 0.45s linear forwards;
				  -webkit-animation-iteration-count: 1;
				  animation-iteration-count: 1;
				}
				figure.snip1436:hover figcaption,
				figure.snip1436.hover figcaption {
				  -webkit-transform: scale(1) translate(0, -50%);
				  transform: scale(1) translate(0, -50%);
				  opacity: 1;
				  -webkit-transition-delay: 0.35s;
				  transition-delay: 0.35s;
				}
				@-webkit-keyframes snip1436 {
				  50% {
				    -webkit-transform: scale(0.8) translateX(0%);
				    transform: scale(0.8) translateX(0%);
				    opacity: 0.5;
				  }
				  100% {
				    -webkit-transform: scale(0.8) translateX(-150%);
				    transform: scale(0.8) translateX(-150%);
				    opacity: 0.5;
				  }
				}
				@keyframes snip1436 {
				  50% {
				    -webkit-transform: scale(0.8) translateX(0%);
				    transform: scale(0.8) translateX(0%);
				    opacity: 0.5;
				  }
				  100% {
				    -webkit-transform: scale(0.8) translateX(-150%);
				    transform: scale(0.8) translateX(-150%);
				    opacity: 0.5;
				  }
				}
				/* Demo purposes only */
				body {
				  background-color: #212121;
				}
					
	
	
	/* css fin */
	
	
	.all{
		
		width: 100%;
		height: 1000px;
	
	}
	
	
	.main_section{
		
		width: 70%;
		/* width : 960px; */
		height: 800px;
		margin: 0 auto;
		margin-top : 60px;
		/* background-color: blue; */
		
	
	}
	
	
	.pic-image{
	
		width: 300px;
		height: 300px;
		/* margin-top: 25px; */
		margin-top: 25px;
		margin-left: 2%;
		float: left;
		border: 1px gray solid;
		
		
		
	
	}
	
	.pic-image:hover{
	
		opacity:0.5;
		filter:alpha(opacity=50); /* For IE8 and earlier */

	
	
	}
	
	#tap{
	width: 100%;
	height: 50px;
}
	

</style>
<c:import url="../../temp/bootStrap.jsp" />
</head>
<body>
   <c:import url="../../temp/header.jsp"/>
   <div id="tap"></div>
   <c:import url="../../temp/header_plus_rent.jsp" />
   
   
   
   
   
   <section class="all">
  	<section class="main_section">
  	
  	
  	
  	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 95%; margin: 0 auto;'">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner" style="margin-bottom: 40px;">
	
	      <div class="item active">
	        <img src="<c:url value="/img/rent-img/rentmain7.jpg" />" alt="Los Angeles" style="width:100%; height: 300px; ">
	        <div class="carousel-caption">
	         
	        </div>
	      </div>
	
	      <div class="item">
	        <img src="<c:url value="/img/rent-img/rentmain2.jpg" />" alt="Chicago" style="width:100%; height: 300px;">
	        <div class="carousel-caption">
	          
	        </div>
	      </div>
	    
	      <div class="item">
	        <img src="<c:url value="/img/rent-img/rentmain5.jpg" />" alt="New York" style="width:100%; height: 300px;">
	        <div class="carousel-caption">
	          
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
	  
	  <hr>
  	
  	
  	
  	
  	
  		<c:forEach items="${list}" var="dto">
  		<c:if test="${dto.category eq 'drone'}">
  			<figure class="snip1436">
  				<img src="<c:url value="${dto.list_img}"/>" class="imgTitle" id="${dto.num}" alt="Pic" >
  				<figcaption>
    			<h3 style="font-size: 14px;">${dto.product_name}</h3>
    			<p>${dto.price} won</p><a href="rentView?num=${dto.num}" class="read-more">Read More</a>
  </figcaption>
</figure>
				</c:if>
  		</c:forEach>
  	
  	
  	</section>
   </section>
   
   <c:import url="../../temp/footer.jsp"/>
</body>
</html>