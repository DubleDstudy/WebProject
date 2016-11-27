<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*" %>

<%
    request.setCharacterEncoding("euc-kr");
    try{
			Class.forName("com.mysql.jdbc.Driver");
			}catch(ClassNotFoundException e){
				System.err.println("드라이버 검색 실패");
			}
          Connection conn1 = null;
					Statement stmt1 = null;
					ResultSet rs1 = null;
					try{
						conn1 = DriverManager.getConnection("jdbc:mysql://localhost/webdb", "root", "admin");
						stmt1 = conn1.createStatement();
						rs1 = stmt1.executeQuery("select * from diary");
						while(rs1.next()) {
              String diary1 = rs1.getString(1);
              String diary2 = rs1.getString(2);
              out.print(diary1);
              out.print(diary2);
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
    <HEAD><TITLE>일기</TITLE></HEAD>
    <BODY>
        <H3>일기</H3>
       
        <FORM ACTION=diaryplan.jsp METHOD=POST>
            <INPUT TYPE=SUBMIT VALUE='추가'>
        </FORM>
    </BODY>
</HTML>