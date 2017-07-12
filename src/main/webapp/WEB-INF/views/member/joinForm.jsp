<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<title>Insert title here</title>
<style type="text/css">
#join_box td {
	height: 30px;
	padding-top: 8px;
	padding-bottom: 8px;
	padding-left: 8px;
	vertical-align: middle;
	border: 0.5px solid #f2f2f2;
}

#join_box .text {
	border: 0.5px solid black;
	border-radius: 5px;
	padding-left: 4px;
	height: 100%;
}

#join_box select {
	border-color: black;
	border-radius: 5px;
	height: 25px;
}

.jf1 {
	text-align: center;
	width: 150px;
}

.jf2 {
	width: 200px;
}

#join_box {
	border: 1px solid black;
	width: 40%;
	min-width: 800px;
	height: 800px;
	margin-left: 25%;
}

#join_box #join_frm {
	width: 90%;
	margin-left: 5%;
}

#join_frm table {
	width: 100%;
}

.span input {
	vertical-align: middle;
	width: 20px;
	margin-top: 0;
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
	margin-top:50px;
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
	border-radius:5px;
	background-color: #003300;
	color: white; 
	width: 100px;
	height: 30px;
}
#id_check:hover {
	background-color:#006600;
}
.sText1 {
font-size: small;

}
.sText2 {
display: none;
color: red;
}

.sText3 {
	display:none;
	color : red;
}

