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
<title>Query-2 Results</title>
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


    Statement statement = null;
	ResultSet resultSet = null;
PrintWriter output = response.getWriter();
		Date date = new Date();
		SimpleDateFormat timestamp = new SimpleDateFormat("HH:mm:ss");
	    String created_at = "%";
	    created_at = created_at+timestamp.format(date);
	    output.println("time is" +created_at);
	    try {
	    	
			Connection con = getRemoteConnection();
			//PreparedStatement ps=con.prepareStatement("select * from q2 where created_at LIKE '%06:16:50'");  
	    	//ps.setString(1,created_at); 
			PreparedStatement ps=con.prepareStatement("SELECT * FROM twitterdb.q2 where tweet_id > 457764740538695680 LIMIT 100"); 
			output.println("<html>");
	    	resultSet = ps.executeQuery();
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			output.println("<html>");
			output.println("<head>");
			output.println("<title>Query 2 - Results </title>");
			output.println("</head>");
			output.println("<body bgcolor=\"white\">");
			  
			
			while(resultSet.next()){
				long tweet_id = resultSet.getLong("tweet_id");
				String text = resultSet.getString("text");
				
				
				
				
				output.println("<p>");
				output.println(tweet_id + ":" + text);
				output.println("</p>");
				//response.setIntHeader("Refresh", 10);
			}
			
			output.println("</body>");
			output.println("</html>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

%>
</body>
</html>