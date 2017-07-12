<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   
   
   
   $(function() {

      $(".boardtitle").click(function(){
         var num =$(this).attr("id").val();
         alert("ddd");
         $.ajax({

            url : "reviewView?num="+num,
            datatype : "get",
            success : function(data) {
               alert(num);
               $("#first1-1").html(data);

            }

         });

      });

   });
</script>
<style type="text/css">

   .main{
      width: 1600px;
      height: 930px;
      background-color: yellow;
      margin: 0 auto;
   
   }


   .first{
      
      width: 70%;
      height: 100%;
      background-color: red; 
      float: left;
      overflow-x:hidden; 
      overflow-y:auto;
   
   }
   
   .first1-1{
      width: 100%;
      height: 70%;
      background-color: gray;
   
   }
   
   .first1-2{
      width: 100%;
      height: 30%;
      background-color: lime;
   }
   
   .second{
      width:28%;
      height: 100%;
      /* background-color: blue; */
      float: right;
      overflow-x:hidden; 
      overflow-y:auto;
      
   }
   
   
   .table{
      width: 90%;
      height: 70%;
      border: solid black 1px;
      margin: 0 auto;
   
   }
   
.boardtitle{
      width :150px;
      text-overflow: ellipsis;
      overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;

   }

</style>
</head>
<body>


   
   <div class="main">
      <div class="first">
         <div class="first1-1">
         
         
            <table>
   
         <tr>
            <th>NUM</th>
            <th>WRITER</th>
            <th>TITLE</th>
            <th>REG_DATE</th>
            <th>HIT</th>
            <th>LIKE</th>
            <th>STAR</th>
         </tr>
   
   
         <tr>
            <td>${view.num}</td>
            <td>${view.writer}</td>
            <td>${view.title}</td>
            <td>${view.reg_date}</td>
            <td>${view.hit}</td>
            <td>${view.thumbs_up}</td>
            <td>${view.stars}</td>
         </tr>
   
         <tr>
            <th colspan="5">CONTENTS</th>
         </tr>
   
   
         <tr>
            <td colspan="5">${view.contents}</td>
         </tr>
   
   
      </table>
         
         
         
         
         
         
         
         
         </div>
         
         <div class="first1-2">
         
         </div>

      </div>
      <div class="second">
      
         <table class="table table table-hover">
            <tr>
               <th>No</th>
               <th>WRITE</th>
               <th>TITLE</th>
               <th>DATE</th>
               <th>HIT</th>
               <th>LIKE</th>
               
            </tr>
            <c:forEach items="${list}" var="dto">
               <tr class="boardtitle" id="${dto.num}">
                  <td>${dto.num}</td>
                  <td>${dto.writer}</td>
                  <td  >${dto.title}</td>
                  <td><fmt:formatDate value="${dto.reg_date}" pattern="MM.dd"/></td>
                  <%-- <td>${dto.reg_date}</td> --%>
                  <td>${dto.hit}</td>
                  <td>${dto.thumbs_up}</td>
               
               </tr>
            </c:forEach>
         </table>
         <c:if test="${listInfo.curBlock>1}">
            <span class="go" id="${listInfo.startNum-1}">[이전]</span>
            <%-- <a href="${board}List?curPage=${listInfo.startNum-1}&search=${listInfo.search}&find=${listInfo.find}">[이전]</a> --%>
         </c:if>
         <c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}"
            var="i">
            <span class="go" id="${i}">${i}</span>
            <%-- <a href="${board}List?curPage=${i}&search=${listInfo.search}&find=${listInfo.find}">${i}</a> --%>
         </c:forEach>
         <c:if test="${listInfo.curBlock < listInfo.totalBlock}">
            <span class="go" id="${listInfo.lastNum+1}">[다음]</span>
            <%-- <a href="${board}List?curPage=${listInfo.lastNum+1}&search=${listInfo.search}&find=${listInfo.find}">[다음]</a> --%>
         </c:if>

         <a href="reviewWrite">WRITE</a>
      </div>
   
   </div>
   

   

</body>
</html>