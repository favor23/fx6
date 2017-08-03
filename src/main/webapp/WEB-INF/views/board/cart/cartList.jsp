<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.allSection {
	width: 100%;
	height: auto;
}

.mainSection {
	width: 70%;
	height: 1000px;
	/* background-color: red; */
	margin: 0 auto;
	margin-top: 60px;
}

.top_t {
	margin-top: 70px;
	font-weight: bold;
	font-size: 18px;
}

.top_area {
	margin-top: 20px;
	width: 100%;
	height: 70px;
	/* background-color: red; */
}

.top_tb {
	width: 100%;
	height: 70px;
	border: 1px solid #999;
}

.top_tr {
	border: 1px dotted gray;
	vertical-align: middle;
}

.top_td {
	border: 1px dotted gray;
	vertical-align: middle;
}

.top_text {
	margin-left: 20px;
	font-size: 11px;
	color: #404040;
}

.list_img {
	width: 70px;
	height: 70px;
}

.first_tr {
	background-color: #fbfafa;
}

.table {
	margin-top: 30px;
	/* 	border: 1px solid black; */
}

.th_style {
	text-align: center;
	font-size: 11px;
}

.td_style {
	text-align: center;
	margin: 0;
	color: #353535;
	font: 12.5px 'Open Sans', 'Lato', arial, "맑은 고딕", 'Malgun Gothic', 나눔고딕,
		'Nanum Gothic', "돋움", Dutum, san-serif;
}

.center {
	vertical-align: middle;
	margin-top: 25px;
}

.button {
	width: 15%;
	height: 30px;
	float: right;
	background-color: white;
	border: 1px gray solid;
	margin-top: 13px;
	margin-left: 20px;
}

.button_del {
	width: 60%;
	height: 30px;
	float: left; background-color : white;
	border: 1px black solid;
	margin-top: 18px;
	margin-left: 20px;
	background-color: white;
}

.button:HOVER {
	background-color: #f00;;
	color: white;
}

.button_del:HOVER {
	background-color: black;;
	color: white;
}
</style>
<c:import url="../../temp/bootStrap.jsp" />
</head>
<body>
	<c:import url="../../temp/header.jsp" />

	<section class="allSection">
		<section class="mainSection">
			<div class="top_t">CART</div>
			<div class="top_area">
				<table class="top_tb">
					<tr class="top_tr">
						<td rowspan="2"
							style="text-align: center; margin-top: 10px; width: 13%; font-size: 12px; vertical-align: middle; font-weight: bold;">
							회원정보</td>
						<td class="top_td">
							<div class="top_text">
								<span style="font-weight: bold; float: left:;">${member.name}</span>님의
								장바구니입니다.
							</div>
						</td>
					</tr>
					<tr class="top_tr">
						<td class="top_td">
							<div class="top_text">
								가용 후원금 :
								<!-- 후원금 뿌려주기 -->
							</div>
						</td>
					</tr>

				</table>
			</div>
			<table class="table">
				<tr class="first_tr">
					<th class="th_style"><input type="checkbox" name="checkAll"></th>
					<th class="th_style">IMG</th>
					<th class="th_style">PRODUCT INFO</th>
					<th class="th_style">PRICE</th>
					<th class="th_style">QUANTITY</th>
					<th class="th_style">RENTAL</th>
					<th class="th_style">TOTAL</th>
					<th class="th_style">SELECT</th>
				</tr>


						<form id="del_frm" action="cartDelete2" method="get">
				<c:forEach items="${cart}" var="dto">
					<c:if test="${member.id eq dto.id}">
					
					<input type="hidden" name="num" value="${dto.cart_num}">
					<input type="hidden" name="id" value="${member.id}">
					<input type="hidden" name="product_name" value="${dto.product_name}">
					<input type="hidden" name="quantity" value="${dto.quantity}">
					<input type="hidden" name="price" value="${dto.price}">
					<input type="hidden" name="start_date" value="${dto.start_date }">
					<input type="hidden" name="last_date" value="${dto.end_date}">
					
					<input type="hidden" name="list_img" value="${dto.list_img}">	
						<tr>
							<td>
								<div class="center"><input type="checkbox"  value="${dto.cart_num}" name="checkOne"></div>
							</td>
							<td class="td_style"><img
								src="<c:url value="${dto.list_img}"/>" class="list_img"></td>
							<td class="td_style"><div class="center" style="font-size: 13px;">${dto.product_name}</div></td>
							<td class="td_style"><div class="center"><fmt:formatNumber type="currency" value="${dto.price}" pattern="###,###" />원</div></td>
							<td class="td_style"><div class="center">${dto.quantity}</div></td>
							<td class="td_style"><div class="center">${dto.start_date}~<br>${dto.end_date}</div></td>
							<td class="td_style"><div class="center"><fmt:formatNumber type="currency" value="${dto.total}" pattern="###,###" />원</div></td>
							<td class="td_style"><input type="button" value="delete"
								id="${dto.cart_num}" class="center delete button_del"></td>
							<%-- <td class="td_style"><div class="center"><a href="cartDelete?cart_num=${dto.cart_num}">DELETE</a></div></td>	 --%>
						</tr>
					</c:if>

				</c:forEach>
						</form>
			</table>
			<div class="button_section">
				<input type="button" value="전체요청하기" class="button" id="cart_btn">
				<input type="button" value="선택요청하기" class="button" id="rent_btn">
				<input type="button" value="선택삭제하기" class="button" id="del2">
			</div>
			



		</section>
	</section>

	<script type="text/javascript">
	
	$("#del2").click(function() {
		$("#del_frm").submit();
		
	});
	
	
	$("#rent_btn").click(function() {
		$("#del_frm").attr("action" , "../../board/order_rent/order_rentList");
		$
		$("#del_frm").submit();
	});
	
	
	
	function allCheckFunc( obj ) {
		$("[name=checkOne]").prop("checked", $(obj).prop("checked") );
}

/* 체크박스 체크시 전체선택 체크 여부 */
function oneCheckFunc( obj )
{
	var allObj = $("[name=checkAll]");
	var objName = $(obj).attr("name");

	if( $(obj).prop("checked") )
	{
		checkBoxLength = $("[name="+ objName +"]").length;
		checkedLength = $("[name="+ objName +"]:checked").length;

		if( checkBoxLength == checkedLength ) {
			allObj.prop("checked", true);
		} else {
			allObj.prop("checked", false);
		}
	}
	else
	{
		allObj.prop("checked", false);
	}
}

$(function(){
	$("[name=checkAll]").click(function(){
		allCheckFunc( this );
	});
	$("[name=checkOne]").each(function(){
		$(this).click(function(){
			oneCheckFunc( $(this) );
		});
	});
});
	
	
	
	
	$(".delete").click(function() {
	var vnum=$(this).attr("id");
	
		location.href="cartDelete?cart_num="+vnum;
		
	});


</script>
	<c:import url="../../temp/footer.jsp" />
</body>
</html>