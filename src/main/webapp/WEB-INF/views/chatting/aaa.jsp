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
#video{
	width: 100%;
	height: 100%;
	position: absolute;
	overflow: hidden;
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
	width: 360px;
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
}

#chatting-container{
	width: 100%;
	height: 80%;
	overflow: scroll;
	overflow-x: hidden;
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
#banTextBox {
	width: 100%;
	height: 100%;
	display: none;
	background-color: black;
}
#banTextBox span{
	color: white;
	font-weight: bold;
	font-size: 15px;
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
#hidden_box {
	display: none;
}
</style>
</head>
<body>


<div id="main-section">
	
	<!--===============================영화  -->
		<div id="d1">
			<div id="movie-info"></div>
			<div id="video-div">
				<div id="video-container">
					<video id="video">
					
					</video>
					<input type="range" id="seekBar" value="0" disabled="disabled">
					<div id="volume-container" onmouseover="enter()">
						<input type="range"	id="volume-range" min="0" max="1" step="0.1" value="0.5" onchange="range()">
					</div>
				</div>
			</div>
			<div id="etc"></div>
		</div>

		<!--==================================== 채팅 -->
	<div id="d2">
		<div id="chat-info"><span class="rep_list">신고내역</span><span class="rep_count">0</span></div>
		<div id="chatting-container">
			<c:forEach items="${str}" var="roomUser" varStatus="status">
					<input type="hidden" id="roomUser${status.count}" value="${roomUser}" />
				</c:forEach>
				<ul id="discussion${member.playView}" title="chat" class="chatting"	onchange="moveScroll()"></ul>
		</div>
		<div id="messageCon">
			<input type="hidden" id="userid${member.playView}" width="500" style="width: 100%;" placeholder="Input User ID"	value="${member.id}">
			<input type="hidden" name="grade" id="grade" value="${member.grade}">
			<input type="text" name="contents" id="message${member.playView}" class="message" wrap="hard" placeholder="메세지 보내기" onkeydown="showKeyCode(event)" value="님이 접속하셨습니다.">
			<input type="button" id="btnSend${member.playView}" class="btn" value="보내기" /> <br />
			<div id="banTextBox">
				<span>*경고 1회가 부여되어 채팅이 5분간 금지됩니다.*</span>
			
			</div>
		</div>
	</div>
</div>
	<script src="http://demo.dongledongle.com/Scripts/jquery-1.10.2.min.js"></script>
	<script src="http://demo.dongledongle.com/Scripts/jquery.signalR-2.2.1.min.js"></script>
	<script type="text/javascript">
	/*
	신고할때 - 
	신고자 id, 대상id, 신고사유, 해당 채팅내용 일부,채팅방넘버(playView)  - 새창으로 띄움. 새창으로 값보내기
	
	새창에서 할일 - 
	신고사유는 select(option)으로.
	form을 짜서. 보내기. 하면 신고가 기록 됨.
	*/
	$(".chatting").on("click","strong",function(){ //채팅창의 닉네임 눌렀을때.
		var rn = '${member.playView}';
		var ted = $(this).attr("name");
		var tedChat = $(this).attr("dropzone");
		var ted2 = confirm(ted+"을(를) 신고하시겠습니까?");
		if(ted2){
			var date;
				window.open("../member/reportUser?targetId="+ted
						+"&senderId="+'${member.id}'
						+"&roomNum="+'${member.playView}',
						/* +"&reg_date="+, */
						"userReport","width=270,height=235,resizeable=0,left=1000,top=5");
		}
	});
	
	
	
	
		
	/* ************************************************* 채팅 ***************************************************** */
		var connection = $.hubConnection('http://demo.dongledongle.com/');
		var chat = connection.createHubProxy('chatHub');
		var room = ${member.playView};
		var count = ${count};
		var ttt;
		var ban;
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
					chat.on('addNewMessageToPage', function(name, message) {
						var nowName = name;
						var message = htmlEncode(message);
						for (var i = 1; i <= count; i++) {
							if ($("#roomUser" + i).val() == name) {
								$('#discussion' + room).append('<li><strong class="ted" dropzone="'+htmlEncode(message)+'" name='+htmlEncode(name)+'>'+ htmlEncode(name) + '</strong>: ' + htmlEncode(message) + '</li>');
								var grade=$("#grade").val();
								$.post("chch",{
									num:'${member.playView}',
									writer:htmlEncode(name),
									contents:htmlEncode(message),
									grade:grade
								},function(){});
							}
						}
					});
				
		$('#message' + room).focus();
					connection.start({
						jsonp : true
					}).done(
							function() {
								sendMessage();
								$('#btnSend' + room).click(
										function() {

											chat.invoke('send', $(
													'#userid' + room).val(), $(
													'#message' + room).val());
											$('#message' + room).val('')
													.focus();
											moveScroll();
										});
							});
				});

		setInterval("setting()",1500);
		
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
		
		var val;
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
					tset = 3000;
				} else if (data * 1 == 2) {
					tset = 5000;
				} else if (data * 1 == 3) {
					tset = 10000;
				}
				setTimeout("resetting()", tset);
			}
		}

		//스페이스는 32
		function sendMessage() {
			if ($("#message" + room).val() != "" && chk || chk2) {
				chat.invoke('send', $('#userid' + room).val(), $('#message' + room).val());
				$('#message' + room).val('').focus();
				/* $.post("주소를",{
					//id,sysdate,log
				},function(){
					
				}); */
				
			}
		}

		function htmlEncode(value) {
			var encodedValue = $('<div />').text(value).html();
			return encodedValue;
		}
	</script>

</body>
</html>
