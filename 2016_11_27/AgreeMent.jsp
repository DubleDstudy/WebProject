<%@page contentType="text/html;charset=euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String passwordhint = request.getParameter("passwordhint");
	String hint = request.getParameter("hint");
	session.setAttribute("NAME",name);
	session.setAttribute("GENDER",gender);
	session.setAttribute("PHONE",phone);
	session.setAttribute("EMAIL",email);
	session.setAttribute("ADDRESS", address);
	session.setAttribute("ID",id);
	session.setAttribute("PASSWORD",password);
	session.setAttribute("PASSWORDHINT",passwordhint);
	session.setAttribute("HINT",hint);
  out.print(name);
%>
<HTML>
	<HEAD>
		<TITLE>회원신청서</TITLE>
	</HEAD>
	<BODY>
		<H3>약관</H3>
		1. 회원 정보는 웹 사이트의 운영을 위해서만 사용됩니다.<BR>
		2. 웹 사이트의 정상 운영을 방해하는 회원은 탈퇴 처리합니다.<BR>
		<FORM ACTION=Subscription.jsp METHOD=POST>
			위의 약관에 동의하십니까?
			<INPUT TYPE=RADIO NAME=AGREE VALUE=YES>동의함
			<INPUT TYPE=RADIO NAME=AGREE VALUE=NO>동의하지 않음<BR><BR>
			<INPUT TYPE=SUBMIT VALUE='확인'>
		</FORM>
	</BODY>
</HTML>