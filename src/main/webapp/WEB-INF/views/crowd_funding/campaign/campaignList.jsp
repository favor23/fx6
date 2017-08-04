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
		height: 500px;
		margin: 0 auto;
		display: table;
		margin-bottom: 80px;
		background-color: lime;
	}
</style>
<script type="text/javascript">
	$(function() {
		var count = 0;
		var curPage = 0;
		
		//스크롤 이벤트 발생 시
		$(document).scroll(function() {
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentHeight = $(document).height();
			
			if (documentHeight <= scrollHeight + 1) {
				//if(count<'${totalCount}'||count!='${totalCount}') {
					curPage++;
					
					getList(curPage);
					
					count = count + 10;
				//}
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