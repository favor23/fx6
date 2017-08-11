<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<title>Insert title here</title>
<style type="text/css">
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
	text-align: left;
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
	text-align: left;
}

#join_box {
	margin-top: 50px;
	width: 40%;
	min-width: 800px;
	height: 830px;
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
	width: 330px;

}

#smtext {
line-height:3;
	font-size: small;
}

.cert {
	padding-left: 50px;
	padding-right: 50px;
	text-align: left;
}

#certCode {
border: 0.5px solid black;
	border-radius: 5px;
	padding-left: 4px;
	height: 30px;
}

#certBtn {
	border: 0.5px solid black;
	border-radius: 5px;
	background-color: green;
	color:white;
	font-weight: bold;
	font-size: 15px;
	width:125px;
}

#chk_certBtn {
	border: 0.5px solid black;
	border-radius: 5px;
	background-color: #ccff33;
	font-weight: bold;
	font-size: 15px;
	width:125px;
}

#yearBox select {
	width: 70px;
	font-size: 18px;
}
#monthBox select {
	width: 50px;
	font-size: 18px;
}
#dayBox select {
	width: 50px;
	font-size: 18px;
}
.jf10 {
	width: 100%;
	text-align: center;
}

#certBtn2 {
	border: 0.5px solid black;
	border-radius: 5px;
	background-color: black;
	color:white;
	font-weight: bold;
	font-size: 15px;
	width:105px;
}
</style>
</head>
<body>
<c:import url="../temp/bootStrap.jsp" />
<c:import url="../temp/header.jsp" />
<c:if test="${check eq true }">
	<!-- 아이디 비번 폰 이메일 주소 성별 직업 이름 나이 grade result -->
	<label id="head_label">회원가입</label>
	<div id="join_box">
		<form action="customerJoin" id="join_frm" method="post">
			<table>
				<tr>
					<td class="jf1">아이디</td>
					<td class="jf2" colspan="2"><input type="text" name="id" id="id" class="text">
					<span><input type="button" id="id_check" value="중복체크">
					<label class="none_pass ic">사용중인 아이디 입니다.</label>
					<label class="pass ic">사용 가능한 아이디입니다.</label>
					</span>
					<div class="info_box">영문, 숫자, '_' 으로만 이루어진 6~12글자로 지어주세요.</div>
					</td>
				</tr>
				<tr>
					<td class="jf1">비밀번호</td>
					<td class="jf2"><input type="password" name="pw" id="pw" class="text">
					<!-- 0804 비밀번호 체크 해제   onblur="pw_chk()" onfocus="focus1()"  -->
			
					</td>
					<td class="jf3" id="text_pw"><label class="sText1">8~20자의 영문과 1개 이상의 숫자,특수문자만 가능.</label> 
					<label class="sText2">비밀번호 양식과 맞지않습니다.</label>
					<label class="currect">멋진 비밀번호네요!</label>
					</td>
				</tr>
				<tr>
					<td class="jf1">비밀번호 확인</td>
					<td class="jf2"><input type="password" id="pwc" class="text" ></td>
					<!--0804비밀번호 체크 해제 onblur="pwc_chk()" -->

					<td class="jf3" id="text_pw2"><label class="sText3">비밀번호가 일치하지 않습니다.</label></td>
					<!-- 0804 비밀번호 정규식 일시 해제 >   onblur="pwc_chk()" -->
				</tr>
				<tr>
					<td class="jf1">생년월일</td>
					<td class="jf2" colspan="2">
					<div id="yearBox" class="birthBox"></div>
                	<div id="monthBox" class="birthBox"></div>
                    <div id="dayBox" class="birthBox"></div>
					</td>
				</tr>
				<tr>
					<td class="jf1">이름</td>
					<td colspan="2"  class="jf2"><input type="text" name="name" class="text"></td>
				</tr>
				<tr>
					<td class="jf1">휴대전화</td>
					<td class="jf2"><input type="text" name="phone" maxlength="11" class="text" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					<td class="jf3">하이픈('-') 없이 입력해주세요</td>
				</tr>
				<tr>
					<td class="jf1">전자우편</td>
					<td class="jf2 jf_close"><input type="text" id="e1" class="text"> @</td>
					<td class="jf3 jf_close">
					<select id="e2" onchange="mailing()">
							<option value="self">직접 입력</option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
					</select> 
					<input type="text" id="e3" class="text">
					<input type="button" id="certBtn" value="인증번호 발송">
					
					</td>
					<td class="jf2 jf_open" colspan="2" style="display: none;">
					<span id="cert_mail"></span>
					<input type="button" id="certBtn2" value="이메일 수정">
					 <span id="certTxt1"></span>
					</td>
				</tr>
				
				<tr class="jf_open2" style="display: none;">
					<td class="cert" colspan="3" style="padding-left: 158px;">
					<input type="text" id="certCode"> 
					<input type="button" id="chk_certBtn" value="인증번호확인">
					 <span id="certTxt2"></span>
					</td>
				</tr>				
				<tr>
					<td class="jf1">집주소</td>
					<td colspan="2" class="jf2"><input type="text" name="address" class="text" style=" width: 79.4%;"></td>
				</tr>
				<tr>
					<td class="jf1">성별</td>
					<td class="jf2"><span class="span">남 : <input type="radio"
							name="sung" value="m" checked="checked"></span></td>
					<td class="jf3" style="text-align: left;"><span class="span">여 : <input type="radio"
							name="sung" value="f"></span></td>
				</tr>
				<tr>
				<td class="jf1">선호하는 장르<br><span id="smtext">(최소 1개 이상)</span></td>
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
			<input type="hidden" name="grade" id="grade" value="normal">
			<input type="hidden" name="birth" id="birth">
			<input type="hidden" value="" id="age" name="age">
			<input type="hidden" value="" id="email" name="email">
			<input type="button" id="joinBtn" value="다음">
		</form>
	</div>
