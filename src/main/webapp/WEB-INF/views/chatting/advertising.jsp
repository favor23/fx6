<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/bootStrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta charset="utf-8" />
<style type="text/css">
div{
	padding: 5px;
	border: 1px solid black;
}
body{
	background-color: #242424;
}
#main-section{
	width: 1600px;
	height: 900px;
}

#d1{
	width: 80%;
	height: 100%;
	float: left;
	
}

#movie-info{
	width: 100%;
	height: 7%;
	background-color: black;
}

#video-div{
	width: 100%;
	height: 80%;
	padding: 0 0 0 0;
}

#video-container{
	width: 100%;
	height: 100%;
	background-color: black;
	position: relative;
	padding: 0 0 0 0;
	border: 0;
}
/* .video{
	width: 100%;
	height: 100%;
	position: absolute;
	overflow: hidden;
} */
#video1{
	width: 100%;
	height: 100%;
	position: absolute;
	overflow: hidden;
	display: inline-block;
}

#video2{
	width: 100%;
	height: 100%;
	position: absolute;
	overflow: hidden;
	display: none;
}
#video3{
	width: 100%;
	height: 100%;
	position: absolute;
	overflow: hidden;
	display: none;
}
#video4{
	width: 100%;
	height: 100%;
	position: absolute;
	overflow: hidden;
	display: none;
}

#volume-container{
	z-index: 999;
	width: 200px;
	height: 5%;
	position: absolute;
	bottom: 0px;
	cursor: pointer;
	border: 0;
}

#volume{
	display: inline-block;
	z-index: 999;
	position: relative;
	bottom: 5px;
}

#mute {
	display: none;
	z-index: 999;
	position: relative;
	bottom: 0px;
}

#volume-range{
	width: 100px;
	z-index: 999;
	position: relative;
	display: none;
	bottom: 0px;
	
}

#seekBar{
	position: relative;
	width: 60%;
	bottom: -96%;
	left: 200px;
}

#fullScreen{
	display: inline-block;
	z-index: 999;
	position: relative;
	bottom: -93%;
	float: right;
	cursor: pointer;
}

#etc{
	width: 100%;
	height: 13%;
	font-size: large;
	background-color: black;
}

#etc > *{
	margin: 0;
}

.etc_p {
	float: right;
	display: inline-block;
	color: white;
}

.etc_title {
	float: left;
	display: inline-block;
	color: white;
}
.etc_genre{
	float: left;
	display: block;
	font-size: small;
	color: white;
}

.etc_playtime{
	float: left;
	display: inline-block;
	font-size: small;
	margin-left: 10px;
	color: white;
}

.etc_director{
	float: left;
	display: inline-block;
	font-size: small;
	margin-left: 10px;
	color: white;
}

#exit{
	width: 100px;
	height: 50px;
	float: right;
	margin-top: 32px;
	margin-right: -50px;
}

#d2{
	width: 20%;
	height: 100%;
	float: left;
	border: 1px solid black;
}
#chat-info{
	width: 100%;
	height: 7%;
	background-color: black;
}

#chatting-container{
	width: 100%;
	height: 80%;
	overflow: scroll;
	overflow-x: hidden;
	background-color: black;
	color: white;
}
.chatting{
	width: 100%;
	height: auto;
	padding-bottom: 10px;
}
#messageCon{
	width: 100%;
	height: 13%;
}

#frm {
	width: 100%;
	height: 100%;
}

.message{
	width: 78.6%;
	height: 100%;
	display: inline-block;
	margin-top: 1px;
	padding: 0;
}
.btn{
	width: 20%;
	height: 100%;
	display: inline-block;
	margin: 0;
	padding: 0;
}

img{
	width: 30px;
	height: 30px;
	overflow: auto;
}
#ad_logo{
	width: 100%;
	height: 100%;
}
#banTextBox {
	width: 100%;
	height: 100%;
	display: none;
	background-color: black;
	margin-top: -21px;
}

