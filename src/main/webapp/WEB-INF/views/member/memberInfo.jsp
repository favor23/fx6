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
#memberBox {
	border: 1px solid black;
	width: 70%;
	margin-left: 15%;
	padding: 15px;
}
#member_box td {
	height: 30px;
	padding-top: 8px;
	padding-bottom: 8px;
	padding-left: 8px;
	vertical-align: middle;
	border: 0.5px solid gray;
}


#member_box select {
	border-color: black;
	border-radius: 5px;
	height: 25px;
}

.jf1 {
	text-align: center;
	width: 15%;
}

.jf2 {
	width: 60%;
}

.p_tag {
	margin-top: 10px;
	height: 30px;
}
.info_table {
margin-top: 20px;
	width: 100%;
}
#headTag {
	width:250px;
	margin-left: 10%;
	border-bottom: 2px solid green;
}

</style>
</head>
<body>
	<!-- 아이디 비번 폰 이메일 주소 성별 직업 이름 나이 grade result -->
	<div id="member_box">
			<p id="headTag">${member.name } 님의 회원 정보</p>
			<table class="table-hover">
				<tr>
					<td class="jf1">아이디</td>
					<td class="jf2">${member.id }</td>
				</tr>
				<tr>
					<td class="jf1">생년월일</td>
					<td class="jf2 birth"></td>
				</tr>
				<tr>
					<td class="jf1">이름</td>
					<td class="jf2">${member.name }</td>
				</tr>
				<tr>
					<td class="jf1">휴대전화</td>
					<td class="jf2">${member.phone }</td>
				</tr>
				<tr>
					<td class="jf1">전자우편</td>
					<td class="jf2">${member.email }</td>
				</tr>
				<tr>
					<td class="jf1">집주소</td>
					<td class="jf2">${member.address }</td>
				</tr>
				<tr>
					<td class="jf1">성별</td>
					<td class="jf2">${member.sung }</td>
				</tr>

				<tr>
					<td class="jf1">직업</td>
					<td  class="jf2">
					<c:if test="${member.job =='director' }">
					감독
					</c:if>
					<c:if test="${member.job =='writer' }">
					작가
					</c:if>
					<c:if test="${member.job =='user' }">
					유저
					</c:if>
				</tr>

				<tr>
				<td class="jf1">선호하는 장르</td>
					<td colspan="2"  class="jf2">
						<p class="p_tag">
						<span class="span">공포 : <input type="checkbox" id="horror" value="horror" class="chkBox">&nbsp;&nbsp;</span>
						<span class="span">추리 : <input type="checkbox" id="reasoning" value="reasoning" class="chkBox">&nbsp;&nbsp;</span>
						<span class="span">스릴러 : <input type="checkbox" id="thrill" value="thrill" class="chkBox">&nbsp;&nbsp;</span>
						</p>
						<p class="p_tag">
						<span class="span">코미디 : <input type="checkbox" id="comic" value="comic" class="chkBox">&nbsp;&nbsp;</span>
						<span class="span">로멘스 : <input type="checkbox" id="romance" value="romance" class="chkBox">&nbsp;&nbsp;</span>
						<span class="span">액션 : <input type="checkbox" id="action" value="action" class="chkBox">&nbsp;&nbsp;</span>
						<span class="span">성인 : <input type="checkbox" id="adult" value="adult" class="chkBox">&nbsp;&nbsp;</span>
						</p>
					</td>
				
				</tr>
				
			</table>
	</div>
	<script type="text/javascript">
	$(".chkBox").attr("disabled","true");
	var taste = '${member.taste}';
	var split = taste.split(",");
	for(var i in split){
		$("#"+split[i]).attr("checked","checked");
	}
	
	var date = '${member.birth}';
	var go = new Date(date).getFullYear()+'년 '+new Date(date).getDay(date)+'월 '+new Date(date).getDate(date)+'일';
	$(".birth").html(go);
	
	</script>
</body>
</html>