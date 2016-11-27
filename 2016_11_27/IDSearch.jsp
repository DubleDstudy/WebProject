<%@page contentType="text/html; charset=euc-kr" %>
<%@page import="java.sql.*" %>
<%
	response.setContentType("text/html; charset=euc-kr");
	String name = request.getParameter("NAME");
	String phone = request.getParameter("PHONE");
	String email = request.getParameter("EMAIL");
	Connection  conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		//Register JDBC driver
		Class.forName("com.mysql.jdbc.Driver");

		//Open a connection
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "admin");
		stmt = conn.createStatement();

		String command  = String.format("select id from userinfo where name = '%s' and phone = '%s' and email = '%s'", name, phone, email);
		rs = stmt.executeQuery(command);

		if (rs.next() == false) {
			response.sendRedirect("idAlert.jsp?ID=NULL");
		}
		else {
			response.sendRedirect("idAlert.jsp?ID=" + rs.getString(1));
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