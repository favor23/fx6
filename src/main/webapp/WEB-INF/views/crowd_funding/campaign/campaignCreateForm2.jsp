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
		z-index: 1;
		position: relative;
		background-color: #0052cc;
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
		height: 1010px;
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
		height: 1010px;
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
	
	#counter {
		font-size: 0.9em;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('.simple_story').keyup(function (e){
	        var content = $(this).val();
	        $('#counter').html(content.length + '/240');
	    });
	    
		$('.simple_story').keyup();
		
		$(".btn").click(function() {
			if($(".simple_story").val()!=null&&$(".simple_story").val()!="") {
				if($(".main_video").val()!=null&&$(".main_video").val()!="") {
					if($(".story").val()!=null&&$(".story").val()!="") {
						$("#frm").submit();							
					} else {
						alert("캠페인 스토리를 입력해주세요.");
					}
				} else {
					alert("메인 동영상 URL을 입력해주세요.")
				}
			} else {
				alert("캠페인 요약을 입력해주세요.");
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
				<img class="top1_img" alt="" src="<c:url value="/img/cf-img/top1-1.png" />">
				<img class="top2_img" alt="" src="<c:url value="/img/cf-img/top2-2.png" />">
				<img class="top3_img" alt="" src="<c:url value="/img/cf-img/top3-1.png" />">
				<img class="top4_img" alt="" src="<c:url value="/img/cf-img/top4-1.png" />"> 	
			</div>
		</article>
		<article class="main_art">
			<div class="main_name">
				스토리
			</div>
			<div class="main_con">
				<form action="campaignCreateForm2" id="frm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="campaign_title" value="${dto.campaign_title}">
					<input type="hidden" name="goal_price" value="${dto.goal_price}">
					<input type="hidden" name="period" value="${dto.period}">
					<input type="hidden" name="campaign_end" value="${dto.campaign_end}">
					<input type="hidden" name="campaign_img" value="${dto.campaign_img}">
					<span style="color: red;">*</span><span style="font-size: 0.8em;">은 필수 입력 항목입니다.</span>
					<table class="table">
						<tr>
							<td><span style="color: red;">*</span>캠페인 요약</td>
							<td>
								<textarea rows="5" cols="54" maxlength="240" class="simple_story" name="simple_story" style="border-radius: 4px; border: 1px solid #b8b894; resize: none;"></textarea>
								<span id="counter">###</span>
								<p>입력하신 내용은 캠페인 카드에 보여집니다.</p>
							</td>
						</tr>
						<tr>
							<td><span style="color: red;">*</span>메인 동영상</td>
							<td>
								<input type="text" class="main_video" name="main_video" placeholder="YouTube URL을 입력해주세요." style="width: 400px; height: 40px; border-radius: 4px; border: 1px solid #b8b894;">
								<p>캠페인 스토리 최상단에 노출될 동영상이며, YouTube에 동영상</p>
								<p>등록 후 해당 동영상의 URL을 기재하여 주시기 바랍니다.</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span style="color: red;">*</span>캠페인 스토리
								<textarea rows="10" cols="113" class="story" name="story" style="margin-top: 15px; resize: none;">
후원자들은 수많은 아이디어 중 자신이 믿을만하고 뜨겁게 감동을 줄 수 있는 아이디어에
후원합니다. 이를 위해 캠페인 스토리를 제대로 만드는 것은 굉장히 중요합니다.

Tip!

- 소제목과 사진 그리고 자세한 설명을 단락별로 나누어 만들어주세요.
- 자신과 팀이 누구인지를 소개해주세요.
- 캠페인과 이 캠페인이 왜 당신에게 중요한지 간단하게 기술해주세요.
- 지금 이 캠페인의 성공을 위해 얼마나 많은 사람이 도와주고 있는지 알려주세요.
- 당신이 무엇을 위해 이 돈이 필요하며, 후원 시 어떤 혜택을 받을 수 있는지 적어주세요.
- 후원금이 어떻게 쓰일지 세부적으로 적어주세요.
- 만약 목표치만큼 후원금이 모이지 않았을 때 모인 금액은 어떻게 되는지 설명해주세요.
- 후원을 통해 후원자가 어떤 특별한 경험을 할 수 있는지 이야기해주세요.
- 캠페인과 그 이후 행동으로 옮겼을 때의 타임라인을 작성해주세요.
- 캠페인의 리스크와 장애요인을 반드시 기입해주세요. 
   미리 후원자가 발생할 수 있는 문제들에 대해 질문하기 전에, 
   솔직하게 설명하고 어떻게 이를 극복할지에 대하여 설명하신다면 
   후원자와 더 큰 신뢰를 만들어가실 수 있습니다.
								</textarea>	
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