<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
#memberBox {
 border: 1px solid black;
 width: 70%;
 margin-left: 15%;
 padding : 15px;

}    
p {
	margin-left: 15%;
}

#title {
margin-top:50px;
width:180px;
	font-weight:bold;
	font-size:large;
	border-bottom: 2px solid green;
}
#updateBtn {
	margin-top:20px;
	width: 100%;
	height: 35px;
	border : 1px solid gray;
	border-radius : 5px;
	background-color: #004d00;
	font-weight: bold;
	font-size: medium;
	color : white;
}

#updateBtn:HOVER{
background-color: #009900;
color: black;
}


.jf1 {
	text-align: right;
	font-weight: bold;
}
.red {
	color:red;
}
.input {
	border:0.5px solid gray;
	border-radius:5px;
	padding-left: 5px;

}

input[type="radio"] { 
width:20px;
height:20px;
position:relative; 
top:-1px; 
vertical-align:middle; 
}
    .address {
    	width: 90%;
    
    }
    
</style>
<p id="title">회원정보수정</p>
<div id="memberBox">
	<form action="customerUpdate" id="frm" method="post">
		<table class="table table-bordered">
			<tr id="t">
				<td class="jf1">아이디</td>
				<td colspan="2">${member.id}</td>
			</tr>
			<tr>
				<td class="jf1">비밀번호</td>
				<td><input type="password" name="pw" id="pw" class="input"></td>
				<td id="pwc1" class="red"></td>
			</tr>
			<tr>
				<td class="jf1">비밀번호 확인</td>
				<td><input type="password" name="pwc" id="pwc" class="input"></td>
				<td id="pwc2" class="red"></td>
			</tr> 
			<tr>
				<td class="jf1">이름</td>
				<td colspan="2"><input type="text" name="name" value="${member.name }" class="input"></td>
			</tr>
			<tr>
				<td class="jf1">휴대전화</td>
				<td><input type="text" name="phone" value="${member.phone }" class="input"></td>
				<td>하이픈('-') 없이 입력해주세요</td>
			</tr>
			<tr>
			<!-- @기준으로 앞위로 잘라서 넣어야함. -->
				<td class="jf1">전자우편</td>
				<td><input type="text" id="e1" value="" class="input">@</td>
				<td><select id="e2" onchange="mailing()">
						<option value="self">직접 입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
				</select>
				
				 <input type="text" id="e3" class="input">
				</td>
			</tr>
			<tr>
				<td class="jf1">집주소</td>
				<td colspan="2"><input type="text" name="address" value="${member.address }" class="input address"></td>
			</tr>

			<tr>
				<td class="jf1">직업</td>
				<td colspan="2">
					<p>
						학생 <input type="radio" name="r" value="student" class="student">&nbsp;&nbsp;&nbsp;
						자영업 <input type="radio" name="r" value="ceo" class="ceo">&nbsp;&nbsp;&nbsp;
						회사원 <input type="radio" name="r" value="sal" class="sal">&nbsp;&nbsp;&nbsp;
						무직 <input type="radio" name="r" value="none" class="none">&nbsp;&nbsp;&nbsp;
					</p>
					<p>
						기타 <input type="radio" name="r" value="etc">
						<input type="text" id="etc" class="input">
					</p>
				</td>
			</tr>
		</table>
	<!-- email -->
	<input type="hidden" value="${member.id }" name="id">
	<input type="hidden" value="" id="email" name="email">
	<input type="hidden" value="" id="job" name="job">
	</form>
	

	<button id="updateBtn">완료</button>
</div>
	<script type="text/javascript">
	var test = '${member.email}';
	test = test.split("@");
	var a = test[0];
	var b = test[1];
	$("#e1").val(test[0]);
	$("#e3").val(test[1]);
	var ck='${member.job}';
	if(ck=='none'){
		$("."+ck).attr("checked","checked");	
		$("#etc").val(ck);
	}else { 
		$("."+ck).attr("checked","checked");		
	}
	
	
	
		var year = new Date().getFullYear();

		$("#updateBtn").click(function() {
			var job = $('input:radio[name="r"]:checked').val();
			var pw = $("#pw").val();
			var pwc =$("#pwc").val() ;
			if(pw==""){
				$("#pwc1").html("비밀번호를 입력해주세요");
			}
			
			if(pwc==""){
				$("#pwc2").html("비밀번호를 입력해주세요");
			}
			
			if(pw!=pwc){
				$("#pwc2").html("비밀번호가 일치하지않습니다.");
			}			
			
			if (job == 'etc') {
				$("#job").val($("#etc").val());
			} else {
				$("#job").val(job);
			}

			$("#email").val($("#e1").val()+"@"+$("#e3").val());
			
			if(pw!=""&&pwc!=""&&pw==pwc){
				$("#frm").submit();				
			}else {
				alert("입력하신 정보가 맞는지 다시 확인 바랍니다.");
			}

		});

		function mailing() {
			var e2 = $("#e2").val();
			if (e2 == 'self') {
				$("#e3").val('');
			} else {
				$("#e3").val(e2);
			}

		}
		
		$().click(function(){
			
			
			
			
		});
		
		
		
		
	</script>