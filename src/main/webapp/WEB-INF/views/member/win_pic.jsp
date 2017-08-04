<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사진 업로드</title>
<style type="text/css">
#myPic{
	width: 380px;
	height: 430px;
	margin-left: 10px;
	margin-top: 10px;
	background-color: #cceeff;
	border: 2px solid #00334d;
	border-radius: 5px;
}
#myPic label{
margin-top:5px;
width: 100%;
text-align: center;
font-weight: bold;

}

#box {
	width: 200px;
	height: 266px;
	margin-left:92px;
	border: 2px solid #0077b3;
	background-color: white;
	overflow: hidden;
}
#box img{
	width: 100%; height: 100%;
}

#file {
 	width:80%;
 	margin-left:10%;
	margin-top: 20px;
	border: 2px solid #0077b3;
	background-color: white;
}

#picDone {
	width: 40%;
	margin-left:30%;
	height: 40px;
	margin-top: 20px;
	border: 2px solid #00334d;
	border-radius:5px;
	background-color: #00334d;
	color:white;
	font-weight: bold; 
}
</style>
</head>
<body>
<c:import url="../temp/bootStrap_black.jsp" />
	<div id="myPic">
		<div id="box"><img id="preView" alt="" src="#" style="display: none"></div>
		<label>Tip - 사진의 비율은 3:4가 제일 좋습니다. </label>
		<form action="file_upload" method="post" id="f" enctype="multipart/form-data" >
			<input type="hidden" name="id" value="${member.id }">
			<input type="file" name="f1" id="file">
		</form>
		<input type="button" value="업로드" id="picDone">
	</div>
	<script type="text/javascript">
	var chk = "none";
	var id= '${member.id}';
	if(id==''){
		window.close();
	}
	$("#file").on('change', function(){
        readURL(this);
    });
	
	 function readURL(input) {
	        if (input.files && input.files[0]) {
	        var reader = new FileReader();
	
	        reader.onload = function (e) {
	                $('#preView').attr('src', e.target.result);
	                $("#preView").css("display","inline-block");
	                chk="done";
	            }
	
	          reader.readAsDataURL(input.files[0]);
	        }
	    }
	
	 $("#picDone").click(function(){
	    	if(chk=='none'){
	    		alert('사진이 없습니다.');
	    	}else {
	    		$("#f").submit();
	    	}
	    });
	
	
	</script>
</body>
</html>