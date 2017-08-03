<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${list}" var="dto">
   <div class="ct">
      <section class="wrapper cl">
         <div class="pic pic-3d">
            <img src="<c:url value="${dto.matching_img}"/>" class="pic-image" alt="Pic">
            <span class="pic-caption open-right" accesskey="${dto.matching_num}">
               <h1 class="pic-title">${dto.title}</h1>
               <hr>
               <p>감독 : ${dto.writer}</p>
               <p>장르 : ${dto.genre}</p>
               <p>형식 : ${dto.form}</p>
               <p >줄거리 : ${dto.story}</div></p>
               <p>작성일 : ${dto.reg_date}</p>         
            </span>
         </div>
      </section>
   </div>
</c:forEach>