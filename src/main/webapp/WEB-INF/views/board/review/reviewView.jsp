<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			
			
			<div class="container">
			<div style="margin-top: 25px;" class="top_text" >게시판 > 리뷰게시판</div>
			<div class="view_btn">
			<button href="reviewDelete?num=${view.num}" class="view_bt">Delete</button>
			<button href="reviewUpdate?num=${view.num}" class="view_bt">Update</button>
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
			<tr class="viewtr">				
				<td  class="td1 view_td"><div class="view_mar">좋아요</div></td>
				<td class="view_td"><div class="view_mar">${view.thumbs_up}</div></td>
			</tr>			
			<tr class="viewtr">
			<td  class="td1 view_td"><div class="view_mar">별점</div></td>
				<c:if test="${view.stars eq '1'}">

					<td><img src="<c:url value="/img/reviewimg/star1.jpg"/>"></td>				
				</c:if>
				<c:if test="${view.stars eq '2'}">
					<td><img src="<c:url value="/img/reviewimg/star2.jpg"/>"></td>				
				</c:if>
				<c:if test="${view.stars eq '3'}">
					<td><img src="<c:url value="/img/reviewimg/star3.jpg"/>"></td>				
				</c:if>
				<c:if test="${view.stars eq '4'}">
					<td><img src="<c:url value="/img/reviewimg/star4.jpg"/>"></td>				
				</c:if>
				<c:if test="${view.stars eq '5'}">
					<td><img src="<c:url value="/img/reviewimg/star5.jpg"/>"></td>				

				</c:if>
				</tr>
			<tr>
				<td colspan="2"><div class="contentsView" style="padding: 10px;'">${view.contents}</div></td>
			</tr>
		</table>
			
		</div>
	
	
	


