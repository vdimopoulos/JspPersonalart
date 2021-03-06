<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Register to PersonalArt</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="landingpage/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="landingpage/css/style.css">
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        	<div class="panel panel-danger">
                <% if (request.getAttribute("error_message") != null) {%>            
  				
                <h3>  <%=request.getAttribute("error_message")%> </h3>
                  
                  <% } %>

                        <form method="POST" action="registercontroller.jsp" class="register-form" id="register-form" >
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name"/>
                            </div>
                            <div class="form-group">
                                <label for="surname"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="surname" id="surname" placeholder="Your Surname"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                            </div>
                            
                            <div class="form-group">
                                <input type="checkbox" name="artisttype" id="artisttype" class="agree-term" value="artist" />
                                <label for="artisttype" class="label-agree-term"><span><span></span></span>I am a tattoo artist (Artist account)</label>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree_term" id="agree-term" class="agree-term" value="agree" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <a href="loginpage.jsp" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>

        </div>

    <!-- JS -->
    <script src="landingpage/vendor/jquery/jquery.min.js"></script>
    <script src="landingpage/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>