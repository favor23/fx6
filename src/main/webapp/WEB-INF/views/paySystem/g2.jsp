<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<nav class="navbar navbar-default">
  		<div class="container-fluid">
   		<div class="navbar-header">
     	<a class="navbar-brand" href="#">결제 정보 입력</a>
    	</div>
    	<ul class="nav navbar-nav">
      	<li><a href="#">선택</a></li>
      	<li><a id="g1">Card</a></li>
     	<li class="active"><a id="g2">무통장 입금</a></li>      	
   		</ul>
  </div>
</nav>
<h2>무통장 입금</h2>
<div>
	<table class="table">
	<tr><td>수령자</td><td>김지수</td></tr>
	<tr><td>은행</td><td>KB국민은행</td></tr>
	<tr><td>계좌번호</td><td>777102-01-117106</td></tr>
	<tr><td>ps</td><td>단 이체시 아이디를 기입해주시기 바랍니다.</td></tr>
	</table>
</div>
<div class="div_1">		
		<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">최종 결제 금액</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="aj_totalpay"></a></li>
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">개인정보 판매자 제공 약관
        <span class="caret"></span></a>
        <ul class="dropdown-menu">      
          <li><div>고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며, 거부시 상품 배송, CS가 제한됩니다.<br>
		제공받는자	[김지수,장태주,이상일]<br>
목적	주문상품의 배송(예약), 고객상담 및 불만처리<br>
항목	성명, 주소, 연락처(안심번호 적용 시 연락처는 제외), 개인통관고유부호(선택시)<br>
보유기간	구매확정 후 무기한
		</div></li>   
        </ul>
      </li>
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">개인정보 판매자 제공 약관
        <span class="caret"></span></a>
        <ul class="dropdown-menu">      
          <li><div>고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며, 거부시 상품 배송, CS가 제한됩니다.<br>
		제공받는자	[김지수,장태주,이상일]<br>
목적	주문상품의 배송(예약), 고객상담 및 불만처리<br>
항목	성명, 주소, 연락처(안심번호 적용 시 연락처는 제외), 개인통관고유부호(선택시)<br>
보유기간	구매확정 후 무기한
		</div></li>   
        </ul>
      </li>
    </ul>
  </div>
</nav>
		<h3>개인정보 판매자 제공에 동의합니다.</h3><input type="checkbox" id="agree1">
		<div>고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며, 거부시 상품 배송, CS가 제한됩니다.<br>
		제공받는자	[김지수,장태주,이상일]<br>
목적	주문상품의 배송(예약), 고객상담 및 불만처리<br>
항목	성명, 주소, 연락처(안심번호 적용 시 연락처는 제외), 개인통관고유부호(선택시)<br>
보유기간	구매확정 후 무기한
		</div><br>
		<h3>개인정보 수집 및 이용에 동의합니다.</h3><input type="checkbox" id="agree2">
		<div>고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며, 거부 시 상품배송, 구매 및 결제, 일부 포인트 적립이 제한됩니다.<br>
수집이용목적	수집 항목	보유기간
대금 결제/환불 서비스 제공, 주문/배송/거래 내역 조회 서비스 제공, 전자상거래법 준수 등 신용카드 정보, 계좌 정보, 주문/배송/거래 내역	회원탈퇴 시 까지<br>
단, 관계 법령의 규정에 따라 보존할 의무가 있으면 해당 기간 동안 보존<br>
이용계약(이용약관)이 존속중인 탈퇴하지 않은 회원의 경우 보유기간은 보존의무기간 이상 보관할 수 있으며<br> 이 기간이 경과된 기록에 대해서 파기요청이 있는 경우 파기함<br>
결제수단에 따른 개인정보 수집.이용 항목이 상이할 수 있음</div>
<input type="hidden" name="select2" value="g2">
	<input type="button" id="btn_pay2" class="btn-danger dtn_go_size" value="결제하기">
		</div>