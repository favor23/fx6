<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	

	
   			 <form id="frm" name="frm" action="reply${path}" method="post">
                 	<%-- <input type= "hidden" name="write" value="${member.id}"> --%>
                 	<input type="hidden" name="review_num" value="${listInfo.review_num}">
                 	<input type="hidden" name="writer" value="${member.id}">
                 	
                 	
                 	<c:if test="${member.id eq null }">
                 		<table>
                 		<tr>
                 			<td>
                 				<textarea rows="3" cols="81" name="contents" placeholder="로그인 후 이용바랍니다." readonly="readonly" required="required" style="margin-left: 15px; margin-top: 20px; resize: none; float: right;" >${update.contents}</textarea>
                 			</td>
                 			<td>
                 				<input type="button" id="reply_btn2" value="등록">
                 			</td>
                 		</tr>
                 	</table>
                 	
                 	</c:if>
                 	<c:if test="${member.id ne null}">
                 	<table>
                 		<tr>
                 			<td>
                 				<textarea rows="3" cols="81" name="contents" placeholder="댓글을 입력해주세요." required="required" style="margin-left: 15px; margin-top: 20px; resize: none; float: right;" >${update.contents}</textarea>
                 			</td>
                 			<td>
                 				<input type="button" id="reply_btn" value="등록">
                 			</td>
                 		</tr>
                 	</table>
                 	</c:if>
                 </form>
                 	
                 	
                 	
                 	<table style="border:none; width: 98%; float: right; margin-top: 10px; " class="table" >
                     
                     <c:forEach items="${list}" var="ar">
                        <tr>
                           <td style="font-weight: bold;font-weight: 700; font-family: '나눔고딕', 'NanumGothic', '맑은 고딕', 'Malgun Gothic', '돋움', dotum, 'Apple SD Gothic Neo', sans-serif; font-size: 18px; line-height: 13px;  color: #333;">
                              ${ar.writer}
                           </td>
                            <td style="text-align: right; font-size: small; font-size: 12px; color: #666;">
                              ${ar.reg_date}
                           </td>
                        </tr>
                        <tr class="reply_2" id="${ar.reply_num}" >
                           <td>
                              <div id="up_contents">${ar.contents}</div>                             
                           </td>
                           <td style="text-align: right;">                     
                            
                             
                              <c:if test="${member.id eq ar.writer}">
                              <input type="button" class="update_btn1" value="수정" id="${ar.reply_num}" accesskey="${ar.review_num}">                       
                              <a href="replyDelete?reply_num=${ar.reply_num}&review_num=${ar.review_num}" style="margin-left: 10px; color: red;" id="x">X</a>
                              </c:if>
                             
                          </td>
                          
                        </tr>   
                     </c:forEach>
                  </table>
                  
		          <%--   <c:if test="${listInfo.curBlock>1}">
						
						<a href="reviewReply?curPage=${listInfo.startNum-1}&search=${listInfo.search}&find=${listInfo.find}">[이전]</a>
					</c:if>
					<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}"
						var="i">
						
						<a href="reviewReply?curPage=${i}&search=${listInfo.search}&find=${listInfo.find}">${i}</a>
					</c:forEach>
					<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
					
						<a href="reviewReply?curPage=${listInfo.lastNum+1}&search=${listInfo.search}&find=${listInfo.find}">[다음]</a>
					</c:if>
		                   --%>
                 	
                 

	

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
