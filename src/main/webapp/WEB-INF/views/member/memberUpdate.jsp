<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#memberBox {
	width: 70%;
	margin-left: 15%;
	padding: 15px;
}


#title {
	margin-left: 15%;
	margin-top: 50px;
	width: 140px;
	font-weight: bold;
	font-size: large;
	border-bottom: 2px solid green;
}

#updateBtn {
	margin-top: 20px;
	width: 100%;
	height: 35px;
	border: 1px solid gray;
	border-radius: 5px;
	background-color: #004d00;
	font-weight: bold;
	font-size: medium;
	color: white;
}

#updateBtn:HOVER {
	background-color: #009900;
	color: black;
}

.jf1 {
	text-align: right;
	font-weight: bold;
	width: 120px;
}

.red {
	color: red;
}

.input {
	border: 0.5px solid gray;
	border-radius: 5px;
	padding-left: 5px;
}

.g {
	width: 20px;
	height: 20px;
	position: relative;
	top: -1px;
	vertical-align: middle;
}

.address {
	width: 98%;
}

.sText1 {
font-size: 12px;

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
.jf2 {
width: 250px;

}
.p_tag {
	margin-top: 10px;
	height: 30px;
}
.span input {
	vertical-align: middle;
	width: 20px;
	margin-top: 0;
	height: 20px;
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


</style>
<c:import url="../temp/bootStrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_member.jsp" />
<div id="main_session_default">
<p id="title">회원정보수정</p>
<div id="memberBox">
	<form action="customerUpdate" id="frm" method="post">
		<table class="table table-bordered">
			<tr id="t">
				<td class="jf1">아이디</td>
				<td colspan="2">${member.id}</td>
			</tr>
			<tr>
				<td class="jf1">비밀번호</td>
				<td class="jf2"><input type="password" name="pw" id="pw" class="input" onblur="pw_chk()" onfocus="focus1()"></td>
				<td id="pwc1" class="red"><label class="sText1">8~20자의 영문과 1개 이상의 숫자,특수문자만 가능.</label> 
					<label class="sText2">비밀번호 양식과 맞지않습니다.</label>
					<label class="currect">멋진 비밀번호네요!</label></td>
			</tr>
			<tr>
				<td class="jf1">비밀번호 확인</td>
				<td class="jf2"><input type="password" name="pwc" id="pwc" class="input" onblur="pwc_chk()"></td>
				<td id="pwc2" class="red"><label class="sText3">비밀번호가 일치하지 않습니다.</label></td>
			</tr> 
			<tr>
				<td class="jf1">이름</td>
				<td colspan="2"><input type="text" name="name" value="${member.name }" class="input"></td>
			</tr>
			<tr>
				<td class="jf1">휴대전화</td>
				<td><input type="text" name="phone" value="${member.phone }" class="input"></td>
				<td>하이픈('-') 없이 입력해주세요</td>
			</tr>
			<tr>
			<!-- @기준으로 앞위로 잘라서 넣어야함. -->
				<td class="jf1">전자우편</td>
				<td><input type="text" id="e1" value="" class="input">@</td>
				<td><select id="e2" onchange="mailing()">
						<option value="self">직접 입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
				</select>
				
				 <input type="text" id="e3" class="input">
				</td>
			</tr>
			<tr>
				<td class="jf1">집주소</td>
				<td colspan="2"><input type="text" name="address" value="${member.address }" class="input address"></td>
			</tr>
			<tr>
				<td class="jf1">선호하는 장르</td>
					<td colspan="2"  class="jf2">
						<p class="p_tag">
						<!-- 뮤지컬, 미스터리, 로맨스(멜로), 공상 과학, 스포츠, 스릴러, 전쟁, 서부극 -->
						<span class="span">액션 : <input type="checkbox" name="taste" value="action" class="action">&nbsp;&nbsp;</span>
						<span class="span">모험 : <input type="checkbox" name="taste" value="adventure" class="adventure">&nbsp;&nbsp;</span>
						<span class="span">추리 : <input type="checkbox" name="taste" value="reason" class="reason">&nbsp;&nbsp;</span>
						<span class="span">전쟁 : <input type="checkbox" name="taste" value="warfare" class="warfare">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">역사 : <input type="checkbox" name="taste" value="history" class="history">&nbsp;&nbsp;</span>
						<span class="span">다큐 : <input type="checkbox" name="taste" value="document" class="document">&nbsp;&nbsp;</span>
						<span class="span">공포 : <input type="checkbox" name="taste" value="horror" class="horror">&nbsp;&nbsp;</span>
						<span class="span">가족 : <input type="checkbox" name="taste" value="family" class="family">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">판타지 : <input type="checkbox" name="taste" value="fantasy" class="fantasy">&nbsp;&nbsp;</span>
						<span class="span">누아르 : <input type="checkbox" name="taste" value="noir" class="noir">&nbsp;&nbsp;</span>
						<span class="span">코미디 : <input type="checkbox" name="taste" value="comic" class="comic">&nbsp;&nbsp;</span>
						<span class="span">드라마 : <input type="checkbox" name="taste" value="drama" class="drama">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">뮤지컬 : <input type="checkbox" name="taste" value="musical" class="musical">&nbsp;&nbsp;</span>
						<span class="span">스포츠 : <input type="checkbox" name="taste" value="sports" class="sports">&nbsp;&nbsp;</span>
						<span class="span">스릴러 : <input type="checkbox" name="taste" value="thriller" class="thriller">&nbsp;&nbsp;</span>
						<span class="span">로맨스 : <input type="checkbox" name="taste" value="romance" class="romance">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">미스터리 : <input type="checkbox" name="taste" value="mystery" class="mystery">&nbsp;&nbsp;</span>
						<span class="span">애니메이션 : <input type="checkbox" name="taste" value="animation" class="animation">&nbsp;&nbsp;</span>
						<span class="span">공상과학(SF) : <input type="checkbox" name="taste" value="sf" class="sf">&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
		</table>
	<!-- email -->
	<input type="hidden" value="${member.id }" name="id">
	<input type="hidden" value="" id="email" name="email">
	</form>
	

	<button id="updateBtn">완료</button>
</div>




</div>
<c:import url="../temp/footer.jsp" />
<script type="text/javascript">
var pw_checker = "";
var test = '${member.email}';
test = test.split("@");
var a = test[0];
var b = test[1];
$("#e1").val(test[0]);
$("#e3").val(test[1]);

var taste = '${member.taste}';
taste = taste.split(",");
for(var i in taste){
	$("."+taste[i]).attr("checked","checked");
}


	$("#updateBtn").click(function() {
		var job = $('input:radio[name="r"]:checked').val();
		var pw = $("#pw").val();
		var pwc =$("#pwc").val() ;
		if(pw==""){
			$("#pwc1").html("비밀번호를 입력해주세요");
		}
		
		if(pwc==""){
			$("#pwc2").html("비밀번호를 입력해주세요");
		}
		
		if(pw!=pwc){
			$("#pwc2").html("비밀번호가 일치하지않습니다.");
		}			

		$("#email").val($("#e1").val()+"@"+$("#e3").val());
		
		if(pw!=""&&pwc!=""&&pw==pwc){
			$("#frm").submit();				
		}else {
			alert("입력하신 정보가 맞는지 다시 확인 바랍니다.");
		}

	});

	function mailing() {
		var e2 = $("#e2").val();
		if (e2 == 'self') {
			$("#e3").val('');
		} else {
			$("#e3").val(e2);
		}

	}
	
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
	


</script>
</body>
</html>