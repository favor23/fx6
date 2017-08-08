<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<c:url value="/js/json2.js"/>"></script>
<style type="text/css">
html, div, body, h3 {
	margin: 0;
	padding: 0;
}

h3 {
	display: inline-block;
	padding: 0.6em;
}
#tap{
	width: 100%;
	height: 50px;
}

#main_session_default{
	height: 1200px;
	width: 1000px;
	margin: 0 auto;
}
/*************  이 아래의 CSS는 joinFormCSS와 동일한 부분임   ************/
#join_box td {
	height: 30px;
	padding-top: 8px;
	padding-bottom: 8px;
	padding-left: 8px;
	vertical-align: middle;
	border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;
}
#join_box input[type="radio"],#join_box input[type="checkbox"]{
	margin-top: 0;

}

#join_box .text {
	border: 0.5px solid black;
	border-radius: 5px;
	padding-left: 4px;
	height: 30px;
}

#join_box select {
	border-color: black;
	border-radius: 5px;
	height: 25px;
}

.jf1 {
	text-align: center;
	width: 150px;
	font-weight: bold;
}

.jf2 {
	width: 230px;
}

#join_box {
	margin-top: 50px;
	width: 40%;
	min-width: 800px;
	height: 800px;
	margin-left: 25%;
}

#join_box #join_frm {
	width: 100%;
}

#join_frm table {
	width: 100%;
}

.span input {
	vertical-align: middle;
	width: 20px;
	
	height: 20px;
}

.span .text {
	border: 0.5px solid black;
	border-radius: 5px;
	padding-left: 4px;
	height: 70%;
	width: 150px;
}

.p_tag {
	margin-top: 10px;
	height: 30px;
}

#joinBtn {
	margin-top: 50px;
	min-width: 250px;
	width: 20%;
	height: 40px;
	margin-left: 35%;
	background-color: #5cd65c;
	font-size: large;
	font-weight: bold;
	border-radius: 5px;
	border: 1px solid gray;
}

#joinBtn:hover {
	background-color: #2eb82e;
}

#join_frm #id_check {
	border: 1px solid gray;
	border-radius: 5px;
	background-color: #003300;
	color: white;
	width: 100px;
	height: 30px;
}

#id_check:hover {
	background-color: #006600;
}

.sText1 {
	font-size: small;
}

.sText2 {
	display: none;
	color: red;
}

.sText3 {
	display: none;
	color: red;
}

.currect {
	display: none;
	color: green;
}

.birthBox {
	display: inline-block;
}

#head_label {
	width: 100%;
	height: 100px;
	text-align: center;
	line-height: 3;
	font-family: sans-serif;
	font-weight: bold;
	font-size: xx-large;
	border-bottom: 2px solid black;
	margin-top: 50px;
}

#join_frm #art {
	font-weight: bold;
}

#join_frm #mans {
	text-align: center;
	font-size: small;
}

#join_frm #mode1 {
	cursor: pointer;
}

.jf2 #cancel {
	padding: 5px;
	width: 80px;
	height: 20px;
	margin-left: 50px;
	border: 0.5px solid red;
	border-radius: 4px;
	cursor: pointer;
}

.fontConfig {
	width:80px;
	height:15px;
	text-align: justify;
}
.ic {
	display: none;
}
.none_pass{
	color:red;
}
.pass {
	color : green;
}
.info_box {
	font-size: small;
	margin-top: 5px;

}

