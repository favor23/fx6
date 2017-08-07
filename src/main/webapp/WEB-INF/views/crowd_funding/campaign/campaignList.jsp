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
	.main_top {
		width: 100%;
		height: 250px;
		margin-top: 50px;
		background-color: #0052cc;
		z-index: 1;
		position: relative;
	}
	
	.main_top:after {
		content: "";
		background-image: url("../../img/cf-img/main-top3.jpg");
		background-position: bottom center;
		display: block;
		position: absolute;
		top: 0;
   		left: 0;
   		width: 100%;
	    height: 100%;
	    opacity : 0.2;
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
	
	.art {
		width: 60%;
		margin: 0 auto;
		display: table;
		margin-bottom: 80px;
		height: 1000px;
	}
	
	.ct {
		width: 230px;
		height: 336px;
		float: left;
		margin-top: 80px;
		margin-left: 2.7%;
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
</style>
<script type="text/javascript">
	$(function() {
		var count = 0;
		var curPage = 1;
		
		getList(curPage);
		
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
	});
	
	function getList(curPage) {
		$.ajax({
			url:"getCampaignList",
			type:"POST",
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
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	
	<section id="main_section">
		<article class="main_top">
			<div class="top1">
				캠페인 둘러보기
			</div>
			<hr style="width: 20%; position: absolute; left: 20%;">
			<span style="position: absolute; left: 44%; top: 80px; color: white; font-size: 1.7em;">꿈을 가진 영화인들</span>
			<hr style="width: 20%; position: absolute; left: 60%;">
			<div class="top2">
				수많은 사람들의 꿈이 녹아 들어간 캠페인들을 만나보세요.
			</div>
			<div class="top3">
				<p>당신의 꿈만큼이나 다양한 장르와 개성있는 캠페인들을 모았습니다.</p>
				<p>그들의 아이디어가 맘에 들었다면 후원하셔도 좋습니다.</p>
			</div>
		</article>
		
		<c:import url="../../temp/header_plus_cfList.jsp"></c:import>
		
		<article class="art">
	  
	    </article>
	</section>
	
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>