<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
  	<script src="https://kit.fontawesome.com/54d6336788.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="967750790060-v9ro6kgih816p02fq4mvnafmf3fv04kg.apps.googleusercontent.com">
    <meta name="google-signin-clientSecret" content="ddd_AQLZ7DMwIkjwVeo4UpNi">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
 	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
  	<script src="https://apis.google.com/js/api:client.js"></script>
  </head>
  	
    <!-- 로그인 -->
    <script>
    /* 앱 시작 */
    var googleUser = {};
    function startApp() {
		  gapi.load('auth2', function(){
		    // Retrieve the singleton for the GoogleAuth library and set up the client.
		    auth2 = gapi.auth2.init({
		      client_id: '967750790060-v9ro6kgih816p02fq4mvnafmf3fv04kg.apps.googleusercontent.com',
		      cookiepolicy: 'single_host_origin',
		      // Request scopes in addition to 'profile' and 'email'
		      //scope: 'additional_scope'
		    });
		    attachSignin(document.getElementById('customBtn'));
		    console.log("동기화됨")
		  });
		}
    /*로그인시 */
    function attachSignin(element) {
		  console.log(element.id);
		  auth2.attachClickHandler(element, {},
		      function(googleUser) {
			  var profile = googleUser.getBasicProfile();
	    	  console.log('ID: ' + profile.getId()); //그냥 전달하지 말것. Oauth 인증으로 가져오기
	    	  console.log('Name: ' + profile.getName());
	    	  console.log('Image URL: ' + profile.getImageUrl());
	    	  console.log('Email: ' + profile.getEmail());
		      }, function(error) {
		        alert(JSON.stringify(error, undefined, 2));
		      });
		}	
    </script>
    <title>Log in</title>
    <style>
      body{
        height: 50%;
      }
    </style>
  </head>
  <body>

    <header class="welcome-header">
      <h1 class="welcome-header__title">Welcome</h1>
    </header>

    <form action="/user/userLoginProc.do" method="get" id="login-form">
      <input name="user_email" type="text" placeholder="Email or phone number" />
      <input name="user_pw" type="password" placeholder="Password" />
      <input type="submit" value="Log In"/>
      <input type="button" value="Sign In" onClick="location.href='/user/userSignin.do'" style="cursor:pointer; background-color: #FFFFFF; border: 1.5px solid #4285F4; border-radius: 5px;">
      <a href="#">Find Account or Password</a>
    	
		<!-- 구글 로그인 버튼 / API 로직 시작 -->
		<div id="gSignInWrapper">
		  <div id="customBtn" class="customGPlusSignIn">
		    <span class="icon"></span>
		    <span class="buttonText">구글로 로그인</span>
		  </div>
		</div>
		<div id="name"></div>
		<script>startApp();</script>
    </form>
   
    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>

    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    
  </body>
</html>