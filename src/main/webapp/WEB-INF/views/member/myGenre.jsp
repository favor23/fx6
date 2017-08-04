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
.p {
 width: 500px;
 display: inline-block;
 height: 50px;
 margin-top: 5px;
 border: 1px solid black;
}

.c {
	background-color: gray;
	height: 50px;
}

.s {
	background-color: green;
	height: 50px;
}

#age {
	width: 600px;
}

#genreUl {
	border: 1px solid black;
	height: 40px;	
}

#genreUl li{
	border: 1px solid black;
	float: left;
	width: 150px;
	height: 100%;
}
#genreUl li:hover{
	cursor: pointer;
}
.f_td {
	width: 50px;
}
</style>
</head>
<body>
<p>영화 하나 눌렀을때 설명하는거임</p>
<p>영화제목..</p>
		<ul id="genreUl">
			<li class="age">연령</li><li class="sung">성별</li><li class="all_of_it">전체</li>
		</ul>
		<c:if test="${rcd eq null }">
		<h2>아직 [${dto.movie_title }]에 대한 추천이 없습니다.</h2>
		
		</c:if>
		<c:if test="${rcd ne null}">
		<p>영화 제목 : ${dto.movie_title } >>>> <span id="val"></span> 추천수입니다. </p>
		<p>총 추천수 : <span id="all_count"></span></p>
	<div id="age">
		<table>
			<tr>
				<td class="f_td">10대</td><td class="p"><div id="g1" class="c"></div></td>
			</tr>
			<tr>
				<td class="f_td">20대</td><td class="p"><div id="g2" class="c"></div></td>
			</tr>
			<tr>
				<td class="f_td">30대</td><td class="p"><div id="g3" class="c"></div></td>
			</tr>
			<tr>
				<td class="f_td">40대</td><td class="p"><div id="g4" class="c"></div></td>
			</tr>
			<tr>
				<td class="f_td">50대</td><td class="p"><div id="g5" class="c"></div></td>
			</tr>
		
		</table>
	</div>
		
		<div id="sung">
			<table>
				<tr>
					<td class="f_td">남</td><td class="p"><div id="m" class="s"></div></td>
				</tr>
				<tr>
					<td class="f_td">여</td><td class="p"><div id="f" class="s"></div></td>
				</tr>
			</table>
		</div>
	</c:if>
	<script type="text/javascript">
	$(function(){
		age();
		sung();
	});
	$("li").click(function(){
		var li = $(this).attr("class");
		if(li=='age'){
			$("#"+li).css("display","block");
			$("#sung").css("display","none");
			$("#val").html("나이 별");
		}else if(li=='sung'){
			$("#"+li).css("display","block");
			$("#age").css("display","none");
			$("#val").html("성별");
		}else {
			$("#age").css("display","block");
			$("#sung").css("display","block");
		}
	});
	
	
	
	function sung(){
		var m='${rcd.male}';
		var f='${rcd.female}';
		var cal = m*1+f*1;
		m=m/cal*100;
		f=f/cal*100;
		$("#m").css("width",m+"%");
		$("#f").css("width",f+"%");
		
		m=m.toFixed(2);
		$("#m").html(m+"%");
		f=f.toFixed(2);
		$("#f").html(f+"%");
	}
	
	function age(){
		var g1='${rcd.gen_10}';
		var g2='${rcd.gen_20}';
		var g3='${rcd.gen_30}';
		var g4='${rcd.gen_40}';
		var g5='${rcd.gen_50}';
		var cal = g1*1+g2*1+g3*1+g4*1+g5*1;
		$("#all_count").html(cal);
	 	g1 = g1/cal*100;
		g2 = g2/cal*100;
		g3 = g3/cal*100;
		g4 = g4/cal*100;
		g5 = g5/cal*100;
		$("#g1").css("width",g1+"%");
		$("#g2").css("width",g2+"%");
		$("#g3").css("width",g3+"%");
		$("#g4").css("width",g4+"%");
		$("#g5").css("width",g5+"%");
		
		g1=g1.toFixed(2);
		$("#g1").html(g1+"%");
		g2=g2.toFixed(2);
		$("#g2").html(g2+"%");
		g3=g3.toFixed(2);
		$("#g3").html(g3+"%");
		g4=g4.toFixed(2);
		$("#g4").html(g4+"%");
		g5=g5.toFixed(2);
		$("#g5").html(g5+"%");
	}
	/*
	영화의 추천수를 가져옴. 7741 영화의 추천수를 가져옴
	바로 이 페이지를 호출했을 때, 기본으로 띄워줄게 필요한데, 그게 내 장르와 동일한 영화임.
	*/
	
	
	
	/*
	내 나이를 보내서 10자리를 때어서 몇대나이인지 알아서 그 기준으로 연령대의 영화중에서 내 나이대 사람이 따봉을 누른 영화를 추천.+ 장르별.
	
	var mnum=7741;
	$.post("myGenre",{
		
	},function(){});
	
		$("li").click(function(){
			var id=$(this).attr("class");
			genre(id);
			chk(id);
			$("#"+id).css("display","inline-block");
		});
		
		
		function chk(id){
			if(id=='age'){
				$("#sung").css("display","none");
				$("#all_of_it").css("display","none");
			}else if(id=='sung'){
				$("#all_of_it").css("display","none");
				$("#age").css("display","none");
			}else {
				$("#age").css("display","none");
				$("#sung").css("display","none");
			}
		}
		
		function genre(id){
			var birth='${member.birth}';
			alert(birth);
			var myAge=calcAge(birth)+1;
			if(id=='age'){
				alert(myAge);
			}
		}
		
		
		function test(){
			
		}
		
		
		function calcAge(birth) {                 
			var my = new Date(birth);
			var thisYear= new Date();
			var year = thisYear.getFullYear()-my.getFullYear();
			return year;
		} 
		*/
	</script>
</body>
</html>