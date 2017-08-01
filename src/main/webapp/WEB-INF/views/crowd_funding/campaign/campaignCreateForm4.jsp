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
		height: 930px;
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
	
	.tab tr td:first-child {
		width: 100px;
	}
	
	.tab tr td:last-child {
		width: 320px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$(".top1_img").click(function() {
			if(confirm("이동하실 경우, 현재 입력중인 정보들이 사라집니다. 이동하시겠습니까?")) {
				location.href = "campaignCreateForm";				
			}
		});
		
		$(".top2_img").click(function() {
			if(confirm("이동하실 경우, 현재 입력중인 정보들이 사라집니다. 이동하시겠습니까?")) {
				location.href = "campaignCreateForm2";				
			}
		});
		
		$(".top3_img").click(function() {
			if(confirm("이동하실 경우, 현재 입력중인 정보들이 사라집니다. 이동하시겠습니까?")) {
				location.href = "campaignCreateForm3";				
			}
		});
		
		$(".approve").click(function() {
			$("#frm").submit();
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
				<img class="top3_img" alt="" src="<c:url value="/img/cf-img/top3-1.png" />">
				<img class="top4_img" alt="" src="<c:url value="/img/cf-img/top4-2.png" />"> 	
			</div>
		</article>
		<article class="main_art">
			<div class="main_name">
				등록자정보
			</div>
			<div class="main_con">
				<form action="campaignCreateForm4" id="frm" method="post">
					<input type="hidden" name="campaign_title" value="${dto.campaign_title}">
					<input type="hidden" name="goal_price" value="${dto.goal_price}">
					<input type="hidden" name="period" value="${dto.period}">
					<input type="hidden" name="campaign_end" value="${dto.campaign_end}">
					<input type="hidden" name="campaign_img" value="${dto.campaign_img}">
					<input type="hidden" name="simple_story" value="${dto.simple_story}">
					<input type="hidden" name="main_video" value="${dto.main_video}">
					<input type="hidden" name="story" value="${dto.story}">
					<input type="hidden" name="option_msg" value="${dto.option_msg}">
					<input type="hidden" name="id" value="${member.id}">
					<input type="hidden" name="campaign_num" value="${campaign_num}">
					<span style="color: red;">*</span><span style="font-size: 0.8em;">은 필수 입력 항목입니다.</span>
					<table class="table">
						<tr>
							<td><span style="color: red;">*</span>캠페인 등록자 정보</td>
							<td>
								<table class="tab">
									<tr>
										<td>이름</td>
										<td>
											<input type="text" name="register_name" class="register_name" readonly="readonly" value="${member.name}" style="width: 100%; height: 40px; border-radius: 4px; border: 1px solid #b8b894; margin-right: 10px;">
										</td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td>
											<input type="text" name="register_phone" class="register_phone" placeholder="'-'를 제외한 나머지 번호를 입력해주세요." value="${member.phone}" style="width: 100%; height: 40px; border-radius: 4px; border: 1px solid #b8b894; margin-right: 10px;">
										</td>
									</tr>
									<tr>
										<td>E-mail</td>
										<td>
											<input type="email" name="register_email" class="register_email" placeholder="ex. honggildong@gmail.com" value="${member.email}" style="width: 100%; height: 40px; border-radius: 4px; border: 1px solid #b8b894; margin-right: 10px;">
										</td>
									</tr>
								</table>
								<p style="margin-top: 10px;">캠페인 등록과 관련하여 운영자 또는 후원자가 연락할 수 있는</p> 
								<p>등록자 정보를 확인하여 주십시오.</p>
							</td>
						</tr>
						<tr>
							<td><span style="color: red;">*</span>대금 수취 정보</td>
							<td>
								<p>최소 캠페인 목표 금액은 10만원이며, 최대 금액은 제한이 없습니다.</p>
								<table class="tab">
									<tr>
										<td>은행</td>
										<td>
											<select name="bank" style="width: 100%; height: 40px; border-radius: 4px; border: 1px solid #b8b894; margin-right: 10px;">
												<option value="">은행선택</option>
												<option value="산업은행">산업은행</option>
												<option value="기업은행">기업은행</option>
												<option value="국민은행">국민은행</option>
												<option value="외한은행">외환은행</option>
												<option value="유안타증권">유안타증권</option>
												<option value="농협">농협</option>
												<option value="우리은행">우리은행</option>
												<option value="SC은행">SC은행</option>
												<option value="삼성증권">삼성증권</option>
												<option value="한국시티은행">한국시티은행</option>
												<option value="대구은행">대구은행</option>
												<option value="부산은행">부산은행</option>
												<option value="광주은행">광주은행</option>
												<option value="제주은행">제주은행</option>
												<option value="새마을금고">새마을금고</option>
												<option value="신협">신협</option>
												<option value="우체국">우체국</option>
												<option value="하나은행">하나은행</option>
												<option value="신한은행">신한은행</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>계좌번호</td>
										<td>
											<input type="text" name="bank_account" class="bank_account" placeholder="'-'를 제외한 나머지 번호를 입력해주세요." style="width: 100%; height: 40px; border-radius: 4px; border: 1px solid #b8b894; margin-right: 10px;">
										</td>
									</tr>
								</table>
								<p style="color: #0052cc; margin-top: 10px;">예금주는 캠페인 등록자의 이름과 동일하여야 합니다.</p>
								<p style="color: #0052cc;">만약 동일하지 않을 경우, 지급이 되지 않을 수 있습니다.</p>
							</td>
						</tr>
					</table>
					<div class="main_btns">
						<input type="button" class="btn btn-warning approve" value="캠페인 승인신청">
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