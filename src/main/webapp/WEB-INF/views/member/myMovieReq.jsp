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


</style>
<c:import url="../temp/bootStrap_black.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_member.jsp" />
<div id="main_session_default">
<p id="title">${member.id } 님의 영화 요청 목록입니다.</p>
<c:forEach items="${list }" var="list">
	<c:if test="${list.writer eq member.id}">
		${list.num }
	</c:if>
</c:forEach>
</div>

<c:import url="../temp/footer.jsp" />
</body>
<script type="text/javascript">

</script>
</html>