<%@page contentType="text/html; charset=euc-kr"%>
<% String result = request.getParameter("RESULT");%>
<HTML>
	<HEAD>
		<TITLE>회원신청서</TITLE>
	</HEAD>
	<BODY>
		<H3>회원 가입 결과</H3>
		<%
			if(result.equals("SUCCESS"))
				out.println("가입되었습니다.");
			else
				out.println("가입되지 않았습니다.");
		%>
		<form method="post" action="project_main.html">
		<input type="submit" value="홈으로가기">
		</form>
	</BODY>
</HTML>