#banTextBox .w_p {
color:white;
font-weight: bold;
	font-size: 15px;
	text-align: center;
	margin-top: 15px;
}

</style>
</head>
<body>

<c:if test="${member == null}">
	<input type="hidden" onload="close()">
</c:if>

<div id="main-section">
	
	<!--===============================영화  -->
		<div id="d1">
			<div id="movie-info"><%-- <img
         id="bar_logo" class="${pageContext.request.contextPath}/index"
         src="<c:url value="/img/index/영화를 찍으시조.PNG"/>"> --%> <input type="hidden" id="movie_num" value="${movie_num}"></div>
				<div id="video-div">
					<div id="video-container">
					<c:forEach begin="1" end="4" step="1" var="i">
						<video class="video" id="video${i}" onmouseenter="play()">
							<source src='../movie/${i}.mp4'>
							<%-- <source src='<c:url value="/movie/${view.fname}"/>'> --%>
						</video>
					</c:forEach>
						<video class="video" id="video2">
							<source src="../movie/spider.mp4">
						</video>
						<input type="range" id="seekBar" value="0" disabled="disabled">
						<div id="volume-container" onmouseover="enter()">
							<img src="../movie/volume.png" id="volume">
							<img src="../movie/mute.PNG" id="mute">
							<input type="range" id="volume-range" min="0" max="1" step="0.1" value="0.5" onchange="range()">
						</div>
						<img src="../movie/fullScreen.PNG" id="fullScreen">
					</div>
				</div>
			<div id="etc">
				<p class="etc_title">영화 제목 : ${dto.movie_title}</p>
				<p class="etc_p"><img alt="" src="../movie/eye.PNG"> ${count-1}</p>
				<br>
				<p class="etc_genre">장르 : ${dto.genre}</p>
				<button class="btn" id="exit">나가기</button>
				<br>
				<p class="etc_director">감독 : ${dto.director}</p>
				<br>
				<p class="etc_playtime">상영시간 : ${dto.restricted}세 관람가</p>
			</div>
		</div>

		<!--==================================== 채팅 -->
	<div id="d2">
		<div id="chat-info"><img
         id="ad_logo" class="${pageContext.request.contextPath}/index"
         src="<c:url value="/img/index/광고중.PNG"/>"></div>
		<div id="chatting-container">
			<c:forEach items="${str}" var="roomUser" varStatus="status">
					<input type="hidden" id="roomUser${status.count}" value="${roomUser}" />
			</c:forEach>
			<ul id="discussion${movie_num}" title="chat" class="chatting"	onchange="moveScroll()"></ul>
		</div>
		<div id="messageCon">
			<input type="hidden" id="userid${movie_num}" width="500" style="width: 100%;" placeholder="Input User ID"	value="${member.id}">
			<input type="hidden" name="grade" id="grade" value="${member.grade}">
			<input type="text" name="contents" id="message${movie_num}" class="message" wrap="hard" placeholder="메세지 보내기" onkeydown="showKeyCode(event)" value="님이 접속하셨습니다.">
			<input type="button" id="btnSend${movie_num}" class="btn" value="보내기" /> <br />
			<div id="banTextBox">
				<p class="w_p">경고<span class="wtis1"></span>회가 부여되어</p>
				<p class="w_p">채팅이<span class="wtis2"></span>간 금지됩니다.</p>
			</div>
		</div>
	</div>
