<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../temp/bootStrap.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="<c:url value="/datepicker/datepicker3.css" />" />
<script type="text/javascript" src="<c:url value="/datepicker/bootstrap-datepicker.js" />"></script>
<script type="text/javascript" src="<c:url value="/datepicker/bootstrap-datepicker.kr.js" />"></script>
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
		background-image: url("../../img/cf-img/main-top2.jpg");
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
	
	.nav_left,
	.nav_right {
		width: 20%;
		height: 850px;
		float: left;
		background-color: #f5f5f0;
	}
	
	.nav_left {
		margin-top: 250px;
	}
	
	.nav_right {
		float: right;
	}
	
	.main_art {
		width: 60%;
		height: 850px;
		float: left;
		background-color: #f5f5f0;
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
		margin-top: 60px;
		margin-left: 24.5%;
	}
	
	.top2_wrap img {
		cursor: pointer;
		opacity: 0.8;
		margin-right: 10px;
	}
	
	.top2_wrap img:first-child {
		margin-left: 18%;
	}
	
	.top2_wrap img:hover {
		opacity: 1;
	}
	
	.main_name {
		font-size: 1.5em;
		text-align: center;
		margin-top: 50px;
	}
	
	.main_con {
		width: 90%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 20px;
		display: block;
		background-color: white;
		box-shadow: 1px 1px 5px #adad85;
		padding: 100px;
	}
	
	.table {
		width: 100%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 20px;
		display: block;
	}
	
	.datepicker {
		width: 220px;
	}
	
	tr td:first-child {
		width: 240px;
	}
	
	.main_btns input {
		width: 150px; 
		height: 40px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 50px;
		display: block;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('.input-group.date').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
		
		$(".period").keyup(function() {
			var period = $(this).val() * (1000*60*60*24);
			var today = new Date();
			var end = today.getTime() + period;
			var endDate = new Date(end);
			var month = endDate.getMonth() + 1;
			
			$(".form-control").val(endDate.getFullYear() + "-" + month + "-" + endDate.getDate());
		});
		
		$(".btn").click(function() {
			if($(".campaign_title").val()!=null&&$(".campaign_title").val()!="") {
				if($(".goal_price").val()!=null&&$(".goal_price").val()!="") {
					if($(".goal_price").val()>100000||$(".goal_price").val()==100000) {
						if($(".period").val()!=null&&$(".period").val()!="") {
							if($(".period").val()==1||$(".period").val()==60||$(".period").val()>1&&$(".period").val()<60) {
								$("#frm").submit();							
							} else {
								alert("캠페인 기간은 최소 1일 이상, 최대 60일 이하로 입력해주세요.")
							}
						} else {
							alert("캠페인 기간을 입력해주세요.");
						}
					} else {
						alert("캠페인 목표 금액은 10만원 이상으로 입력해주세요.")
					}
				} else {
					alert("캠페인 목표 금액을 입력해주세요.");
				}
			} else {
				alert("캠페인 제목을 입력해주세요.");
			}
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
			<span style="position: absolute; left: 38.5%; top: 83px; color: white; font-size: 1.4em;">우리와 함께 아이디어와 목표, 꿈을 나누시기 바랍니다.</span>
			<hr style="width: 15%; position: absolute; left: 65%;">
			<div class="top2_wrap">
				<img class="top1_img" alt="" src="<c:url value="/img/cf-img/top1-2.png" />">
				<img class="top2_img" alt="" src="<c:url value="/img/cf-img/top2-1.png" />">
				<img class="top3_img" alt="" src="<c:url value="/img/cf-img/top3-1.png" />">
				<img class="top4_img" alt="" src="<c:url value="/img/cf-img/top4-1.png" />"> 	
			</div>
		</article>
		<article class="main_art">
			<div class="main_name">
				기본정보
			</div>
			<div class="main_con">
				<form action="campaignCreateForm" id="frm" method="post" enctype="multipart/form-data">
					<span style="color: red;">*</span><span style="font-size: 0.8em;">은 필수 입력 항목입니다.</span>
					<table class="table">
						<tr>
							<td><span style="color: red;">*</span>캠페인 제목</td>
							<td>
								<input type="text" class="campaign_title" name="campaign_title" placeholder="캠페인 제목을 입력해주세요." style="width: 400px; height: 40px; border-radius: 4px; border: 1px solid #b8b894;">
							</td>
						</tr>
						<tr>
							<td><span style="color: red;">*</span>캠페인 목표 금액</td>
							<td>
								<input type="number" class="goal_price" name="goal_price" min="100000" placeholder="캠페인 목표 금액을 입력해주세요." style="width: 400px; height: 40px; border-radius: 4px; border: 1px solid #b8b894; margin-right: 10px;">원
								<p>최소 캠페인 목표 금액은 10만원이며, 최대 금액은 제한이 없습니다.</p>
							</td>
						</tr>
						<tr>
							<td><span style="color: red;">*</span>캠페인 기간</td>
							<td>
						        <input type="number" class="period" name="period" min="1" max="60" placeholder="캠페인 기간을 입력해주세요." style="width: 400px; height: 40px; border-radius: 4px; border: 1px solid #b8b894; margin-right: 10px; margin-bottom: 15px;">일
						        <div class="input-group date">
						            <input type="text" class="form-control" placeholder="캠페인 기간에 따른 종료 예정일" style="width: 400px; border: 1px solid #b8b894" name="campaign_end" readonly="readonly">
						            <span class="input-group-addon">
						            	<i class="glyphicon glyphicon-calendar"></i>
						            </span>
						        </div>
						        <p>최소 1일 이상, 최대 60일 이하의 범위에서 입력하시기 바랍니다.</p>
						        <p>종료 예정일은 캠페인 승인 날짜에 따라 변경될 수 있습니다.</p>
							</td>
						</tr>
						<tr>
							<td>캠페인 이미지</td>
							<td>
								<input type="file" name="campaign_img">
							</td>
						</tr>
					</table>
					<div class="main_btns">
						<input type="button" class="btn btn-warning" value="다음 단계로">
					</div>
				</form>
			</div>
		</article>
		
		<nav class="nav_right">
			
		</nav>
	</section>
	
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>