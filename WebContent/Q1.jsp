<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>

<%@ page import = "java.io.IOException" %>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import= "java.util.Date" %>

<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %> 
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Query One</title>
</head>
<body>
<%
PrintWriter output = response.getWriter();
		//Set response content type
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		Date date = new Date();
		Timestamp timeStamp = new Timestamp(date.getTime());
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timeStamp);
		output.println("Twitter Analytics - SCU cloud walker      Time: "+time);
		output.println("<p>" + " System is running. "+ "</p>");
		response.setIntHeader("Refresh", 5);
%>

</body>
</html>