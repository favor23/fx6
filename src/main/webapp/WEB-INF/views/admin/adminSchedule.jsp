<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href="<c:url value="/calendar/fullcalendar.min.css" />" rel="stylesheet"/>
<link href="<c:url value="/calendar/fullcalendar.print.min.css" />" rel='stylesheet' media='print'/>
<script src='${pageContext.request.contextPath}/calendar/lib/moment.min.js'></script>
<script src='${pageContext.request.contextPath}/calendar/lib/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/calendar/fullcalendar.min.js'></script>
<c:import url="../temp/bootStrap_api_crash_black.jsp" />
<style type="text/css">
#tap{
	width: 100%;
	height: 50px;
}
#main_session_default{
	height: 1300px;
	width: 1000px;
	margin: 0 auto;
}

</style>
<style>

	body {		
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		height:800px;
		margin: 0 auto;
		padding-top: 20px;
	}

</style>
<link href="<c:url value="/css/admin_one.css" />" type="text/css" rel="stylesheet">
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_admin.jsp" />
<div id="main_session_default">
<c:import url="./admin_one.jsp" />
	<div id='calendar'></div>
</div>
<c:import url="../temp/footer.jsp" />
</body>
<script>
var str;
$.post("./schedul_list",function(data){
	/* 제이슨 짜르기  */
	str=JSON.stringify(data);			
	str=str.substring(str.indexOf('['),str.indexOf(']')+1);			
	/* 다시 제이슨 오브젝트화 */
	str=JSON.parse(str);
	var date = new Date();
	 
	    var year = date.getFullYear(); //년도
	    var month = date.getMonth()+1; //월
	    var day = date.getDate(); //일
	 
	    if ((day+"").length < 2) {       // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
	        day = "0" + day;
	    }
	 
	var getToday = year+"-"+month+"-"+day; // 오늘 날짜 

	gogo(str, getToday);
})


function gogo(str, getToday) {
$('#calendar').fullCalendar({
	header: {
		left: 'prev,next today',
		center: 'title',
		right: 'month,agendaWeek,agendaDay,listMonth'
	},
	defaultDate: getToday,//sysdate 값 필요
	navLinks: true, // can click day/week names to navigate views
	businessHours: true, // display business hours
	editable: true,
	events: str
	});	
}
</script>
</html>
