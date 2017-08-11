<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#tap{
	width: 100%;
	height: 50px;
}

#main_session_default{
	height: 1200px;
	width: 1000px;
	margin: 0 auto;
}
.title_tag{
	text-align:center;
	width:100%;
	height:50px;
	font-weight: bold;
	font-size: 25px;
}

#drop_table {
	width: 600px;
	margin: 50px auto;
}

.reason_span {
	width:130px;
	height: 55px;
	font-weight: bold;
}

#drop_table td{
	vertical-align: middle;
	text-align: center;
}

#drop_table .reason_select{
width:300px;
height: 40px;
}
#drop_table .reason_input{
width:500px;
height: 150px;
resize: none;
}
#dropBtn {
	width: 100px;
	margin-left: 48%;
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
<p class="title_tag">탈퇴 사유를 알려주시면, 더 나은 서비스를 위해 노력하겠습니다.</p>
<form action="" method="post" id="drop_form">
<table class="table table-hover" id="drop_table">
	<tr>
		<td class="reason_span">탈퇴 사유</td>
		<td style="text-align: left;">
			<select class="reason_select" name="reason">
				<option value="유저 관리가 미흡함">유저 관리가 미흡함</option>
				<option value="사이트에 대한 안내가 부족함">사이트에 대한 안내가 부족함</option>
				<option value="사이트 디자인의 개선이 필요함">사이트 디자인의 개선이 필요함</option>
				<option value="영화 관람에 불편함을 느낌">영화 관람에 불편함을 느낌</option>
				<option value="더 이상 이용할 이유가 없음">더 이상 이용할 이유가 없음</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="reason_span">기타 의견</td>
		<td>
			<textarea name="etc_reason"
			id="con_reason" class="reason_input" placeholder="최대 1000자 까지 입력 가능합니다."
			maxlength="1000"></textarea>
			<span id="counter"></span>
		</td>
	</tr>
</table>
<input type="hidden" name="id" value="${member.id }">
</form>
	<button id="dropBtn" class="btn btn-success" onclick="dropStart()">다음</button>
</div>
<c:import url="../temp/footer.jsp" />
</body>
<script type="text/javascript">
//스크립트로 form 넘기기

function dropStart(){
	$("#drop_form").attr("action","${pageContext.request.contextPath}/member/dropUser");
	$("#drop_form").submit();
}

$('#con_reason').keyup(function (){
    var content = $(this).val();
    //$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
    $('#counter').html(content.length + '/1000');
});
$('#con_reason').keyup();


</script>
</html>