<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <script type="text/javascript" charset="utf-8" src='<c:url value="/js/jquery-3.2.1.min.js" />'></script>
    <script type="text/javascript" charset="utf-8" src="<c:url value="/jc/jquery.cookie.js"/>"></script>
    <script type="text/javascript" charset="utf-8" src="<c:url value="/js/naverLogin.js"/>"></script>



</head>
<body>

<script type="text/javascript">
    function generateState() {
        // CSRF 방지를 위한 state token 생성 코드
        // state token은 추후 검증을 위해 세션에 저장 되어야 합니다.
        var oDate = new Date();
        return oDate.getTime();
    }
    function saveState(state) {
        $.removeCookie("state_token");
        $.cookie("state_token", state);
    }
    var naver = NaverAuthorize({
        client_id : "Bj1_9UMI6rGHV7mggCcz",
        redirect_uri : "http://127.0.0.1/naver.html",
        client_secret : "DaFiDKuT5H"
    });
    function getNaverUserInfo(){
    	   naver.api(URL, tokenInfo.access_token, function(data) {
    	       var response = data._response.responseJSON;
    	       console.log("success to get user info", response);
    	       alert(response.response.email);
    	   });
    	}

     function loginNaver() {
        var state = generateState();
        saveState(state);
        naver.login(state);
    }

    $("#NaverIdLoginBTN").click( function () {
        var state = generateState();
        saveState(state);
        naver.login(state);
    });
</script>
<script type="text/javascript">
    window.onload=function(){
 // callback이 오면 checkLoginState()함수를 호출한다.
        checkLoginState();
    }
    var tokenInfo = { access_token:"" , refresh_token:"" };
    function checkLoginState() {
    var state = $.cookie("state_token");
    if(naver.checkAuthorizeState(state) === "connected") {
        //정상적으로 Callback정보가 전달되었을 경우 Access Token발급 요청 수행
        naver.getAccessToken(function(data) {

            var response = data._response.responseJSON;
            if(response.error === "fail") {
                //access token 생성 요청이 실패하였을 경우에 대한 처리
                return ;
            }
            tokenInfo.access_token = response.access_token;
            tokenInfo.refresh_token = response.refresh_token;

            //sonsole.log에 나온다.
            console.log("success to get access token", response);
        });
    } else {
        //Callback으로 전달된 데이터가 정상적이지 않을 경우에 대한 처리
        return ;
    }
}
</script>
<div>
    <button onclick='loginNaver()'>네이버 로그인 FN Call</button>
</div>
</body>
</html>
