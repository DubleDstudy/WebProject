<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*" %>
<%@ page import = "java.util.*"%>
<%@ page import = "java.lang.*"%>

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
					String mymoney = null;
					try{
						conn2 = DriverManager.getConnection("jdbc:mysql://localhost/webdb", "root", "admin");//여기가 연결하는부분(어디 인지(서버주소)/아이디/패스워드)
						stmt2 = conn2.createStatement();
						rs2 = stmt2.executeQuery("select mymoney from allowmoney");// 결과를 받아옴
						while(rs2.next()) {
              mymoney = rs2.getString(1);
            }
            int int_money = Integer.parseInt(mymoney);

  String moneydat = request.getParameter("MONEYDATE");
	String moneysummar = request.getParameter("MONEYSUMMARY");
	String moneywithdra = request.getParameter("MONEYWITHDRAW");
	String moneydeposi = request.getParameter("MONEYDEPOSIT");
	session.setAttribute("MONEYDATE",moneydat);
	session.setAttribute("MONEYSUMMARY",moneysummar);
	session.setAttribute("MONEYWITHDRAW",moneywithdra);
	session.setAttribute("MONEYDEPOSIT",moneydeposi);	
	String moneydate = (String)session.getAttribute("MONEYDATE");
	String moneysummary = (String)session.getAttribute("MONEYSUMMARY"); 
	String moneywithdraw = (String)session.getAttribute("MONEYWITHDRAW");
	String moneydeposit = (String)session.getAttribute("MONEYDEPOSIT");
  
  int int_withdraw = Integer.parseInt(moneywithdra);
  int int_deposit = Integer.parseInt(moneydeposi);

  int total = int_money - Integer.parseInt(moneywithdra) + Integer.parseInt(moneydeposi);
  
      String command  = String.format("insert into allow values ('%s','%s','%s','%s');",moneydate,moneysummary,moneydeposit,moneywithdraw);
			stmt2.executeUpdate(command);
			String command1  = String.format("update allowmoney set mymoney='"+total+"';");
			stmt2.executeUpdate(command1);
			
			stmt2.close();
			conn2.close();
		}
		catch (SQLException ex) {
			ex.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	response.sendRedirect("money.jsp");
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>용돈</title>
 
                   
                   
</head>
<body>

</body>
</html>