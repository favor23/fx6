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
#memberBox td{
	text-align:center;
	vertical-align: middle;
}


#title {
	margin-left: 15%;
	margin-top: 50px;
	width: 300px;
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
	width: 80px;
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
	width: 90%;
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
.controlBtn {
	border: 1px solid;
	height: 50px;
	color: white;
	font-size: large;
	font-weight: bold;
	background-color: #000000;
}
#updateForm {
	width : 180px;
	float: left;
}

#dropOut {
	width : 100px;
	float: right;
}
#updateForm:hover {
	background-color:orange;

}
#dropOut:hover {
	background-color: #990000;

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
.member_css {
	margin: 0px auto;
	padding: 0px;
	text-align: center;
	font-family: 'Open Sans', sans-serif;
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
<div id="main_session_default" class="member_css">
<p id="title">${member.id } 님의 회원정보 입니다.</p>
<div id="memberBox">
	<form action="customerUpdate" id="frm" method="post">
		<table class="table table-bordered">
			<tr id="t">
				<td class="jf1">아이디</td>
				<td colspan="2">${member.id}</td>
			</tr>
			<tr>
				<td class="jf1">이름</td>
				<td colspan="2">${member.name }</td>
			</tr>
			<tr>
				<td class="jf1">생년월일</td>
				<td colspan="2" class="birth"></td>
			</tr>
			<tr>
				<td class="jf1">휴대전화</td>
				<td class="jf2">${member.phone }</td>
			</tr>
			<tr>
			<!-- @기준으로 앞위로 잘라서 넣어야함. -->
				<td class="jf1">전자우편</td>
				<td class="jf2" colspan="2">${member.email }</td>
			</tr>
			<tr>
				<td class="jf1">집주소</td>
				<td colspan="2">${member.address }</td>
			</tr>
			<tr>
				<td class="jf1">선호하는 장르</td>
					<td colspan="2"  class="jf2">
						<p class="p_tag">
						<span class="span">액션 : <input type="checkbox" name="taste" value="액션" class="액션 uc">&nbsp;&nbsp;</span>
						<span class="span">모험 : <input type="checkbox" name="taste" value="모험" class="모험 uc">&nbsp;&nbsp;</span>
						<span class="span">추리 : <input type="checkbox" name="taste" value="추리" class="추리 uc">&nbsp;&nbsp;</span>
						<span class="span">전쟁 : <input type="checkbox" name="taste" value="전쟁" class="전쟁 uc">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">역사 : <input type="checkbox" name="taste" value="역사" class="역사 uc">&nbsp;&nbsp;</span>
						<span class="span">다큐 : <input type="checkbox" name="taste" value="다큐" class="다큐 uc">&nbsp;&nbsp;</span>
						<span class="span">공포 : <input type="checkbox" name="taste" value="공포" class="공포 uc">&nbsp;&nbsp;</span>
						<span class="span">가족 : <input type="checkbox" name="taste" value="가족" class="가족 uc">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">판타지 : <input type="checkbox" name="taste" value="판타지" class="판타지 uc">&nbsp;&nbsp;</span>
						<span class="span">누아르 : <input type="checkbox" name="taste" value="누아르" class="누아르 uc">&nbsp;&nbsp;</span>
						<span class="span">코미디 : <input type="checkbox" name="taste" value="코미디" class="코미디 uc">&nbsp;&nbsp;</span>
						<span class="span">드라마 : <input type="checkbox" name="taste" value="드라마" class="드라마 uc">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">뮤지컬 : <input type="checkbox" name="taste" value="뮤지컬" class="뮤지컬 uc">&nbsp;&nbsp;</span>
						<span class="span">스포츠 : <input type="checkbox" name="taste" value="스포츠" class="스포츠 uc">&nbsp;&nbsp;</span>
						<span class="span">스릴러 : <input type="checkbox" name="taste" value="스릴러" class="스릴러 uc">&nbsp;&nbsp;</span>
						<span class="span">로맨스 : <input type="checkbox" name="taste" value="로맨스" class="로맨스 uc">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">미스터리 : <input type="checkbox" name="taste" value="미스터리" class="미스터리 uc">&nbsp;&nbsp;</span>
						<span class="span">애니메이션 : <input type="checkbox" name="taste" value="애니메이션" class="애니메이션 uc">&nbsp;&nbsp;</span>
						<span class="span">공상과학(SF) : <input type="checkbox" name="taste" value="SF" class="SF uc">&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
		</table>
	<!-- email -->
	<input type="hidden" value="${member.id }" name="id">
	<input type="hidden" value="" id="email" name="email">
	</form>
</div>
</div>
<c:import url="../temp/footer.jsp" />
</body>
<script type="text/javascript">
$("input[type='checkbox']").attr("disabled","disabled");

var taste = '${member.taste}';
taste = taste.split(",");
for(var i in taste){
	$("."+taste[i]).attr("checked","checked");
}


var date = '${member.birth}';
var go = new Date(date).getFullYear()+'년 '+(new Date(date).getMonth()+1)+'월 '+new Date(date).getDate()+'일';
$(".birth").html(go);

</script>
</html>