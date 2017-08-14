<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/bootStrap_black.jsp"/>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://use.fontawesome.com/aa95071b26.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

<title>Insert title here</title>
<style type="text/css">
#body {
  background: #212121;
  min-height: 500px;
  font-family: 'Josefin Sans', sans-serif;
  text-transform: captalize;
  letter-spacing: 2px;
}
@media only screen and (min-width: 768px) {
  #body {
    padding: 50px;
  }
}
@media only screen and (max-width: 767px) {
  #body {
    padding: 1px;
  }
}
#body, #body * {
  transition: all .25s;
}
#body .out-wrap {
  position: relative;
  width: 90%;
  margin: auto;
  color: #777;
}
@media only screen and (min-width: 768px) {
  #body .out-wrap {
    padding: 0 50px 50px;
  }
}
#body .out-wrap #payment {
  display: flex;
  align-items: center;
  justify-content: center;
}
@media only screen and (max-width: 767px) {
  #body .out-wrap #payment {
    flex-wrap: wrap;
  }
  #body .out-wrap #payment > div {
    margin: 15px auto !important;
    width: 100%;
  }
  #body .out-wrap #payment > div:first-child {
    order: 2;
  }
}
#body .out-wrap #payment .details {
  flex: 1;
  max-width: 400px;
  min-width: 300px;
  margin-right: 50px;
}
#body .out-wrap #payment .details .input-wrap {
  display: flex;
  flex-wrap: wrap;
}
#body .out-wrap #payment .details .input-wrap label {
  width: 100%;
  margin: 25px 0 10px;
}
#body .out-wrap #payment .details .input-wrap input {
  flex: 1;
  border: 0;
  background: rgba(0, 0, 0, 0.3);
  height: 40px;
  width: 100%;
  text-transform: uppercase;
  padding: 0 10px;
}
#body .out-wrap #payment .details .input-wrap input:focus {
  outline: none;
  box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.5);
  background: rgba(0, 0, 0, 0.1);
}
#body .out-wrap #payment .details .input-wrap.four-num input {
  margin: 0 10px 0 0;
  text-align: center;
}
#body .out-wrap #payment .details .input-wrap.four-num input:last-child {
  margin: 0;
}
#body .out-wrap #payment .details .halfbox {
  display: flex;
}
#body .out-wrap #payment .details .halfbox > div:last-child {
  margin-left: 25px;
}
#body .out-wrap #payment .details .halfbox > div:last-child input {
  width: 50px;
}
#body .out-wrap #payment .details .halfbox > div:first-child .twin {
  position: relative;
  display: flex;
}
#body .out-wrap #payment .details .halfbox > div:first-child .twin:before {
  position: absolute;
  left: 0;
  right: 0;
  text-align: center;
  pointer-events: none;
  content: '/';
  bottom: 5px;
  font-size: 20px;
}
#body .out-wrap #payment .details .halfbox > div:first-child .twin.focusit {
  box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.5);
}
#body .out-wrap #payment .details .halfbox > div:first-child .twin.focusit input {
  box-shadow: none;
  background: rgba(0, 0, 0, 0.1);
}
#body .out-wrap #payment .details .halfbox > div:first-child input {
  width: 40px;
}
#body .out-wrap #payment .card > div {
  perspective: 1000px;
  max-width: 350px;
  height: 200px;
  min-width: 320px;
}
@media only screen and (max-width: 767px) {
  #body .out-wrap #payment .card > div {
    margin: auto;
  }
}
#body .out-wrap #payment .card.flip > div > .clayout {
  transform: rotateY(180deg);
}
#body .out-wrap #payment .card.flip > div > .clayout .c-front .logo {
  opacity: 0;
  transition: none;
}
#body .out-wrap #payment .card .clayout {
  position: relative;
  transform-style: preserve-3d;
}
#body .out-wrap #payment .card .clayout.blueit .c-front, #body .out-wrap #payment .card .clayout.blueit .c-back {
  background: linear-gradient(to right, #0af, #0099e6);
}
#body .out-wrap #payment .card .clayout .c-front, #body .out-wrap #payment .card .clayout .c-back {
  max-width: 350px;
  width: 100%;
  height: 200px;
  position: absolute;
  z-index: 2;
  top: 0;
  right: 0;
  transform-style: preserve-3D;
  transform-origin: center center;
  perspective: 50px;
  border-radius: 10px;
  -webkit-box-shadow: 0 6px 10px -2px rgba(0, 0, 0, 0.25);
  -moz-box-shadow: 0 6px 10px -2px rgba(0, 0, 0, 0.25);
  box-shadow: 0 6px 10px -2px rgba(0, 0, 0, 0.25);
  background: linear-gradient(to right, #b71c1c, #a11919);
  color: #fff;
  font-size: 12px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  align-items: center;
  padding: 20px;
}
#body .out-wrap #payment .card .clayout .c-front > p, #body .out-wrap #payment .card .clayout .c-back > p {
  margin: 0;
}
#body .out-wrap #payment .card .clayout .c-front .chiplogo, #body .out-wrap #payment .card .clayout .c-back .chiplogo {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
}
#body .out-wrap #payment .card .clayout .c-front .chiplogo > span, #body .out-wrap #payment .card .clayout .c-back .chiplogo > span {
  height: 35px;
  width: 150px;
}
#body .out-wrap #payment .card .clayout .c-front .chiplogo > span.chip b, #body .out-wrap #payment .card .clayout .c-back .chiplogo > span.chip b {
  position: relative;
  height: 30px;
  width: 43px;
  display: block;
  border-radius: 5px;
  background: #f3c251;
}
#body .out-wrap #payment .card .clayout .c-front .chiplogo > span.chip b:before, #body .out-wrap #payment .card .clayout .c-back .chiplogo > span.chip b:before {
  background: url(https://d30y9cdsu7xlg0.cloudfront.net/png/190185-200.png) no-repeat center/100% 140%;
  content: '';
  opacity: .5;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
}
#body .out-wrap #payment .card .clayout .c-front .chiplogo > span.logo, #body .out-wrap #payment .card .clayout .c-back .chiplogo > span.logo {
  transform: translate3d(0, 0, 0);
}
#body .out-wrap #payment .card .clayout .c-front .chiplogo > span.logo b, #body .out-wrap #payment .card .clayout .c-back .chiplogo > span.logo b {
  width: 75px;
  margin-left: auto;
  display: block;
  height: 100%;
  background-size: auto 130% !important;
  background-position-y: center !important;
  transform: translateZ(0);
}
#body .out-wrap #payment .card .clayout .c-front .chiplogo > span.logo b.master, #body .out-wrap #payment .card .clayout .c-back .chiplogo > span.logo b.master {
  background: url(https://new.corezoid.com/wp-content/uploads/2016/03/visa-mastercard.png) no-repeat;
  background-position-x: 10px;
}
#body .out-wrap #payment .card .clayout .c-front .chiplogo > span.logo b.visa, #body .out-wrap #payment .card .clayout .c-back .chiplogo > span.logo b.visa {
  background: url(https://new.corezoid.com/wp-content/uploads/2016/03/visa-mastercard.png) no-repeat;
  background-position-x: -60px;
}
#body .out-wrap #payment .card .clayout .c-front .chiplogo > span:last-child, #body .out-wrap #payment .card .clayout .c-back .chiplogo > span:last-child {
  text-align: right;
}
#body .out-wrap #payment .card .clayout .c-front .cnum, #body .out-wrap #payment .card .clayout .c-back .cnum {
  margin: 20px 0;
  font-size: 20px;
  width: 100%;
  justify-content: space-between;
  display: flex;
  align-items: center;
  align-content: center;
  font-family: monospace;
}
#body .out-wrap #payment .card .clayout .c-front .cnum span, #body .out-wrap #payment .card .clayout .c-back .cnum span {
  letter-spacing: 5px;
  font-family: 'Josefin Sans', sans-serif;
  flex: 1;
  text-align: center;
}
#body .out-wrap #payment .card .clayout .c-front .cname, #body .out-wrap #payment .card .clayout .c-front .cvtr, #body .out-wrap #payment .card .clayout .c-back .cname, #body .out-wrap #payment .card .clayout .c-back .cvtr {
  min-height: 35px;
  max-width: 215px;
  overflow: hidden;
}
#body .out-wrap #payment .card .clayout .c-front .cname > span, #body .out-wrap #payment .card .clayout .c-front .cvtr > span, #body .out-wrap #payment .card .clayout .c-back .cname > span, #body .out-wrap #payment .card .clayout .c-back .cvtr > span {
  display: block;
  font-size: 8px;
  color: #ccc;
}
#body .out-wrap #payment .card .clayout .c-front .cname label, #body .out-wrap #payment .card .clayout .c-front .cvtr label, #body .out-wrap #payment .card .clayout .c-back .cname label, #body .out-wrap #payment .card .clayout .c-back .cvtr label {
  text-transform: uppercase;
}
#body .out-wrap #payment .card .clayout .c-front .cvtr, #body .out-wrap #payment .card .clayout .c-back .cvtr {
  text-align: center;
}
#body .out-wrap #payment .card .clayout .c-back {
  padding: 0;
  align-items: initial;
  z-index: 1;
  transform: rotateY(180deg);
}
#body .out-wrap #payment .card .clayout .c-back .topc {
  line-height: 20px;
  padding: 0 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  font-size: 8px;
  color: rgba(255, 255, 255, 0.5);
}
#body .out-wrap #payment .card .clayout .c-back .backit {
  height: 35px;
  background: #333;
  width: 100%;
}
#body .out-wrap #payment .card .clayout .c-back .cvv {
  margin: 0 30px;
  width: 100%;
  text-align: right;
}
#body .out-wrap #payment .card .clayout .c-back .cvv b {
  border-radius: 5px;
  line-height: 25px;
  height: 25px;
  margin-top: 5px;
  padding-right: 5px;
  background: #fff;
  display: block;
  color: #000;
}
#body .out-wrap #payment .card .clayout .c-back .chiplogo {
  margin: 0 15px 30px 0;
  justify-content: flex-end;
}

