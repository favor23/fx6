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
		height: 930px;
		float: left;
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
	
	.top2 {
		width: 80%;
		height: 20%;
		text-align: center;
		font-size: 1.2em;
		color: #b3d9ff;
		margin-top: 45px;
	}
	
	.top3 {
		width: 80%;
		height: 30%;
		text-align: center;
		font-size: 1.2em;
		color: white;
	}
	
	.main1 img {
		margin-left: auto; 
		margin-right: auto;
		margin-top: 100px;
		display: block;
	}
	
	.main2 {
		width: 100%;
		text-align: center;
		font-size: 1.6em;
		margin-top: 20px;
		margin-bottom: 30px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.main3_wrap {
		width: 100%;
		height: 230px;
		font-family: 'Jeju Gothic', sans-serif;
	}
	
	.main3_1,
	.main3_2,
	.main3_3,
	.main3_4 {
		width: 50%;
		height: 50%;
		float: left;
		font-size: 0.9em;
	}
	
	.main3_1 p,
	.main3_2 p,
	.main3_3 p,
	.main3_4 p {
		margin: 0 0 0px;
		color: #8a8a5c;
	}
	
	.main3_1 p:first-child,
	.main3_2 p:first-child,
	.main3_3 p:first-child,
	.main3_4 p:first-child {
		font-size: 1.3em;
		color: #005ce6;
		margin: 0 0 10px;
	}
	
	.main4_wrap {
		width: 100%;
		height: 228px;
	}
	
	.main4_1,
	.main4_2 {
		width: 50%;
		height: 100%;
		float: left;
		border: 1px solid #e0e0d1;
		background-color: #f5f5f0;
		margin-top: 30px;
	}
	
	.main4_1 {
		border-right: 0px;
	}
	
	.main4_1 p {
		text-align: center;
		color: #8a8a5c;
	}
	
	.main4_1 p:first-child {
		font-size: 1.4em;
		color: black;
		margin-top: 30px;
		margin-bottom: 20px;
	}
	
	.main4_1 input {
		width: 150px;
		height: 40px;
		margin-left: auto; 
		margin-right: auto;
		margin-top: 20px;
		display: block;
	}
	
	.main4_2 {
		cursor: pointer;
		font-size: 1.4em;
		text-align: center;
		line-height: 228px;
	}
	
	.main4_2:hover {
		border: 2px solid #0052cc;
		font-size: 1.5em;
	}
</style>
<script type="text/javascript">
	$(function() {
		$(".yes").click(function() {
			if($(".main4_2").attr("title")=="go") {
				alert("이미 약관에 동의하셨습니다.");
			}
			
			$(".main4_2").attr("title", "go");
		});
		
		$(".main4_2").click(function() {
			if($(".main4_2").attr("title")=="stop") {
				alert("약관에 동의하지 않으셨습니다. 약관에 동의해주세요.");
			} else {
				location.href = "campaignWrite";
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
				캠페인 만들기
			</div>
			<hr style="width: 20%; position: absolute; left: 20%;">
			<span style="position: absolute; left: 45%; top: 80px; color: white; font-size: 1.7em;">꿈을 가진 영화인들</span>
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
			<div class="main1">
				<img alt="" src='<c:url value="/img/cf-img/logo.png" />' style="width: 160px; height: 160px;">
			</div>
			<div class="main2">
				우리와 함께하는 캠페인
			</div>
			<div class="main3_wrap">
				<div class="main3_1">
					<p>아이디어와 꿈들은 공유되어야만 빛을 발합니다.</p>
					<p>현재 우리는 마음이 맞는 사람들과 협업하고 가치를 창출해내는 것이 매우</p>
					<p>간편해진 사회에서 살고 있습니다. 이는 투명하고 신뢰할만한 온라인 플랫</p>
					<p>폼 속에서 상호작용이 가능해진 덕분입니다.</p>
				</div>
				<div class="main3_2">
					<p>우리는 당신의 꿈을 응원합니다.</p>
					<p>우리는 꿈과 아이디어를 함께 나누며 서로의 뜻을 공유하고</p>
					<p>실현할 수 있는 역동적인 온라인 창의와 신뢰의 금융 공간을 창조합니다.</p>
					<p>지금 당장 우리와 함께 캠페인을 시작하세요.</p>
				</div>
				<div class="main3_3">
					<p>우리는 커뮤니티의 가치를 지향합니다.</p>
					<p>우리는 '커뮤니티'라는 단어를 중요하게 생각합니다.</p>
					<p>여러 영화인들이 공동체를 형성하여 그 속의 상호작용을 통해</p>
					<p>실현해내는 아이디어와 꿈을 위해 항상 노력하겠습니다.</p>
				</div>
				<div class="main3_4">
					<p>세상 모든 영화의 꿈을 현실로!</p>
					<p>우리는 독립 영화를 위한 크라우드 펀딩으로서 세상의 모든 예술, 영화</p>
					<p>등을 가리지 않고 당신의 꿈을 위해 열심히 정진합니다.</p>
					<p>당신의 모든 프로젝트의 성공을 기원하고 응원하겠습니다.</p>
				</div>
			</div>
			<div class="main4_wrap">
				<div class="main4_1">
					<p>이용약관 동의</p>
					<p>캠페인을 시작하기 전에 사전동의가 필요하며</p>
					<p>동의하지 않으실 경우 서비스 이용이 제한됩니다.</p>
					<input type="button" class="btn btn-warning agree_btn" value="자세히 보기" data-toggle="modal" data-target="#myModal">
				</div>
				<div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header" style="background-color: #0052cc;">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title" style="color: white; font-weight: bold;">이용약관 및 개인정보 보호정책</h4>
				        </div>
				        <div class="modal-body" style="font-size: 0.9em; color: #8a8a5c;">
				          	<ul>
				          		<li>제 1 조 목적</li>
				          		<li>이 약관은 텀블벅㈜ (이하 '회사')가 운영하는 인터넷사이트 tumblbug(이하 ‘사이트’)에서 </li>
				          		<li>제공하는 인터넷 관련 서비스(이하 ‘서비스’)를 이용함에 있어 회사와 이용자의 권리와 의무,</li>
				          		<li>책임사항 및 회원의 서비스이용절차에 관한 사항을 규정함을 목적으로 합니다.</li>
				          	</ul>
				          	<ul>
				          		<li>제 2 조 용어의 정의</li>
				          		<li>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</li>
				          		<li>본 약관에 명시되지 않은 용어는 관련 법령이 정하는 바에 따르며,</li>
				          		<li>그 외에는 일반적인 상거래관행에 의합니다.</li>
				          	</ul>
				          	<ul>
				          		<li>제 3 조 약관의 명시와 개정</li>
				          		<li>회사는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자 등록번호,</li>
				          		<li>연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 사이트의 초기 서비스</li>
				          		<li>화면에 게시합니다. 다만, 약관의 구체적 내용은 이용자가 연결화면을 통하여 볼 수 있도록</li>
				          		<li>합니다.회사는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법,</li>
				          		<li>정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전자상거래 등에서의 소비자 보호에 관한</li>
				          		<li>법률, 유사수신행위의 규제에 관한 법률 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할</li>
				          		<li>수 있습니다. 회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과</li>
				          		<li>함께 사이트의 초기화면에 최소 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.</li>
				          		<li>다만, 이용자에게 불리하게 약관의 내용을 변경하는 경우에는 적용일자 30일 이전부터 공지합니다.</li>
				          		<li>제3항에 따라 공지된 적용일자 이후에 회원이 회사의 서비스를 계속 이용하는 경우에는 개정된</li>
				          		<li>약관에 동의하는 것으로 봅니다. 개정된 약관에 동의하지 아니하는 회원은 언제든지 자유롭게 </li>
				          		<li>서비스 이용계약을 해지할 수 있습니다. 유료서비스를 이용하는 회원이 약관의 개정에 동의하지</li>
				          		<li>아니하여 해지할 경우 회사가 정한 환불정책에 따릅니다.</li>
				          		<li>이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한</li>
				          		<li>전자거래소비자보호지침 및 관계법령 또는 일반 상 관례에 따릅니다.</li>
				          	</ul>
				          	<ul>
				          		<li>제 4 조 이용계약의 성립</li>
				          		<li>이용계약은 이용자의 약관동의와 이용신청에 대한 회사의 승낙으로 성립합니다.</li>
				          		<li>이용계약의 성립시기는 회사가 가입완료 표시를 신청절차 상에 표시한 시점으로 합니다.</li>
				          	</ul>
				          	<ul>
				          		<li>제 5 조 이용신청 및 제한</li>
				          		<li>이용자는 회사가 정한 가입 양식에 따라 회원정보를 정확히 기입한 후</li>
				          		<li>이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.</li>
				          		<li>회사는 다음 각호에 해당하는 경우에 대해서는 그 신청에 대한 제한 사유가</li>
				          		<li>해소될 때까지 승낙을 유보 또는 일부 서비스 이용을 제한할 수 있습니다.</li>
				          		<li>내용이 허위인 것으로 판명 되거나, 그러하다고 의심할 만한 합리적인 사유가 발생할 경우</li>
				          		<li>기타 회사가 필요하다고 인정되는 경우</li>
				          		<li>회사는 다음에 해당하는 경우에는 이용신청을 승낙하지 아니할 수 있습니다.</li>
				          		<li>이미 가입된 회원과 이메일 주소가 동일한 경우</li>
				          		<li>다른 사람의 명의를 사용하여 신청하였을 때</li>
				          		<li>회원가입 신청서의 내용을 허위로 기재하였을 때</li>
				          		<li>사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 때</li>
				          		<li>기타 회사가 정한 이용신청 요건이 미비 되었을 때</li>
				          		<li>회사는 다음 각 호에 해당하는 경우 그 사유가 해소될 때까지 이용계약 성립을 유보할 수</li>
				          		<li>있습니다.</li>
				          		<li>서비스 관련 제반 용량이 부족한 경우</li>
				          		<li>기술상 장애 사유가 있는 경우</li>
				          	</ul>
				          	<ul>
				          		<li>제 6 조 이용자 ID부여 및 변경</li>
				          		<li>이용자 ID는 이용자가 가지고 있는 이메일 주소이며 메일 주소가 바뀌었을 경우 사용자</li>
				          		<li>설정에서 변경할 수 있습니다.</li>
				          		<li>서비스 이용자 ID 및 비밀번호의 관리책임은 회원에게 있습니다.</li>
				          		<li>이를 소홀히 관리하여 발생하는 서비스 이용상의 손해 또는 제3자에 의한 부정이용</li>
				          		<li>등에 대한 책임은 회원에게 있으며 회사는 그에 대한 책임을 일절 지지 않습니다.</li>
				          	</ul>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default yes" data-dismiss="modal">동의합니다</button>
				        </div>
				      </div>
				      
				    </div>
				  </div>
				<div class="main4_2" title="stop">
					캠페인 시작하기.
				</div>
			</div>
		</article>
		
		<nav class="nav_right">
			
		</nav>
	</section>
	
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>