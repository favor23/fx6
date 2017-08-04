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
<c:import url="../../temp/bootStrap.jsp"></c:import>

<style type="text/css">

	.main{
		width: 100%;
		height: 930px;
		/* background-color: yellow; */
		margin: 0 auto;
		margin-top: 20px;
	
	}
	
	.se_main{
		width: 80%;
		height: 100%;
		background-color: red;
		margin: 0 auto;
	
	}


	.first{
		
		width: 62%;
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
		width:35%;
		height: 100%;
		/* background-color: blue; */
		float: right;
		overflow-x:hidden; 
		overflow-y:auto;
		
	}
	
	
	.table{
		
		width: 100%;
		height: 70%;
		border: solid black 2px;
		margin-top: 50px;
		vertical-align: middle;
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
	
	.font{
		
		font-family: "lucida grande", Tahoma, Verdana, Arial, Helvetica, sans-serif, "나눔고딕", NanumGothic, "돋움", Dotum'';
		font-size: 12px;
		line-height: 58px;
		vertical-align: middle;
		
	}
	
	.tr{
	
		
		line-height: 58px;
		vertical-align: middle;
	}
	
	
	
	
	

</style>
</head>
<body>
 <c:import url="../../temp/header.jsp"/>
 <c:import url="../../temp/header_plus_board.jsp" />

	
	<div class="main">

		<div class="se_main">

	<div class="main2" style="width: 75%; margin: 0 auto">
		

		<div class="first">
			<div class="first1-1">
			
			</div>
			
			<div class="first1-2">
			
			</div>

		</div>
		<div class="second">
			<table class="table">
				<tr class="tr">
					<th class="font" style="border-right: 1px gray solid">No</th>
					<th class="font">WRITER</th>
					<th class="font">TITLE</th>
					<th class="font">DATE</th>
					<th class="font">HIT</th>
				
					
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr class="boardtitle tr" id="${dto.num}" style="cursor:hand;" >
						<td class="font td" style="color: red;">${dto.num}</td>
						<td class="font td">${dto.writer}</td>
						<td class="font td"> 
                           <div class="boardtitle2"><c:forEach begin="1" end="${dto.depth}" var="i">
                           <span>RE:</span>
                           </c:forEach> ${dto.title}</div>
                        </td>
						<td class="font td"><fmt:formatDate value="${dto.reg_date}" pattern="MM.dd"/></td>
						<td class="font td">${dto.hit}</td>
					
					
					</tr>
				</c:forEach>
			</table>
			<c:if test="${listInfo.curBlock>1}">
				<%-- <span class="go" id="${listInfo.startNum-1}">[이전]</span> --%>
				<a href="requiredList?curPage=${listInfo.startNum-1}&search=${listInfo.search}&find=${listInfo.find}">[이전]</a>
			</c:if>
			<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}"
				var="i">
				<%-- <span class="go" id="${i}">${i}</span> --%>
				<a href="requiredList?curPage=${i}&search=${listInfo.search}&find=${listInfo.find}">${i}</a>
			</c:forEach>
			<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
				<%-- <span class="go" id="${listInfo.lastNum+1}">[다음]</span> --%>
				<a href="requiredList?curPage=${listInfo.lastNum+1}&search=${listInfo.search}&find=${listInfo.find}">[다음]</a>
			</c:if>

			<a href="requiredWrite">WRITE</a>
		</div>
	</div>
	</div>
	</div>
	

	

<c:import url="../../temp/footer.jsp"/>
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