<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header_plus start -->
<style type="text/css">
li {
width: 25%;
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
		<li id="${pageContext.request.contextPath}/member/memberUpdate" dropzone="f" class="header_plus_li">
				회원 정보 수정
		</li>
		<li id="${pageContext.request.contextPath}/member/" dropzone="f" class="header_plus_li">
				구매한 영화(!)
		</li>
		<c:if test="${member.grade ne normal}">
		<li id="${pageContext.request.contextPath}/member/myPr" dropzone="n" class="header_plus_li normal">
				나의 프로필
		</li>
		<li id="${pageContext.request.contextPath}/mebmer/" dropzone="f" class="header_plus_li normal">
				영화 요청 목록(!)
		</li>	
		</c:if>
		<li id="${pageContext.request.contextPath}/member/dropUser" dropzone="f" class="header_plus_li">
				회원 탈퇴
		</li>
		
		
		</ul>
		</div>
	</div>
</div>
<!-- header_plus end -->
<script>
var grade='${member.grade}';
if(grade=='normal'){
	$(".normal").css("display","none");
	$(".header_plus_li").css("width","25%");
}else {
	$(".header_plus_li").css("width","16.5%");
}
$(".header_plus_li").click(function() {
	var path=$(this).attr("id");
	var vl=$(this).attr("name");
	if(vl=='f'){
		location.href=path;
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
