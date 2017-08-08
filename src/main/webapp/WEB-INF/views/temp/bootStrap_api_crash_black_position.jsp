<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link href="<c:url value="/css/reset.css" />" type="text/css" rel="stylesheet">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value="/css/header.css" />" type="text/css" rel="stylesheet">
<link href="<c:url value="/css/footer.css" />" type="text/css" rel="stylesheet">

<c:if test="${empty member}">
<script type="text/javascript">
alert("로그인이 필요합니다.");
location.href="/fx6/index";
</script>
</c:if>
<c:if test="${member.position ne '부장'}">
<script type="text/javascript">
alert("권한이 없습니다.");
location.href="/fx6/index";
</script>
</c:if>
