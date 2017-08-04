<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
	<title>Home</title>
	<style type="text/css">
#hojeong {
	width: 100px;		
}
	
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
body{
	height: 3000px;
	width: auto;
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

<h2>유경이</h2>
<a href="paySystem/aaa">aaa</a>
<a href="paySystem/pay24">pay24</a>
<a href="index">index</a>
<a href="board/movie/movieList">movieList</a>
<a href="board/matching/matchingList">matchingList</a>
<a href="board/review/reviewList">reviewList</a>
<a href="board/required/requiredList">requiredList</a>
<a href="board/note/noteList">noteList</a>
<a href="chatting/chat">chat</a>
<a href="board/rent/rentList">rentList</a>
<a href="board/cart/cartList">cart</a>



<div>
<p>======호정==========================</p>
<div style="width: 600px;height: 400px;border: 1px solid black;">
	<p>이미지 경로 테스트</p>
	
<img id="hojeong" alt="" src="<c:url value="/upload/1501585824954_KakaoTalk_20170704_115722091.jpg"/>">
<h5>/upload/1501586621585_lupeow.png</h5>
</div>

<a href="emailTest/naverlogin">@@@@@ naver @@@@@</a>
<a href="chatting/aaa">CHAT</a>
<a href="member/myGenre">GENRE_TEST</a>
<a href="member/admin/banProccessList">밴 처리한거 결과물 불러오는 게시판</a>
<a href="member/logintester">로그인 폼 테스트</a>

	<c:if test="${member == null }">
		<button id="join">회원가입</button>
		<button id="login">로그인</button>
	</c:if>
	<c:if test="${member != null }">
	<button id="myPage">마이페이지</button>   
		<button id="logOut">로그아웃</button>
		<img alt="" src="/fx6/upload/1500626921849_KakaoTalk_20170704_115722091.jpg">
	</c:if>
	<c:if test="${member.grade ne 'admin'}">
	<div>
		<p>내가 고른 장르들 담아서 보내기</p>
		<button id="gl">장르리스트로</button>
		<div id="gg"></div>
		<form action="member/myGenreList" method="post" id="f">
			<input type="text" name="curPage" value="1">
			<input type="text" name="ar" value="${member.taste }">
		</form>
	</div>
	<input type="hidden" id="mg" value="${member.taste }">
	</c:if>
	<script type="text/javascript">
	$("#gl").click(function(){
		var chk=/,/;
		var myGenre=$("#mg").val();
		var bln = chk.test(myGenre);
		if(bln){
			$("#f").submit();		
		}else {
			$("#f").attr("action","member/myGenreList2");
			$("#f").submit();
		}
	});
	
	
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
	
	

<a href="paySystem/aaa">aaa</a>
<a href="paySystem/pay24">pay24</a>
<a href="index">index</a>
<a href="movie/movieList">movieList</a>
<a href="review/reviewList">reviewList</a>
<a href="required/requiredList">requiredList</a>
<a href="chatting/chat">chat</a>
<P>  The time on the server is ${serverTime}. </P>
</div>

<p>===성재형==========성재형==========성재형==========성재형==========성재형==========성재형==========성재형==========성재형==========성재형=====================================================================</p>
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
<button id="chat1">aaa</button>
<button id="chatb">bbb</button>
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
<a href="movieupload/movieupload">movieupload</a>
<P>  The time on the server is ${serverTime}. </P>
</body>
<script type="text/javascript">
$("#chatb").click(function() {
	window.open("chatting/bbb", "", "width=1600 height=900 scrollbars=no toolbar=no resizable=no");
});

$("#chat1").click(function() {
	window.open("chatting/aaa", "", "width=1600 height=900 scrollbars=no toolbar=no resizable=no");
});
</script>
</html>