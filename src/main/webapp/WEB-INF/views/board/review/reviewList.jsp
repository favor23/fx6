<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
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
		height: 1200px;
		/* background-color: yellow; */
		margin: 0 auto;
		margin-top: 20px;
	
	}
	
	.se_main{
		width: 80%;
		height: 100%;
		/* background-color: red; */
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
		margin-top: 7px;
		
	}
	
	
	.table{
		
		width: 100%;
		height: 70%;
		border-top : 2px solid #503396;
		border-bottom: 2px solid #d9d9d9;
		margin-top: 11px;
		vertical-align: middle;
		font-family: 'NanumGothic', '나눔고딕', '맑은 고딕', 'Malgun Gothic', '돋움', dotum, 'Apple SD Gothic Neo', sans-serif;
		font-size: 12px;
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
		border-top : 2px solid #503396;
		border-bottom: 2px solid #d9d9d9;
	}
	
	.viewtr{
	
		border-bottom: 1px solid #d9d9d9;
		color : #666;
		
		height: 30px;
		
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
	
	.th{
		
		color : #666;
		background-color: #f8f8f8;
		font-weight: 600;
		font-size: 13px;
	
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
				
			#wr_bt{
				width: 70px;
				height: 30px;
				background-color: #503396;
				display: inline;
				float: right;
				color: white;
				border: 1px gray solid;
			}
			
			#wr_bt:HOVER {
				
				background-color: white;
				color:  #503396;
				
			}
			
			
			.search_bar{
				
				width: 100%;
				height: 26px;
				
			
			}
			
			#kind{
				
				height: 26px;
				float: left;
			}
			
			#search_btn{
				width : 43px;
				height: 26px;
				border: 1px gray solid;
				background-color: #503396;
				color: white;
				
				
			}
			
			#search_btn:HOVER {
				
				background-color: white;
				color:  #503396;
			}
			
			.view_btn{
				width: 300px;
				height: 26px;
				margin-left : 570px;
				margin-top: 10px;
			}
			
			.view_bt{
				width : 58px;
				height: 26px;
				border: 1px gray solid;
				background-color: #503396;
				color: white;
				
			}
			
			.view_bt:HOVER{
				background-color: white;
				color:  #503396;
			
			}
			
			.top_btn1{
				width: 159px;
				height: 125px;
				background-image: url("${pageContext.request.contextPath}/img/board-img/required_off.jpg");
				border-top: 1px solid #d9d9d9;
				border-left: 1px solid #d9d9d9;
				border-bottom: 1px solid #d9d9d9;
				float: left;
				
			}
			
			.top_btn2{
				width: 159px;
				height: 125px;
				background-image: url("${pageContext.request.contextPath}/img/board-img/review_on.jpg");
				border: 1px solid #d9d9d9;
				float: left;
				
			}
			
			
			.top_btn3{
				width: 159px;
				height: 125px;
				background-image: url("${pageContext.request.contextPath}/img/board-img/matching_off.jpg");
				border-top: 1px solid #d9d9d9;
				border-right: 1px solid #d9d9d9;
				border-bottom: 1px solid #d9d9d9;
				float: left;
				
			}
			
			
			.top_btn1:HOVER {
				background-image: url("${pageContext.request.contextPath}/img/board-img/required_on.jpg");
			}
			
			.top_btn3:HOVER {
				background-image: url("${pageContext.request.contextPath}/img/board-img/matching_on.jpg");
			}
			
			
			.td1{
			
				background-color: #f2f2f2;
				font-size: 12px;
				color: #666;
				width: 15%;
			}
			
			.view_td{
			
				vertical-align: middle;	
				
			}
			
			.view_mar{
				margin-left: 10px;
			}
			
			.top_text{
				display: inline;
				float: left;
			
			}
			
			#reply_btn{
				width: 102px; 
				height: 66px; 
				float: left; 
				border-bottom: 1px solid #d9d9d9;
				border-right: 1px solid #d9d9d9;
				border-top: 1px solid #d9d9d9; 
				background-color: #f2f2f2;
				font-size: 16px;
				color: #595959;
				
			}
			
			#reply_btn:HOVER{
				
				background-color: #bfbfbf;
				color: white;
			
			}
			
			#reply_btn2{
				width: 102px; 
				height: 66px; 
				float: left; 
				border-bottom: 1px solid #d9d9d9;
				border-right: 1px solid #d9d9d9;
				border-top: 1px solid #d9d9d9; 
				background-color: #f2f2f2;
				font-size: 16px;
				color: #595959;
				
			}
			
			#reply_btn2:HOVER{
				
				background-color: #bfbfbf;
				color: white;
			
			}
			
			
			.contentsView{
				width: 100%;
				height: 490px;
				background-color: white;
			}
			
			
			.td{
			
				height: 58px;
				
				margin-top:10px;
			}
			
			

