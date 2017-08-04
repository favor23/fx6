<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <style type="text/css">
    #listBox {
    	height: 200px;
    	overflow: auto;
    }
    </style>
	<div id="listBox">
	<c:forEach items="${list}" var="chat">
		<p>[닉네임]:<span>${chat.writer }</span>[채팅]:<span>${chat.contents }</span>[시간]:<span>${chat.reg_date }</span></p>
	</c:forEach>
	</div>