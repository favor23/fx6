<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- header_plus start -->
<style type="text/css">
li {
width: 25%;
}
#drowdown_id {
	width: 100px;
}
#dd_menu {
border: 1px solid black;
left:-59px;
width: 83px;
}
#dd_menu li{
text-align:center;
width: 100%;
}

li:hover {
	cursor:pointer;
}
</style>
<div class="header_plus" >
	<div class="plus_d1"></div>
	<div class="plus_d2">
		<div class="plus_d2_list">
		<ul>
		<li id="${pageContext.request.contextPath}/member/memberInfo" dropzone="f" class="header_plus_li">
				회원 정보 보기
		</li>
		<li id="${pageContext.request.contextPath}/member/findPw" dropzone="a" class="header_plus_li">
				회원 정보 수정
		</li>
		<li id="${pageContext.request.contextPath}/member/myMovieList?curPage=1" dropzone="f" class="header_plus_li">
				구매한 영화
		</li>
		<li id="${pageContext.request.contextPath}/member/movie_req?id=${member.id}" dropzone="f" class="header_plus_li">
				영화 요청 목록
		</li>	
		<li id="${pageContext.request.contextPath}/member/findPw" dropzone="b" class="header_plus_li">
				회원 탈퇴
		</li>
		
		<li id="${pageContext.request.contextPath}/board/note/noteList" dropzone="f" class="header_plus_li">
				쪽지
		</li>
		<c:if test="${member.grade ne 'normal'}">
		<li id="${pageContext.request.contextPath}/member/myPr" dropzone="n" class="header_plus_li normal">
				나의 프로필
		</li>
		</c:if>
		
		</ul>
		<c:if test="${fn:contains(member.grade,'감독')}" >
		<div class="dropdown" id="dd" style="position:fixed; right: 10px; top:200px;">
  		<button id="drowdown_id" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">영화인
  		<span class="caret"></span></button>
  		<ul class="dropdown-menu" id="dd_menu" style="position: none;">
		<li id="${pageContext.request.contextPath}/board/cart/cartList" dropzone="f" class="sheader_plus_li">
				장바구니
		</li>
		<li id="${pageContext.request.contextPath}/board/order_rent/orderList" dropzone="f" class="sheader_plus_li">
				장비 요청 목록
		</li>  		 
  		</ul>
		</div>
		</c:if>
		</div>
	</div>
</div>
<!-- header_plus end -->
<script>
var grade="${member.grade}";
if(grade!='normal'){
	$(".header_plus_li").css("width","14%");
}else {
	$(".header_plus_li").css("width","16.5%");
}
$(".header_plus_li").click(function() {
	var path=$(this).attr("id");
	var vl=$(this).attr("dropzone");
	if(vl=='f'){		
		location.href=path;
	}else if(vl=='a') {
		location.href=path+"?val="+0;
	}else if(vl=='b') {
		location.href=path+"?val="+1;
	}else {
		var id='${member.id}';
		location.href=path+"?id="+id;
	}
})
</script>

<!-- 필요한곳에  사용
header_plus.jsp
=header_plus_board.jsp, header_plus_mypage.jsp
바꿔서 저장해 아래 목록만들어서 사용하기바람

			<li id="${pageContext.request.contextPath}/board/movie/movieList" class="header_plus_li">
				영화
				</li> 
				id값에 보내고 싶은곳 경로 쓰면됌
	-->
