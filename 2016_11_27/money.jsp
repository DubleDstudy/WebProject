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
						rs2 = stmt2.executeQuery("select mymoney from allowmoney");// ����� �޾ƿ�
						while(rs2.next()) {
              String money1 = rs2.getString(1);
              out.print(money1);
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
        
        <FORM ACTION=moneyallow.jsp METHOD=POST>
            <INPUT TYPE=SUBMIT VALUE='�����������'>
        </FORM>
        <FORM ACTION=showmoney.jsp METHOD=POST>
            <INPUT TYPE=SUBMIT VALUE='���⳻������'>
        </FORM>
        
    </BODY>
</HTML>