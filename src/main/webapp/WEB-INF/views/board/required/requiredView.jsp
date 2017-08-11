<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


			
			
			<div class="container">
					<div style="margin-top: 25px;" class="top_text">게시판 > 요청게시판</div>
					<div class="view_btn">
					<c:if test="${member.id eq view.writer}">
					<button class="view_bt bt_del">Delete</button>
					<button class="view_bt bt_re" >Reply</button>
					<button  class="view_bt bt_up">Update</button>
					</c:if>
					</div>
			<table id="viewtable" style="margin-top:10px;">
		
		
			<tr class="viewtr">
				<td class="td1 view_td"><div class="view_mar">작성자</div></td>
				<td class="view_td"><div class="view_mar">${view.writer}</div></td>	
			</tr>
	
			<tr class="viewtr">	
				<td  class="td1 view_td"><div class="view_mar">글제목</div></td>
				<td class="view_td"><div class="view_mar">${view.title}</div></td>		
			</tr>

			<tr>
				<td colspan="2"><div class="contentsView" style="padding: 10px;'">${view.contents}</div></td>
			</tr>
	
	
		</table>
		</div>
	<script type="text/javascript">
	
	

	$(".bt_del").click(function () {
		
		location.href='requiredDelete?num=${view.num}';
		
	});
	
	$(".bt_re").click(function () {
		
		location.href='requiredReply?num=${view.num}';
		
	});
	
$(".bt_up").click(function () {
		
		location.href='requiredUpdate?num=${view.num}';
		
	});
	
	</script>
