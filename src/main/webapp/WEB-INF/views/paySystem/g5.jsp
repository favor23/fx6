<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="div_1">		
		<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">최종 결제 금액</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="aj_totalpay">${totalpay}</a></li>
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">개인정보 판매자 제공 약관
        <span class="caret"></span></a>
        
      </li>
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">개인정보 판매자 제공 약관
        <span class="caret"></span></a>       
      </li>
    </ul>
  </div>
</nav>
		<h3>개인정보 판매자 제공에 동의합니다.</h3><input type="checkbox" id="agree1">
		<div>고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며, 거부시 상품 배송, CS가 제한됩니다.<br>
		제공받는자	[길성재,김지수,신호정,유기원,홍유경]<br>
목적	주문상품의 배송(예약), 고객상담 및 불만처리<br>
항목	성명, 주소, 연락처(안심번호 적용 시 연락처는 제외), 개인통관고유부호(선택시)<br>
보유기간	구매확정 후 무기한
		</div><br>
		<h3>개인정보 수집 및 이용에 동의합니다.</h3><input type="checkbox" id="agree2">
		<div>고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며, 거부 시 상품배송, 구매 및 결제 제한됩니다.<br>
수집이용목적	수집 항목	보유기간
대금 결제/환불 서비스 제공, 주문/배송/거래 내역 조회 서비스 제공, 전자상거래법 준수 등 신용카드 정보, 계좌 정보, 주문/배송/거래 내역	회원탈퇴 시 까지<br>
단, 관계 법령의 규정에 따라 보존할 의무가 있으면 해당 기간 동안 보존<br>
이용계약(이용약관)이 존속중인 탈퇴하지 않은 회원의 경우 보유기간은 보존의무기간 이상 보관할 수 있으며<br> 
매달 25일 이후에는 환불이 불가능 합니다. 이점 유의 하시기 바랍니다.<br>
이 기간이 경과된 기록에 대해서 파기요청이 있는 경우 파기함<br>
결제수단에 따른 개인정보 수집.이용 항목이 상이할 수 있음</div>
		<input type="hidden" name="select2" value="g1">
		<c:if test="${totalpay == 0}">
		<form id="frm4" action="" method="post">
		<c:forEach items="${sessionScope.list}" var="dto">
					<input type="hidden" name="id" value="${member.id}">
					<input type="hidden" name="type" value="movie">
					<input type="hidden" name="movie_num" value="${dto.movie_num}">
					<input type="hidden" name="money" value="${totalpay}">					
					</c:forEach>		
		<input type="button" id="btn_pay2" class="btn-danger dtn_go_size" value="결제하기">
		</form>
		</c:if>
		<c:if test="${totalpay != 0}">
		<input type="button" id="btn_pay" class="btn-danger dtn_go_size" data-toggle="modal" value="결제하기">
		</c:if>
		</div>		
		
		
<%-- 				<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">  
    
      <div class="modal-body">
        <form id="frm3" action="" method="post">
	<input type="hidden" name="name" value="${param.name}">
	<input type="hidden" name="address" value="${param.address}">
	<input type="hidden" name="phone" value="${param.phone}">
	<input type="hidden" name="req" value="${param.req}">
	<input type="hidden" name="select2" value="${param.select2}">
	<input type="hidden" name="totalpay" value="${totalpay}">
	<input type="hidden" name="id" value="${member.id}">
		<input type="hidden" name="type" value="support">
					<input type="hidden" name="present" value="${support.benefit_title}">
					<input type="hidden" name="address" value="${member.address}">
					<input type="hidden" name="project_num" value="${psupport.campaign_num}">
					<input type="hidden" name="money" value="${support.total_price}">
	<input type="hidden" name="use_point" value="${param.use_point}"> 
	<div id="post_d1">
		<!-- <img id="im_bank"src="../img/main_jisoo/bank_222.PNG"> 카드를 이용해주셔서 감사합니다. -->
		<div>
		
			<table class="table">
				<tr>
					<td>주문상품</td>
					<td>${support.benefit_title}</td>	
									
				</tr>
				<tr>
					<td>상품금액</td>
					<td>${support.total_price}</td>
				</tr>
				<tr>
					<td>할부기간 선택</td>
					<td><select><option>일시불</option></select></td>
				</tr>
			</table>
		</div>
		<h4>결제</h4>
		<div>
			<div>
				<table class="table">
					<tr>
						<td>카드번호</td>
					</tr>
					<tr>
						<td><input type="text" id="cardNum1" name="cardNum1" class="card_num" maxlength="4" value="9441"></td>
						<td>
						<input type="text" id="cardNum2" name="cardNum2" class="card_num" maxlength="4" value="1602">
						</td>
						<td>
						<input type="text" id="cardNum3" name="cardNum3" class="card_num" maxlength="4" value="2860">
						</td>
						<td><input type="text" id="cardNum4" name="cardNum4" class="card_num" maxlength="4" value="6562"></td>
					</tr>				
						</table>
			</div>
			<div>
				<table class="table">
			<tr>
						<td>MONTH</td>
						<td> YEAR</td>
					</tr>
			<tr>
						<td><select id="m"><option>01</option><option>02</option><option>03</option><option>04</option><option>05</option><option>06</option><option>07</option><option>08</option><option>09</option><option>10</option><option>11</option><option>12</option></select></td>
						<td><select id="y"><option>17</option><option>18</option><option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option><option>25</option><option>26</option><option>27</option><option>28</option></select></td>
					</tr>
			</table>
			</div>
			<div>CVC :<input type="text" name="cvc" id="cvc" maxlength="3"></div>
			<hr>
			<input type="button" id="pay_go" class="btn-danger" value="결제"><hr>
			<button id="pay_exit" type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
		</div>
		
	</div>
	</form>
      </div>     
    </div>
  </div>
</div>	 --%>
<!-- <script type="text/javascript">
var date = new Date();
var year = date.getFullYear(); //년도
var month = date.getMonth()+1; //월

$("#pay_go").click(function(){
	//각각 값 가져와서 다채워져있는지 확인
	var cardNum1=$("#cardNum1").val();
	var cardNum2=$("#cardNum2").val();
	var cardNum3=$("#cardNum3").val();
	var cardNum4=$("#cardNum4").val();
	var cvc=$("#cvc").val();
	var m=$("#m").val();
	var y=$("#y").val();
	
	//월 01=> 1 숫자로 만들기
	m=m*1;
			
	if(cardNum1>1000&&cardNum2>1000&&cardNum3>1000&&cardNum4>1000){
			if((year-2000)==y&&month>m){
				alert("카드 month/year을 확인해주세요");					
			}		
			else{
				if(cvc<100){
					alert("cvc를 입력해주세요");
				}
				else{
					$("#frm3").attr("action","/fx6/support_bank");
					$("#frm3").submit();	
				}
			}
			
	}else{
		alert("카드번호를 모두 입력해주세요");		
	}		
});		

$("#btn_pay2").click(function () {
	$("#frm4").attr("action","/fx6/support_bank");
	$("#frm4").submit();	
})
</script> -->
	