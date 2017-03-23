<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ page import = "java.io.IOException" %>

    <%@ page import= "java.io.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.text.SimpleDateFormat" %>
<%@ page import= "java.util.Date" %>
<%@ page import= "java.util.logging.Logger" %>
<%@ page import= "javax.servlet.*" %>
<%@ page import= "javax.servlet.annotation.*" %>
<%@ page import= "javax.servlet.http.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q4 Results</title>
</head>
<body>
<%!

 static Logger logger;
    private static Connection getRemoteConnection() throws SQLException {
    	 
    	String dbName = "twitterdb";
    	  String userName = "ksolanki";
    	  String password = "50lank1402";
    	  String hostname = "twitterinstance.cabmso8gz1o9.us-west-2.rds.amazonaws.com";
    	  String port = "3306";
    	  String jdbcUrl = "jdbc:mysql://" + hostname + ":" +
    	    port + "/" + dbName + "?user=" + userName + "&password=" + password;
    	  
    	  // Load the JDBC driver
    	  try {
    	    System.out.println("Loading driver...");
    	    Class.forName("com.mysql.jdbc.Driver");
    	    System.out.println("Driver loaded!");
    	  } catch (ClassNotFoundException e) {
    	    throw new RuntimeException("Cannot find the driver in the classpath!", e);
    	  }
    	  
    	  Connection conn = null;
    	  try {
    	System.out.println(jdbcUrl);
    	  conn = DriverManager.getConnection(jdbcUrl);
    	  return conn;
    	  }
    	  catch (SQLException ex) {
    		    // Handle any errors
    		    System.out.println("SQLException: " + ex.getMessage());
    		    System.out.println("SQLState: " + ex.getSQLState());
    		    System.out.println("VendorError: " + ex.getErrorCode());
    		  } 
        return null;
      }
 %>
 
 <%
 int countUser = Integer.parseInt(request.getParameter("count"));
		
		
		String sql = "SELECT user_id FROM q3 GROUP BY user_id HAVING ( COUNT(*) > "+countUser+" )";
		
		
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			
			
			connection =getRemoteConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			
			PrintWriter output = response.getWriter();
			//Set response content type
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			output.println("<p>");
			output.println("Users who twitted more than or equal to"+countUser+"times.");
			output.println("</p>");
			
			int count = 0;
			while(resultSet.next()){
				
				long user_id = resultSet.getLong("user_id");
				output.println("<p>");
				output.println(user_id);
				output.println("</p>");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
  %>
</body>
</html>