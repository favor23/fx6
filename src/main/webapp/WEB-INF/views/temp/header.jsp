<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header start -->
<header>
   <div id="header_bar">
      <ui>
      <li id="bar_logo" class="${pageContext.request.contextPath}/index"><img
         id="bar_logo" class="${pageContext.request.contextPath}/index"
         style="cursor: pointer;"
         src="<c:url value="/img/index/로고2.jpg"/>"></li>
      <li id="${pageContext.request.contextPath}/board/movie/movieList"
         class="header_li">영화</li>
      <li id="${pageContext.request.contextPath}/board/cinema/cinema_list" class="header_li">상영관</li>
      <div class="dropdown">
         <li id="header_board" class="dropdown-toggle" data-toggle="dropdown"
            style="line-height: 49px; text-align: center; border-right: 1px solid #e5e5e5; float: left; font-weight: bold; height: 49px; width: 130px; cursor: pointer;">
            게시판</li>
         <ul class="dropdown-menu"
            style="position: absolute; width: 100px; top: 48px; left: 470px; background-color: white; border: 0.1px solid #e5e5e5;">
            <li><a href="${pageContext.request.contextPath}/board/required/requiredList">요청게시판</a></li>
            <li><a href="${pageContext.request.contextPath}/board/review/reviewList">리뷰게시판</a></li>
          	<c:if test="${!empty member}">
          	<c:if test="${member.grade ne normal}">
          	<li><a href="${pageContext.request.contextPath}/board/rent/rentList">감독렌트게시판</a></li>
         	</c:if>
         	</c:if>
         </ul>
      </div>
      </li>
      <li id="${pageContext.request.contextPath}/crowd_funding/cf_index" class="header_li">펀딩</li>
   <%--    <li id="${pageContext.request.contextPath}/board/matching/matchingList" class="header_li">매칭시스템</li> --%>
      <li id="${pageContext.request.contextPath}/board/matching/matchingList" class="header_li">시나리오</li>
      <c:if test="${empty member}">
      <div class="dropdown"
            style="height: 50px; width: 150px; float: right;">
            <li id="bar_login" class="dropdown-toggle" type="button"
               data-toggle="dropdown">로그인</li>  
              <ul class="dropdown-menu" id="css_Id"
               style="background-color: white; margin: 0 0 0 0; border: 0.1px solid #e5e5e5;">
               <li style="position: absolute;right: 500px;">
               <div class="cont_forms">
					<div class="cont_form_login">
						<h2>LOGIN</h2>
					<span id="redCode"></span>
						<input type="text" placeholder="ID" id="input_id" /> <input
							type="password" placeholder="Password" id="input_pw" onkeypress="keycheck(event)"/>
						<button class="btn_login_s" onclick="cambiar_login()">LOGIN</button>
						<button class="btn_login_s2" onclick="naver_login()">네이버 아이디로 로그인</button>
						<button class="btn_sign_up" onclick="cambiar_sign_up()">아직 회원이 아니신가요?</button>
					</div>
					<div class="cont_form_sign_up">
						<a href="#" onclick="ocultar_login_sign_up()">
						<i class="material-icons">X</i></a>
					</div>

				</div>
               </li>
               </ul>          
         </div>

      </c:if> <c:if test="${!empty member}">
         <div class="dropdown"
            style="height: 50px; width: 150px; float: right;">
            <li id="bar_login" class="dropdown-toggle" type="button" data-toggle="dropdown"
            style="width: 220px;">${member.name}님반갑습니다.</li>
               <c:if test="${member.grade ne 'admin'}">
            <ul class="dropdown-menu"
               style="background-color: white; margin: 0 0 0 0; border: 0.1px solid #e5e5e5;">
               <li><a href="${pageContext.request.contextPath}/member/memberInfo">마이페이지</a></li>
               <li><a href="${pageContext.request.contextPath}/board/note/noteList">쪽지</a></li>
               <li><a href="${pageContext.request.contextPath}/member/logOut">로그아웃</a></li>               
            </ul>
            </c:if>
            <c:if test="${member.grade eq 'admin'}">
            <ul class="dropdown-menu"
               style="background-color: white; margin: 0 0 0 0; border: 0.1px solid #e5e5e5;">
               <li><a href="${pageContext.request.contextPath}/member/myPage">사원 마이페이지</a></li>
               <li><a href="${pageContext.request.contextPath}/board/note/noteList">쪽지</a></li>
               <li><a href="${pageContext.request.contextPath}/admin/adminBusiness">업무페이지</a></li>
               <li><a href="${pageContext.request.contextPath}/member/logOut">로그아웃</a></li>               
            </ul>
            </c:if>
         </div>
      </c:if> </ui>
   </div>
   <div>
   </div>
   <div id="remote_area"></div>
</header>
<!-- header end -->
<script>

	var id='${member.id}';
	$.get("${pageContext.request.contextPath}/admin/worker?id="+id,function(chk){
		chk=chk.trim();
		if(chk=="work"){
			remote();
		}
	});
	
	

function remote(){
	$.get("${pageContext.request.contextPath}/temp/remote",function(data){
		$("#remote_area").html(data);
	});
}

$("#bar_logo").click(function() {
   location.href=$(this).attr("class");
})
$(".admin_li").click(function() {
   location.href=$(this).attr("id");
})
$(".header_li").click(function() {
   location.href=$(this).attr("id");
})

$("#bar_login").click(function(){
	$("#css_Id").toggle();
	document.querySelector('.cont_form_login').style.opacity = "1";
});


/* ------------------------------------ Click on login and Sign Up to  changue and view the effect
		 ---------------------------------------
		 */

		function cambiar_login() {
				var id = $("#input_id").val();
				var pw = $("#input_pw").val();
				$.post("${pageContext.request.contextPath}/member/customerLogin",{
					id:id,
					pw:pw
				},function(data){
					if(data==0){
						$("#redCode").html("비밀번호를 다시 확인해주세요.");
						$("#input_pw").val("");
					}else if(data==1){
						location.href="${pageContext.request.contextPath}/index";
					}else {
						$("#redCode").html("등록되지 않은 아이디 입니다.");
						$("#input_pw").val("");
					}
				});
				
			

			//setTimeout("dropDown()", 400);

			/* setTimeout(function() {
						document.querySelector('.cont_form_sign_up').style.display = "none";
					}, 200); */
		}

		function cambiar_sign_up() {
			location.href = "${pageContext.request.contextPath}/member/join";

		}
		
		/* function dropDown(){
			document.querySelector('.cont_form_login').style.opacity = "1";
		} */
		
		
		function naver_login(){
			var path;
			$.get("${pageContext.request.contextPath}/nlogin",function(data){
				location.href=data;		
			});
		}
		
		function keycheck(evt){
		    var keyCode = evt.which?evt.which:event.keyCode;
		    if(keyCode==13){
		    	cambiar_login();
		    }
		}
		
		


</script>