#smtext {
line-height:3;
	font-size: small;
}
/*************     여기까지가 joinForm과 CSS가 동일한 부분임      *****************/
</style>
<c:import url="../temp/bootStrap.jsp" />
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus.jsp" />
<div id="main_session_default">
	
	<p>환영합니다! ${nickname } 님. 사이트 이용을 위해선 다음의 추가 정보가 필요합니다.</p>
		<div id="join_box">
		<form action="naverJoin" id="join_frm" method="post">
			<table>
				<tr>
					<td class="jf1">생년월일</td>
					<td class="jf2" colspan="2">
					<div id="yearBox" class="birthBox"></div>
                	<div id="monthBox" class="birthBox"></div>
                    <div id="dayBox" class="birthBox"></div>
					</td>
				</tr>
				<tr>
					<td class="jf1">휴대전화</td>
					<td class="jf2"><input type="text" name="phone" maxlength="11" class="text" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					<td class="jf3">하이픈('-') 없이 입력해주세요</td>
				</tr>
				<tr>
					<td class="jf1">집주소</td>
					<td colspan="2" class="jf2"><input type="text" name="address" class="text" style=" width: 79.4%;"></td>
				</tr>
				<tr>
				<td class="jf1">선호하는 장르<br><span id="smtext">(최소한개이상)</span></td>
					<td colspan="2"  class="jf2">
						<p class="p_tag">
						<!-- 뮤지컬, 미스터리, 로맨스(멜로), 공상 과학, 스포츠, 스릴러, 전쟁, 서부극 -->
						<span class="span">액션 : <input type="checkbox" name="taste" value="액션" class="action">&nbsp;&nbsp;</span>
						<span class="span">모험 : <input type="checkbox" name="taste" value="모험" class="adventure">&nbsp;&nbsp;</span>
						<span class="span">추리 : <input type="checkbox" name="taste" value="추리" class="reason">&nbsp;&nbsp;</span>
						<span class="span">전쟁 : <input type="checkbox" name="taste" value="전쟁" class="warfare">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">역사 : <input type="checkbox" name="taste" value="역사" class="history">&nbsp;&nbsp;</span>
						<span class="span">다큐 : <input type="checkbox" name="taste" value="다큐" class="document">&nbsp;&nbsp;</span>
						<span class="span">공포 : <input type="checkbox" name="taste" value="공포" class="horror">&nbsp;&nbsp;</span>
						<span class="span">가족 : <input type="checkbox" name="taste" value="가족" class="family">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">판타지 : <input type="checkbox" name="taste" value="판타지" class="fantasy">&nbsp;&nbsp;</span>
						<span class="span">누아르 : <input type="checkbox" name="taste" value="누아르" class="noir">&nbsp;&nbsp;</span>
						<span class="span">코미디 : <input type="checkbox" name="taste" value="코미디" class="comic">&nbsp;&nbsp;</span>
						<span class="span">드라마 : <input type="checkbox" name="taste" value="드라마" class="drama">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">뮤지컬 : <input type="checkbox" name="taste" value="뮤지컬" class="musical">&nbsp;&nbsp;</span>
						<span class="span">스포츠 : <input type="checkbox" name="taste" value="스포츠" class="sports">&nbsp;&nbsp;</span>
						<span class="span">스릴러 : <input type="checkbox" name="taste" value="스릴러" class="thriller">&nbsp;&nbsp;</span>
						<span class="span">로맨스 : <input type="checkbox" name="taste" value="로맨스" class="romance">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">미스터리 : <input type="checkbox" name="taste" value="미스테리" class="mystery">&nbsp;&nbsp;</span>
						<span class="span">애니메이션 : <input type="checkbox" name="taste" value="애니메이션" class="animation">&nbsp;&nbsp;</span>
						<span class="span">공상과학(SF) : <input type="checkbox" name="taste" value="SF" class="sf">&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr>
					<td class="jf1">영화인</td>
					<td class="jf2" colspan="2" id="mans">
					<label id="mode1" onclick="display()">본인이 <span id="art">감독, 작가, 배우, 스탭</span> 중 하나라도 해당된다면 이곳을 눌러주세요</label>
					</td>
				</tr>
				
			</table>
			<!-- hidden 영역 -->
			<input type="hidden" name="name" value="${dto.name }">
			<input type="hidden" name="id" value="${dto.id }">
			<input type="hidden" name="birth" id="birth">	
			<input type="hidden" name="email" value="${dto.email }">
			<input type="hidden" name="sung" id="sung" value="${dto.sung }">
			<input type="hidden" name="grade" id="grade" value="normal">
			<input type="hidden" name="birth" id="birth">
			<input type="hidden" value="" id="age" name="age">
			
			<input type="button" id="joinBtn" value="다음">
		</form>
	</div>
	</div>
<c:import url="../temp/footer.jsp" />
</body>
<script type="text/javascript">
var taste_checker="";
$("input[type='checkbox']").click(function(){
	var num = $('input:checkbox:checked').length;
	if(num==0){
		taste_checker="";
	}else if(num>0){
		taste_checker="ok";
	}
});


