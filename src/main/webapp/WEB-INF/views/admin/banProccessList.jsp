<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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

#bpl_table th {
font-weight: bold;

}
.go {
 border: 1px solid gray;
 border-radius: 5px;
 width: 30px;
 height: 30px;
 display: inline-block;
 text-align: center;
 line-height: 30px;
 color: cornflowerblue;
 font-weight: bold;
 font-size: 20px;
}
.go:hover{
cursor: pointer;
}
.go2 {
 border: 1px solid gray;
 border-radius: 5px;
 width: 30px;
 height: 30px;
 display: inline-block;
 text-align: center;
 line-height: 30px;
 color: cornflowerblue;
 font-weight: bold;
 font-size: 20px;
}
.go2:hover{
cursor: pointer;
}
#pageing {
text-align: center;
}

#controlBox1 {
float: right;
margin-top: 20px;
margin-bottom: 20px;

}

#sch_value{
width: 115px;
}
#findThis {
margin-left: 10px;
height: 30px;
}

#fallback {
margin-right: 10px;
height: 30px;
}
</style>
<c:import url="../temp/bootStrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp" />
<div id="tap"></div>
<c:import url="../temp/header_plus_admin.jsp" />
<div id="main_session_default" class="member_css">

<div id="controlBox1">
<button class="btn btn-info" id="fallback" style="display: none;">전체목록</button>
담당자 검색 : <input type="text" id="sch_value"><button class="btn btn-default" id="findThis">찾기</button>
</div>
<div id="bpl_main">

</div>
</div>
<c:import url="../temp/footer.jsp" />
</body>
<script type="text/javascript">
$.get("${pageContext.request.contextPath}/admin/banProccessListAll?curPage=1&id=n",function(data){
	$("#bpl_main").html(data);
});

$("#bpl_main").on("click",".go",function(){
	var cp = $(this).attr("id");
	$.get("${pageContext.request.contextPath}/admin/banProccessListAll?curPage="+cp+"&id=n",function(data){
		$("#bpl_main").html(data);
	});
});
$("#bpl_main").on("click",".go2",function(){
	var cp = $(this).attr("id");
	var id=$(this).attr("dropzone");
	$.get("${pageContext.request.contextPath}/admin/banProccessListSearch?curPage="+cp+"&id="+id,function(data){
		$("#bpl_main").html(data);
	});
});

$("#findThis").click(function(){
	var id=$("#sch_value").val();
	$.get("${pageContext.request.contextPath}/admin/banProccessListSearch?curPage=1&id="+id,function(data){
		$("#bpl_main").html(data);
	});
	$("#fallback").removeAttr("style");
});

$("#fallback").click(function(){
	$.get("${pageContext.request.contextPath}/admin/banProccessListAll?curPage=1&id=n",function(data){
		$("#bpl_main").html(data);
	});
	$("#fallback").css("display","none");
});



</script>
</html>