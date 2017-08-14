<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<c:url value="/css/header.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/footer.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/reset.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/login.css" />">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
	@import url('//cdn.jsdelivr.net/font-iropke-batang/1.2/font-iropke-batang.css');
	
	header {
		font-family: 'Noto Sans KR';
	}


	body {
		margin: 0%;
		font-family: 'Noto Sans KR';
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
	
	
	
	
	
	
	.main_top {
		width: 100%;
		height: 250px;
		margin-top: 50px;
		background-color: #0052cc;
		z-index: 1;
		position: relative;
		font-family: 'Iropke Batang', serif;
	}
	
	.main_top:after {
		content: "";
		background-image: url("../../img/cf-img/main-top.jpg");
		background-position: center center;
		display: block;
		position: absolute;
		top: 0;
   		left: 0;
   		width: 100%;
	    height: 100%;
	    opacity : 0.4;
	    z-index: -1;
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
	
	.main_section{
	
		width: 80%;
		height: 600px;
		/* background-color: yellow; */
		margin: 0 auto;
		margin-top: 30px;
	
	}
	
	
	
	
	
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	
	body{
	
	font-family: 'Noto Sans KR';
	}
	
	#tap {
	width: 100%;
	height: 50px;
	}
	#main_session_default {
	height: 400px;
	width: 1000px;
	margin: 0 auto;
	}	

	.note_main{
	
	width : 800px;
	height: auto;
	margin: 0 auto;
	padding: 0 0 100px 0;
	/* background-color: yellow;	 */
	}
	
	.contentsView{
		
		width : 400px;
    	overflow: hidden;
    	text-overflow: ellipsis;
	    white-space: nowrap;

	}
	
	.table{
		
		border-top: 2px solid #503396;
		border-bottom: 2px solid #e1e1e1;
		font-family: 'NanumGothic', '나눔고딕', '맑은 고딕', 'Malgun Gothic', '돋움', dotum, 'Apple SD Gothic Neo', sans-serif;
		font-size: 12px;
	
	}
	
	th{
		
		background-color: #f2f2f2;
		color: #666;
		font-size: 13px;
		font-weight: 700;
	
	}
	
	.button_lab{
		
		width: 100%;
		height: 60px;
		/* background-color: yellow; */
	}
	
	
	.send_btn{
		
		border: 1px solid #351F66 !important;
		background-color: #503396 !important;
		color: white;
		float: right;
		margin-right: 10px;
	
	}
	
	
	.del_btn{
	
		border: 1px solid #351F66 !important;
		background-color: #503396 !important;
		color: white;
		float: right;
		margin-right: 10px;
	}
	
	
	.check_send{
	
	border: 1px solid #351F66 !important;
		background-color: #503396 !important;
		color: white;
		float: right;
		margin-right: 10px;
	
	
	}







			.pagination {
			    display: inline-block;
			    color: #503396;
			    float: left;
			   
			}
			
			.pagination a {
			    color: #503396;
			    float: left;
			    padding: 8px 16px;
			    text-decoration: none;
			    transition: background-color .3s;
			    border: 1px solid #ddd;
			    margin: 0 4px;
			}
			
			.pagination a.active {
			    background-color: #503396;
			    color: white;
			    border: 1px solid #351F66;
			}
			
			.pagination a:hover:not(.active) {background-color: #ccc;}




		#wri_B{
		
			width: 70px;
			height: 50px;
			border: 1px solid #351F66 !important;
			background-color: #503396 ;
			color: white;
		
		}

		#wri_B:HOVER {
	
		background: white;
		color: #503396;
			
	}
	
	
	.story_Bt{
	
		width: 40px;
		height: 20px;
		background-color: #503396;
		color: white;
		border: 1px solid #351F66 !important;S
	}
	
	
	
	
