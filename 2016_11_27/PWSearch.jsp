<%@page contentType="text/html; charset=euc-kr" %>
<%@page import="java.sql.*" %>
<%
	response.setContentType("text/html; charset=euc-kr");
	String id = request.getParameter("ID");
	String name = request.getParameter("NAME");
	String email = request.getParameter("EMAIL");
	String passwordhint = request.getParameter("PASSWORDHINT");
	String hint = request.getParameter("HINT");
	Connection  conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		//Register JDBC driver
		Class.forName("com.mysql.jdbc.Driver");

		//Open a connection
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "admin");
		stmt = conn.createStatement();

		String command  = String.format("select password from userinfo where id = '%s' and name = '%s' and email = '%s' and passwordhint = '%s' and hint = '%s'",id, name, email, passwordhint, hint);
		rs = stmt.executeQuery(command);

		if (rs.next() == false) {
			response.sendRedirect("pwAlert.jsp?PASSWORD=NULL");
		}
		else {
			response.sendRedirect("pwAlert.jsp?PASSWORD=" + rs.getString(1));
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