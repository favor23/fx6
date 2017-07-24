<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>추천순 리뷰</h3>
<span style="float: left;">총 ${totalCount}건</span>
<span style="float: right;"><a href="../review/reviewList">more...</a></span>
<table class="table">
    <tbody>
    <c:forEach items="${upList}" var="upList">
      <tr>
        <td>${upList.title}</td>
        <td>${upList.writer}</td>
        <td>${upList.reg_date}</td>
        <td>추천수 ${upList.thumbs_up}</td>
      </tr>
    </c:forEach>
    </tbody>
</table>
<a href="#" onclick="return false;" class="rotation2">조회순으로 보기</a>