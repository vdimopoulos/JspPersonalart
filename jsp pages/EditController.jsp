<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="personalart_2021_22.*"%>

<% 
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("Lastname");
String email = request.getParameter("Mail");
String tattooshop = request.getParameter("tattooshop");
String phonenumber = request.getParameter("phonenumber");
String prefcategory = request.getParameter("prefcategory");
User user =(User)session.getAttribute("loggedin");
String prevemail = user.getEmail();
ArtistManager artm = new ArtistManager();


if (firstname == null && lastname == null && email == null && tattooshop == null && phonenumber == null && prefcategory == "") {
    throw new Exception("No parameters specified, please visit <a href='EditForm.jsp'>edit form</a>");
}

int errors = 0;
String mess = "";
if (firstname == null || firstname.length() < 2 || firstname.length() > 15) {
	errors++;
    mess += "First name must be 2-15 chracters long.\n";
}
if (lastname == null || lastname.length() < 2 || lastname.length() > 15) {
	errors++;
    mess += "Last name must be 2-15 chracters long.\n";
}

 String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
	java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
	java.util.regex.Matcher m = p.matcher(email);

if( !m.matches() ) {				
	errors++;
    mess += "Email not valid.\n";
}

if (tattooshop == null || tattooshop.length() < 3) {
	errors++;
    mess += "Tattoo shop name must be longer than 3 characters.\n";
}
if (phonenumber == null || phonenumber.length() != 10) {
	errors++;
    mess += "Phone number must contain 10 numbers.\n";
}
if (prefcategory== "") {
	errors++;
    mess += "Please select the category of your preference.\n";
}

if (errors >0 ) {
request.setAttribute("message", mess);
%>
<jsp:forward page="EditForm.jsp"/>
<% 
} else {
    artm.updateProfile(prevemail, firstname, lastname, email, tattooshop, phonenumber, prefcategory);
	UserManager usrm = new UserManager();
	User user1 = usrm.findUser(email);
	session.setAttribute("loggedin",user1);
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="t8190038@aueb.gr">
    <title>Information Updated!</title>

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
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="homepage.jsp"><i class="fa fa-fw fa-home"></i></a></li>					
						<%
						Artist artist = artm.findArtist(user.getEmail());
						if (artist != null) {
						 %>
						<li><a href="edit_artist_profile.jsp?artemail=<%=user.getEmail()%>"><i class="fa fa-fw fa-user"></i></a></li>
						<% } %>	
						<li>
							<a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span></a>
						</li>				
					</ul>		
		
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
		<div class="container theme-showcase" role="main">
		<div>
			<h1>Your information was updated!</h1>
		</div>
		<a href="edit_artist_profile.jsp?artemail=<%=email%>" class="btn btn-info active" role="button" aria-pressed="true">< Back to the form</a>
		</div>
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
}
%>







