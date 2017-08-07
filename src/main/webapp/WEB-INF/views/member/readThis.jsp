<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>Insert title here</title>
<style type="text/css">
#out_line {
	margin-top:80px;
	min-width: 500px;
	width:60%;
	margin-left:20%;
	height: 900px;
}
.r {
border:1px solid black;
 width: 98%;
 margin-left: 1%;
 overflow:auto;
 height: 350px;

}
.c {
	margin-top:3px;
	margin-bottom:24px;
	text-align: right;
	width: 98%;
	float: right;
	margin-right: 1%;
	font-weight: bold;
	font-size: 17px;
	}
.cb1 {
	vertical-align: -9px;
}	
.cb2 {
	vertical-align: -9px;
}

.abs{
	font-size: 14px;
	color: #800000;
	font-weight: normal;
}
.nabs {
	font-size: 14px;
	color:#006600;
	font-weight: normal;
}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
		<div id="out_line">
			<span class="c">약관에 전체 동의합니다.<input type="checkbox" id="ch_all" class="cb1" style="width:30px;height:30px;margin-left: 5px;"></span>
			<div class="r">
			
			</div>
			<span class="c">약관을 전부 읽었으며, 이에 동의합니다.<span class="abs">(필수)</span><input type="checkbox" id="ch1" class="cb2"style="width:30px;height:30px;margin-left: 5px;"></span>

			<div class="r">
			
			</div>
			<span class="c">약관을 전부 읽었으며, 이에 동의합니다.<span class="abs">(필수)</span><input type="checkbox" id="ch2" class="cb2"style="width:30px;height:30px;margin-left: 5px;"></span>

			<div class="r">
			
			</div>
			<span class="c">약관을 전부 읽었으며, 이에 동의합니다.<span class="nabs">(선택)</span><input type="checkbox" id="ch3" class="cb2"style="width:30px;height:30px;margin-left: 5px;"></span>

		</div>
		<form action="joinForm" method="post" id="frm">
			<input type="hidden" name="agree" id="agree">
		</form>
		<button id="chk">버튼</button>
<script type="text/javascript">


$("#chk").click(function(){
	var all = $("#ch_all").is(":checked");
	var ch1 = $("#ch1").is(":checked");
	var ch2 = $("#ch2").is(":checked");
	var ch3 = $("#ch3").is(":checked");
	if(ch1==true&&ch2==true){
		$("#agree").attr("value","ok");
		$("#frm").submit();
	}else {
		alert("필수 약관에 동의하셔야 합니다.");
	}
});



	$(".cb2").click(function() {
		var a = document.getElementsByClassName("cb2");
		var all=document.getElementById("ch_all");
		if (a[0].checked && a[1].checked && a[2].checked) {
			all.checked=true;
			
		} else {
			all.checked=false;
		}

	});
	$("#ch_all").click(function() {
		var all = document.getElementById("ch_all");
		var a = document.getElementsByClassName("cb2");
		if (all.checked == true) {
			for (var i = 0; i < a.length; i++) {
				a[i].checked = true;
			}
		} else {
			for (var i = 0; i < a.length; i++) {
				a[i].checked = false;
			}
		}

	});
</script>
</body>
</html>