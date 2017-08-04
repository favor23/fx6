<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<c:import url="../temp/bootStrap_black.jsp" />
<title>MyPage</title>
<c:if test="${member.grade eq normal  }">
	<link href="<c:url value="/css/member_noraml.css"/>" type="text/css" rel="stylesheet">
</c:if>
<c:if test="${member.grade ne normal }">
	<link href="<c:url value="/css/member_other.css"/>" type="text/css" rel="stylesheet">
</c:if>
</head>
<body>
	<c:import url="../temp/header.jsp" />

	<div id="controlBox">
		<ul id="shj_ul">
			<li class="liBtn" id="memberView" style="background-image: url('<c:url value="/img/icon/user-2.png"/>');">
			회원 정보 보기</li>
			<li class="liBtn" id="memberUpdate" style="background-image: url('<c:url value="/img/icon/user-2.png"/>');">
			회원 정보 수정</li>
			<li class="liBtn" id="memberDrop" style="background-image: url('<c:url value="/img/icon/user-2.png"/>');">
			회원 탈퇴</li>
			<c:if test="${member.grade ne normal }">
				<li class="liBtn" id="memberPr" style="background-image: url('<c:url value="/img/icon/user-2.png"/>');">
				나의 프로필</li>
			</c:if>
		</ul>
	</div>
	<section id="container">
		<div id="main_box" ></div>
		<!-- ghhghg -->
		<form action="delete" method="post" id="frm">
			<input type="hidden" id="id" name="id" value="${member.id }">
			<input type="hidden" id="pw" name="pw" value="">
		</form>
	</section>
	<script type="text/javascript">
			$.get("memberInfo",function(data){
				$("#main_box").html(data);				
			});
			
			$("#memberView").click(function(){
				$.get("memberInfo",function(data){
					$("#main_box").html(data);				
				});
			});
			
			$("#memberUpdate").click(function(){
				$.get("memberUpdate",function(data){
					$("#main_box").html(data);				
				});			
			});
			
			
			$("#memberPr").click(function(){
			/* var specs = "left=10,top=10,width=940px,height=600px"; 
				specs += ",toolbar=no,menubar=no,status=no,resizable=no";
				window.open("./myPr?id="+id, "writePr", specs);*/
				var memberId='${member.id}';
			     $.ajax({
		               type: 'GET',
		               url: 'myPr',
		               data: "id="+memberId,
		               success: function(data) {
		                    if(data != null) {
		                    	$("#main_box").html(data);
		                    }
		               }
		          });
			});
			
			
		$(".liBtn").mousemove(function(){
			$(this).addClass("active");
		});
		$(".liBtn").mouseleave(function(){
			$(this).removeClass("active");
		});
		//클릭했을때 변하는거
		
    var vid = "memberView";
		$(".liBtn").click(function(){
			var id = $(this).attr("id");
			if(id!=vid){
				$("#"+vid).removeClass("ho");
				$(this).addClass("ho");
			}
			vid = id;
		});
		
	
		
	
		
				
			
		 
		
		
	</script>

	<c:import url="../temp/footer.jsp" />
</body>
</html>