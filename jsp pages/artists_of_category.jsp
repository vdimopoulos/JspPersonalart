<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="personalart_2021_22.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<% 
if (session.getAttribute("loggedin") == null) {
	request.setAttribute("error_mess","You are not authorized to access this resource. Please login.");
	%>
<jsp:forward page="loginpage.jsp" />
<%
return;
}
User user = (User)session.getAttribute("loggedin");
String cname = request.getParameter("categ");
ArtistManager artm = new ArtistManager();
List<ArtistProfile> artists = artm.getCatArtists(cname);
%>

<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="t8190038@aueb.gr">
    <title>Category Artists</title>

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

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <h1>Check out the artists of the <%=cname%> category</h1>
    </div>

    <!-- Page Title -->
    <div class="page-header">
        <h1>Artists:</h1>
    </div>

    <div class="row">   
		<%
		for (ArtistProfile artistpr : artists) {
		%>
		<div class="col-sm-3">
		<div class="card">
			<img class="card-img-top" src="images/downloads.png" width="175" height="200">
			<h1><%=artistpr.getprfirstname()%> <%=artistpr.getprlastname()%></h1>
			<p class="title"><%=artistpr.getprtattooshop()%></p>
			<p>Tattoo Artist</p>
			<a href="http://ism.dmst.aueb.gr/ismgroup53/PersonalArt/edit_artist_profile.jsp?artemail=<%=artistpr.getpremail()%>" class="btn btn-warning">View artist's profile</a>
		</div>
		</div>

		<%	
		}
		%>
	</div>
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