</style>
</head>
<body>
	<c:import url="../../temp/header.jsp"/>
	
	<section id="main_section">
	
		<article class="main_top">
			<div class="top1">
				시나리오
			</div>
			<hr style="width: 20%; position: absolute; left: 20%;">
			<span style="position: absolute; left: 45%; top: 80px; color: white; font-size: 1.7em;">꿈을 가진 영화인들</span>
			<hr style="width: 20%; position: absolute; left: 60%;">
			<div class="top2">
				시나리오 업로드를 통해 당신의 작품을 현실화 하세요!
			</div>
			<div class="top3">
				<p>꿈과 아이디어를 가지고 본인의 영화를 실현시키고자 행동하는 사람들을 뜻합니다.</p>
				<p>당신의 소중한 꿈과 톡톡튀는 아이디어를 영화로 만들어 드립니다.</p>
			</div>
		</article>
		
	  <article class="art2">
	  	<div class="sub_wrap">
	  		<div class="sub1">
	  			<div class="sub1_con">
		  			<ul class="sub1_ul">
		  				
		  			</ul>
		  		</div>
	  		</div>
	  		<div class="sub2">
	  			<div class="sub2_con">
	  				
	  				<ul class="sub2_ul">
	  					<!-- <li id="delli">
	  						<button id="del_B">
	  							
	  						</button>
	  					</li>
	  					<li id="modli">
	  						<button id="mod_B"></button>
	  					</li> -->
	  					<li>
	  						<c:if test="${member.id ne null}"></c:if>
	  						<button id="wri_B" > 글작성</button>
	  						<!-- <a href="matchingWriteForm?path=Write">추가</a> -->
	  					</li>
	  				</ul>
	  				
	  			</div>
	  		</div>
	  	</div>
	  </article>



		<section class="main_section">
		
		
		
		
		<table class="table">
			<tr>
				<th>작가</th>
				<th>제목</th>
				<th>장르</th>
				<th>형식</th>
				<th>작성일</th>
				<th>스토리</th>
			</tr>
			
			<c:forEach items="${list}" var="dto">
			
			<tr >
				<td>${dto.writer}</td>
				<td><a href="matchingDetail?matching_num=${dto.matching_num}">${dto.title}</a></td>
				<td>${dto.genre}노멀</td>
				<td>${dto.form}</td>
				<td>${dto.reg_date}</td>
				<td><button  class="btn btn-info btn-lg story_Bt" data-toggle="modal" data-target="#${dto.matching_num}" value="스토리"> </button></td>
			</tr>
			
			
			
			
			<div id="${dto.matching_num}" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" style="color:black; background-color: white;">
      <div class="modal-header" style="border-bottom: #503396 solid 2px; background-color: #ddd;">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">STORY</h4>
      </div>
      <div class="modal-body">
        <p>${dto.story}</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
			
			
			
			
			
				
			</c:forEach>
				
		</table>
		
		
		
		<div style="width: 10%; height: 60px; margin: 0 auto;">
		<ul class="pagination pagination-sm" style="margin-top: -1px; mar">
            
                  <li>
                  <c:if test="${listInfo.curBlock>1}">
                     <a href="matchingList?curPage=${listInfo.startNum-1}&search=${listInfo.search}&find=${listInfo.find}">이전</a>
                  </c:if>
                  </li>
                  
                  <li>
                  <c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}"
                     var="i">   
                     <a href="matchingList?curPage=${i}&search=${listInfo.search}&find=${listInfo.find}" class="active">${i}</a>
                  </c:forEach>
                  </li>
                  
                  <li>
                  <c:if test="${listInfo.curBlock < listInfo.totalBlock}">
                     <a href="matchingList?curPage=${listInfo.lastNum+1}&search=${listInfo.search}&find=${listInfo.find}">다음]</a>
                  </c:if>
                  </li>
            
            </ul>
		</div>
		
		
		
		
	
		
		
		
		
		
		</section>
	
	   
	  
	</section>
	
	<script type="text/javascript">
	
		$("#wri_B").click(function() {
			
			location.href="matchingWriteForm?path=Write";
		});
	
		
		
		$(document).ready(function(){
		    $("#story_Bt").click(function(){
		        $("p").toggle();
		        
		       
		    });
		});
		
	
	</script>
	<c:import url="../../temp/footer.jsp"/>
</body>
</html>