<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 <meta charset="utf-8" />
 <style type="text/css">
 .chatting{
 	border: 1px solid black;
 }
 
 </style>
</head>
<body>


	<c:forEach items="${str}" var="roomUser" varStatus="status">
		<input type="text" id="roomUser${status.count}" value="${roomUser}"/>		
	</c:forEach>

    <input type="hidden" id="userid${member.playView}" width="500" style="width:100%;" placeholder="Input User ID" value="${member.id}">
    <input type="text" id="message${member.playView}" width="500" style="width:100%;" placeholder="Input Message." onkeydown="showKeyCode(event)">
    <br>
    <input type="button" id="btnSend${member.playView}" value="Send" style="width:100%;" />
    <br />
    
    	
   <ul id="discussion${member.playView}" class="chatting"></ul>    		
    	
  
    
    <script src="http://demo.dongledongle.com/Scripts/jquery-1.10.2.min.js"></script>
    <script src="http://demo.dongledongle.com/Scripts/jquery.signalR-2.2.1.min.js"></script>

    <script type="text/javascript">
        var connection = $.hubConnection('http://demo.dongledongle.com/');
        var chat = connection.createHubProxy('chatHub');
		var room=${member.playView};
		var count=${count};				
		var ttt;
		
		
		function showKeyCode(event) {
		      event = event || window.event;
		      var keyID = (event.which) ? event.which : event.keyCode;
		      if (keyID == 13) {
		         sendMessage();
		         $("#message"+room).val("");
		         moveScroll();
		      }
		   }
		function moveScroll() {
		      var scr = document.getElementById("data");
		      scr.scrollTop=scr.scrollHeight;
		   }

		
        $(document).ready(function () {

            chat.on('addNewMessageToPage', function (name, message) {            	
            	var nowName=name;
            	
            	for(var i=1;i<=count;i++){            		
            		 if($("#roomUser"+i).val()==name){
                		$('#discussion'+room).append('<li><strong>' + htmlEncode(name) + '</strong>: ' + htmlEncode(message) + '</li>');
            		} 
            	}
            	
            });

            $('#message'+room).focus();

            connection.start({ jsonp: true }).done(function () {
				sendMessage();
                $('#btnSend'+room).click(function () {
                    chat.invoke('send', $('#userid'+room).val(), $('#message'+room).val());
                    $('#message'+room).val('').focus();
                });
            });
        });
        function sendMessage() {
        	 chat.invoke('send', $('#userid'+room).val(), $('#message'+room).val());
             $('#message'+room).val('').focus();
            }

        function htmlEncode(value) {
            var encodedValue = $('<div />').text(value).html();
            return encodedValue;
        }
    </script>

</body>
</html>
