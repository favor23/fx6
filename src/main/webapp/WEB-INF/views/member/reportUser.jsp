<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>URP</title><!-- UserReportPage -->
<style type="text/css">
#frm {
	width: 98%;
	margin-left: 1%;
}
.front {
width:80px;
	background-color: black;
	color: white;
	font-weight: bold;
}
.behind {
width:170px;
	font-weight: bold;
}
#selector {
	height: 37px;
	width: 174px;
}
#btn {
 width: 100%;
}
.done_and_done {
	width:100%;
	text-align:center;
	display: none;

}
</style>
</head>
<body>
<c:if test="${!empty blist}">
		<div id="frm">
			<table class="table tabel-hover">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;font-weight: bold;font-size: 18px;">유 저 신 고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="front">신고대상</td><td class="behind">${blist.targetId }</td>
					</tr>
					<tr>
						<td class="front">신고자</td><td class="behind">${blist.senderId }</td>
					</tr>
					<tr>
						<td class="front">신고사유</td>
						<td class="behind2" style="padding: 0;">
							<select name="reason" id="selector">
								<option value="욕설 및 비속어">욕설 및 비속어</option>
								<option value="스포일러">스포일러</option>
								<option value="도배">도배</option>
								<option value="분란조장">분란조장</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="button" id="btn" class="btn btn-success" value="제출">
			<p class="done_and_done">신고가 제출되었습니다.</p>
			<p class="done_and_done"><span id="timer">5</span>초 후에 창이 닫힙니다.</p>
		</div>
		<input type="hidden" id="target" value="${blist.targetId }">
		<input type="hidden" id="sender" value="${blist.senderId }">
		<input type="hidden" id="roomNum" value="${blist.roomNum }">
</c:if>
<c:if test="${empty blist}">
		<h1>잘못된 접근입니다.</h1>
</c:if>
</body>
<script type="text/javascript">
var second = 4;
var inter;
$("#btn").click(function(){
var rsn = $("#selector").val();
var target = $("#target").val();
var sender = $("#sender").val();
var num = $("#roomNum").val();
	$.post("reportUser",{
		targetId:target,
		senderId:sender,
		reason:rsn,
		roomNum:num
	},function(data){
		data=data.trim();
		if(data=='done'){
			$("#btn").css("display","none");
			$(".done_and_done").css("display","inline-block");
			inter = setInterval("cd(second)",1000);
		}
	});	
});

function cd(sec){
	if(sec>0){
		$("#timer").html(second);
		second--;
	}else {
		chain(inter);
	}
}

function chain(inter){
		clearInterval(inter);	
		window.close();
}

</script>
</html>