.four-num, .cnum {
  font-family: 'roboto' !important;
}

/* =============== */
.table img{
	width: 200px;
	height: auto;
}
.main_wrap{
	width: 1000px;
	height: auto;
	margin: 0 auto;
	padding: 100px 0 100px 0; 
}
.div_1{
	width: 100%;
	height: auto;
	/* border: 1px solid black; */
}
a{
	cursor: pointer;
}
.dtn_go_size{
	width:100%;
	height: 30px;
}
#card_go{
	width: 100%;
}
#btn_point_x{
	color: red;
	cursor: pointer;
}

#post_d1{
	height: 500px;
	width: 500px;
	margin: 0 auto;
}
.card_num{
	width: 97%;
}
#pay_go, #pay_exit{
	width: 95%;
	height: 33px;
}
#im_bank{
	height: 50px;
	width: auto;

}
.modal-body{
	margin-top:40px;
	margin-bottom: 40px;
}
.item_jb{
	width: 45%;
	height: 100%;
	float: left;
		
}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<section class="main_section">
	<section class="main_wrap">
		<img src="<c:url value="/img/jsimg/pay2img.PNG"/>">
		<form id="frm" method="post">
				<table class="table">
					<tr>
						<td>상품정보</td>
						<td>상품 금액</td>
						<td>총금액</td>
					</tr>
					<tr>
						<td style="width: 600px;">
							<div class="item_jb">
								<img src="<c:url value="${psupport.campaign_img}"/>">
									
							</div>
							<div class="item_jb" style="margin-left: 30px;">
								[${psupport.campaign_title}]<br>${support.benefit_title}</div>

						</td>
						<td style="width: 200px;">${support.total_price} <br>
						</td>
						<td style="width: 200px;">${support.total_price} 
							<input type="hidden" id="totalpay" name="totalpay"
							value="${support.total_price}">
						</td>
					</tr>
				</table>
				<table class="table">
				<tr>
					<td>이름</td>
					<td>${member.name}</td>
				</tr>
				<tr>
					<td>집 주소</td>
					<td colspan="3"><input type="text" name="address"
						value="${member.address}"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td colspan="3"><input type="text" name="phone" value="${member.phone}"></td>
				</tr>
				</table>
				</div>
		<div id="ajax_g">		
		<nav class="navbar navbar-inverse">
  		<div class="container-fluid">
   		<div class="navbar-header">
     	<a class="navbar-brand">결제 정보 입력</a>
    	</div>
    	<ul class="nav navbar-nav">
      		<li class="active"><a>선택</a></li>
      		<li><a id="g1">Card</a></li>
     	<!-- 	<li><a id="g2">무통장 입금</a></li>   -->  	
   		</ul>
  </div>
