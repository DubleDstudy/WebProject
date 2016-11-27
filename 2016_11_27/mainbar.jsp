<%@page contentType="text/html; charset=euc-kr" %>
<%@page import="java.sql.*" %>
<%
    request.setCharacterEncoding("euc-kr");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/webdb", "root", "admin");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select name from userinfo");
            while(rs.next()) {
                  out.print(rs.getString(1));
                  out.print("님 어서오세요");
              }   
			stmt.close();
			conn.close();	
			}catch (SQLException ex) {
				ex.printStackTrace();
			}catch (Exception e){
				e.printStackTrace();
			}
%>
<HTML>
    <HEAD><TITLE></TITLE></HEAD>
    <BODY>
    
    </BODY>
</HTML>