</div>
	<script src="http://demo.dongledongle.com/Scripts/jquery-1.10.2.min.js"></script>
	<script src="http://demo.dongledongle.com/Scripts/jquery.signalR-2.2.1.min.js"></script>
	<script type="text/javascript">

	/* ************************************************* 영화 ***************************************************** */	
	function range() {
		var range=document.getElementById("volume-range").value;
		var video = document.getElementById("video");
		
		if(range==0){
			$("#volume").css("display", "none");
			$("#mute").css("display", "inline-block");
			video1.muted = !video1.muted;
			video2.muted = !video2.muted;
			video3.muted = !video3.muted;
			video4.muted = !video4.muted;
		}else{
			if(video.muted == true){
				video1.muted = !video1.muted;
				video2.muted = !video2.muted;
				video3.muted = !video3.muted;
				video4.muted = !video4.muted;
			}
			$("#volume").css("display", "inline-block");
			$("#mute").css("display", "none");
			video1.volume=range;
			video2.volume=range;
			video3.volume=range;
			video4.volume=range;
		}
	}
	
	function enter() {
		$("#volume-range").css("display", "inline-block");
	}
	
	$("#volume-container").mouseout(function() {
		$("#volume-range").css("display", "none");
	});
	
	//************************************************** 전체화면 *******************************************************
	
 	  var inFullScreen = false; // flag to show when full screen

      var fsClass = document.getElementById("fullScreen");
      var videoC = document.getElementById("video-container");
      fsClass.addEventListener("click", function (evt) {
          if (inFullScreen == false) {
           	  makeFullScreen(videoC); // open to full screen
			  videoC.style.display = "block";
			  videoC.style.width = "100%";
			  videoC.style.height = "100%";
			  reset();
          } 
        }, false);
      
      videoC.addEventListener("dblclick", function (evt) {
          if (inFullScreen == false) {
           	  makeFullScreen(videoC); // open to full screen
			  videoC.style.display = "block";
			  videoC.style.width = "100%";
			  videoC.style.height = "100%";
			  reset();
          } 
        }, false);

  
      function makeFullScreen(divObj) {
        if (divObj.requestFullscreen) {
          divObj.requestFullscreen();
        }
        else if (divObj.msRequestFullscreen) {
          divObj.msRequestFullscreen();
        }
        else if (divObj.mozRequestFullScreen) {
          divObj.mozRequestFullScreen();
        }
        else if (divObj.webkitRequestFullscreen) {
          divObj.webkitRequestFullscreen();
        }
        inFullScreen = true;
        $("#seekBar").attr("type", "hidden");
        return;
      }

      function reset() {
        if (document.exitFullscreen) {
          document.exitFullscreen();
        }
        else if (document.msExitFullscreen) {
          document.msExitFullscreen();
        }
        else if (document.mozCancelFullScreen) {
          document.mozCancelFullScreen();
        }
        else if (document.webkitCancelFullScreen) {
          document.webkitCancelFullScreen();
        }
        inFullScreen = false;
        $("#seekBar").attr("type", "range");
        return;
      }
      
  	/* ************************************************ range가 재생시간에 맞게 움직임 ***************************************************** */

      var seekBar = document.querySelector("#seekBar");

	  
	  /* video.currentTime = parseInt(video.duration * (90 / 100), 90); */
	  
