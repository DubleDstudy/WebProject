<%@page contentType="text/html; charset=euc-kr" %>
<%@page import="java.sql.*" %>
<%
	response.setContentType("text/html; charset=euc-kr");
	String id = request.getParameter("ID");
	String password = request.getParameter("PASSWORD");
	String result = null;
	Connection  conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		//Register JDBC driver
		Class.forName("com.mysql.jdbc.Driver");

		//Open a connection
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "admin");
		stmt = conn.createStatement();

		String command  = String.format("select password from userinfo where id = '%s'", id);
		rs = stmt.executeQuery(command);

		if (rs.next() == false) {
			result = "NULL";
			response.sendRedirect("loginAlert.jsp?RESULT=" + result);
		}
		else {
			if (rs.getString(1).equals(password))
				response.sendRedirect("project_main.jsp?ID=" + id);
			else {
				result = "DISCORD";
				response.sendRedirect("loginAlert.jsp?RESULT=" + result);
			}
		}
			
		//close a connection
		stmt.close();
		conn.close();
	}
	catch (SQLException ex) {
		ex.printStackTrace();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
		
%>