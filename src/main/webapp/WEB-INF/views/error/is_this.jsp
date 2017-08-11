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
	height: 460px;
	width: 710px;
	margin: 0 auto;
}
.img404{
	margin: 0 auto;
	margin-top: 100px;
	cursor: pointer;
}


</style>
<c:import url="../temp/bootStrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus.jsp" />
<div id="main_session_default">
	<div class="img404">
		이미 구매하신 영화입니다.
	</div>
</div>
<c:import url="../temp/footer.jsp" />
</body>
<script type="text/javascript">
$(".img404").click(function() {
	location.href="${pageContext.request.contextPath}/index";
})
</script>
</html>