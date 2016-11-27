<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*" %>
<%
    request.setCharacterEncoding("euc-kr"); 
    try{
			Class.forName("com.mysql.jdbc.Driver");
			}catch(ClassNotFoundException e){
				System.err.println("드라이버 검색 실패");
			}
          Connection conn2 = null;
					Statement stmt2 = null;
					ResultSet rs2 = null;
					try{
						conn2 = DriverManager.getConnection("jdbc:mysql://localhost/webdb", "root", "admin");//여기가 연결하는부분(어디 인지(서버주소)/아이디/패스워드)
						stmt2 = conn2.createStatement();
						rs2 = stmt2.executeQuery("select * from anni");// 결과를 받아옴
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
        <H3>기념일</H3>
        <FORM ACTION=anniver.jsp METHOD=POST>
            <INPUT TYPE=SUBMIT VALUE='추가'>
        </FORM>
         
    </BODY>
</HTML>