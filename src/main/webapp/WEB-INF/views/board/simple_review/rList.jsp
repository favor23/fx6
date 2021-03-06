<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>조회순 리뷰</h3>
<span style="float: left;">총 ${totalCount}건</span>
<span style="float: right;"><a href="../review/reviewList">more...</a></span>
<table class="table" style="border-top: 2px solid #b31aff;">
    <tbody>
    <tr style="background-color: #f2e6ff">
      	<td>title</td>
      	<td>writer</td>
      	<td>date</td>
      	<td>hit</td>
    </tr>
    <c:forEach items="${list}" var="rList">
      <tr>
        <td>${rList.title}</td>
        <td>${rList.writer}</td>
        <td>${rList.reg_date}</td>
        <td>조회수 ${rList.hit}</td>
      </tr>
    </c:forEach>
    </tbody>
</table>
<c:if test="${empty list}">
	<h1>등록된 리뷰가 없습니다.</h1>
</c:if>
<a href="#" onclick="return false;" class="rotation1">추천순으로 보기</a>