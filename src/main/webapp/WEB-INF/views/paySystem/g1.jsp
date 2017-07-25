<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${totalpay != 0}">
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">결제 정보 입력</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="#">선택</a></li>
			<li class="active"><a id="g1">Card</a></li>
			<!-- <li><a id="g2">무통장 입금</a></li> -->
		</ul>
	</div>
</nav>
</c:if>
<c:if test="${totalpay != 0}">
<h2>카드 결제</h2>
</c:if>
<div>
<c:if test="${totalpay != 0}">
	<table class="table">
		<tr>
			<td><label for="usr">카트선택</label></td>
			<td colspan="3"><select>
					<option>신한카드</option>
					<option>비씨카드</option>
					<option>삼성카드</option>
					<option>KB국민카드</option>
					<option>현대카드</option>
					<option>롯데카드</option>
					<option>하나[구 하나 SK]카드</option>
					<option>하나[구 외환]카드</option>
					<option>NH농협카드</option>
					<option>씨티카드</option>
					<option>SC은행리워드카드</option>
					<option>우리카드</option>
					<option>제주카드</option>
					<option>신협체크카드</option>
					<option>광주카드</option>
					<option>수협카드</option>
					<option>전북카드</option>
					<option>우체국카드</option>
					<option>KDB카드</option>
					<option>IBK기업은행카드</option>
					<option>KB[구 현대]증권체크카드</option>					
					</select></td>
		</tr>		
		<tr>
			<td><label for="usr">결제안내</label></td>
			<td colspan="3"><img src="<c:url value="/img/jsimg/결제안내.PNG"/>" style="width: 500px"></td>
		</tr>		
	</table>
	</c:if>
	
	<div id="div_good"><input id="card_go" type="button" class="btn-danger" value="결제동의"></div>
<c:if test="${totalpay != 0}">
	<img src="<c:url value="/img/jsimg/bank.PNG"/>">
	</c:if>
</div>