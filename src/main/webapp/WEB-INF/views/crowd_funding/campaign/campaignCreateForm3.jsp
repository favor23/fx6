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
		height: 700px;
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
		height: 700px;
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
	
	.body_left,
	.body_right {
		width: 50%;
		height: 500px;
		float: left;
	}
	
	.body_left {
		background-color: #f5f5f0;
		box-shadow: 1px 1px 5px #adad85;
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
	
	.ben_del {
		margin-top: 4px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('.benefit_title').keyup(function (e){
	        var content = $(this).val();
	        $('#counter').html(content.length + '/30');
	    });
	    
		$('.benefit_title').keyup();
		
		$('.benefit_contents').keyup(function (e){
	        var content = $(this).val();
	        $('#counter2').html(content.length + '/300');
	    });
	    
		$('.benefit_contents').keyup();
		
		$(".ben_form").click(function() {
			getBenefitList($(".num").val()-1);
		});
		
		$(".ben_write").click(function() {
			if($(".benefit_title").val()!=null&&$(".benefit_title").val()!="") {
				if($(".benefit_price").val()!=null&&$(".benefit_price").val()!="") {
					if($(".benefit_price").val()>1000||$(".benefit_price").val()==1000) {
						if($(".benefit_contents").val()!=null&&$(".benefit_contents").val()!="") {
							benefitWrite();
							$(".benefit_title").val("");
							$(".benefit_price").val("");
							$(".benefit_contents").val("");
						} else {
							alert("혜택 내용을 입력하세요.");
						}	
					} else {
						alert("후원 금액은 1000원 이상부터 입력 가능합니다.");
					}
				} else {
					alert("해당 혜택의 후원 금액을 입력해주세요.");
				}
			} else {
				alert("혜택명을 입력해주세요.");
			}
		});
		
		$(".next").click(function() {
			$("#frm").submit();
		});
		
		$(document).on("click", ".ben_del", function() {
			var benefit_num = $(this).attr("id");
			
			benefitDelete(benefit_num);
		});
	});
	
	function getBenefitList(campaign_num) {
		$.ajax({
			url: "../benefit/benefitList/" + campaign_num,
			type: "GET",
			success: function(data) {
				var result = "";
				
				if(data!=null&&data!="") {
					$(".body_left").attr("style", "background-color: white; box-shadow: 0px 0px 0px white;");
					
					$(data).each(function() {
						var benefit_title = this.benefit_title;
						
						if(benefit_title.length>=9) {
							benefit_title = benefit_title.substr(0, 9) + "...";
						}
						
						result += '<div class="ben_list">';
						result += '<span style="font-size: 1.8em; float: left; margin-left: 5px;">' + benefit_title + '</span>';
						result += '<input type="button" class="btn btn-danger ben_del" value="삭제" id="' + this.benefit_num + '" style="float: right;">';
						result += '<span style="float: right; margin-top: 10px; margin-right: 5px;">원</span>';
						result += '<span style="float: right; margin-top: 5px; margin-right: 5px; font-size: 1.5em; color: #0052cc;">' + this.benefit_price + '</span>';
						result += '<span style="float: right; margin-top: 10px; margin-right: 5px;">후원금액</span>';
						result += '</div>';
					});					
				} else {
					result += '<h2 style="text-align: center; vertical-align: middle;">등록된 혜택이 없습니다.</h2>';
				}
					
				$(".body_left").html(result);
			}
		});
	}
	
	function benefitWrite() {
		var params = $("#frm2").serialize();
		
		$.ajax({
			url: "../benefit/benefitWrite",
			type: "POST",
			data: params,
			success: function(data) {
				alert(data.trim());
				getBenefitList($(".num").val()-1);
			}			
		});
	}
	
	function benefitDelete(benefit_num) {
		$.ajax({
			url: "../benefit/benefitDelete",
			type: "POST",
			data: {
				benefit_num: benefit_num
			},
			success: function(data) {
				alert(data.trim());
				getBenefitList($(".num").val()-1);
			}
		});
	}
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
			<div class="main_name">
				혜택
			</div>
			<div class="main_con">
				<form action="campaignCreateForm3" id="frm" method="post">
					<input type="hidden" name="campaign_title" value="${dto.campaign_title}">
					<input type="hidden" name="goal_price" value="${dto.goal_price}">
					<input type="hidden" name="period" value="${dto.period}">
					<input type="hidden" name="campaign_end" value="${dto.campaign_end}">
					<input type="hidden" name="campaign_img" value="${dto.campaign_img}">
					<input type="hidden" name="simple_story" value="${dto.simple_story}">
					<input type="hidden" name="main_video" value="${dto.main_video}">
					<input type="hidden" name="story" value="${dto.story}">
					<span style="color: red;">*</span><span style="font-size: 0.8em;">은 필수 입력 항목입니다.</span>
					<table class="table">
						<tr>
							<td>옵션 메세지</td>
							<td>
								<input type="text" class="option_msg" name="option_msg" placeholder="혜택에 선택 사항이 있을 경우 기재해주세요." style="width: 450px; height: 40px; border-radius: 4px; border: 1px solid #b8b894;">
								<p>후원자들이 반드시 입력해야 하는 옵션 메세지를 안내해주세요.</p>
							</td>
						</tr>
						<tr>
							<td><span style="color: red;">*</span>캠페인 혜택</td>
							<td>
								<input type="button" class="btn btn-info ben_form" style="float: right;" value="등록하기"  data-toggle="modal" data-target="#myModal">
								<p>혜택은 금액별, 혜택 내용별 최대 10개까지 등록할 수 있습니다.</p>
							</td>
						</tr>
					</table>
					<div class="main_btns">
						<input type="button" class="btn btn-warning next" value="다음 단계로">
					</div>
				</form>
			</div>
			<div class="modal_div">
				<div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog modal-lg">
				      <div class="modal-content">
				        <div class="modal-header" style="background-color: #0052cc; color: white;">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">혜택 등록하기</h4>
				        </div>
				        <div class="modal-footer">
				          <div class="body_left">
				          	
				          </div>
				        <form name="frm2" id="frm2">
				          <input type="hidden" class="num" name="campaign_num" value="${campaign_num}">
				          <div class="body_right">
				          	<table class="table">
				          		<tr>
				          			<td>
				          				<p><span style="color: red;">*</span>혜택명 등록</p>
				          				<input type="text" class="benefit_title" name="benefit_title" maxlength="30" placeholder="혜택명을 입력해주세요." style="width: 410px; height: 40px; border-radius: 4px; border: 1px solid #b8b894; margin-left: 10px;">
				          				<div id="counter">###</div>
				          			</td>
				          		</tr>
				          		<tr>
				          			<td>
				          				<p><span style="color: red;">*</span>해당 혜택의 후원 금액</p>
				          				<input type="number" class="benefit_price" name="benefit_price" placeholder="금액을 입력해주세요.(1000원 이상)" style="width: 410px; height: 40px; border-radius: 4px; border: 1px solid #b8b894; margin-left: 10px;">
				          			</td>
				          		</tr>
				          		<tr>
				          			<td>
				          				<p><span style="color: red;">*</span>혜택 내용</p>
				          				<textarea rows="8" cols="55" class="benefit_contents" name="benefit_contents" maxlength="300" placeholder="혜택 내용을 입력해주세요." style="resize: none; border-radius: 4px; border: 1px solid #b8b894;"></textarea>
				          				<div id="counter2">###</div>
				          			</td>
				          		</tr>
				          	</table>
				          </div>
				          <input type="button" class="btn btn-info ben_write" value="등록">
				          <input type="button" class="btn btn-warning" data-dismiss="modal" value="완료">
				        </form>
				        </div>
				      </div>
				    </div>
				  </div>
			</div>
		</article>
		
		<nav class="nav_right">
			
		</nav>
	</section>
	
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>