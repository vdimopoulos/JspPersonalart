<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <!-- Font Icon -->
    <link rel="stylesheet" href="landingpage/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="landingpage/css/style.css">>
		<title>Error Page</title>
    </head>
    <body>

      <div class="container">
        <div class="page-header">
			<h1>Ooops something went wrong</h1>
		</div>

        <div class="row">

            <div class="col-xs-12">

                <h2>Description</h2>                 	
               <% if(exception != null) { %>	                  	
						<p><code><%=exception %></code></p>						
					<% } %>		
            </div>

        </div>        

      </div><!-- /.container -->
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
	  