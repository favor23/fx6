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


.color{
	color: red;

}

.color2{
	color: blue;
	
	
}
#tap{
	width: 100%;
	height: 50px;
}
</style>
<c:import url="../temp/bootStrap.jsp" />
</head>
<body>
	<c:import url="../temp/header.jsp" />
	<div id="tap"></div>
<c:import url="../temp/header_plus_admin.jsp" />


	<section class="allSection">
		<section class="mainSection">
			<div class="top_t">ORDER</div>
			<div class="top_area">
				<table class="top_tb">
					<tr class="top_tr">
						<td rowspan="2"
							style="text-align: center; margin-top: 10px; width: 13%; font-size: 12px; vertical-align: middle; font-weight: bold;">
							회원정보</td>
						<td class="top_td">
							<div class="top_text">
								<span style="font-weight: bold; float: left:;">${member.name}</span>님의
								요청 내역입니다.
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
				
					<th class="th_style">IMG</th>
					<th class="th_style">PRODUCT INFO</th>
					<th class="th_style">PRICE</th>
					<th class="th_style">QUANTITY</th>
					<th class="th_style">DATE</th>
					
					<th class="th_style">PERMISSION</th>
				</tr>


						
				<c:forEach items="${list}" var="dto">
					<c:if test="${member.id eq dto.id}">
					
					
					
						<tr>
						
							<td class="td_style"><img
								src="<c:url value="${dto.list_img}"/>" class="list_img"></td>
							<td class="td_style"><div class="center" style="font-size: 13px;">${dto.product_name}</div></td>
							<td class="td_style"><div class="center"><fmt:formatNumber type="currency" value="${dto.price}" pattern="###,###" />원</div></td>
							<td class="td_style"><div class="center">${dto.quantity}</div></td>
							<td class="td_style"><div class="center">${dto.start_date}~<br>${dto.end_date}</div></td>
							<td class="td_style"><div class="center">
							
							<div class="color"><c:if test="${dto.permission eq 'unapproved'}">요청 대기</c:if></div>
							<div class="color2"><c:if test="${dto.permission eq 'approved'}">요청 승인 완료</c:if></div>
							
							</div></td>
							
						</tr>
					</c:if>

				</c:forEach>
					
			</table>
			
			



		</section>
	</section>

	<script type="text/javascript">
	



</script>
	<c:import url="../temp/footer.jsp" />
</body>
</html>