</style>
</head>
<body>
 <c:import url="../../temp/header.jsp"/>
  <c:import url="../../temp/header_plus_board.jsp" />

	
	<div class="main">
		<div class="se_main">
	
	
	
	<div class="top_img" style="width: 488px; height: 160px; vertical-align:middle; margin: 0 auto;">
			<div class="top_btn1">			
			</div>
			
			<div class="top_btn2">			
			</div>
			
			<div class="top_btn3">			
			</div>
		
		<%-- <span class="top_btn1">
			<img src="${pageContext.request.contextPath}/img/board-img/required_on.jpg"  alt="Pic" >
		</span>
		<span class="top_btn2">
			<img src="${pageContext.request.contextPath}/img/board-img/review_off.jpg"  alt="Pic" >
		</span>
		<span class="top_btn3">
			<img src="${pageContext.request.contextPath}/img/board-img/matching_off.jpg"  alt="Pic" >
		</span> --%>
					
		</div>
	
	
		<div class="main2" style="width: 75%; margin: 0 auto">
	
		<div class="first">
			<div class="first1-1">
			
			</div>
			
			<div class="first1-2">
				
			
			</div>

		</div>
		<div class="second">
			<div class="search_bar">
				<form action="reviewList" method="get">
                     <select id="kind" name="search" >
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="contents">글내용</option>
                     </select> 
                     <input type="text" name="find" >
                     <input type="submit" id="search_btn" value="검색"> 
                     <input  type="hidden" name="curPage" value="1">
                  </form>
                  </div>
                  
                  
			<table class="table">
				<tr class="tr">
					<th class="font th" >NO</th>

					<th class="font th">WRITER</th>
					<th class="font th">TITLE</th>
					<th class="font th">DATE</th>
					<th class="font th">HIT</th>
					<th class="font th">LIKE</th>
					
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr class="boardtitle" id="${dto.num}" style="cursor:hand;">
						<td class="font td">${dto.num}</td>
						<td class="font td">${dto.writer}</td>
						<td class="font td"><div class="boardtitle2">${dto.title}</div></td>
						<td class="font td"><fmt:formatDate value="${dto.reg_date}" pattern="MM.dd"/></td>
						<td class="font td">${dto.hit}</td>
						<td class="font td"> ${dto.thumbs_up}</td>
					
					</tr>
				</c:forEach>
			</table>
			
			<div class="bottom" style="width: 100%; height: 30px; overflow: hidden;">
				<ul class="pagination pagination-sm" style="margin-top: -1px;">
			
			<li>
			<c:if test="${listInfo.curBlock>1}">
				<%-- <span class="go" id="${listInfo.startNum-1}">[이전]</span> --%>
				<a href="reviewList?curPage=${listInfo.startNum-1}&search=${listInfo.search}&find=${listInfo.find}">[이전]</a>
			</c:if>
			</li>
			
			<li>
			<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}"
				var="i">
				<%-- <span class="go" id="${i}">${i}</span> --%>
				<a href="reviewList?curPage=${i}&search=${listInfo.search}&find=${listInfo.find}" class="active">${i}</a>
			</c:forEach>
			</li>
			
			<li>
			<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
				<%-- <span class="go" id="${listInfo.lastNum+1}">[다음]</span> --%>
				<a href="reviewList?curPage=${listInfo.lastNum+1}&search=${listInfo.search}&find=${listInfo.find}">[다음]</a>
			</c:if>
			</li>

			</ul>
				<span>
					<c:if test="${member.id ne null }">
					<button type="button" id="wr_bt" class="reviewWrite" >글작성</button>
					</c:if>
				</span>
			</div>
	
	</div>
	</div>
	</div>
	</div>
	

	

<c:import url="../../temp/footer.jsp"/>
<script type="text/javascript">

	$(".reviewWrite").click(function() {
		
		location.href="reviewWrite";
		
	});

$.ajax({
	url : "reviewView?num="+${Rnum},
	datatype : "get",
	success : function(data) {
		
		$(".first1-1").html(data.trim());

	}

});

$.ajax({
	url : "reviewReply?review_num="+${Rnum},
	datatype : "get",
	success : function(data) {
		
		$(".first1-2").html(data.trim());
		
	}
	
});

$(".boardtitle").click(function() {
	var vnum=$(this).attr("id");
	
	
	$.ajax({
		url : "reviewView?num="+vnum,
		datatype : "get",
		success : function(data) {
			
			$(".first1-1").html(data.trim());

		}

	});
	
	$.ajax({
		url : "reviewReply?review_num="+vnum,
		datatype : "get",
		success : function(data) {
			
			$(".first1-2").html(data.trim());
			
		}
		
	});
});
$(".first1-2").on("click","#reply_btn",function() {
    alert("dkals");
    $("#frm").submit();            
 });
 
 $(".first1-2").on("click",".update_btn1",function() {	
	  var reply_num = $(this).attr("id");
	  var review_num = $(this).attr("accesskey");	 
	  alert(reply_num);
	  alert(review_num);
	/*  $.ajax({		  
		  url : "replyMod?reply_num="+reply_num+"&review_num="+review_num,				
		 success:function(data){
			  $(".reply_2").html(data);
			
			  }
		  }		  
	  });  */ 

});



</script>

</body>

</html>


















