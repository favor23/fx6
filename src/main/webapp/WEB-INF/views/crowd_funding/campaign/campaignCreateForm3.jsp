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
	}
	
	.nav_left,
	.nav_right {
		width: 20%;
		height: 930px;
		float: left;
		background-color: gray;
	}
	
	.nav_left {
		margin-top: 250px;
	}
	
	.nav_right {
		float: right;
	}
	
	.main_art {
		width: 60%;
		height: 930px;
		float: left;
		background-color: lime;
	}
	
	footer {
		display: inline-block;
	}
	
	.top1 {
		width: 80%;
		height: 30%;
		text-align: center;
		line-height: 100px;
		font-size: 3.0em;
		color: white;
		font-weight: bold;
	}
	
	.top2_wrap {
		width: 60%;
		height: 40%;
		margin-top: 50px;
		margin-left: 20%;
	}
	
	.top2_wrap img {
		cursor: pointer;
		opacity: 0.8;
		margin-right: 40px;
	}
	
	.top2_wrap img:first-child {
		margin-left: 18%;
	}
	
	.top2_wrap img:hover {
		opacity: 1;
	}
</style>
<script type="text/javascript">
	$(function() {
		$(".top1_img").click(function() {
			location.href = "campaignCreateForm";
		});
		
		$(".top2_img").click(function() {
			location.href = "campaignCreateForm2";
		});
		
		$(".top3_img").click(function() {
			location.href = "campaignCreateForm3";
		});
		
		$(".top4_img").click(function() {
			location.href = "campaignCreateForm4";
		});
	});
</script>
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	
	<section id="main_section">
		<nav class="nav_left">
			
		</nav>
		
		<article class="main_top">
			<div class="top1">
				캠페인 시작하기
			</div>
			<hr style="width: 15%; position: absolute; left: 20%;">
			<span style="position: absolute; left: 36%; top: 133px; color: white; font-size: 1.4em;">우리와 함께 아이디어와 목표, 꿈을 나누시기 바랍니다.</span>
			<hr style="width: 15%; position: absolute; left: 65%;">
			<div class="top2_wrap">
				<img class="top1_img" alt="" src="<c:url value="/img/cf-img/top1-1.png" />">
				<img class="top2_img" alt="" src="<c:url value="/img/cf-img/top2-1.png" />">
				<img class="top3_img" alt="" src="<c:url value="/img/cf-img/top3-2.png" />">
				<img class="top4_img" alt="" src="<c:url value="/img/cf-img/top4-1.png" />"> 	
			</div>
		</article>
		<article class="main_art">
		
		</article>
		
		<nav class="nav_right">
			
		</nav>
	</section>
	
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>