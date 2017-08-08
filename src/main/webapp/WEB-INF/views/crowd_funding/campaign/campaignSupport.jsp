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
	body {
		background-color: #f5f5f0;
	}
	
	.main_top {
		width: 100%;
		height: 250px;
		margin-top: 50px;
		background-color: #0052cc;
	}
	
	.main_art {
		width: 60%;
		margin: 0 auto;
		margin-bottom: 150px;
		background-color: #f5f5f0;
	}
	
	footer {
		display: inline-block;
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
	
	.ben_list {
		width: 100%;
		height: 41px;
		margin-bottom: 10px;
		box-shadow: 1px 1px 5px #adad85;
		background-color: #f5f5f0;
	}
	
	.ben_list:last-child {
		margin-bottom: 0px;
	}
	
	.ben_choice {
		margin-top: 4px;
	}
</style>
<script type="text/javascript">
	$(function() {
		var campaign_num = ${campaign_num};
		
		getBenefitList(campaign_num);
	});
	
	function getBenefitList(campaign_num) {
		$.ajax({
			url: "../benefit/benefitList/" + campaign_num,
			type: "GET",
			success: function(data) {
				var result = "";
				
				if(data!=null&&data!="") {
					$(".bene_list").attr("style", "background-color: white; box-shadow: 0px 0px 0px white;");
					
					$(data).each(function() {
						var benefit_title = this.benefit_title;
						
						if(benefit_title.length>=9) {
							benefit_title = benefit_title.substr(0, 9) + "...";
						}
						
						result += '<div class="ben_list">';
						result += '<span style="font-size: 1.8em; float: left; margin-left: 5px;">' + benefit_title + '</span>';
						result += '<input type="button" class="btn btn-info ben_choice" value="선택" id="' + this.benefit_num + '" style="float: right;">';
						result += '<span style="float: right; margin-top: 10px; margin-right: 5px;">원</span>';
						result += '<span style="float: right; margin-top: 5px; margin-right: 5px; font-size: 1.5em; color: #0052cc;">' + this.benefit_price + '</span>';
						result += '<span style="float: right; margin-top: 10px; margin-right: 5px;">후원금액</span>';
						result += '</div>';
					});					
				} else {
					result += '<h2 style="text-align: center; vertical-align: middle;">등록된 혜택이 없습니다.</h2>';
				}
					
				$(".bene_list").html(result);
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
				캠페인 후원하기
			</div>
			<hr style="width: 20%; position: absolute; left: 20%;">
			<span style="position: absolute; left: 44%; top: 80px; color: white; font-size: 1.7em;">꿈을 가진 영화인들</span>
			<hr style="width: 20%; position: absolute; left: 60%;">
			<div class="top2">
				우리의 캠페인을 통해 그 기회를 만들어 보세요!
			</div>
			<div class="top3">
				<p>꿈과 아이디어를 가지고 본인의 영화를 실현시키고자 행동하는 사람들을 뜻합니다.</p>
				<p>당신의 소중한 꿈과 톡톡튀는 아이디어를 영화로 만들어 드립니다.</p>
			</div>
		</article>
		<article class="main_art">
			<div class="main_name">
				후원정보
			</div>
			<div class="main_con">
				<form action="campaignSupport" id="frm" method="post">
					<span style="color: red;">*</span><span style="font-size: 0.8em;">은 필수 입력 항목입니다.</span>
					<table class="table">
						<tr>
							<td>후원에 따른 혜택</td>
							<td>
								<p>후원에 따른 혜택을 선택해주세요.</p>
								<div class="bene_list">
									
								</div>
							</td>
						</tr>
						<tr>
							<td><span style="color: red;">*</span>추가 후원 금액</td>
							<td>
								<input type="number" class="add_price" name="add_price" min="0" step="1000" value="0" style="width: 400px; height: 40px; border-radius: 4px; border: 1px solid #b8b894; margin-right: 10px;">원
								<p>후원 금액의 경우 1,000원 단위로 입력이 가능합니다.</p>
								<p>혜택을 선택하지 않으시면, 캠페인 등록자에게 후원금만 전달됩니다.</p>
							</td>
						</tr>
						<tr>
							<td>결제 금액</td>
							<td>
						        
							</td>
						</tr>
					</table>
					<div class="main_btns">
						<input type="button" class="btn btn-warning" value="다음 단계로">
					</div>
				</form>
			</div>
		</article>
	</section>
	
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>