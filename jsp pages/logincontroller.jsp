<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="personalart_2021_22.*"%>

<% 
String email = request.getParameter("email");
String password = request.getParameter("pass");
UserManager usrm = new UserManager();
try {
    User user =(User)usrm.authenticate(email, password);
    session.setAttribute("loggedin", user);
%> 
<jsp:forward page="homepage.jsp" />
<%    
} catch (Exception e) {
    request.setAttribute("error_mess", e.getMessage());
%>
<jsp:forward page="loginpage.jsp" />
<%   
}
%>