<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../temp/bootStrap.jsp"></c:import>
<style type="text/css">
#main_section {
	width: 60%;
	height: 1000px;
	background-color: yellow;
	margin: 0 auto;
	margin-top: 50px;
}

.img_section {
	width: 70%;
	height: 300px;
	background-color: red;
	float: left;
}

.profile_section {
	width: 30%;
	height: 300px;
	background-color: blue;
	float: right;
}

.main_area {
	width: 70%;
	height: 700px;
	background-color: gray;
	float: left;
}

.apply_area {
	width: 30%;
	height: 700px;
	background-color: purple;
	float: right;
}

.button {
	width: 80%;
	height: 30px;
	margin-top: 5%;
	margin-left: 10%;
}

.writer_pro {
	width: 90%;
	height: 75%;
	background-color: white;
	margin-left: 5%;
	margin-top: 3%;
}

.writer_pro2 {
	width: 90%;
	height: 23%;
	background-color: orange;
	margin-left: 5%;
	margin-top: 2%;
}
</style>
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>



	<section id="main_section">


		<div class="img_section" style="overflow: auto;">
			<img src="<c:url value="${dto.matching_img}"/>" class="pic-image"
				alt="Pic">
		</div>

		<div class="profile_section">
			<div class="writer_pro">
				<p>감독 : ${dto.writer}</p>
				<p>장르 : ${dto.genre}</p>
				<p>형식 : ${dto.form}</p>
				<p>줄거리 : ${dto.story}</p>
				<p>작성일 : ${dto.reg_date}</p>
			</div>
			<div class="writer_pro2">
				<input type="button" value="작가 프로필" class="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#writerPr">
			</div>
			
			<div class="modal fade" id="writerPr" role="dialog">
				    <div class="modal-dialog modal-lg">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">${dto.writer}님의 PR입니다.</h4>
				        </div>
				        <div class="modal-body">
				          <p> 이름 :  ${member.name}</p>
				          <p> 작가 아이디 :  ${member.id}</p>
				          <p> 생년월일 :  ${member.birth}</p>
				          <c:if test="${!empty prDTO }">
				          	<p>수상경력 : ${prDTO.award }</p>
							<p>최종학력 : ${prDTO.education }</p>
							<p>작품활동 : ${prDTO.activity }</p>
				          </c:if>
				          <c:if test="${empty prDTO}">
							[아직 자기소개를 작성하지 않으셨습니다.]				
							</c:if>	
				          
				          
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
							
			
			
			
		</div>


		<div class="main_area">



			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">시나리오</a></li>
				<li><a data-toggle="tab" href="#menu1" id="${dto.matching_num}" class="director_list">감독 지원 현황</a></li>
				<li><a data-toggle="tab" href="#menu2" id="${dto.matching_num}" class="actor_list">배우 지원 현황</a></li>
				<li><a data-toggle="tab" href="#menu3" id="${dto.matching_num}" class="staff_list">스탭 지원 현황</a></li>
				<li><a data-toggle="tab" href="#menu4">공지사항</a></li>
			</ul>

			<div class="tab-content">
				<div id="home" class="tab-pane fade in active">
					<h3>시나리오</h3>
					<p>${dto.scenario }</p>
				</div>
				<div id="menu1" class="tab-pane fade">
					<div id="menu1_form"></div>
					
				</div>
				<div id="menu2" class="tab-pane fade">
						<div id="menu2_form"></div>
				</div>
				<div id="menu3" class="tab-pane fade">
						<div id="menu3_form"></div>
				</div>
				<div id="menu4" class="tab-pane fade">
					<h3>공지사항</h3>
					<p>${dto.notice}</p>
				</div>
			</div>
		</div>



		<div class="apply_area">


			<!-- 감독 지원/모달 -->
			<button type="button" class="button" data-toggle="modal" data-target="#directorModal">감독 지원하기</button>
			
			<form id="director_frm" method="post" action="applyWrite">
			<div class="modal fade" id="directorModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title" style="text-align: center;">감독 지원하기</h4>
						</div>
						<div class="modal-body">
							<p style="font-size: x-small;">※등록해놓은 프로필이 자동으로 등록되며 변경된 사항이 있을 경우 프로필 업데이트 후 지원 바랍니다. ※</p>
							<br>
							<p style="font-size: small;">작가에게 남기고 싶은 말</p>
							<br>
							<textarea rows="10px" cols="70px" name="towriter"></textarea>
							<input type="hidden" name="id" value="${member.id}">
							<input type="hidden" name="name" value="${member.name}">
							<input type="hidden" name="matching_num" value="${dto.matching_num}" >
							<input type="hidden" name="apply_roll" value="감독">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="director_apply">지원하기</button>
						</div>
					</div>
				</div>
			</div>
			</form>
			
			<!-- 배우 지원/모달 -->
			<button type="button" class="button" data-toggle="modal" data-target="#actorModal">배우 지원하기</button>
			
			<form id="actor_frm" method="post" action="applyWrite">
			<div class="modal fade" id="actorModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">배우 지원하기</h4>
						</div>
						<div class="modal-body">
							<p style="font-size: x-small;">※등록해놓은 프로필이 자동으로 등록되며 변경된 사항이 있을 경우 프로필 업데이트 후 지원 바랍니다. ※</p>
							<br>
							<p style="font-size: small;">작가에게 남기고 싶은 말</p>
							<br>
							<textarea rows="10px" cols="70px" name="towriter"></textarea>
							<input type="hidden" name="id" value="${member.id}">
							<input type="hidden" name="name" value="${member.name}">
							<input type="hidden" name="matching_num" value="${dto.matching_num}" >
							<input type="hidden" name="apply_roll" value="배우">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="actor_apply">지원하기</button>
						</div>
					</div>
				</div>
			</div>
			</form>
			
			
			<!-- 스텝 지원/모달 -->
			<button type="button" class="button" data-toggle="modal" data-target="#staffModal">스텝 지원하기</button>
			<form id="staff_frm" method="post" action="applyWrite">
			<div class="modal fade" id="staffModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">스텝 지원하기</h4>
						</div>
						<div class="modal-body">
							<p style="font-size: x-small;">※등록해놓은 프로필이 자동으로 등록되며 변경된 사항이 있을 경우 프로필 업데이트 후 지원 바랍니다. ※</p>
							<br>
							<p style="font-size: small;">작가에게 남기고 싶은 말</p>
							<br>
							<textarea rows="10px" cols="70px" name="towriter"></textarea>
							<input type="hidden" name="id" value="${member.id}">
							<input type="hidden" name="name" value="${member.name}">
							<input type="hidden" name="matching_num" value="${dto.matching_num}" >
							<input type="hidden" name="apply_roll" value="스텝">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="staff_apply">지원하기</button>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
		

