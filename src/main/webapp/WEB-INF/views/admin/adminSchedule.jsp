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
<c:import url="../temp/bootStrap_api_crash.jsp" />
<style type="text/css">
#tap{
	width: 100%;
	height: 50px;
}
#main_session_default{
	height: 1200px;
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
		margin: 0 auto;
		padding-top: 50px;
	}

</style>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_admin.jsp" />
<div id="main_session_default">
	<div id='calendar'></div>
</div>
<c:import url="../temp/footer.jsp" />
</body>
<script>
	
$('#calendar').fullCalendar({
	header: {
		left: 'prev,next today',
		center: 'title',
		right: 'month,agendaWeek,agendaDay,listMonth'
	},
	defaultDate: '2017-05-12',//sysdate 값 필요
	navLinks: true, // can click day/week names to navigate views
	businessHours: true, // display business hours
	editable: true,
	events: [
		{
			title: 'Business Lunch',
			start: '2017-05-03T13:00:00',
			constraint: 'businessHours'
		},
		{
			title: 'Meeting',
			start: '2017-05-13T11:00:00',
			color: '#257e4a'
		},
		{
			title: 'Conference',
			start: '2017-05-18',
			end: '2017-05-20'
		},
		{
			title: 'Party',
			start: '2017-05-29T20:00:00'
		},

		// areas where "Meeting" must be dropped
		{
			id: 'availableForMeeting',
			start: '2017-05-11T10:00:00',
			end: '2017-05-11T16:00:00',
		},
		{
			id: 'availableForMeeting',
			title: 'Party',
			start: '2017-05-13T10:00:00',
			end: '2017-05-13T16:00:00',
		},

		// red areas where no events can be dropped
		{
			start: '2017-05-24',
			end: '2017-05-30',
		},
		{
			start: '2017-05-06',
			end: '2017-05-08',
			overlap: false,
			rendering: 'background',
			color: '#ff9f89'
		}
	]
});
</script>
</html>
