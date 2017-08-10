<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		font-family: 'Noto Sans KR';
	}

	footer {
		display: flow-root;
		float: right;
	}
	
	.main_wrap {
		width: 1020px;
		margin: 0 auto;
		margin-top: 100px;
	}
	
	.youtube {
		width: 600px;
		height: 350px;
		float: left;
	}
	
	.detail {
		width: 420px;
		height: 350px;
		float: right;
		padding: 20px;
		padding-top: 0px;
		padding-right: 0px;
	}
	
	.detail_title {
		font-size: 1.6em;
		width: 100%;
		height: 70px;
		font-family: 'Noto Sans KR';
		font-weight: 700;
	}
	
	.detail_simple {
		font-size: 0.9em;
		color: #6b6b47;
		width: 100%;
		height: 100px;
		margin-top: 10px;
		font-family: 'Jeju Gothic', sans-serif;
	}
	
	.detail_name {
		font-weight: bold;
		margin-top: 10px;
	}
	
	.detail_bot {
		font-family: 'Hanna', sans-serif;
	}
	
	.detail_bot2 {
		font-family: 'Hanna', sans-serif;
	}
	
	.progress-box { 
		margin-top: 10px;
		width: 100%;
		background-color: white; 
		border:1px solid transparent; 
		border-radius:4px 4px 0 0; 
		-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05); 
		box-shadow:0 1px 1px rgba(0,0,0,.05);
		font-family: 'Hanna', sans-serif;
	} 
	
	.progress-box-default {
		border-color: white; 
	} 
	
	.progress-heading {
		border-bottom:1px solid transparent; 
		background-color: white;
	} 
	
	.progress-small {
		overflow:hidden; 
		height:10px;
		margin-bottom:0px; 
		background-color:#f5f5f5; 
		border-radius:0px; 
		-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.1); 
		box-shadow:inset 0 1px 2px rgba(0,0,0,.1); 
	} 
	
	.progress-bar-small {
		float:left; 
		width:0;
		height:100%; 
		font-size:6px;
		line-height:7px; 
		color:#fff; 
		text-align:center; 
		background-color:#428bca; 
		-webkit-box-shadow:inset 0 -1px 0 rgba(0,0,0,.15); 
		box-shadow:inset 0 -1px 0 rgba(0,0,0,.15); 
		-webkit-transition:width .6s ease; 
		transition:width .6s ease; 
	}
	
	.progress-bar-s-danger {
		background-color:#d9534f;
	}
	
	.main {
		width: 600px;
		float: left;
	}
	
	.ben {
		width: 420px;
		float: right;
		margin-bottom: 100px;
	}
	
	body {
	    position: relative; 
	}
	
	#section1 {padding-top:30px; padding-left: 0px;}
	#section2 {padding-top:30px; padding-left: 0px;}
	#section3 {padding-top:30px; padding-left: 0px;}
	
	.sup,
	.thumbs_up {
		width: 195px;
		height: 50px;
		float: right;
	}
	
	.sup {
		margin-right: 10px;
		background-color: #1a75ff;
	}
	
	.section1_contents,
	.section2_contents {
		padding-top: 30px;
	}
	
	.section1_contents {
		line-height: 40px;
	}
	
	.section2_contents {
		color: #8a8a5c;
		font-size: 1.5em;
	}
	
	.ben_title {
		width: 100%;
		height: 50px;
		float: right;
		padding-left: 20px;
		margin-top: 50px;
		margin-bottom: 30px;
	}
	
	.title {
		width: 100%;
		height: 50px;
		line-height: 50px;
		color: #8a8a5c;
		font-size: 1.1em;
		border-bottom: 1px solid #e0e0d1;
		font-family: 'Hanna', sans-serif;
	}
	
	.ben_con {
		width: 100%;
		float: right;
		padding-left: 20px;
	}
	
	.ben_wrap {
		width: 100%;
		height: 100%;
		float: right;
	}
	
	.ben_list {
		width: 100%;
		float: right;
		margin-bottom: 20px;
		padding: 15px;
		border: 1px solid #e0e0d1;
		font-family: 'Hanna', sans-serif;
	}
	
	.ben_list:hover {
		border: 1px solid #1a75ff;
		cursor: pointer;
	}
	
	.main {
		margin-bottom: 100px;
	}
	
	.list_price {
		width: 100%;
		height: 30px;
		line-height: 30px;
		font-size: 1.7em;
		font-weight: bold;
	}
	
	.list_title {
		width: 100%;
		margin-top: 10px;
	}
	
	.list_contents {
		width: 100%;
		color: #8a8a5c;
		font-size: 0.8em;
		margin-top: 10px;
	}
	
	.list_sup {
		width: 40%;
		color: #8a8a5c;
		font-size: 0.8em;
		margin-top: 10px;
		margin: 0 auto;
		margin-top: 20px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$(".sup").click(function() {
			location.href = "campaignSupport?campaign_num=" + ${dto.campaign_num};
		});
		
		$(".thumbs_up").click(function() {
			var campaign_num = ${dto.campaign_num};
			
			thumbs_up(campaign_num);
			badge(campaign_num);
		});
		
		$(".ben_list").click(function() {
			location.href = "campaignSupport?campaign_num=" + ${dto.campaign_num};
		});
	});
	
	function thumbs_up(campaign_num) {
		$.ajax({
			url:"campaignUp",
			type:"POST",
			data:{
				campaign_num:campaign_num
			},
			success:function(data) {
				
			}
		});
	}
	
	function badge(campaign_num) {
		$.ajax({
			url:"campaignBadge/" + campaign_num,
			type:"GET",
			success:function(data) {
				$(".badge").html(data.thumbs_up);
			}
		});
	}