<script type="text/javascript">

	$(function () {
	
		$("#director_apply").click(function () {			
			$("#director_frm").submit();
		
		});
		
		$("#actor_apply").click(function () {
			$("#actor_frm").submit();
			
			});
		
		$("#staff_apply").click(function () {
			
			$("#staff_frm").submit();
			
			});
		
		$(".director_list").click(function(){
			var mnum=$(this).attr("id");
			
			
			$.ajax({
				
				url : "applyList?matching_num="+mnum,
				datatype: "get",
				success : function(data) {
					
					$("#menu1_form").html(data.trim());
				}
				
			});
		
		});
		
		$(".actor_list").click(function(){
			var mnum=$(this).attr("id");
			
			
			$.ajax({
				
				url : "applyList2?matching_num="+mnum,
				datatype: "get",
				success : function(data) {
					
					$("#menu2_form").html(data.trim());
				}
				
			});
		
		});
		
		
		$(".staff_list").click(function(){
			var mnum=$(this).attr("id");
			
			
			$.ajax({
				
				url : "applyList3?matching_num="+mnum,
				datatype: "get",
				success : function(data) {
					
					$("#menu3_form").html(data.trim());
				}
				
			});
		
		});
		
	
	
	
	
	});
	


</script>
	</section>
	<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>