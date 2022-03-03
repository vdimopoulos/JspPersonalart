<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <!-- Font Icon -->
    <link rel="stylesheet" href="landingpage/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="landingpage/css/style.css">
    <title>Sign in to PersonalArt</title>
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signin">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-form">
                        <h2 class="form-title">Sign in</h2>
                        <% if (request.getAttribute("error_mess") != null ) { %>
                        <h3> <%=request.getAttribute("error_mess") %> </h3>
                        <% } %>
                        <form method="POST" action="logincontroller.jsp" class="login-form" id="login-form">
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" placeholder="Password"/>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Login"/>
                            </div>
                        </form>
                    </div>
                    <div class="signin-image">
                        <figure><img src="landingpage/images/tattooicon.png" alt="sing in image" style="width: 400px;"></figure>
                        <a href="registerpage.jsp" class="signin-image-link">I am not a member</a>
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