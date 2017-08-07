<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
/* ------------------------------------ Click on login and Sign Up to  changue and view the effect
---------------------------------------
*/
* {
	margin: 0px auto;
	padding: 0px;
	text-align: center;
	font-family: 'Open Sans', sans-serif;
}

.cotn_principal {
	position: absolute;
	width: 100%;
	height: 100%;
	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#cfd8dc+0,607d8b+100,b0bec5+100 */
	background: #cfd8dc; /* Old browsers */
	background: -moz-linear-gradient(-45deg, #cfd8dc 0%, #607d8b 100%, #b0bec5 100%);
	/* FF3.6-15 */
	background: -webkit-linear-gradient(-45deg, #cfd8dc 0%, #607d8b 100%, #b0bec5 100%);
	/* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(135deg, #cfd8dc 0%, #607d8b 100%, #b0bec5 100%);
	/* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cfd8dc',
		endColorstr='#b0bec5', GradientType=1);
	/* IE6-9 fallback on horizontal gradient */
}

.cont_centrar {
	position: relative;
	float: left;
	width: 100%;
}

.cont_login {
	position: relative;
	width: 640px;
	left: 59%;
	margin-left: -320px;
}

.cont_back_info {
	position: relative;
	float: left;
	width: 320px;
	height: 320px;
	overflow: hidden;
	background-color: #fff;
	margin-top: 100px;
	box-shadow: 1px 10px 30px -10px rgba(0, 0, 0, 0.5);
}

.cont_forms {
	position: absolute;
	overflow: hidden;
	top: 100px;
	left: 0px;
	width: 320px;
	height: 320px;
	background-color: #eee;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.cont_forms_active_login {
	box-shadow: 1px 10px 30px -10px rgba(0, 0, 0, 0.5);
	height: 420px;
	top: 20px;
	left: 0px;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.cont_forms_active_sign_up {
	box-shadow: 1px 10px 30px -10px rgba(0, 0, 0, 0.5);
	height: 420px;
	top: 20px;
	left: 320px;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.cont_img_back_grey {
	position: absolute;
	width: 950px;
	top: -80px;
	left: -116px;
}

.cont_img_back_grey>img {
	width: 100%;
	-webkit-filter: grayscale(100%);
	filter: grayscale(100%);
	opacity: 0.2;
	animation-name: animar_fondo;
	animation-duration: 20s;
	animation-timing-function: linear;
	animation-iteration-count: infinite;
	animation-direction: alternate;
}

.cont_img_back_ {
	position: absolute;
	width: 950px;
	top: -80px;
	left: -116px;
}

.cont_img_back_>img {
	width: 100%;
	opacity: 0.3;
	animation-name: animar_fondo;
	animation-duration: 20s;
	animation-timing-function: linear;
	animation-iteration-count: infinite;
	animation-direction: alternate;
}

.cont_forms_active_login>.cont_img_back_ {
	top: 0px;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.cont_forms_active_sign_up>.cont_img_back_ {
	top: 0px;
	left: -435px;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.cont_info_log_sign_up {
	position: absolute;
	width: 320px;
	height: 320px;
	top: 100px;
	z-index: 1;
}

.col_md_login {
	position: relative;
	float: left;
	width: 100%;
}

.col_md_login>h2 {
	font-weight: 400;
	margin-top: 70px;
	color: #757575;
}

.col_md_login>p {
	font-weight: 400;
	margin-top: 15px;
	width: 80%;
	color: #37474F;
}

.btn_login {
	background-color: #26C6DA;
	border: none;
	padding: 10px;
	width: 200px;
	border-radius: 3px;
	box-shadow: 1px 5px 20px -5px rgba(0, 0, 0, 0.4);
	color: #fff;
	margin-top: 25px;
	cursor: pointer;
	font-weight: bold;
}

.btn_login2 {
	background-color: #009900;
	border: none;
	padding: 10px;
	width: 200px;
	border-radius: 3px;
	box-shadow: 1px 5px 20px -5px rgba(0, 0, 0, 0.4);
	color: #fff;
	margin-top: 20px;
	cursor: pointer;
	font-weight: bold;
}

.col_md_sign_up {
	position: relative;
	float: left;
	width: 50%;
}

.cont_ba_opcitiy>h2 {
	font-weight: 400;
	color: #fff;
}

.cont_ba_opcitiy>p {
	font-weight: 400;
	margin-top: 15px;
	color: #fff;
}
/* ----------------------------------
background text    
------------------------------------
 */
.cont_ba_opcitiy {
	position: relative;
	background-color: rgba(120, 144, 156, 0.55);
	width: 80%;
	border-radius: 3px;
	margin-top: 15px;
	padding: 15px 0px;
}

.btn_sign_up {
	background-color: #ef5350;
	border: none;
	padding: 10px;
	width: 200px;
	border-radius: 3px;
	box-shadow: 1px 5px 20px -5px rgba(0, 0, 0, 0.4);
	color: #fff;
	margin-top: 35px;
	cursor: pointer;
	font-weight: bold;
}

.cont_forms_active_sign_up {
	z-index: 2;
}

@
-webkit-keyframes animar_fondo {from { -webkit-transform:scale(1)translate(0px);
	-moz-transform: scale(1) translate(0px);
	-ms-transform: scale(1) translate(0px);
	-o-transform: scale(1) translate(0px);
	transform: scale(1) translate(0px);
}

to {
	-webkit-transform: scale(1.5) translate(50px);
	-moz-transform: scale(1.5) translate(50px);
	-ms-transform: scale(1.5) translate(50px);
	-o-transform: scale(1.5) translate(50px);
	transform: scale(1.5) translate(50px);
}

}
@
-o-keyframes identifier {from { -webkit-transform:scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
}

to {
	-webkit-transform: scale(1.5);
	-moz-transform: scale(1.5);
	-ms-transform: scale(1.5);
	-o-transform: scale(1.5);
	transform: scale(1.5);
}

}
@
-moz-keyframes identifier {from { -webkit-transform:scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
}

to {
	-webkit-transform: scale(1.5);
	-moz-transform: scale(1.5);
	-ms-transform: scale(1.5);
	-o-transform: scale(1.5);
	transform: scale(1.5);
}

}
@
keyframes identifier {from { -webkit-transform:scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
}

to {
	-webkit-transform: scale(1.5);
	-moz-transform: scale(1.5);
	-ms-transform: scale(1.5);
	-o-transform: scale(1.5);
	transform: scale(1.5);
}

}
.cont_form_login {
	position: absolute;
	opacity: 0;
	display: none;
	width: 320px;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.cont_forms_active_login {
	z-index: 2;
}

.cont_forms_active_login>.cont_form_login {
	
}

.cont_form_sign_up {
	position: absolute;
	width: 320px;
	float: left;
	opacity: 0;
	display: none;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.cont_form_sign_up>input {
	text-align: left;
	padding: 15px 5px;
	margin-left: 10px;
	margin-top: 20px;
	width: 260px;
	border: none;
	color: #757575;
}

.cont_form_sign_up>h2 {
	margin-top: 50px;
	font-weight: 400;
	color: #757575;
}

.cont_form_login>input {
	padding: 15px 5px;
	margin-left: 10px;
	margin-top: 20px;
	width: 260px;
	border: none;
	text-align: left;
	color: #757575;
}

.cont_form_login>h2 {
	margin-top: 110px;
	font-weight: 400;
	color: #757575;
}

.cont_form_login>a, .cont_form_sign_up>a {
	color: #757575;
	position: relative;
	float: left;
	margin: 10px;
	margin-left: 30px;
}
</style>
</head>
<body>

	<div class="cotn_principal">
		<div class="cont_centrar">

			<div class="cont_login">
				<div class="cont_info_log_sign_up">
					<div class="col_md_login">
						<div class="cont_ba_opcitiy">
							<h2>영화를찍으시조</h2>
							<p>환영합니다!</p>
							<button class="btn_login" onclick="cambiar_login(1)">로그인</button>
							<button class="btn_login2" onclick="naver_login()">네이버 아이디로 로그인</button>
							<button class="btn_sign_up" onclick="cambiar_sign_up()">아직 회원이 아니신가요?</button>
						</div>
					</div>
				</div>


				<div class="cont_back_info">
					<div class="cont_img_back_grey">
						<img
							src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d"
							alt="" />
					</div>

				</div>
				<div class="cont_forms">
					<div class="cont_img_back_">
						<img
							src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d"
							alt="" />
					</div>
					<div class="cont_form_login">
						<a href="#" onclick="ocultar_login_sign_up()"><i
							class="material-icons">X</i></a>
						<h2>LOGIN</h2>
						<input type="text" placeholder="ID" id="input_id" /> <input
							type="password" placeholder="Password" id="input_pw" />
						<button class="btn_login" onclick="cambiar_login(2)">LOGIN</button>
					</div>

					<div class="cont_form_sign_up">
						<a href="#" onclick="ocultar_login_sign_up()"><i
							class="material-icons">X</i></a>

					</div>

				</div>

			</div>
		</div>
	</div>
	<form action="" method="post" id="frm">
		<input type="hidden" name="id" id="hID" autocomplete="off"> <input
			type="hidden" name="pw" id="hPW" autocomplete="off">
	</form>
	<script type="text/javascript">
		/* ------------------------------------ Click on login and Sign Up to  changue and view the effect
		 ---------------------------------------
		 */

		function cambiar_login(data) {
			if (data == 2) {
				var id = $("#input_id").val();
				var pw = $("#input_pw").val();
				$("#hID").attr("value", id);
				$("#hPW").attr("value", pw);
				$("#frm")
						.attr("action",
								"${pageContext.request.contextPath}/member/customerJoin");
				$("#frm").submit();
			} else {
				document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";
				document.querySelector('.cont_form_login').style.display = "block";
				document.querySelector('.cont_form_sign_up').style.opacity = "0";
			}

			setTimeout(function() {
				document.querySelector('.cont_form_login').style.opacity = "1";
			}, 400);

			setTimeout(
					function() {
						document.querySelector('.cont_form_sign_up').style.display = "none";
					}, 200);
		}

		function cambiar_sign_up() {
			location.href = "${pageContext.request.contextPath}/member/join";

		}

		function ocultar_login_sign_up() {

			document.querySelector('.cont_forms').className = "cont_forms";
			document.querySelector('.cont_form_sign_up').style.opacity = "0";
			document.querySelector('.cont_form_login').style.opacity = "0";

			setTimeout(
					function() {
						document.querySelector('.cont_form_sign_up').style.display = "none";
						document.querySelector('.cont_form_login').style.display = "none";
					}, 500);

		}
		
		function naver_login(){
			var path;
			$.get("${pageContext.request.contextPath}/nlogin",function(data){
				location.href=data;		
			});
		}
	</script>
</body>
</html>