</script>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
	<c:import url="../../temp/header.jsp"></c:import>
	
	<section id="main_section">
		<article class="main_wrap">
			<div class="youtube">
				<iframe width="600" height="350" src="${dto.main_video}" frameborder="0" allowfullscreen></iframe>
			</div>
			<div class="detail">
				<div class="detail_title">
					${dto.campaign_title}
				</div>
				<div class="detail_simple">
					${dto.simple_story}
				</div>
				<div class="detail_name">
					<span >${dto.id}</span>&nbsp;<span>(${dto.register_name})</span>
				</div>
				<div class="progress-box progress-box-default">
				<!-- Default panel contents -->
					<div class="progress-heading">
						<c:if test="${dto.until_end<0}">
							<span style="color: #d9534f; font-size: 0.9em;">마감</span>
						</c:if>
						<c:if test="${dto.until_end>=0}">
							<span style="font-size: 0.9em;">앞으로 <span style="font-weight: bold; font-size: 1.2em;">${dto.until_end}</span>일</span>						
						</c:if>
						<span style="font-size: 0.9em; float: right;">${dto.per}%</span>
					</div>
					<div class="progress-small">
						<div role="progressbar" aria-valuenow="10" aria-valuemin="0" class="progress-bar-small progress-bar-s-danger" style="WIDTH: ${dto.per}%" aria-valuemax="100">
							<span class="sr-only">60% Complete</span>
						</div><!-- Complete -->
					</div>
				</div>
				<div class="detail_bot">
					<span style="font-size: 2.0em; font-weight: bold;">
						<fmt:formatNumber value="${dto.support_price}" pattern="#,###"></fmt:formatNumber>
					</span>원
					<span style="color: #999966;">
						/&nbsp;<fmt:formatNumber value="${dto.goal_price}" pattern="#,###"></fmt:formatNumber>원
					</span>
				</div>
				<div class="detail_bot2">
					<span style="color: #999966; float: right;">종료 예정일&nbsp;<span style="color: #1a75ff; font-size: 1.3em;">${dto.campaign_end}</span></span>
				</div>
			</div>
			<div class="main">
				<nav class="navbar navbar-inverse">
				  <div class="container-fluid">
				    <div class="navbar-header">
				      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				          <span class="icon-bar"></span>
				          <span class="icon-bar"></span>                    
				      </button>
				    </div>
				    <div>
				      <div class="collapse navbar-collapse" id="myNavbar">
				        <ul class="nav navbar-nav">
				          <li><a href="#section1">스토리</a></li>
				          <li><a href="#section2">후원자</a></li>
				        </ul>
				      </div>
				    </div>
				  </div>
				</nav>    
				
				<div id="section1" class="container-fluid">
					<div class="title">
						캠페인 스토리
					</div>
					<div class="section1_contents">
						${dto.story}
					</div>
				</div>
				<div id="section2" class="container-fluid">
				    <div class="title">
						후원자
					</div>
				    <div class="section2_contents">
						현재 후원한 사람이 없습니다!
					</div>
				</div>
			</div>
			<div class="ben">
				<button type="button" class="btn btn-danger thumbs_up">추천하기&nbsp;&nbsp;<span class="badge">${dto.thumbs_up}</span></button>
				<input type="button" class="btn btn-info sup" value="후원하기">
				<div class="ben_title">
					<div class="title">
						캠페인 혜택
					</div>
				</div>
				<div class="ben_con">
					<div class="ben_wrap">
						<c:forEach items="${list}" var="benList">
							<div class="ben_list">
								<div class="list_price">
									<fmt:formatNumber value="${benList.benefit_price}" pattern="#,###"></fmt:formatNumber><span style="font-size: 0.6em; font-weight: normal; color: #8a8a5c;">&nbsp;원을 후원 해주시는 분들께는</span>							
								</div>
								<div class="list_title">
									${benList.benefit_title}
								</div>
								<div class="list_contents">
									${benList.benefit_contents}
								</div>
								<div class="list_sup">
									<span style="display: inline-block; width: 40px; height: 20px; background-color: #ffa31a; color: white; border-radius: 3px; font-size: 1.4em; text-align: center;">${benList.benefit_hit}</span>&nbsp;명 후원하였습니다.
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</article>
	</section>
	
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>