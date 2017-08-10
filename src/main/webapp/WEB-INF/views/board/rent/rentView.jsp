<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link href="/SRC2/magnifying/magnify.css" rel="stylesheet" type="text/css"> -->
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.all_section{
		width: 100%;
		height: auto;
		/* background-color: red; */
		margin-top: 60px;
		
	}
	
	
	.main_section{
		width: 70%;
		height: auto;
		/* background-color: blue; */
		margin:  0 auto;
		
	}
	
	.midle_top{
		width: 900px;
		height: 400px;
		/* background-color: gray; */
		margin: 0 auto;
	}
	
	.img_area{
		width: 400px;
		height: 400px;
		/* background-color: yellow; */
		float: left;
	}
	
	.info_area{
		width: 470px;
		height: 400px;
		/* background-color: purple; */
		float: right;
		border-bottom: 1px gray solid;
		border-top: 1px gray solid;
	
	}
	
	/* .midle_bottom{
		
		width: 100%;
		height:600px;
	 background-color: navy; 
	} */
	
	 .img_size{
		width: 400px;
		height: 400px;
	
	}
	
	.top_text{
		
		margin-top: 30px;
		margin-left: 10px;
	
	}
	
	
	.table_style{
	
	margin-left: 10px;
	margin-top: 40px;
	font-size: 14px;
	margin-bottom: 20px;
	
	}
	
	.tr_style{
	
	width: 70px;
	height: 35px;
	
	}
	
	.name{
	
	width: 70px;
	
	
	}
	
	.button_section{
	
	width: 100%;
	height: 100px;
	/* background-color: blue; */
	
	}
	
	.button{
	
		width:  33%;
		height: 42px;
		float: left;
		background-color: white;
		border: 1px black solid;
		margin-top: 13px;
		margin-left: 20px;
	}
	
	.button:HOVER {
	background-color: #f00;;
	color: white;
	
	}
	
	.text_top{
	
		margin-left: 40px;
		font-size: 13px;
		margin-top: 30px;
		margin-bottom: 10px;
		text-align: right;
	
	}
 
 
 
 
</style>
<c:import url="../../temp/bootStrap.jsp" />
</head>
<body>
   <c:import url="../../temp/header.jsp"/>
	<section class="all_section">
		<section class="main_section">
			<section class="text_top">
				<p>LIST > ${view.category}</p>
			</section>
			<section class="midle_top">
			<div class="img_area">
				<img src="<c:url value="${view.detail_img}"/>"  class="img_size" alt="Pic"
				 <c:url value="${view.detail_img}"/>>
			</div>
			<div class="info_area">
			<h2 class="top_text" style="background-color:#fff; padding-right:10px; font-weight: bold; font-size: 20px !important;">${view.product_name}</h2>
			
			
			<form id="cart_frm" method="POST" action="../../board/cart/cartWrite">
				<input type="hidden" name="list_img" value="${view.detail_img}">
				<input type="hidden" name="price" value="${view.price}">
				<input type="hidden" name="id" value="${member.id}">
				<input type="hidden" name="product_name" value="${view.product_name}">
				
				<div class="area"></div>
			<table class="table_style">
				<tr class="tr_style">
					<td class="name">수량</td>
					<td>${view.quantity}</td>
				</tr>
				<tr class="tr_style">
					<td>가격</td>
					<td>${view.price}원</td>
				</tr>
				<tr class="tr_style">
					<td>대여일</td>
					<td><input type="date" name="start_date"></td>
				</tr>
				
				<tr class="tr_style">
					<td>반납일</td>
					<td><input type="date" name="end_date"></td>
				</tr>
				<tr class="tr_style">
					<td>대여수량</td>
					<td><input type="number" min="1" max="${view.quantity}" name="quantity"></td>
				</tr>
			
			</table>
				</form>
			
				<hr>
			
			<div class="button_section">
				<input type="button" value="CART" class="button" id="cart_btn">
				<input type="button" value="요청하기" class="button" id="rent_btn">
			</div>
			</div>
		
		</section>
		<section class="midle_bottom" style="width: 100%; margin-top: 60px; margin-bottom: :30px; margin-left: 70px;">
			
			
			<img src="<c:url value="${view.contents}"/>" alt="Pic" style="margin-left: 200px; margin-bottom: 100px;"
				 <c:url value="${view.contents}"/>>
		
		
		
		</section>
		</section>
	
	</section>
<script type="text/javascript">
 
 
	$("#cart_btn").click(function() {
		$("#cart_frm").submit();
	});
	
	$("#rent_btn").click(function() {
	 	$(".area").append('<input type="hidden" name="category" value="${view.category}">');
		$("#cart_frm").attr("action" , "../../board/order_rent/order_rentInsert");
		$("#cart_frm").submit();
	});
 
 
</script>
<c:import url="../../temp/footer.jsp"/>
</body>
</html>