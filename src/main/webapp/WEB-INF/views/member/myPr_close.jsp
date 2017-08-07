<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/ckeditor/ckeditor.js"/>" charset="utf-8"></script>
<c:import url="../temp/bootStrap_black.jsp" />
<style type="text/css">
#container {
	height: auto;
	padding-bottom: 40px;

}
.p_title {
	border-bottom: 2px solid orange;
	line-height: 2;
	width: 280px;
	margin-top: 20px;
	margin-left: 20px;
	display: inline-block;
}


.prbox #info {
	width:100%;
	height: 100%;
}

.ta { 
	max-height: 990px;
	overflow: auto;
	padding-bottom: 20px;
	
}

#cke_prText {
	
	height: 380px;
}

.pt1 {
	vertical-align: middle;
	border-bottom: 1px solid black;
	width: 180px;
	height: 50px;
	background-color: teal;
	color:white;
	font-weight: bold;
	font-size: large;
	text-align: center;
}

.pt2 {
	vertical-align: middle;
	border-bottom: 1px solid black;
	padding-left: 10px;
	padding-right: 10px;
	height: 50px;
}

.pt3 {
	height: 50px;
	vertical-align: bottom;
	padding-bottom: 8px;
	padding-left:35px;
	font-size: 20px;
	font-weight: bold;
	background-color: #003333;
	color: white;
}

.pic {
	width: 150px;
	height: 200px;
	cursor: pointer;
	background-size: auto;
	background-repeat: no-repeat;
}
#form {
	display: none;
}

.prbox {
	border: 1px solid black;
	width: 98%;
	margin-top: 20px;
	margin-left: 1%;
}
#dialog_box {
	width: 100px;
	height: 20px;
	display: inline-block;
	float: right;
	margin-right: 30px;
	margin-top: 54px;
}

.dialog_span {
	width:100px;
	height:20px;
	text-align:center;
	font-weight: bold;
	vertical-align: text-bottom;
}

.view_p_text{
font-weight: bold;
margin-top: 15px;
margin-bottom: 5px;
margin-left: 10px;

}

.PRarea{
width: 98%;
min-height:30px;
padding-left: 8px;
line-height:25px;
margin-left: 1%;
border: 1px solid black;
border-radius:3px; 
}

#cke_award {
	width: 98%;
	margin-left: 1%;
}
#cke_education {
	width: 98%;
	margin-left: 1%;
}
#cke_activity {
	width: 98%;
	margin-left: 1%;
}
#cke_introduce {
	width: 98%;
	margin-left: 1%;
}

.disNone {
	display: none;
}

.btn {
	margin-left: 11px;
	margin-top: 15px;
	display: inline-block;
}