</nav>
</div>
		</form>	
		<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" style="width: 750px;border-top-width: 0px;border-right-width: 0px;border-bottom-width: 0px;border-left-width: 0px;">  
    
      <div class="modal-body" style="
    margin-top: 0px;
    margin-bottom: 0px;
    padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
      ">
					<div id="body">
					<form id="frm3" action="" method="post">
  <div class="out-wrap">
   <table class="table">
				<tr>
					<td>주문상품</td>
					<td>${support.benefit_title}</td>	
									
				</tr>
				<tr>
					<td>상품금액</td>
					<td>${support.total_price}</td>
				</tr>
			</table>
    <div id="payment" ng-app="myApp" ng-controller="myCtrl">
      <div class="details">
        <div class="input-wrap four-num">
          <label>Card Number</label>
          <input id="cardNum1" name="cardNum1" maxlength="4" ng-model="f4" type="text">
          <input id="cardNum2" name="cardNum2" maxlength="4" ng-model="s4" type="text">
          <input id="cardNum3" name="cardNum3" maxlength="4" ng-model="t4" type="text">
          <input id="cardNum4" name="cardNum4" maxlength="4" ng-model="l4" type="text">
        </div>
        <div class="input-wrap">
          <label>Card Holder's Name </label>
          <input ng-model="hname" type="text">
        </div>
        <div class="halfbox">
        <div class="input-wrap">
          <label>Valid Till</label>
          <div class="twin">
          <input id="m" maxlength="2" ng-model="edm" type="text" value="08">
          <input id="y" maxlength="2" ng-model="edy" type="text" value="17">
          </div>
        </div>
        
        <div class="input-wrap">
          <label>CVV</label>
          <input id="cvc" maxlength="3" ng-model="cvv" type="text">
        </div>
      </div>
      </div>
      <div class="card">
        <div>
        <div class="clayout">
          <div class="c-front">
          <p class="chiplogo">
            <span class="chip">
              <b></b></span>
            <span class="logo">
            <b class="master"></b>
            </span>
            </p>
          <p class="cnum">
            <span ng-bind="f4">XXXX</span> - <span ng-bind="s4">XXXX</span> - <span ng-bind="t4">XXXX</span> - <span ng-bind="l4">XXXX</span> 
            </p>
            <P class="cname"><span>Card Holder</span><label ng-bind="hname">PRAVEEN KUMAR GORAKALA</label></P>
            <P  class="cvtr"><span>Valid Till</span><label ng-bind="edm">01</label> / <label ng-bind="edy">28</label></P>
            </div>
          <div class="c-back">
            <p class="topc"><span>136589420</span><span>sddv5</span></p>
            <p class="backit"></p>
            <p class="cvv"><span>CVV</span><b ng-bind="cvv"></b></p>
          <p class="chiplogo">
          <span class="logo">
            <b class="master"></b>
            </span>
            </p>
          </div>
          </div>
        </div>
    </div>
  </div>
 </div>
 <input type="hidden" name="id" value="${member.id}">
		<input type="hidden" name="type" value="support">
					<input type="hidden" name="present" value="${support.benefit_title}">
					<input type="hidden" name="address" value="${member.address}">
					<input type="hidden" name="project_num" value="${psupport.campaign_num}">
					<input type="hidden" name="money" value="${support.total_price}">
 	
 <input type="button" id="pay_go" class="btn-danger" value="결제"><hr>
			<button id="pay_exit" type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
  </form>   
 </div>
 
      </div>
 </div>
 </div>
 </div>
	</section>
