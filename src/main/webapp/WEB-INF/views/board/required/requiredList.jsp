<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<style type="text/css">

	.main{
		width: 1500px;
		height: 930px;
		/* background-color: yellow; */
		margin: 0 auto;
	
	}


	.first{
		
		width: 70%;
		height: 100%;
		/* background-color: red;  */
		float: left;
		overflow-x:hidden; 
		overflow-y:auto;
	
	}
	
	.first1-1{
		width: 100%;
		height: 70%;
	/* 	background-color: gray; */
	
	}
	
	.first1-2{
		width: 100%;
		height: 30%;
		/* background-color: lime; */
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
		
		width: 75%;
		height: 70%;
		border: solid black 2px;
		
		margin-top: 50px;
	}
	
.boardtitle2{
		width :140px;
		text-overflow: ellipsis;
		overflow: hidden;
   		 white-space: nowrap;

	}
	
	#viewtable{
	
		width: 1000px;
		height: 100%;
		border: 2px black solid;
	}
	
	.viewtr{
	
		border: 1px black solid;
		
	}
	
	.boardtitle{
		
		cursor: pointer;
	
	}
	

	
	

</style>
</head>
<body>


	
	<div class="main">
		<div class="first">
			<div class="first1-1">
			
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
				
					
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr class="boardtitle" id="${dto.num}" style="cursor:hand;">
						<td>${dto.num}</td>
						<td>${dto.writer}</td>
						<td><div class="boardtitle2">${dto.title}</div></td>
						<td><fmt:formatDate value="${dto.reg_date}" pattern="MM.dd"/></td>
						<td>${dto.hit}</td>
					
					
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

			<a href="requiredWrite">WRITE</a>
		</div>
	
	</div>
	

	


<script type="text/javascript">


$(".boardtitle").click(function() {
	var vnum=$(this).attr("id");
	
	
	$.ajax({
		url : "requiredView?num="+vnum,
		datatype : "get",
		success : function(data) {
			
			$(".first1-1").html(data.trim());

		}

	});
});


</script>

</body>

</html>