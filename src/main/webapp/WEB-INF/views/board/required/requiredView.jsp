<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


			
			
			<div class="container">
					<h6 style="margin-top: 25px;">게시판 > 요청게시판</h6>
			<table id="viewtable" style="margin-top:10px;">
		
		
		
			<tr class="viewtr">
				<td>${view.num}</td>
				<td style="text-align: right;">${view.writer}</td>
			</tr>
	
			<tr class="viewtr">	
				<td>${view.title} ${view.reg_date}</td>
				<td style="text-align: right;">${view.hit}</td>
				
			</tr>

			<tr>
				<td colspan="2">${view.contents}</td>
			</tr>
	
	
		</table>
	<div class="view_btn">
	<button href="requiredDelete?num=${view.num}" class="view_bt">Delete</button>
	<button href="requiredReply?num=${view.num}" class="view_bt">Reply</button>
	<button href="requiredUpdate?num=${view.num}" class="view_bt">Update</button>
	</div>
		</div>
	
