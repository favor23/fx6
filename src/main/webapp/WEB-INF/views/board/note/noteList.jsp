<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../temp/bootStrap.jsp"></c:import>
<style type="text/css">
	
	.note_main{
	
	width : 800px;
	height: auto;
	margin: 0 auto;
	padding: 100px 0 100px 0;
	/* background-color: yellow;	 */
	}
	
	.contentsView{
		
		width : 400px;
    	overflow: hidden;
    	text-overflow: ellipsis;
	    white-space: nowrap;

	}

</style>
<script type="text/javascript">

function checkAll(){
    if( $("#th_checkAll").is(':checked') ){
      $("input[name=checkRow]").prop("checked", true);
    }else{
      $("input[name=checkRow]").prop("checked", false);
    }
}


</script>
</head>
<body>
<c:import url="../../temp/header.jsp"/>
	<article class="note_main">
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#sendmessage">쪽지 보내기</button>
	<button type="button" value="DELETE" id="delete_sel">DELETE</button>
	
	
		
		<table class="table table table-hover">
			<tr>
				<th><input type="checkbox" name="checkAll"></th>
				<th>보낸사람</th>
				<th>내용</th>
				<th>날짜</th>
			</tr>
			<form method="get" id="del_frm" action="noteDelete2">
			<c:forEach items="${list}" var="dto">
				<c:if test="${dto.addressee eq member.id }">
			<tr>
				<td><input type="checkbox" value="${dto.num}" name="checkOne"></td>
				<td>${dto.addressee}</td>
				<td><div class="contentsView" id="${dto.num}" data-toggle="modal" data-target="#viewModal">${dto.contents}</div></td>
				<td>${dto.reg_date}</td>
			</tr>
				</c:if>
			</c:forEach>
				</form>
		</table>
		
		
		<c:if test="${listInfo.curBlock>1}">
				<a href="noteList?curPage=${listInfo.startNum-1}">[이전]</a>
			</c:if>
			<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
				<a href="noteList?curPage=${i}">${i}</a>
			</c:forEach>
			<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
				<a href="noteList?curPage=${listInfo.lastNum+1}">[다음]</a>
			</c:if>
			
			
			
			
			
			
			
							<!-- Modal -->
				  <div class="modal fade" id="viewModal" role="dialog">
				    <div class="modal-dialog modal-sm">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Modal Header</h4>
				        </div>
				        <div class="modal-body2">
				          <p>Some text in the modal.</p>
				        </div>
				        <div class="modal-footer">
				        	
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				      
				    </div>
				  </div>
							

			 			
			  <!-- Modal -->
			  <div class="modal fade" id="sendmessage" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">쪽지 보내기</h4>
			        </div>
			        <div class="modal-body">
			         <form action="noteWrite" method="post" id="frm">
			          	<input type="hidden"  name="sender" value="${member.id}">
			          	받는 사람 : <input type="text" name="addressee" class="form-control" style="width:180px; height: 30px;" placeholder="아이디를 입력해주세요.">
			        	<textarea rows="20" cols="54" class="form-control" name="contents" style="resize: none;"></textarea> 
			        	</form> 
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal" id="message">보내기</button>
			        </div>
			      </div>
			      
			    </div>
			  </div>
			  
			  
			  
			  


			
			
			
			
	</article>
	<script type="text/javascript">
	
	$("#message").click(function () {			
		$("#frm").submit();
	
	});
	
	
	$("#delete_sel").click(function() {
		$("#del_frm").submit();
	});
	
	
	$(".contentsView").click(function() {
		var vnum=$(this).attr("id");
		
		
		$.ajax({
			url : "noteView?num="+vnum,
			datatype : "get",
			success : function(data) {
				
				$(".modal-body2").html(data.trim());
			}
			
			
		});
	});
	
	
	

	function allCheckFunc( obj ) {
		$("[name=checkOne]").prop("checked", $(obj).prop("checked") );
}

/* 체크박스 체크시 전체선택 체크 여부 */
function oneCheckFunc( obj )
{
	var allObj = $("[name=checkAll]");
	var objName = $(obj).attr("name");

	if( $(obj).prop("checked") )
	{
		checkBoxLength = $("[name="+ objName +"]").length;
		checkedLength = $("[name="+ objName +"]:checked").length;

		if( checkBoxLength == checkedLength ) {
			allObj.prop("checked", true);
		} else {
			allObj.prop("checked", false);
		}
	}
	else
	{
		allObj.prop("checked", false);
	}
}

$(function(){
	$("[name=checkAll]").click(function(){
		allCheckFunc( this );
	});
	$("[name=checkOne]").each(function(){
		$(this).click(function(){
			oneCheckFunc( $(this) );
		});
	});
});
	
	
	
	
	
	</script>
<c:import url="../../temp/footer.jsp"/>
</body>
</html>