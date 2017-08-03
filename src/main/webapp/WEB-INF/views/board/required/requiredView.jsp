<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			
			
			<div class="container">
			<table id="viewtable" style="margin-top:50px;">
		
		
		
			<tr class="viewtr">
				<td>${view.num}</td>
				<td style="text-align: right;">${view.writer}</td>
			</tr>
	
			<tr>
				
				<td>${view.title} ${view.reg_date}</td>
				<td style="text-align: right;">${view.hit}</td>
				
			</tr>

			<tr>
				<td colspan="2">${view.contents}</td>
			</tr>
	
	
		</table>
		</div>
	
	
	<a href="requiredUpdate?num=${view.num}">Update</a>
	<a href="requiredDelete?num=${view.num}">Delete</a>
	<a href="requiredReply?num=${view.num}">Reply</a>

