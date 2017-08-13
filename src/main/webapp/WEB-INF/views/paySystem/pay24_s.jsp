<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/bootStrap_black.jsp"/>
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
		<tr><td>상품정보</td><td>상품 금액</td><td>할인</td><td>총금액</td></tr>
		<tr>
		<td style="width: 400px;">
			<%-- <c:forEach items="${sessionScope.list}" var="dto">	 --%>
			<c:forEach items="${sessionScope.list}" var="dto">
					<div class="item_jb"><img src="<c:url value="${dto.poster_img}"/>"></div> 
					<div class="item_jb" style="margin-left: 30px;">${dto.movie_title}<br>	${dto.genre} ${dto.restricted}세 ${dto.running_time}분</div>					
			</c:forEach>
		</td>				
		<td style="width: 200px;">
			<c:forEach items="${sessionScope.list}" var="dto">					
					${dto.movie_price}	<br>		
			</c:forEach>
		</td>
		<td style="width: 200px;"></td><td style="width: 200px;">
						
							${totalpay}
	<input type="hidden" id="totalpay" name="totalpay" value="${totalpay}">
			</td>		
		</tr>		
		</table>
		
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
</script>
</body>
</html>