</c:if>
<c:if test="${check ne true }">
<h2>잘못 된 요청입니다. </h2>
</c:if>
	

<c:import url="../temp/footer.jsp" />


<script type="text/javascript">
var year = new Date().getFullYear(); //올해 년도 구함.
var id_checker = "";
var pw_checker = "a";//0804 비밀번호 정규식 해제 . 처이 완료 후 ""으로 바꾸어 놓아야함
var code="code";
var code_checker="";
var taste_checker="";
	$("input[type='checkbox']").click(function(){
		var num = $('input:checkbox:checked').length;
		if(num==0){
			taste_checker="";
		}else if(num>0){
			taste_checker="ok";
		}
	});
	


		/* <select name="user_birth_year">
		<option value="2000" selected>2000</option> */
	
		$("#id_check").click(function(){
			var vid=$("#id").val();
			//아이디 생성 조건 작성.
			var regex = /^[a-zA-Z]{1}[a-zA-Z0-9_]{5,11}$/;
			if(regex.test(vid)){
				$.post("idCheck",{
					id:vid,
				},function(data){
					data=data.trim();
					if(data!=""){
						$(".pass").css("display","none");
						$(".none_pass").css("display","inherit");
						id_checker="";
					}else {
						$(".none_pass").css("display","none");
						$(".pass").css("display","inherit");
						id_checker="ok";
					}
				});
			}else {
				alert("아이디 생성 조건에 맞지 않습니다.");
			}
		});
		
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
		
		function test(num) {
			if (num == 1) {
				$("#etc").attr("readonly","readonly");
			} else {
				$("#etc").removeAttr("readonly");
			}
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
			} else if (m % 2 == 0&&m<8) {
				var birthDay = '<select id="myDay">';
				for (var i = 1; i <= 30; i++) {
					birthDay = birthDay + '<option value="'+i+'" selected>' + i
							+ '</option>';
				}
				birthDay = birthDay + '</select>월';
				$("#dayBox").html(birthDay);
			} else if(m % 2 != 0&&m < 8){
				var birthDay = '<select id="myDay">';
				for (var i = 1; i <= 31; i++) {
					birthDay = birthDay + '<option value="'+i+'" selected>' + i
							+ '</option>';
				}
				birthDay = birthDay + '</select>월';
				$("#dayBox").html(birthDay);
			} else if(m % 2 == 0&&m > 7){
				var birthDay = '<select id="myDay">';
				for (var i = 1; i <= 31; i++) {
					birthDay = birthDay + '<option value="'+i+'" selected>' + i
							+ '</option>';
				}
				birthDay = birthDay + '</select>월';
				$("#dayBox").html(birthDay);
			} else {
				var birthDay = '<select id="myDay">';
				for (var i = 1; i <= 30; i++) {
					birthDay = birthDay + '<option value="'+i+'" selected>' + i
							+ '</option>';
				}
				birthDay = birthDay + '</select>월';
				$("#dayBox").html(birthDay);
			}
		}

	//가입하기 버튼을 눌렀을때 작동하는 스크립트
			$("#joinBtn").click(function(){
				var myCode=$("#certCode").val();
				if(code*1==myCode*1){
					code_checker="ok";
				}
				$("#email").val($("#e1").val() + "@" + $("#e3").val());
				var myYear = $("#myYear").val(); //내가 태어난 년도
				var age = year - myYear; //나이 구하기
				$("#age").val(age);  //나이 저장
				var text = $("#myYear").val() + '-' + $("#myMonth").val() + '-'
						+ $("#myDay").val();
				$("#birth").val(text);//생년 월일 저장
				//중복체크를 했는지, 패스워드가 조건에 맞는지, 패스워드와 패스워드 확인과 일치하는지 확인해줌.
				if (id_checker != "" && pw_checker != ""&&taste_checker!=""&&code_checker!="") {
					$("#join_frm").submit();
				} else if(id_checker == "" && pw_checker == ""){
					alert("다시 확인하세요.");
				}else if(taste_checker==""){
					alert("선호하는 장르를 다시 확인해주세요.");
				}else if(code_checker==""){
					alert("이메일 인증을 다시 진행해 주세요");
				}

			});

	
	//비밀번호 정규식
	function pw_chk() {
		var pw = $("#pw").val();
		var pwc = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
		var ck = pwc.test(pw);
		if (ck) {
			
			pw_checker = "ok";
			$(".sText1").css("display", "none");
			$(".sText2").css("display", "none");
			$(".currect").css("display", "inherit");
		} else {
			$(".sText1").css("display", "none");
			$(".sText2").css("display", "inherit");
			pw_checker = "";
		}
	}

	function focus1() {
		$(".sText1").css("display", "inherit");
		$(".sText2").css("display", "none");
	}

	function pwc_chk() {
		var pw = $("#pw").val();
		var pwc = $("#pwc").val();
		if (pw != pwc && pw != "") {
			$(".sText3").css("display", "inherit");
		} else {
			$(".sText3").css("display", "none");
		}
	}

	function mailing() {
		var e2 = $("#e2").val();
		if (e2 == 'self') {
			$("#e3").val('');
		} else {
			$("#e3").val(e2);
		}
	}
	
	//이메일 인증
	function readonlyCSS(num){
		if(num*1==0){
			$("#e1").removeAttr("readonly");
			$("#e2").css("display","inherit");
			$("#e3").removeAttr("readonly");
			$("#certBtn2").css("display","none");
		}else {
			$("#e1").attr("readonly","readonly");
			$("#e2").css("display","none");
			$("#e3").attr("readonly","readonly");
		}
	}
	
	$("#certBtn").click(function(){
		$("#email").val($("#e1").val() + "@" + $("#e3").val());
		var email=$("#email").val();
		if($("#e1").val()!=""&&$("#e3").val()!=""){
			$("#certTxt1").html("인증번호를 발급하고 있습니다 잠시만 기다려주세요.");
			$(".jf_open").removeAttr("style");
			$(".jf_open2").removeAttr("style");
			$(".jf_close").css("display","none");
			$("#cert_mail").html(email);
			$.post("${pageContext.request.contextPath}/sendMail/auth",{
				email:email
			},function(data){
				code=data*1;
				$("#certTxt1").html("");
				$("#certTxt2").html("인증번호가 발급되었습니다.").fadeOut(4000);
				$("#certCode").css("display","inherit");
				$("#chk_certBtn").css("display","inherit");
				$("#certBtn").attr("value","인증번호 재발송");
			});
		}else {
			alert("이메일을 입력해주세요");
		}
	});
	
	$("#chk_certBtn").click(function(){
		$("#email").val($("#e1").val() + "@" + $("#e3").val());
		var email=$("#email").val();
		var myCode=$("#certCode").val();
		if(code*1==myCode*1){
			$("#certTxt1").html("인증번호가 일치합니다.");
			$("#certTxt1").css("color","green");
			cert_done();
		}else {
			$("#certTxt1").html("인증번호가 일치하지않습니다.");
			$("#certTxt1").css("color","red");
		}
	});
	
	//이메일 인증이 완료되었을 때 처리하는 스크립트
	function cert_done(){
		$(".jf_open2").css("display","none");
	}
	
	$("#certBtn2").click(function(){
		$(".jf_close").removeAttr("style");
		$(".jf_open").css("display","none");
		$("#certCode").val("");
		code="code";
	});
	
	
	
</script>
</body>
</html>