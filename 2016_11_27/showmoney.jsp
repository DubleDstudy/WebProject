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
						rs2 = stmt2.executeQuery("select mymoney from allowmoney");// 결과를 받아옴
						while(rs2.next()) {
              String money1 = rs2.getString(1);
              out.print(money1);
     				}
     				rs2 = stmt2.executeQuery("select * from allow");// 결과를 받아옴
						while(rs2.next()) {
              String money2 = rs2.getString(1);
              String money3 = rs2.getString(2);
              String money4 = rs2.getString(3);
              String money5 = rs2.getString(4);
              out.print(money2);
              out.print(money3);
              out.print(money4);
              out.println(money5);
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
	<HEAD>
		<TITLE></TITLE>
	</HEAD>
	<BODY>
		<H3>지출내역보기</H3>
		<FORM ACTION=money.jsp METHOD=POST>
			<INPUT TYPE=SUBMIT VALUE='뒤로가기'>
		</FORM>
	</BODY>
</HTML>