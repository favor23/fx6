<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<form action="movieupload" method="post" enctype="multipart/form-data">
	동영상 : <input type="file" name="f1" id="file"><br><br>
	포스터 : <input type="file" name="f2" id="file2"><br><br>
	플레이시간 : <input type="text" name="playtime" id="playtime" placeholder="122   분,초"><br><br>
	시작시간 : <input type="text" name="startTime" id="startTime" placeholder="20170731171000" onblur="asas()">
	종료시간 : <input type="text" name="lastTime" id="lastTime" value="">
	<button>upload</button>
</form>
</body>
<script type="text/javascript">
	
	function asas() {
		var playTime = $("#playtime").val(); 
		var startTime = $("#startTime").val();
		var lastTime = startTime*1+playTime*1;
		alert(playTime);
		alert(startTime);
		alert(lastTime);
		$("#lastTime").val(lastTime);		
	}
</script>
</html>