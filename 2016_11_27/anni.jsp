<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*" %>
<%
    request.setCharacterEncoding("euc-kr"); 
    try{
			Class.forName("com.mysql.jdbc.Driver");
			}catch(ClassNotFoundException e){
				System.err.println("����̹� �˻� ����");
			}
          Connection conn2 = null;
					Statement stmt2 = null;
					ResultSet rs2 = null;
					try{
						conn2 = DriverManager.getConnection("jdbc:mysql://localhost/webdb", "root", "admin");//���Ⱑ �����ϴºκ�(��� ����(�����ּ�)/���̵�/�н�����)
						stmt2 = conn2.createStatement();
						rs2 = stmt2.executeQuery("select * from anni");// ����� �޾ƿ�
						while(rs2.next()) {
              String anni1 = rs2.getString(1);
              String anni2 = rs2.getString(2);
              out.print(anni1);
              out.print(anni2);
     				}
						stmt2.close();
						conn2.close();
					}catch (SQLException ex) {
						ex.printStackTrace();
					} catch (Exception e){
						e.printStackTrace();
					}
%>
<HTML>
    <HEAD><TITLE></TITLE></HEAD>
    <BODY>
        <H3>�����</H3>
        <FORM ACTION=anniver.jsp METHOD=POST>
            <INPUT TYPE=SUBMIT VALUE='�߰�'>
        </FORM>
         
    </BODY>
</HTML>