var year = new Date().getFullYear(); 
	/* <select name="user_birth_year">
	<option value="2000" selected>2000</option> */	
	//모든 자동완성 off
	$("#join_box input").attr("autocomplete","off");
	
	
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
	

	function display() {
		var dialog = prompt("본인이 해당되는 것을 적어주세요 [감독,작가,배우,스탭]");
		if (dialog != "" && dialog != null) {
			$("#grade").val(dialog);
			$("#mans")
					.html('<label id="mode2"><span id="art">'
									+ dialog
									+ '</span><span id="cancel" onclick="cancel()">취소</span></label>');
		} else {
			alert("입력값이 없습니다.");
			$("#grade").val("normal");
		}
	}

	function cancel() {
		$("#mans").html('<label id="mode1" onclick="display()">본인이 <span id="art">감독, 작가, 배우, 스탭</span> 중 하나라도 해당된다면 이곳을 눌러주세요</label>');
		$("#grade").val("normal");
	}

	
	//페이지 호출하는 순간 생성 됨.
	//1960~2000까지 연도 생성.(2017년 기준)
	var minYear = year-60; //최소 년도 구하기
	var maxYear = year-17; //최대 년도 구하기
	var birthYear = '<select id="myYear">';
	for (var i = minYear; i <= maxYear; i++) {
		birthYear = birthYear + '<option value="'+i+'" selected>' + i
				+ '</option>';
	}
	birthYear = birthYear + '</select>년';
	$("#yearBox").html(birthYear);

	
	//1~12월까지 월 생성
	var birthMonth = '<select id="myMonth" onblur="day()">';
	for (var i = 1; i <= 12; i++) {
		birthMonth = birthMonth + '<option value="'+i+'" selected>' + i
				+ '</option>';
	}
	birthMonth = birthMonth + '</select>월';
	$("#monthBox").html(birthMonth);
	
	//1~29,30,31 날짜 생성
	var birthDay = '<select id="myDay">';
	for (var i = 1; i <= 31; i++) {
		birthDay = birthDay + '<option value="'+i+'" selected>' + i
				+ '</option>';
	}
	birthDay = birthDay + '</select>월';
	$("#dayBox").html(birthDay);

	
	//선택한 달에 따라 최대 일 수를 29일 30일 31일로 바꿔주는 스크립트
	function day() {
		var m = $("#myMonth").val();
		if (m == '2') {
			var birthDay = '<select id="myDay">';
			for (var i = 1; i <= 29; i++) {
				birthDay = birthDay + '<option value="'+i+'" selected>' + i
						+ '</option>';
			}
			birthDay = birthDay + '</select>월';
			$("#dayBox").html(birthDay);
		} else if (m % 2 == 0) {
			var birthDay = '<select id="myDay">';
			for (var i = 1; i <= 30; i++) {
				birthDay = birthDay + '<option value="'+i+'" selected>' + i
						+ '</option>';
			}
			birthDay = birthDay + '</select>월';
			$("#dayBox").html(birthDay);
		} else {
			var birthDay = '<select id="myDay">';
			for (var i = 1; i <= 31; i++) {
				birthDay = birthDay + '<option value="'+i+'" selected>' + i
						+ '</option>';
			}
			birthDay = birthDay + '</select>월';
			$("#dayBox").html(birthDay);
		}
	}

//가입하기 버튼을 눌렀을때 작동하는 스크립트
		$("#joinBtn").click(function(){

			$("#email").val($("#e1").val() + "@" + $("#e3").val());
			var myYear = $("#myYear").val(); //내가 태어난 년도
			var age = year - myYear; //나이 구하기
			$("#age").val(age);  //나이 저장
			var text = $("#myYear").val() + '-' + $("#myMonth").val() + '-'
					+ $("#myDay").val();
			$("#birth").val(text);//생년 월일 저장
			//중복체크를 했는지, 패스워드가 조건에 맞는지, 패스워드와 패스워드 확인과 일치하는지 확인해줌.
			if (taste_checker!="") {
				$("#join_frm").submit();
			}else if(taste_checker==""){
				alert("선호하는 장르를 다시 확인해주세요.");
			}

		});



function focus1() {
	$(".sText1").css("display", "inherit");
	$(".sText2").css("display", "none");
}


</script>
</body>
</html>