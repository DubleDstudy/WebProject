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
						rs1 = stmt1.executeQuery("select * from study");
						while(rs1.next()) {
              String study1 = rs1.getString(1);
              String study2 = rs1.getString(2);
              out.print(study1);
              out.print(study2);
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
    <HEAD><TITLE>���ΰ�ȹ</TITLE></HEAD>
    <BODY>
        <H3>���ΰ�ȹ</H3>
       
        <FORM ACTION=studyplan.jsp METHOD=POST>
            <INPUT TYPE=SUBMIT VALUE='�߰�'>
        </FORM>
    </BODY>
</HTML>