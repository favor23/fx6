<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list}" var="dto">
	<div class="ct">
		<section class="wrapper cl">
			<div class="pic pic-3d">
				<img src="<c:url value="${dto.list_img}"/>" class="pic-image" alt="Pic">
            	<span class="pic-caption open-right" accesskey="${dto.num}">
		               <h1 class="pic-title">${dto.product_name}</h1>
		               <hr>
		               <p>감독 : ${dto.price}</p>
		              
            </span>
			</div>
		</section>
	</div>
</c:forEach>

</body>
</html>