/* 	  seekBar.addEventListener("mouseup", function(e){
		    video.play();
	  });
*/


		var videoclass = $(".video");
		var video1 = document.querySelector("#video1");
		var video2 = document.querySelector("#video2");
		var video3 = document.querySelector("#video3");
		var video4 = document.querySelector("#video4");

		video1.addEventListener("timeupdate", function() {
			if (video1.paused) {
				return;
			}
			seekBar.value = (100 / video1.duration) * video1.currentTime;
		});

		video2.addEventListener("timeupdate", function() {
			if (video2.paused) {
				return;
			}

			seekBar.value = (100 / video2.duration) * video2.currentTime;
		});

		video3.addEventListener("timeupdate", function() {
			if (video3.paused) {
				return;
			}

			seekBar.value = (100 / video3.duration) * video3.currentTime;
		});

		video4.addEventListener("timeupdate", function() {
			if (video4.paused) {
				return;
			}

			seekBar.value = (100 / video4.duration) * video4.currentTime;
		});

		/* 	for(var q=0;q < videoclass.size();q++){
				$("#video"+(q+1)).onended = function() {
				video+(q+1).pause();
				video+(q+1).style.display="none";
				$("#video"+(q+2)).css("display", "inline-block");
				video+(q+2).play();
			}
			} */
		/* 동영상 연속재생 */

		video1.onended = function() {
			video1.pause();
			video1.style.display = "none";
			$("#video2").css("display", "inline-block");
			video2.play();
		}
		video2.onended = function() {
			video2.pause();
			video2.style.display = "none";
			$("#video3").css("display", "inline-block");
			video3.play();
		}
		video3.onended = function() {
			video3.pause();
			video3.style.display = "none";
			$("#video4").css("display", "inline-block");
			video4.play();
		}
		video4.onended = function() {
			video4.pause();
			video4.style.display = "none";
			$("#video1").css("display", "inline-block");
			video1.play();
		}
		
		/* ************************************************ 몇시에 동영상 시작되는지 ***************************************************** */

		var playtime = "${roomDTO.play_Time}";
		var starttime = "${roomDTO.startTime}";
		var lasttime = "${roomDTO.lastTime}";		
		var now = new Date();
		   
		   var year = now.getFullYear(); // 현재시간중 4자리 연도
		   var month = now.getMonth()+1; // 현재시간 중 달, 달은 0부터 시작하기 때문에 +1
		   if((month+"").length <2){
		   	month="0"+month; // 달의 숫자가 1자리라면 앞에 0을 붙힘
		   }
		   var date = now.getDate(); //현재시간중 날짜.
		   if((date+"").length <2){
		   	date="0"+date;
		   }
		   hour=now.getHours();
		   if((hour+"").length<2){
		   	hour="0"+hour;
		   }
		   minute=now.getMinutes();
		   if((minute+"").length<2){
		   	minute="0"+minute;
		   }
		   second = now.getSeconds();
		   if((second+"").length<2){
		   	second="0"+second;
		   }
		   today = year+""+month+""+date+""+hour+""+minute+""+second+""; // 오늘날짜 완성
		 
		   var yy =0;
		   var starttime_s=starttime.substring(12,14);
		   var today_s=today.substring(12,14);
		   var starttime_m=starttime.substring(10,12);
		   var today_m=today.substring(10,12);
		   var starttime_h=starttime.substring(8,10);
		   var today_h=today.substring(8,10);
		   var movieRoomNum=$("#movie_num").val();
		   	 		   
		   var cftime = (starttime_h*1-today_h*1)*60*24+(starttime_m*1-today_m*1)*60+(starttime_s*1-today_s*1);/* 초 */
		   /* alert(today_m);
		   alert(today_h); */
		   if(cftime<=0){
				location.href="${pageContext.request.contextPath}/chatting/movie?movieRoomNum="+movieRoomNum;
		   }else{
				setInterval(function() { 
		  	  	 	location.href="${pageContext.request.contextPath}/chatting/movie?movieRoomNum="+movieRoomNum;
				}, cftime*1000);
		   }
			
		/* ************************************************* 채팅 ***************************************************** */
 		var connection = $.hubConnection('http://demo.dongledongle.com/');
		var chat = connection.createHubProxy('chatHub');
		var room = ${movie_num};
		var count = ${count};
		var ttt;
		function showKeyCode(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if (keyID == 13) {
				sendMessage();
				$("#message" + room).val("");
				moveScroll();
			}
		}

		function moveScroll() {
			var scr = document.getElementById("chatting-container");
			scr.scrollTop = scr.scrollHeight;
		}

		//정규식 (채팅칸에 빈칸이면 전송 안되게 하기)
		var message = $("#message" + room).val();
		var regex = /^[a-zA-Z]{1}[a-zA-Z0-9_]{5,11}$/;
		var kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var eng = /^[A-Za-z0-9-]+$/
		var chk = message.match(kor);
		var chk2 = message.match(eng);

		$(document).ready(
				function() {
				chat.on('addNewMessageToPage', function(name, message, grade) {
					var nowName = name;
					var message = htmlEncode(message);
					for (var i = 1; i <= count; i++) {
						if ($("#roomUser" + i).val() == name) {
							$('#discussion' + room).append('<li><strong class="ted" dropzone="'+htmlEncode(message)+'" name='+htmlEncode(name)+'>'+ htmlEncode(name) + '</strong>: ' + htmlEncode(message) + '</li>');
							$.post("chch",{
								num:'${movie_num}',
								writer:htmlEncode(name),
								contents:htmlEncode(message),
								grade:htmlEncode(grade)
							},function(){});
						}
					}
				});
					$('#message' + room).focus();
					connection.start({
						jsonp : true
					}).done(function() {
						sendMessage();
						$('#btnSend' + room).click(
						function() {
							chat.invoke('send', $('#userid' + room).val(), $('#message' + room).val());
							$("#message").val(htmlEncode(message));
							$('#message' + room).val('').focus();
							moveScroll();
						});
					});
				});

		//스페이스는 32
		function sendMessage() {
			if ($("#message" + room).val() != "" /* && chk || chk2 */) {
				chat.invoke('send', $('#userid' + room).val(), $('#message' + room).val());
				$('#message' + room).val('').focus();
			}
		}

		function htmlEncode(value) {
			var encodedValue = $('<div />').text(value).html();
			return encodedValue;
		}
		
		var ck = ${check};
		if(ck==0){
			alert("로그인이 필요한 서비스 입니다.");
			window.close();
		}
		
		$("#exit").click(function() {
			window.close();
		});
		
		//sinhojeong====================================================
		setting();
		setInterval("setting()",5000);
		var val;
		
		$(".chatting").on("click","strong",function(){ //채팅창의 닉네임 눌렀을때.
		var rn = '${movie_num}';
		var ted = $(this).attr("name");
		var tedChat = $(this).attr("dropzone");
		var ted2 = confirm(ted+"을(를) 신고하시겠습니까?");
		if(ted2){
				var date;
					window.open("../member/reportUser?targetId="+ted
							+"&senderId="+'${member.id}'
							+"&roomNum="+rn,
							/* +"&reg_date="+, */
							"userReport","width=270,height=235,resizeable=0,left=1000,top=5");
			}
		});	
			
			
			function resetting() {
				$(".message").css("display", "inline-block");
				$(".btn").css("display", "inline-block");
				$("#banTextBox").css("display", "none");
				$.get("reset?id=" + '${member.id}', function(chk) {
					chk=chk.trim();
					if(chk>0){
						val=0;
					}
				});
			}

			
			function setting() {
				$.ajax({
					type : 'POST',
					url : 'chkBan',
					data : "id=" + '${member.id}',
					async : true,
					success : function(data) {
						data=data.trim();
						if(data>0){
							interChk(data);
						}
					}	
				});
			}
			
			
			function interChk(data){
				if(data!=val){
					val=data;
					$(".message").css("display", "none");
					$(".btn").css("display", "none");
					$("#banTextBox").css("display", "inline-block");
					//1000ms = 1초, 300000ms = 5분, 1200000ms = 20분
					//3600000ms = 1시간
					var tset;//000생략
					if (data * 1 == 1) {
						tset = 30000;
						$(".wtis2").html("30초");
					} else if (data * 1 == 2) {
						tset = 300000;
						$(".wtis2").html("5분");
					} else if (data * 1 >= 3) {
						tset = 3000000;
						$(".wtis2").html("50분");
					}
					$(".wtis1").html(data);
					setTimeout("resetting()", tset);
				}
			}
			
			
			function showKeyCode(event) {
				$.ajax({
					type : 'POST',
					url : 'chkBan',
					data : "id=" + '${member.id}',
					async : true,
					success : function(data) {
						data=data.trim();
						ban=data;
					}
				});
						
				event = event || window.event;
				var keyID = (event.which) ? event.which : event.keyCode;
				if (keyID == 13&&ban==0) {
					sendMessage();
					$("#message" + room).val("");
					moveScroll();
				}else if(ban>0){
					setting(ban);
				}
			}
			
	//sinhojeong end=============================================
		
		
	</script>

</body>
</html>
