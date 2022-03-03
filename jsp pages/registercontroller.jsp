<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="personalart_2021_22.*"%>

<% 
String firstname = request.getParameter("name");
String lastname = request.getParameter("surname");
String email = request.getParameter("email");
String password = request.getParameter("pass");
String conpass = request.getParameter("re_pass");
String type = request.getParameter("artisttype");
String agreement = request.getParameter("agree_term");

if (firstname == null && lastname == null && email == null && password == null && conpass == null && type == null && agreement == null) {
	throw new Exception("No parameters specified, please visit <a href='registerpage.jsp'>registration form</a>");
}

if (firstname != null) {
	firstname = new String(firstname.getBytes("ISO-8859-1"), "UTF-8");
}

if (lastname != null) {
	lastname = new String(lastname.getBytes("ISO-8859-1"), "UTF-8");
}

int errors = 0;

if (firstname == null || firstname.length() < 2 || firstname.length() > 15) {
	errors++;
}

if (lastname == null || lastname.length() < 2 || lastname.length() > 15) {
	errors++;
}

 String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
	java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
	java.util.regex.Matcher m = p.matcher(email);
	
if( !m.matches() ) {				
	errors++;
}

if (password == null || password.length() < 6) {
	errors++;
}

if (!password.equals(conpass)) {
	errors++;
}

if (agreement == null) {
	errors++;
}

if (errors > 0) { 
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="t8190038@aueb.gr">
    <title>Please Try Again</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">	
	<!-- Bootstrap Optional theme -->
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<!-- Custom styles for this template -->
	<link href="css/theme_8XXXXXX.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	</head>

    <body>
        <!-- Fixed navbar -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span> <span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">PersonalArt</a>
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
<div class="page-header">
				<h1>Registration form has errors </h1>
				</div> 
				<div class="panel panel-danger">
  				<div class="panel-heading">
				  <ol type="1">
				<%
				  if (firstname == null || firstname.length() < 2 || firstname.length() > 15) { %>
				 <li> Name must be at least 2-15 characters long</li>
			 	<% }
				   if (lastname == null || lastname.length() < 2 || lastname.length() > 15) { %>
				 <li> Surname must be at least 2-15 characters long</li>
			 	<% }
				 if (password == null || password.length() < 6) { %>
				 <li> Password must be at least 6 characters long</li>
			 	<% }
				 if (!password.equals(conpass)) { %>
				 <li>Password and confirm do not match </li>
			 	<% }
				 if (agreement == null) { %>
				 <li> You must agree to terms and conditions</li>
				 <% }
				 if( !m.matches() ) { %>			
				<li> Email is not valid</li>
					<% } %>
				 </ol>
				</div>
				</div>	 
				 <a href="registerpage.jsp" class="btn btn-info active" role="button" aria-pressed="true">< Back to the form</a>
 <footer class="navbar-inverse">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<p class="text-center">&copy; Copyright 2021 by PersonalArt Team</p>
					</div>
				</div>
			</div>
		</footer>
		<!-- End footer -->
		
		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>
	</body>
</html>
<%	
} else {
	UserManager usrm = new UserManager();
	User user = new User(firstname, lastname, email, password);
	try {
		usrm.register(user);
		session.setAttribute("loggedin", user);
		if (type != null) {
			Artist artist = new Artist(firstname, lastname, email);
			ArtistManager artm = new ArtistManager();
			artm.registerArtist(artist);
			artm.createProfile(artist.getArfirstname(), artist.getArlastname(), artist.getAremail(), "", "", "");
		}
%>
		<jsp:forward page="homepage.jsp" />
<%		
	} catch (Exception e) {
		request.setAttribute("error_message", e.getMessage());
%>
		<jsp:forward page="registerpage.jsp" />
<%		
	}
} 
%>


