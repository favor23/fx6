<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	

	
   			 <form id="frm" name="frm" action="reply${path}" method="post">
                 	<%-- <input type= "hidden" name="write" value="${member.id}"> --%>
                 	<input type="hidden" name="review_num" value="${listInfo.review_num}">
                 	<table>
                 		<tr>
                 			<td>
                 				<input type="text" name="writer" value="${update.writer}">
                 			</td>
                 			<td>
                 				<textarea rows="3" cols="76" name="contents" placeholder="댓글을 입력해주세요." required="required">${update.contents}</textarea>
                 			</td>
                 			<td>
                 				<input type="button" id="reply_btn" value="버튼">
                 			</td>
                 		</tr>
                 	</table>
                 </form>
                 	
                 	
                 	
                 	<table style="border:none; width: 100%;">
                     
                     <c:forEach items="${list}" var="ar">
                        <tr>
                           <td style="font-weight: bold;">
                              ${ar.writer}
                           </td>
                            <td style="text-align: right; font-size: small;">
                              ${ar.reg_date}
                           </td>
                        </tr>
                        <tr class="reply_2" id="${ar.reply_num}" style="background-color: #f2f2f2">
                           <td>
                              <div id="up_contents">${ar.contents}</div>                             
                           </td>
                           <td style="text-align: right;">                     
                            
                             
                              <%-- <c:if test="${member.id eq ar.writer}"> --%>
                              <input type="button" class="update_btn1" value="수정" id="${ar.reply_num}" accesskey="${ar.review_num}">                       
                              <a href="replyDelete?reply_num=${ar.reply_num}&review_num=${ar.review_num}" style="margin-left: 10px; color: red;" id="x">X</a>
                              <%-- </c:if> --%>
                             
                          </td>
                          
                        </tr>   
                     </c:forEach>
                  </table>
                  
		            <c:if test="${listInfo.curBlock>1}">
						<%-- <span class="go" id="${listInfo.startNum-1}">[이전]</span> --%>
						<a href="${board}List?curPage=${listInfo.startNum-1}&search=${listInfo.search}&find=${listInfo.find}">[이전]</a>
					</c:if>
					<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}"
						var="i">
						<%-- <span class="go" id="${i}">${i}</span> --%>
						<a href="${board}List?curPage=${i}&search=${listInfo.search}&find=${listInfo.find}">${i}</a>
					</c:forEach>
					<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
						<%-- <span class="go" id="${listInfo.lastNum+1}">[다음]</span> --%>
						<a href="${board}List?curPage=${listInfo.lastNum+1}&search=${listInfo.search}&find=${listInfo.find}">[다음]</a>
					</c:if>
		                  
                 	
                 

	

<script type="text/javascript">
      $("#reply_btn").click(function() {
        
            $("#frm").submit();            
         });
      
      $("#update_btn1").click(function() {
  		alert("dkasj");
      	  var reply_num = $(this).attr("id");
      	  $.ajax({
      		  
      		  url : "replyMod",
      		type : "post",
      				data:{
      					contents : contents,
      					reply_num : reply_num,
      					review_num : ${ar.review_num}
      				}, 
      		  success:function(data){
      			  $('.reply_2').html(data);
      			
      			  }
      		  }
      		  
      	  });  
      
  	});
 	
   
      
      
   </script>
