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
		
		$(".top4_img").click(function() {
			if(confirm("이동하실 경우, 현재 입력중인 정보들이 사라집니다. 이동하시겠습니까?")) {
				location.href = "campaignCreateForm4";				
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
				<form action="campaignCreateForm3" id="frm" method="post" enctype="multipart/form-data">
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
								<input type="button" class="btn btn-info" style="float: right;" value="등록하기"  data-toggle="modal" data-target="#myModal">
								<p>혜택은 금액별, 혜택 내용별 최대 10개까지 등록할 수 있습니다.</p>
							</td>
						</tr>
					</table>
					<div class="main_btns">
						<input type="button" class="btn btn-warning" value="다음 단계로">
					</div>
				</form>
			</div>
			<div class="modal_div">
				<div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog modal-lg">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">혜택 등록하기</h4>
				        </div>
				        <div class="modal-body">
				          <p>This is a large modal.</p>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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