<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
	<title>Home</title>
	<style type="text/css">
button {
	border: 1px solid gray;
	border-radius: 5px;
}
#join{
	background-color: white;
}
#login{
background-color: white;
}

#myPage {
background-color: white;
}

#logOut{
background-color: white;
}
</style>
</head>
<body>
<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>

	<c:if test="${member == null }">
		<button id="join">회원가입</button>
		<button id="login">로그인</button>
	</c:if>
	<c:if test="${member != null }">
	<button id="myPage">마이페이지</button>
		<button id="logOut">로그아웃</button>
		
	</c:if>
	<c:if test="${member.id!=null }">
	접속자 아이디 : ${member.id } 
	</c:if>
	

	<script type="text/javascript">
		$("#join").click(function() {
			location.href="member/join";
		});
		$("#login").click(function() {
			location.href="member/login";
		});
		$("#myPage").click(function() {
			location.href="member/myPage";
		});
		$("#logOut").click(function() {
			location.href="member/logOut";
		});
		
	</script>

<a href="chatting/aaa">aaa</a>
<a href="paySystem/aaa1">aaa1</a>
<a href="paySystem/pay24">pay24</a>
<a href="index">index</a>
<a href="defaultPage">defaultPage</a>
<a href="board/movie/movieList">movieList</a>
<a href="board/review/reviewList">reviewList</a>
<a href="board/required/requiredList">requiredList</a>
<a href="chatting/chat1">chat1</a>
<a href="chatting/chat2">chat2</a>
<a href="chatting/chat3">chat3</a>
<a href="chatting/chat4">chat4</a>
<a href="chatting/chat5">chat5</a>
<a href="admin/adminPage">adminPage</a>
<a href="board/cinema/cinema_list">cinema_list</a>
<a href="board/cinema/cinema_my">cinema_my</a>
<a href="board/cinema/cinema_time">cinema_time</a>
<a href="crowd_funding/campaign/campaignCreate">campaignCreate</a>
<a href="crowd_funding/cf_index">cf_index</a>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>