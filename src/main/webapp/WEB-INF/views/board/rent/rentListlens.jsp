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
			figure.snip1132 {
			  font-family: 'Raleway', Arial, sans-serif;
			  position: relative;
			  float: left;
			  overflow: hidden;
			  margin: 10px 1%;
			  min-width: 220px;
			  max-width: 220px;
			  max-height: 220px;
			  width:200px;
			  background: #000000;
			  color: #ffffff;
			  text-align: center;
			  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
			}
			
			figure.snip1132 * {
			  -webkit-box-sizing: border-box;
			  box-sizing: border-box;
			  -webkit-transition: all 0.45s ease-in-out;
			  transition: all 0.45s ease-in-out;
			}
			
			figure.snip1132 img {
			  max-width: 100%;
			  position: relative;
			  opacity: 1;
			}
			
			/*  figure.snip1132 figcaption {
			  position: absolute;
			  top: 20px;
			  left: 20px;
			  right: 20px; 
			  bottom: 20px;
			  
			} */
			
			/* figure.snip1132 .heading {
			  overflow: hidden;
			  -webkit-transform: translateY(-50%);
			  transform: translateY(-50%);
			} */
			
			/* figure.snip1132 .caption {
			  overflow: hidden;
			  -webkit-transform: translateY(50%);
			  transform: translateY(50%);
			  position: absolute;
			  width: 100%;
			  bottom: 0;
			} */
			
			/*  figure.snip1132 h3,
			figure.snip1132 p {
			  display: table;
			  margin: 0 auto;
			  padding: 0 10px;
			  position: relative;
			  text-align: center;
			  width: auto;
			  text-transform: uppercase;
			  font-weight: 400;
			}  */
			
			figure.snip1132 h3 span,
			figure.snip1132 p span {
			  font-weight: 800;
			}
			
			figure.snip1132 h3:before,
			figure.snip1132 p:before,
			figure.snip1132 h3:after,
			figure.snip1132 p:after {
			  position: absolute;
			  display: block;
			  width: 1000%;
			  height: 1px;
			  content: '';
			  background: white;
			}
			
			figure.snip1132 h3:before,
			figure.snip1132 p:before {
			  left: -1000%;
			}
			
			figure.snip1132 h3:after,
			figure.snip1132 p:after {
			  right: -1000%;
			}
			
			figure.snip1132 h3:before,
			figure.snip1132 h3:after {
			  top: 50%;
			}
			
			figure.snip1132 p {
			  font-size: 0.8em;
			  font-weight: 500;
			}
			
			figure.snip1132 p:before,
			figure.snip1132 p:after {
			  bottom: 50%;
			}
			
			figure.snip1132 a {
			  left: 0;
			  right: 0;
			  top: 0;
			  bottom: 0;
			  position: absolute;
			  z-index: 1;
			}
			
			figure.snip1132:hover img,
			figure.snip1132.hover img {
			  opacity: 0.35;
			  -webkit-transform: scale(1.15);
			  transform: scale(1.15);
			}
	
	
	
	
	/* css fin */
	
	
	.all{
		
		width: 100%;
		height: 1000px;
	
	}
	
	
	.main_section{
		
		width: 80%;
		/* width : 960px; */
		height: 800px;
		margin: 0 auto;
		margin-top : 60px;
		/* background-color: blue; */
		
	
	}
	
	
	.pic-image{
	
		width: 250px;
		height: 250px;
		margin-top: 25px;
		margin-left: 2%;
		float: left;
		border: 1px gray solid;
		
		
		
	
	}
	
	.pic-image:hover{
	
		opacity:0.5;
		filter:alpha(opacity=50); /* For IE8 and earlier */

	
	
	}
	
	

</style>
<c:import url="../../temp/bootStrap.jsp" />
</head>
<body>
   <c:import url="../../temp/header.jsp"/>
   <c:import url="../../temp/header_plus_rent.jsp" />
   
   
   
   <section class="all">
  	<section class="main_section">
  	
  		<c:forEach items="${list}" var="dto">
  			<figure class="snip1132">
  				<img src="<c:url value="${dto.list_img}"/>" class="imgTitle" id="${dto.num}" alt="Pic">
				  <figcaption>
				    <h3>${dto.product_name}</h3>
				    <p>${dto.price}won </p>
				   
				  </figcaption>
				  <a href="rentView?num=${dto.num}"></a>
				</figure>
  		</c:forEach>
  	
  	
  	</section>
   </section>
   
   <c:import url="../../temp/footer.jsp"/>
</body>
</html>