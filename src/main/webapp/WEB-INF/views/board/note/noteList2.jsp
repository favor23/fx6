<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../temp/bootStrap_black.jsp" />
<link href="<c:url value="/css/admin_one.css" />" type="text/css" rel="stylesheet">

<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	
	body{
	
	font-family: 'Noto Sans KR';
	}
	
	#tap {
	width: 100%;
	height: 50px;
	}
	#main_session_default {
	height: 400px;
	width: 1000px;
	margin: 0 auto;
	}	

	.note_main{
	
	width : 800px;
	height: auto;
	margin: 0 auto;
	padding: 0 0 100px 0;
	/* background-color: yellow;	 */
	}
	
	.contentsView{
		
		width : 400px;
    	overflow: hidden;
    	text-overflow: ellipsis;
	    white-space: nowrap;

	}
	
	.table{
		
		border-top: 2px solid #503396;
		border-bottom: 2px solid #e1e1e1;
		font-family: 'NanumGothic', '나눔고딕', '맑은 고딕', 'Malgun Gothic', '돋움', dotum, 'Apple SD Gothic Neo', sans-serif;
		font-size: 12px;
	
	}
	
	th{
		
		background-color: #f2f2f2;
		color: #666;
		font-size: 13px;
		font-weight: 700;
	
	}
	
	.button_lab{
		
		width: 100%;
		height: 60px;
		/* background-color: yellow; */
	}
	
	
	.send_btn{
		
		border: 1px solid #351F66 !important;
		background-color: #503396 !important;
		color: white;
		float: right;
		margin-right: 10px;
	
	}
	
	
	.del_btn{
	
		border: 1px solid #351F66 !important;
		background-color: #503396 !important;
		color: white;
		float: right;
	}







			.pagination {
			    display: inline-block;
			    color: #503396;
			    float: left;
			   
			}
			
			.pagination a {
			    color: #503396;
			    float: left;
			    padding: 8px 16px;
			    text-decoration: none;
			    transition: background-color .3s;
			    border: 1px solid #ddd;
			    margin: 0 4px;
			}
			
			.pagination a.active {
			    background-color: #503396;
			    color: white;
			    border: 1px solid #351F66;
			}
			
			.pagination a:hover:not(.active) {background-color: #ccc;}








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
<div id="tap"></div>
<c:import url="../../temp/header_plus_admin.jsp" />
<div id="main_session_default">
<c:import url="../../admin/admin_one.jsp" />
</div>	
	<article class="note_main">
	
		
		<table class="table">
			<tr>
				<th><input type="checkbox" name="checkAll"></th>
				<th>보낸사람</th>
				<th>내용</th>
				<th>수신일자</th>
			</tr>
			<form method="get" id="del_frm" action="noteDelete2">
			<c:forEach items="${list}" var="dto">
				<c:if test="${dto.addressee eq member.id }">
			<tr>
				<td><input type="checkbox" value="${dto.num}" name="checkOne"></td>
				<td>${dto.sender}</td>
				<td><div class="contentsView" id="${dto.num}" data-toggle="modal" data-target="#viewModal">${dto.contents}</div></td>
				<td>${dto.reg_date}</td>
			</tr>
				</c:if>
			</c:forEach>
				</form>
		</table>
	
	
	<div class=" button_lab">
	

			 <c:if test="${listInfo.curBlock>1}">
				<a href="noteList?curPage=${listInfo.startNum-1}">[이전]</a>
			</c:if>
			<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
				<a href="noteList?curPage=${i}">${i}</a>
			</c:forEach>
			<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
				<a href="noteList?curPage=${listInfo.lastNum+1}">[다음]</a>
			</c:if>
	
	<button type="button" value="삭제" id="delete_sel" class="del_btn">삭제</button>
	<c:if test="${member.grade eq 'admin'}">
		<button type="button" data-toggle="modal" data-target="#sendmessage" class="send_btn">쪽지 보내기</button>
	</c:if>
	</div>	
		
		
		
			
			
			
			
			
			
			
							<!-- Modal -->
				  <div class="modal fade" id="viewModal" role="dialog" >
				    <div class="modal-dialog modal-sm">
				    
				      <!-- Modal content-->
				      <div class="modal-content" style="color:black; background-color: white;"><!-- 여기가 모달 창 조정 부분 -->
				        <div class="modal-header" style="border-bottom: #503396 solid 2px; background-color: #ddd;">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">수신쪽지</h4>
				        </div>
				        <div class="modal-body2">
				          <p>수신쪽지</p>
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
			        <div class="modal-header" style="border-bottom: #503396 solid 2px; background-color: #ddd;">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">쪽지 보내기</h4>
			        </div>
			        <div class="modal-body">
			         <form action="noteWrite" method="post" id="frm">
			          	<input type="hidden"  name="sender" value="${member.id}">
			          	
			          	<div style="float: left; width: 30%; ">받는 사람 </div> <input type="text" name="addressee" class="form-control" style="width:70%; height: 30px; float: right;" placeholder="아이디를 입력해주세요." >
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