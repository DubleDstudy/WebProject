<%@page contentType="text/html; charset=euc-kr" %>
<%@page import="java.sql.*" %>
<%
	request.setCharacterEncoding("euc-kr");
  String annidat = request.getParameter("ANNIDATE");
	String annisummar = request.getParameter("ANNISUMMARY");
	session.setAttribute("ANNIDATE",annidat);
	session.setAttribute("ANNISUMMARY",annisummar);

		String annidate = (String)session.getAttribute("ANNIDATE");
		String annisummary = (String)session.getAttribute("ANNISUMMARY"); 
		Connection  conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "admin");
			stmt = conn.createStatement();
      String command  = String.format("insert into anni values ('%s','%s');",annidate,annisummary);
			stmt.executeUpdate(command);
			stmt.close();
			conn.close();
		}
		catch (SQLException ex) {
			ex.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	response.sendRedirect("anni.jsp");
		
%>
<HTML>
    <HEAD><TITLE></TITLE></HEAD>
    <BODY>
   
    </BODY>
</HTML>