#don{
	width: 150px;
}
#rew {
	width: 200px;
}
#cen {
	width: 200px;
	float: right;
	margin-right: 9px;
}
</style>
<body>

	<div id="prBox">
		<p class="p_title">"${member.id }" 님의 PR입니다.</p>
		<div id="dialog_box">
		<c:if test="${!empty file }">
		<div class="dialog_span" style="display: none;">사진 바꾸기</div>
		</c:if>
		<c:if test="${empty file }">
		<div class="dialog_span"style="display: none;">사진 올리기</div>
		</c:if>
		</div>
		<div id="justBox" class="prbox">
			<form action="myPr" method="post" id="f">
				<table class="table-hover" id="info">
					<tbody>
						<tr>
							<td class="pt1">이름</td>
							<td class="pt2">${member.name } </td>
							<c:if test="${!empty file }">
								<td class="pic" id="pic_update" rowspan="4" style="background-image: url('<c:url value="/upload/${file.fname }" />');">
								</td>
							</c:if>
							<c:if test="${empty file }">
								<td class="pic" id="pic_upload" rowspan="4" 
								style="background-image: url('<c:url value="/img/icon/nonepic.png" />');">
								</td>
							</c:if>
						</tr>
						<tr>
							<td class="pt1">출생년도</td>
							<td class="pt2" id="birth"></td>
						</tr>
						<tr>
							<td class="pt1">직종</td>
							<td class="pt2">${member.grade }</td>
						</tr>
						<tr>
							<td class="pt3" colspan="2">WHO AM I?</td>
						</tr>
					</tbody>
				</table>

				<div id="view" class="ta">
					<c:if test="${!empty prDTO}">
					<p class="view_p_text">
					<span id="awa_view" class="awaClass">[ 수상경력 보기]</span>
					<span id="awa_close" class="disNone">[ 수상경력 닫기]</span>
					</p>
						<div class="PRarea" id="awa">${prDTO.award }</div>
					<p class="view_p_text">
					<span id="edu_view" class="eduClass">[ 최종학력 보기]</span>
					<span id="edu_close" class="disNone">[ 최종학력 닫기]</span>
					</p>
						<div class="PRarea" id="edu">${prDTO.education }</div>
					<p class="view_p_text">
					<span id="act_view" class="actClass">[ 작품활동 보기]</span>
					<span id="act_close" class="disNone">[ 작품활동 닫기]</span>
					</p>
						<div class="PRarea" id="act">${prDTO.activity }</div>
					<p class="view_p_text">
					<span id="intro_view" class="introClass">[ 소개글 보기]</span>
					<span id="intro_close" class="disNone">[ 소개글 닫기]</span>
					</p>
						<div class="PRarea" id="intro">${prDTO.introduce }</div>
					</c:if>
					<c:if test="${empty prDTO}">
					<div id="notyet">
					<p class="view_p_text">[ 수상경력 ]</p>
						<div class="PRarea ny" id="awa">수상경력을 작성해주세요.</div>
					<p class="view_p_text">[ 최종학력 ]</p>
						<div class="PRarea ny" id="edu">최종학력을 작성해주세요.</div>
					<p class="view_p_text">[ 작품활동 ]</p>
						<div class="PRarea ny" id="act">작품활동을 작성해주세요.</div>
					<p class="view_p_text">[ 간략한 소개 ]</p>
						<div class="PRarea ny" id="intro">간략한 소개를 작성해주세요.</div>
					</div>				
				</c:if>

				</div>
				<div id="form" class="ta">
					<c:if test="${empty prDTO}">
					<p class="view_p_text">[ 수상경력 ]</p>
						<textarea class="PRarea" name="award">
					</textarea>
						
					<p class="view_p_text">[ 최종학력 ]</p>
						<textarea class="PRarea" name="education">
					</textarea>
						
					<p class="view_p_text">[ 작품활동 ]</p>
						<textarea class="PRarea" name="activity">
					</textarea>
					
					<p class="view_p_text">[ 간략한 소개 ]</p>
					<textarea class="PRarea" name="introduce">
					</textarea>
					</c:if>
					<c:if test="${!empty prDTO}">
					<p class="view_p_text">[ 수상경력 ]</p>
						<textarea class="PRarea" name="award">${prDTO.award }
					</textarea>
						
					<p class="view_p_text">[ 최종학력 ]</p>
						<textarea class="PRarea" name="education">${prDTO.education }
					</textarea>
						
					<p class="view_p_text">[ 작품활동 ]</p>
						<textarea class="PRarea" name="activity">${prDTO.activity }
					</textarea>
					
					<p class="view_p_text">[ 간략한 소개 ]</p>
					<textarea class="PRarea" name="introduce">${prDTO.introduce }
					</textarea>
					</c:if>
				</div>
				<input type="hidden" name="id" value="${member.id }">
			</form>
		</div>
		<input type="button" id="don" class="btn btn-success" value="제출">
		<input type="button" id="rew" class="btn btn-warning" value="수정하기">
		<input type="button" id="cen" class="btn btn-danger" value="취소">
	</div>
	<input type="hidden" id="path" value='<c:url value="/se2/SmartEditor2Skin.html"/>'>
	<script type="text/javascript">	
	$("#don").css("display","none");
	
	var year = '${member.birth}';
	year = new Date(year).getFullYear();
	$("#birth").html(year);
	
	$("#rew").click(function(){
		$("#view").css("display","none");
		$(this).css("display","none");
		$("#form").css("display","inherit");
		$("#don").css("display","inline-block");
	});
	
	$("#cen").click(function(){
		$("#form").css("display","none");
		$("#don").css("display","none");
		$("#view").css("display","inherit");
		$("#rew").css("display","inline-block");
	});
	
	$("#don").click(function(){
		$("#f").submit().location.reload();
	});
	
	$(".pic").mouseenter(function(){
		$(".dialog_span").css("display","block");
	});
	$(".pic").mouseleave(function(){
		$(".dialog_span").css("display","none");
	});
	
	$(".pic").click(function(){
		var specs = "left=100,top=10,width=400px,height=450px";
		specs += ",toolbar=no,menubar=no,status=no,resizable=no";
		window.open("win_pic","win_pic",specs);
	});
	
		var path = $("#path").val();
		CKEDITOR.replace('award', {
			height : '100px', // 입력창의 높이
			startupFocus : false
		});
		CKEDITOR.replace('education', {
			height : '100px', // 입력창의 높이
			startupFocus : false
		});
		CKEDITOR.replace('activity', {
			height : '100px', // 입력창의 높이
			startupFocus : false
		});
		CKEDITOR.replace('introduce', {
			height : '300px', // 입력창의 높이
			startupFocus : false
		});
		
		
		
		
	</script>

</body>