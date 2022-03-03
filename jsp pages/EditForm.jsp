<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="personalart_2021_22.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<% 
if (session.getAttribute("loggedin") == null) {
	request.setAttribute("error_mess","You are not authorized to access this resource. Please login.");
	%>
<jsp:forward page="loginpage.jsp" />
<%
return;
}
User user = (User)session.getAttribute("loggedin");
ArtistManager artm = new ArtistManager();
ArtistProfile artistp = artm.getProfile(user.getEmail());
Categoryprinter ctgrypr = new Categoryprinter();
List<Category> categories = ctgrypr.getCategories();

%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="t8190038@aueb.gr">
    <title>Edit Profile Info</title>

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
            <div class="page-header">
				<h1>Edit your Profile</h1>
			</div>
			<% if (request.getAttribute("message") != null) { %>
			<div class="page-header">
				<h5><%=request.getAttribute("message") %></h5>
			</div>
			<% } %>

            <form action="EditController.jsp" method="POST" class="form-horizontal">		
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label main-label">Name </label>
					<div class="col-sm-10">
					  <input type="text" name="firstname" id="name" class="form-control" value="<%=artistp.getprfirstname() %>">
					</div>
				  </div>
				  <div class="form-group">
					<label for="surname" class="col-sm-2 control-label main-label">Surname </label>
					<div class="col-sm-10">
					  <input type="text" name="Lastname" id="surname" class="form-control" value="<%=artistp.getprlastname() %>">
					</div>
				  </div>
				  <div class="form-group">
					<label for="email" class="col-sm-2 control-label main-label">Email </label>
					<div class="col-sm-10">
					  <input type="text" name="Mail" id="email" class="form-control" value="<%=artistp.getpremail() %>">
					</div>
				  </div>
				  
				  <div class="form-group">
					<label for="tattooshop" class="col-sm-2 control-label main-label">Tattoo Shop </label>
					<div class="col-sm-10">
					  <input type="text" name="tattooshop" id="tattooshop" class="form-control" value="<%=artistp.getprtattooshop() %>">
					</div>
				  </div>
				  <div class="form-group">
					<label for="phonenumber" class="col-sm-2 control-label main-label">Phone Number </label>
					<div class="col-sm-10">
					  <input type="number" name="phonenumber" id="phonenumber" class="form-control" value="<%=artistp.getprphonenumber()%>">
					</div>
				  </div>
                  <div class="form-group">
						<label for="prefcategory" class="col-sm-2 control-label main-label">Category of Preference </label>
						<div class="col-sm-10">
							<select id="prefcategory" name="prefcategory" class="form-control" value="<%=artistp.getprprefcategory()%>">
                                <option value="">--Select Category of Preference--</option>
                            <% for (Category cat:categories) {
                                if (cat.getCatname() == "" || cat.getImgsrc() == null || cat.getCattext() == null ) continue; %>	
                                <option value="<%=cat.getCatname()%>"><%=cat.getCatname()%></option>
							<% } %>                    
							</select>
						</div>
					</div>  
				
				 
						
		
			  
			 
			 
			  	<div class="form-group">
            		<div class="col-sm-10 col-sm-offset-2">
             			 <button type="submit" class="btn btn-success">
               				 <span class="glyphicon glyphicon-ok"></span> Submit
              			</button> 
              			<button type="reset" class="btn btn-danger">
               				 <span class="glyphicon glyphicon-remove"></span> Cancel
             			 </button>              
            		</div>
				</div>	
        	</form>

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