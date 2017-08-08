<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


			
			
			<div class="container">
					<div style="margin-top: 25px;" class="top_text">게시판 > 요청게시판</div>
					<div class="view_btn">
					<button href="requiredDelete?num=${view.num}" class="view_bt">Delete</button>
					<button href="requiredReply?num=${view.num}" class="view_bt">Reply</button>
					<button href="requiredUpdate?num=${view.num}" class="view_bt">Update</button>
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
	
