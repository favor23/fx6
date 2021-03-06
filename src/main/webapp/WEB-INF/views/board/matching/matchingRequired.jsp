<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../temp/bootStrap.jsp"></c:import>
<script type="text/javascript">
	$(function() {
		var genre = '${dto.genre}';
		var slice = genre.split("/");

		
		$("input[name=genre]").each(function() {
			 for(var j=0; j<slice.length; j++) {
				if($(this).val()==slice[j]) {
					$(this).prop("checked", "checked");
				}
			}
		});
		
		$(".btn").click(function() {
			$("#frm").submit();
		});
	});
</script>
<style type="text/css">
	#main_section {
		width: 100%;
	}
	
	.main_art1 {
		width: 54%;
		margin: 0 auto;
	}
	
	#head_label {
		width: 100%;
		height: 100px;
		text-align: center;
		line-height: 3;
		font-family: sans-serif;
		font-weight: bold;
		font-size: xx-large;
		border-bottom: 2px solid black;
		margin-top: 50px;
	}
	
	.main_wrap {
		width: 100%;
		height: 100%;
	}
	
	footer {
		margin-top: 100px;
	}
	
	.table {
		border-left: none;
		border-right: none;
		margin-top: 50px;
	}
	
	.table tr td:first-child {
		width: 22%;
		text-align: center;
		font-weight: bold;
	}
	
	.table tr td:last-child {
		width: 78%;
	}
	
	#cb ul {
		float: left;
		margin-right: 50px;
	}
	
	input {
		border-radius: 5px;
		border: 1px solid black;	
	}
	
	textarea {
		border-radius: 5px;
		border: 1px solid black;
	}
	
	.main_art2 {
		width: 54%;
		height: 50px;
		margin: 0 auto;
	}
	
	.main_wrap2 {
		width: 10%;
		height: 100%;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<c:import url="../../temp/header.jsp"/>
	
	<section id="main_section">
		<label id="head_label">시나리오 등록</label>
		<form action="matching${path}" id="frm" method="post" enctype="multipart/form-data">
			<c:if test="${path eq 'Update'}">
				<input type="hidden" name="matching_num" value="${dto.matching_num}">
			</c:if>
			<article class="main_art1">
				<div class="main_wrap">       
					  <table class="table">
					      <tr>
					        <td>영화제목</td>
					        <td>
					        	<input type="hidden" name="writer" value="${member.id}">
								<input type="text" name="title" value="${dto.title}">
							</td>
					      </tr>
					      <tr>
					        <td>형식</td>
					        <td>
					        	<input type="text" name="form" value="${dto.form}" placeholder="단편">
					        </td>
					      </tr>
					      <tr>
					        <td>줄거리</td>
					        <td>
					        	<textarea rows="8" cols="80" name="story" placeholder="300자 이내로 작성해주십시요." maxlength="4000">${dto.story}</textarea>					        	
					        </td>
					      </tr>
					      <tr>
					        <td>시나리오</td>
					       <td>
					        	<textarea rows="8" cols="80" name="scenario" maxlength="4000">${dto.scenario}</textarea>					        	
					        </td>
					      </tr>
					      <tr>
					        <td>공지사항</td>
					       <td>
					        	<textarea rows="8" cols="80" name="notice" maxlength="4000">${dto.scenario}</textarea>					        	
					        </td>
					      </tr>					      
					      <tr>
					        <td>장르</td>
					        <td id="cb">
					        	<ul>
					        		<li><input type="checkbox" name="genre" value="액션">액션</li>
							        <li><input type="checkbox" name="genre" value="모험">모험</li>
							        <li><input type="checkbox" name="genre" value="애니메이션">애니메이션</li>
							        <li><input type="checkbox" name="genre" value="코미디">코미디</li>
					        	</ul>
					        	<ul>
							        <li><input type="checkbox" name="genre" value="범죄">범죄</li>
							       	<li><input type="checkbox" name="genre" value="다큐">다큐</li>
							        <li><input type="checkbox" name="genre" value="드라마">드라마</li>
							       	<li><input type="checkbox" name="genre" value="가족">가족</li>
					        	</ul>
					        	<ul>
							       	<li><input type="checkbox" name="genre" value="판타지">판타지</li>
							       	<li><input type="checkbox" name="genre" value="느와르">느와르</li>
							        <li><input type="checkbox" name="genre" value="역사">역사</li>
							       	<li><input type="checkbox" name="genre" value="공포">공포</li>
					        	</ul>
					        	<ul>
							       	<li><input type="checkbox" name="genre" value="뮤지컬">뮤지컬</li>
							       	<li><input type="checkbox" name="genre" value="미스터리">미스터리</li>
							       	<li><input type="checkbox" name="genre" value="멜로">멜로</li>
							        <li><input type="checkbox" name="genre" value="SF">SF</li>
					        	</ul>
					        	<ul>
							       	<li><input type="checkbox" name="genre" value="스포츠">스포츠</li>
							       	<li><input type="checkbox" name="genre" value="스릴러">스릴러</li>
							       	<li><input type="checkbox" name="genre" value="전쟁">전쟁</li>
							       	<li><input type="checkbox" name="genre" value="서부극">서부극</li>				        		
					        	</ul>
					        </td>
					      </tr>
					      <c:if test="${path eq 'Write'}">
						      <tr>
						        <td>포스터이미지</td>
						        <td>
						        	<input type="file" name="f1">
						        </td>
						      </tr>
					      </c:if>
					  </table>
				</div>
			</article>
			<article class="main_art2">
				<div class="main_wrap2">
					<input type="button" class="btn btn-info" value="추가하기">
				</div>
			</article>
		</form>
	</section>
	
	<c:import url="../../temp/footer.jsp"/>
</body>
</html>