</section>
<c:import url="../temp/footer.jsp"/>
<script type="text/javascript">
var qqq=0;
$.ajax({
	url:"${pageContext.request.contextPath}/paySystem/g1",
	type:"GET",
	success:function(data){
		$("#ajax_g").html(data);
	}
}) 	


		
$("#ajax_g").on("click","#card_go",function(){		
	$.ajax({
		url:"${pageContext.request.contextPath}/paySystem/g5",
		type:"GET",
		success:function(data){
			$("#div_good").html(data);
			$("#aj_totalpay").html($("#totalpay").val()+"원");
		}
	}) 

});

$("#ajax_g").on("click","#btn_pay",function(){
	if($("#agree1").prop("checked")){
		if($("#agree2").prop("checked")){	
			$("#btn_pay").attr("data-target","#myModal");
		}
		else{
			$("#btn_pay").attr("data-target","");
			alert("개인정보 수집 및 이용에 동의해주시기 바랍니다.");
		}
	}
	else{
		$("#btn_pay").attr("data-target","");
		alert("개인정보 판매자 제공에 동의해주시기 바랍니다.");
	}
});

/* ---------------------------------------------------------------- */
var app = angular.module("myApp", []);
app.controller("myCtrl", function($scope) {
  $scope.f4 = "";
  $scope.s4 = "";
  $scope.t4 = "";
  $scope.l4 = "";
  $scope.hname = "";
  $scope.edm = "";
  $scope.edy = "";
  $scope.cvv = "";
});

