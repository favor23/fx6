<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/bootStrap.jsp"/>
<title>Insert title here</title>
<style type="text/css">
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
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<section class="main_section">
	<section class="main_wrap">
		<img src="<c:url value="/img/jsimg/pay2img.PNG"/>">
		<form id="frm" method="post">
		<table class="table">
		<tr><td>상품정보</td><td>상품 금액</td><td>할인</td><td>총금액</td></tr>
		<tr>
		<td>
			<%-- <c:forEach items="${sessionScope.list}" var="dto">	 --%>
			<c:forEach items="${sessionScope.list}" var="dto">
					<img src="<c:url value="${dto.poster_img}"/>">	<br>						
			</c:forEach>
		</td>				
		<td>
			<c:forEach items="${sessionScope.list}" var="dto">					
					${dto.movie_title}	<br>		
			</c:forEach>
		</td>
		<td>
		<%-- <c:forEach items="${sessionScope.list}" var="dto">					
					${dto.movie_price}	<br>		
		</c:forEach> --%>
			</td>		
		</tr>		
		</table>
		<hr>
		<div class="div_1">
		<h3>주문금액 - 할인금액 = 최종결제금액</h3>
		<div id="sum_pay" class="alert alert-success">
		<p><h2>${sessionScope.totalprice} - 0 &nbsp;&nbsp;= ${sessionScope.totalprice}</h2><p>
		<input type="hidden" id="totalpay" name="totalpay" value="<%-- ${dto.movie_price} --%>">
		</div>		
		<hr>
		<p>상품금액 : ${sessionScope.totalprice}</p>
		상품할인/포인트 할인
		<input type="number" id="sum_point" name="use_point">		
		<input type="button" id="btn_point" value="포인트적용"><!-- <span id="btn_point_x">[X]</span> -->
		(상품할인 건/포인트 보유 P)
		</div>		
        </table>
		</div>
		<div id="ajax_g">		
		<nav class="navbar navbar-default">
  		<div class="container-fluid">
   		<div class="navbar-header">
     	<a class="navbar-brand" href="#">결제 정보 입력</a>
    	</div>
    	<ul class="nav navbar-nav">
      		<li class="active"><a href="#">선택</a></li>
      		<li><a id="g1">Card</a></li>
     	<!-- 	<li><a id="g2">무통장 입금</a></li>   -->  	
   		</ul>
  </div>
</nav>
</div>		
		<div class="div_1"></div>
		</form>		
	</section>
</section>
<c:import url="../temp/footer.jsp"/>
<script type="text/javascript">
var qqq=0;
$.ajax({
	url:"./g1",
	type:"GET",
	success:function(data){
		$("#ajax_g").html(data);
	}
}) 	
$("#btn_point").click(function(){
	var point=$("#sum_point").val();
	var point_use="${member.point}";
	point_use*=1;
	if(point>point_use){		
		point=point_use;	
		if(point>"${sessionScope.totalprice}")
		{
			point="${sessionScope.totalprice}";	
		}
	}
	point=point-point%100;
	$("#sum_point").prop("value",point);
	var sum="${sessionScope.totalprice}"-point;
	var result="<p><h2>"+"${sessionScope.totalprice} - "+point+"&nbsp;&nbsp; ="+sum+"</h2><p>";
	result=result+"<input type=\"hidden\" id=\"totalpay\" name=\"totalpay\" value=\""+sum+"\">";    
	$("#sum_pay").html(result);
	qqq=sum;
})
$("#ajax_g").on("click","#card_go",function(){		
	$.ajax({
		url:"./g4",
		type:"GET",
		success:function(data){
			$("#div_good").html(data);
			$("#aj_totalpay").html($("#totalpay").val()+"원");
		}
	}) 

});
/* $("#ajax_g").on("click","#g1",function(){		
			$.ajax({
				url:"./g1",
				type:"GET",
				success:function(data){
					$("#ajax_g").html(data);
				}
			}) 			
		
}); */
/* $("#ajax_g").on("click","#g2",function(){		
			$.ajax({
				url:"./g2",
				type:"GET",
				success:function(data){
					$("#ajax_g").html(data);
					$("#aj_totalpay").html($("#totalpay").val()+"원");
				}
			}) 		
});
$("#ajax_g").on("click","#g3",function(){
			$.ajax({
				url:"./g3",
				type:"GET",
				success:function(data){
					$("#ajax_g").html(data);
					$("#aj_totalpay").html($("#totalpay").val()+"원");
				}
			}) 
		
}); */
$("#ajax_g").on("click","#btn_pay2",function(){
	if($("#agree1").prop("checked")){
		if($("#agree2").prop("checked")){
			$("#frm").prop("action","../member/bankck.bank");	
			$("#frm").submit();
		}
		else{
			alert("개인정보 수집 및 이용에 동의해주시기 바랍니다.");
		}
	}
	else{
		alert("개인정보 판매자 제공에 동의해주시기 바랍니다.");
	}
});
$("#ajax_g").on("click","#btn_pay",function(){
	if($("#agree1").prop("checked")){
		if($("#agree2").prop("checked")){
			$("#frm").prop("action","./paypost");	
			$("#frm").submit();
		}
		else{
			alert("개인정보 수집 및 이용에 동의해주시기 바랍니다.");
		}
	}
	else{
		alert("개인정보 판매자 제공에 동의해주시기 바랍니다.");
	}
});
</script>
</body>
</html>