.currect {
	display: none;
	color: green;
}
.birthBox {
	display: inline-block;

}
</style>
</head>
<body>
	<!-- 아이디 비번 폰 이메일 주소 성별 직업 이름 나이 grade result -->
	<div id="join_box">
		<h3>* 표시된 항복은 통계를 위해 사용되며 외부에 노출되지않습니다.</h3>

		<form action="customerJoin" id="join_frm" method="post">
			<table>
				<tr>
					<td class="jf1">아이디</td>
					<td class="jf2"><input type="text" name="id" id="id" class="text"></td>
					<td class="jf3"><input type="button" id="id_check" value="중복체크"></td>
				</tr>
				<tr>
					<td class="jf1">비밀번호</td>
					<td class="jf2"><input type="password" name="pw" id="pw" class="text" onblur="pw_chk()" onfocus="focus1()">
					</td>
					<td class="jf3" id="text_pw"><label class="sText1">8~20자의 영문과 1개 이상의 숫자,특수문자만 가능.</label> 
					<label class="sText2">비밀번호 양식과 맞지않습니다.</label>
					<label class="currect">멋진 비밀번호네요!</label>
					</td>
				</tr>
				<tr>
					<td class="jf1">비밀번호 확인</td>
					<td class="jf2"><input type="password" name="pwc" id="pwc" class="text" onblur="pwc_chk()"></td>
					<td class="jf3" id="text_pw2"><label class="sText3">비밀번호가 일치하지 않습니다.</label></td>
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
					<td class="jf2"><input type="text" name="phone" class="text"></td>
					<td class="jf3">하이픈('-') 없이 입력해주세요</td>
				</tr>
				<tr>
					<td class="jf1">전자우편</td>
					<td class="jf2"><input type="text" id="e1" class="text"> @</td>
					<td class="jf3"><select id="e2" onchange="mailing()">
							<option value="self">직접 입력</option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
					</select> <input type="text" id="e3" class="text"></td>
				</tr>
				<tr>
					<td class="jf1">집주소</td>
					<td colspan="2" class="jf2"><input type="text" name="address" class="text"></td>
				</tr>
				<tr>
					<td class="jf1">성별</td>
					<td class="jf2"><span class="span">남 : <input type="radio"
							name="sung" value="m"></span></td>
					<td class="jf3"><span class="span">여 : <input type="radio"
							name="sung" value="f"></span></td>
				</tr>

				<tr>
					<td class="jf1">직업</td>
					<td colspan="2" id="radio">
					<span class="span">학생 : <input type="radio" name="r" value="student"></span> 
					<span class="span">자영업 : <input type="radio" name="r" value="ceo"></span> 
					<span class="span">회사원 : <input type="radio" name="r" value="sal"></span> 
					<span class="span">무직 : <input type="radio" name="r" value="none"></span>
					<p class="p_tag">
						<span class="span">기타 : <input type="radio" name="r" value="etc">
						<input type="text" id="etc" class="text"></span>
					</p>
					</td>
				</tr>

				<tr>
					<td class="jf1">분류</td>
					<td  class="jf2" colspan="2">
					<span class="span">감독 : <input type="radio" name="grade" class="g" value="director"></span>
					<span class="span">작가 : <input type="radio" name="grade" class="g" value="writer"></span>
					<span class="span">유저 : <input type="radio" name="grade" class="g" value="user"></span></td>
				</tr>
				<tr>
				<td class="jf1">선호하는 장르</td>
					<td colspan="2"  class="jf2">
						<p class="p_tag">
						<span class="span">공포 : <input type="checkbox" name="taste" value="horror">&nbsp;&nbsp;</span>
						<span class="span">추리 : <input type="checkbox" name="taste" value="reasoning">&nbsp;&nbsp;</span>
						<span class="span">스릴러 : <input type="checkbox" name="taste" value="thrill">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">코미디 : <input type="checkbox" name="taste" value="comic">&nbsp;&nbsp;</span>
						<span class="span">로멘스 : <input type="checkbox" name="taste" value="romance">&nbsp;&nbsp;</span>
						<span class="span">액션 : <input type="checkbox" name="taste" value="action">&nbsp;&nbsp;</span>
						<span class="span">성인 : <input type="checkbox" name="taste" value="adult">&nbsp;&nbsp;</span>
						</p>
					</td>
				
				</tr>
				
				
			</table>
			<!-- email -->
			<input type="hidden" name="birth" id="birth">
			<input type="hidden" value="" id="age" name="age">
			<input type="hidden" value="" id="email" name="email"> <input
				type="hidden" value="" id="job" name="job" value="">
			<input type="button" id="joinBtn" value="다음">
		</form>
	</div>

	<script type="text/javascript">
		/* <select name="user_birth_year">
		<option value="2000" selected>2000</option> */
		var birthYear = '<select id="myYear">';
		for(var i=1960;i<=2000;i++){
			birthYear=birthYear+'<option value="'+i+'" selected>'+i+'</option>';
		}
		birthYear=birthYear+'</select>년';
		$("#yearBox").html(birthYear);
		
		var birthMonth = '<select id="myMonth" onblur="day()">';
		for(var i=1;i<=12;i++){
			birthMonth=birthMonth+'<option value="'+i+'" selected>'+i+'</option>';
		}
		birthMonth=birthMonth+'</select>월';
		$("#monthBox").html(birthMonth);
		
		var birthDay = '<select id="myDay">';
		for(var i=1;i<=31;i++){
			birthDay=birthDay+'<option value="'+i+'" selected>'+i+'</option>';
		}
		birthDay=birthDay+'</select>월';
		$("#dayBox").html(birthDay);
		
		function day(){
			var m = $("#myMonth").val();
			if(m=='2'){
				var birthDay = '<select id="myDay">';
				for(var i=1;i<=29;i++){
					birthDay=birthDay+'<option value="'+i+'" selected>'+i+'</option>';
				}
				birthDay=birthDay+'</select>월';
				$("#dayBox").html(birthDay);
			}else if(m%2==0){
				var birthDay = '<select id="myDay">';
				for(var i=1;i<=30;i++){
					birthDay=birthDay+'<option value="'+i+'" selected>'+i+'</option>';
				}
				birthDay=birthDay+'</select>월';
				$("#dayBox").html(birthDay);
			}else {
				var birthDay = '<select id="myDay">';
				for(var i=1;i<=31;i++){
					birthDay=birthDay+'<option value="'+i+'" selected>'+i+'</option>';
				}
				birthDay=birthDay+'</select>월';
				$("#dayBox").html(birthDay);				
			}
		}
		
		
		
		
		var year = new Date().getFullYear();
		var id_checker = "";
		var pw_checker = "";
		$("#joinBtn").click(function() {
			var job = $('input:radio[name="r"]:checked').val();
			if (job == 'etc') {
				$("#job").val($("#etc").val());
			} else {
				$("#job").val(job);
			}
			$("#email").val($("#e1").val() + "@" + $("#e3").val());
			
			//이거 다시 설정 날짜 다시 받아야함..
			var myYear = $("#date").val(); //생년 월일 저장
			var myYear2 = new Date(myYear).getFullYear(); //연도만 따로 추출
			var age = year-myYear; //나이 구하기
			$("#age").val(age);
			var text = $("#myYear").val()+'-'+$("#myMonth").val()+'-'+$("#myDay").val();
			$("#date").val(text);
			
			if(id_checker==""&&pw_checker!=""){
				$("#join_frm").submit();			
			}else {
				alert("다시 확인하세요");
			}
			
		});
		
		function pw_chk() {
			var pw = $("#pw").val();
			var pwc = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
			var ck = pwc.test(pw);
			if (ck) {
				pw_checker = "ok";
				$(".sText1").css("display","none");
				$(".sText2").css("display","none");
				$(".currect").css("display","inherit");
			} else {
				$(".sText1").css("display","none");
				$(".sText2").css("display","inherit");
				pw_checker = "";
			}
		}
		
		
		function focus1(){
			$(".sText1").css("display","inherit");
			$(".sText2").css("display","none");
		}
		
		function pwc_chk(){
			var pw = $("#pw").val();
			var pwc = $("#pwc").val();
			if(pw!=pwc&&pw!=""){
				$(".sText3").css("display","inherit");
			}else {
				$(".sText3").css("display","none");
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
		
	</script>
</body>
</html>