$(".twin input")
  .on("focus", function() {
    $(this).parent().addClass("focusit");
  })
  .blur(function() {
    $(this).parent().removeClass("focusit");
  });

$('.four-num input[ng-model="f4"]').on("keyup change", function() {
  if ($(this).val().slice(0, 1) === "4") {
    $(".logo b").attr("class", "visa");
    $(".clayout").addClass("blueit");
  } else {
    $(".logo b").attr("class", "master");
    $(".clayout").removeClass("blueit");
  }
});
$(".four-num input").on("keyup change", function() {
  $in = $(this);
  if ($in.val().length > 3) {
    $in.next().focus();
  }
});
$('input[ng-model="cvv"]')
  .on("focus", function() {
    $("#payment .card").addClass("flip");
  })
  .on("blur", function() {
    $("#payment .card").removeClass("flip");
  });
$(".twin input").on("keyup change", function() {
  $in = $(this);
  if ($in.next().length) {
    if ($in.val().length > 1) {
      $in.next().focus();
    }
  } else {
    if ($in.val().length > 1) {
      $in.blur();
    }
  }
});
/*---------------------------------------  */
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
					var total_price = parseInt('${support.total_price}');
					var campaign_num = parseInt('${support.campaign_num}');
					var benefit_num = parseInt('${support.benefit_num}');
					var id = '${member.id}';
					var name = '${member.name}';
					var email = '${member.email}';
					var benefit_title = '${support.benefit_title}';
					
					campaignDone(total_price, campaign_num, benefit_num);
					supporterWrite(id, name, campaign_num, total_price, benefit_num, email, benefit_title);
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

function campaignDone(support_price, campaign_num, benefit_num) {
	$.ajax({
		url: "${pageContext.request.contextPath}/crowd_funding/campaign/campaignDone/" + support_price + "/" + campaign_num + "/" + benefit_num,
		type: "GET",
		success: function(data) {
			
		}
	});
}

function supporterWrite(id, name, campaign_num, support_price, benefit_num, email, benefit_title) {
	$.ajax({
		url: "${pageContext.request.contextPath}/supporter/supporterWrite/" + id + "/" + name + "/" + campaign_num + "/" + support_price + "/" + benefit_num + "/" + email + "/" + benefit_title,
		type: "GET",
		success: function(data) {
			
		}
	});
}
</script>
</body>
</html>