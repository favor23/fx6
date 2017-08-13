<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#remote_box {
	border: 1px solid gray;
	border-radius:5px;
	position: fixed;
	right:30px;
	top:600px;
	background-color: white;
}
#remote_box .ctl_box {
	
}
.remote_btn1{
	width: 80px;
	height: 36px;
	background-color: black;
	color:white;
	font-weight: bold;
	font-size:12px;
	margin-top: 20px;
	margin-left: 27px;
	text-align: center;
	padding-top: 10px;
	border: 1px solid black;
	border-radius: 5px;
	cursor: pointer;
}

.remote_btn1:hover {
	background-color: blue;
}

.remote_btn2{
border:none;
	width: 131px;
	height: 50px;
	background-color: gray;
	color:white;
	font-weight: bold;
	font-size:15px;
	margin-top: 20px;
	
}
.remote_count{
	border:1px solid black;
	border-radius:5px;
	width: 30px;
	height: 30px;
	display: inline-block;
	vertical-align: middle;
    text-align: center;
    line-height: 30px;
    position: fixed;
	right:35px;
	top:632px;
	background-color: white;
}
#remote_box .title {
	width:100%;
	height: 15px;
	text-align:center;
	display:inline-block;
	font-size: 15px;
	margin-bottom:3px;
	margin-top: 3px;
	
}
</style>
<div id="remote_box" style="width: 132px; height: 150px; display: inline-block;">
	<p class="title">채팅 신고 리모콘</p>
	<div class="remote_btn1">신고 확인</div><div class="remote_count">0</div>
	<button class="remote_btn2">신고 처리 내역</button>
	

</div>
<script type="text/javascript">

setInterval("banCount()",1500);

function banCount(){
	$.get("${pageContext.request.contextPath}/admin/getBanCount",function(number){
		number=number.trim();
		if(number*1>0){
			$(".remote_count").css({"background-color":"red","color":"white"});
		}
		$(".remote_count").html(number);
	});
}

$(".remote_btn1").click(function(){
	window.open("${pageContext.request.contextPath}/admin/list","doWork!","width=1000,height=600");
	
});

$(".remote_btn2").click(function(){
	location.href="${pageContext.request.contextPath}/admin/banProccessList";
});



</script>