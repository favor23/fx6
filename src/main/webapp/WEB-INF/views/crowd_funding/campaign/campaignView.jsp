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
	footer {
		display: flow-root;
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
	}
	
	.detail_simple {
		font-size: 0.9em;
		color: #6b6b47;
		width: 100%;
		height: 100px;
		margin-top: 10px;
	}
	
	.detail_name {
		font-weight: bold;
		margin-top: 10px;
	}
	
	.progress-box { 
		margin-top: 10px;
		width: 100%;
		background-color: white; 
		border:1px solid transparent; 
		border-radius:4px 4px 0 0; 
		-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05); 
		box-shadow:0 1px 1px rgba(0,0,0,.05);
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
		background-color: lime;
	}
	
	.ben {
		width: 420px;
		height: 950px;
		float: right;
		background-color: red;
	}
	
	body {
	    position: relative; 
	}
	
	#section1 {padding-top:50px;color: #fff; background-color: #1E88E5;}
	#section2 {padding-top:50px;color: #fff; background-color: #673ab7;}
	#section3 {padding-top:50px;color: #fff; background-color: #ff9800;}
	
	.sup,
	.thumbs_up {
		width: 208px;
		height: 50px;
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
				          <span class="icon-bar"></span>                        
				      </button>
				    </div>
				    <div>
				      <div class="collapse navbar-collapse" id="myNavbar">
				        <ul class="nav navbar-nav">
				          <li><a href="#section1">스토리</a></li>
				          <li><a href="#section2">Section 2</a></li>
				          <li><a href="#section3">Section 3</a></li>
				        </ul>
				      </div>
				    </div>
				  </div>
				</nav>    
				
				<div id="section1" class="container-fluid">
					<div class="section1_title" style="font-size: 1.5em; font-weight: bold;">
						캠페인 스토리
					</div>
					<div class="section1_contents">
						${dto.story}
					</div>
				
				</div>
				<div id="section2" class="container-fluid">
				  <h1>Section 2</h1>
				  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
				  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
				</div>
				<div id="section3" class="container-fluid">
				  <h1>Section 3</h1>
				  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
				  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
				</div>
			</div>
			<div class="ben">
				<input type="button" class="btn btn-info sup" value="후원하기">
				<button type="button" class="btn btn-danger thumbs_up">추천하기&nbsp;&nbsp;<span class="badge">${dto.thumbs_up}</span></button>
			</div>
		</article>
	</section>
	
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>