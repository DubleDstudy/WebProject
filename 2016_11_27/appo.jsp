<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*" %>

<%
    request.setCharacterEncoding("euc-kr");
    try{
			Class.forName("com.mysql.jdbc.Driver");
			}catch(ClassNotFoundException e){
				System.err.println("����̹� �˻� ����");
			}
          Connection conn1 = null;
					Statement stmt1 = null;
					ResultSet rs1 = null;
					try{
						conn1 = DriverManager.getConnection("jdbc:mysql://localhost/webdb", "root", "admin");
						stmt1 = conn1.createStatement();
						rs1 = stmt1.executeQuery("select * from appo");
						while(rs1.next()) {
              String appo1 = rs1.getString(1);
              String appo2 = rs1.getString(2);
              out.print(appo1);
              out.print(appo2);
     				}
						stmt1.close();
						conn1.close();
					}catch (SQLException ex) {
						ex.printStackTrace();
					} catch (Exception e){
						e.printStackTrace();
					}
%>
<HTML>
    <HEAD><TITLE>�������</TITLE></HEAD>
    <BODY>
        <H3>�������</H3>
       
        <FORM ACTION=appoint.jsp METHOD=POST>
            <INPUT TYPE=SUBMIT VALUE='�߰�'>
        </FORM>
    </BODY>
</HTML>