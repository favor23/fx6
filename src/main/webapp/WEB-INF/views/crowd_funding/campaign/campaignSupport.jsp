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
		background-color: #f5f5f0;
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
		background-image: url("../../img/cf-img/main-top4.jpg");
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
		height: 130px;
		margin-bottom: 10px;
		box-shadow: 1px 1px 5px #adad85;
		background-color: #f5f5f0;
		font-family: 'Hanna', sans-serif;
		padding: 10px;
		cursor: pointer;
	}
	
	.ben_list:last-child {
		margin-bottom: 0px;
	}
	
	.ben_list:hover {
		border: 1px solid #0052cc;
	}
	
	.ben_choice,
	.ben_dis {
		margin-top: 4px;
	}
</style>
<script type="text/javascript">
	$(function() {
		var campaign_num = ${campaign_num};
		var count = 0;
		
		getBenefitList(campaign_num);
		
		$(document).on("click", ".ben_choice", function() {
			count++;
			
			if(count<2) {
				var total = parseInt($(this).attr("title")) + parseInt($(".add_price").val());
				
				$(this).attr("style", "background-color: #1f1f14; color: white; position: relative;");
				$(this).attr("class", "ben_list ben_dis");
				$(this).val("해제");
				
				$(".total1").html($(this).attr("title"));
				$(".total").html(total);
				$(".hidden_space").html('<input type="hidden" name="total_price" value="' + total + '">');
				$(".hidden_space2").html('<input type="hidden" name="benefit_title" value="' + $(this).attr("accesskey") + '">');
				$(".hidden_space3").html('<input type="hidden" name="benefit_num" value"' + $(this).attr("id") + '">');
			} else {
				alert("혜택은 하나만 선택해주세요.");
			}
		});
		
		$(document).on("click", ".ben_dis", function() {
			count = 0;
			
			var total = parseInt($(".add_price").val());
			
			$(this).attr("style", "background-color: #f5f5f0; color: black; position: relative;");
			$(this).attr("class", "ben_list ben_choice");
			$(this).val("선택");
			
			$(".total1").html("0");
			$(".total").html($(".add_price").val());
			$(".hidden_space").html('<input type="hidden" name="total_price" value="' + total + '">');
			$(".hidden_space2").html("");
			$(".hidden_space3").html("");
		});
		
		$(".add_price").blur(function() {
			var total = 0;
			
			if($(".ben_dis").attr("title")!=null&&$(".ben_dis").attr("title")!="") {
				total = parseInt($(".ben_dis").attr("title")) + parseInt($(".add_price").val());
			} else {
				total = parseInt($(".add_price").val());
			}
			
			$(".total2").html($(this).val());
			$(".total").html(total);
			$(".hidden_space").html('<input type="hidden" name="total_price" value="' + total + '">');
		});
		
		$(".go_payment").click(function() {
			if('${member.id}'!=null&&'${member.id}'!="") {
				$("#frm").submit();				
			} else {
				alert("로그인이 만료되었습니다. 첫 화면으로 돌아갑니다.");
				location.href = "../../index";
			}
		});
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
						result += '<div class="ben_list ben_choice" style="position: relative;" id="' + this.benefit_num + '" title="' + this.benefit_price + '" accesskey="' + this.benefit_title + '">';
						result += '<div style="width: 100%; font-size: 1.2em;">' + this.benefit_title + '</div>';
						result += '<div class="ben_bottom" style="width: 100%; font-size: 0.9em; color: #6b6b47;">' + this.benefit_contents + '</div>';
						result += '<div style="width: 100%; position: absolute; bottom: 10px; right: 10px;"><span style="float: right; margin-top: 10px; margin-right: 5px;">원</span>';
						result += '<span style="float: right; margin-top: 5px; margin-right: 5px; font-size: 1.5em; color: #0052cc;">' + this.benefit_price + '</span>';
						result += '<span style="float: right; margin-top: 10px; margin-right: 5px;">후원금액</span></div>';
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
			<span style="position: absolute; left: 45%; top: 80px; color: white; font-size: 1.7em;">꿈을 가진 영화인들</span>
			<hr style="width: 20%; position: absolute; left: 60%;">
			<div class="top2">
				마음에 드는 캠페인에 후원해보세요!
			</div>
			<div class="top3">
				<p>당신이 보태주는 힘 하나하나가 그들에겐 희망입니다.</p>
				<p>후원금을 발판삼아 그들의 꿈을 세상에 알려주세요.</p>
			</div>
		</article>
		<article class="main_art">
			<div class="main_name">
				후원정보
			</div>
			<div class="main_con">
				<form action="campaignSupport" id="frm" method="post">
					<div class="hidden_space"></div>
					<div class="hidden_space2"></div>
					<div class="hidden_space3"></div>
					<input type="hidden" name="campaign_num" value="${campaign_num}">
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
						        후원 혜택금액&nbsp;<span class="total1" style="color: #0052cc; font-size: 2.0em; font-family: 'Hanna', sans-serif;">0</span>&nbsp;+&nbsp;후원 금액<span class="total2" style="color: #0052cc; font-size: 2.0em; font-family: 'Hanna', sans-serif;">0</span>
						        <p>=&nbsp;총 결제금액&nbsp;<span class="total" style="color: #0052cc; font-size: 2.5em; font-family: 'Hanna', sans-serif;">0</span></p>
							</td>
						</tr>
					</table>
					<div class="main_btns">
						<input type="button" class="btn btn-warning go_payment" value="다음 단계로">
					</div>
				</form>
			</div>
		</article>
	</section>
	
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>