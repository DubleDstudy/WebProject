<%@page contentType="text/html; charset=euc-kr" %>
<%@page import="java.sql.*" %>
<%
	request.setCharacterEncoding("euc-kr");
  String diarydat = request.getParameter("DIARYDATE");
	String diarysummar = request.getParameter("DIARYSUMMARY");
	session.setAttribute("DIARYDATE",diarydat);
	session.setAttribute("DIARYSUMMARY",diarysummar);

		String diarydate = (String)session.getAttribute("DIARYDATE");
		String diarysummary = (String)session.getAttribute("DIARYSUMMARY"); 
		Connection  conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "admin");
			stmt = conn.createStatement();
      String command  = String.format("insert into diary values ('%s','%s');",diarydate,diarysummary);
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
	response.sendRedirect("diary.jsp");
		
%>
<HTML>
    <HEAD><TITLE></TITLE></HEAD>
    <BODY>
   
    </BODY>
</HTML>