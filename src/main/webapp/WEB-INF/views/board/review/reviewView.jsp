<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			
			
			<div class="container">
			<h6 style="margin-top: 25px;">게시판 > 리뷰게시판</h6>
			<table id="viewtable" style="margin-top:10px;">
		
		
		
			<tr class="viewtr">
				<th colspan="2">${view.num}</th>
				<th style="text-align: right;">${view.writer}</th>
			</tr>
	
			<tr>				
				<td>${view.title} ${view.reg_date}</td>
				<td style="text-align: right;">${view.hit}</td>
				<td style="text-align: right;">${view.thumbs_up}</td>
			</tr>			
			<tr>
				<c:if test="${view.stars eq '1'}">
					<td colspan="3"><img src="<c:url value="/img/reviewimg/star1.JPG"/>"></td>				
				</c:if>
				<c:if test="${view.stars eq '2'}">
					<td colspan="3"><img src="<c:url value="/img/reviewimg/star2.JPG"/>"></td>				
				</c:if>
				<c:if test="${view.stars eq '3'}">
					<td colspan="3"><img src="<c:url value="/img/reviewimg/star3.JPG"/>"></td>				
				</c:if>
				<c:if test="${view.stars eq '4'}">
					<td colspan="3"><img src="<c:url value="/img/reviewimg/star4.JPG"/>"></td>				
				</c:if>
				<c:if test="${view.stars eq '5'}">
					<td colspan="3"><img src="<c:url value="/img/reviewimg/star5.JPG"/>"></td>				
				</c:if>
				</tr>
			<tr>
				<td colspan="5">${view.contents}</td>
			</tr>
		</table>
			<div class="view_btn">
			<button href="reviewDelete?num=${view.num}" class="view_bt">Delete</button>
			<button href="reviewUpdate?num=${view.num}" class="view_bt">Update</button>
			</div>
		</div>
	
	
	
